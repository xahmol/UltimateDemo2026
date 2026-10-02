# Capture the Ultimate's audio stream (multicast) and report its AC level.
# The stream has a large constant offset per channel even when silent, so the
# level is the RMS after removing each channel's mean (idle: about 0.0001).
import socket, struct, sys, time, json, urllib.request, math
HOST, GROUP, PORT, SECS = "192.168.1.148", "239.0.1.65", 11001, float(sys.argv[1] if len(sys.argv) > 1 else 3)
def put(path):
    req = urllib.request.Request("http://%s%s" % (HOST, path), method="PUT")
    return urllib.request.urlopen(req, timeout=5).read().decode()
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(("", PORT))
s.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, struct.pack("4s4s", socket.inet_aton(GROUP), socket.inet_aton("0.0.0.0")))
s.settimeout(1.0)
print("start:", put("/v1/streams/audio:start?ip=%s:%d" % (GROUP, PORT)).replace("\n", ""))
left, right, pkts = [], [], 0
end = time.time() + SECS
try:
    while time.time() < end:
        try: d = s.recv(2048)
        except socket.timeout: continue
        pkts += 1
        v = struct.unpack("<%dh" % ((len(d) - 2) // 2), d[2:2 + ((len(d) - 2) // 2) * 2])  # 2-byte seq header
        left.extend(v[0::2]); right.extend(v[1::2])
finally:
    put("/v1/streams/audio:stop")
def ac(v):
    m = sum(v) / len(v)
    return (sum((x - m) ** 2 for x in v) / len(v)) ** 0.5 / 32768, m
(l, lm), (r, rm) = ac(left), ac(right)
print("packets=%d samples=%d level L=%.4f R=%.4f (offsets %.0f / %.0f)" % (pkts, len(left), l, r, lm, rm))
