# Capture the Ultimate's audio stream (multicast) and report RMS/peak.
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
n = 0; sq = 0.0; peak = 0; pkts = 0; end = time.time() + SECS
try:
    while time.time() < end:
        try: d = s.recv(2048)
        except socket.timeout: continue
        pkts += 1
        smp = struct.unpack("<%dh" % ((len(d) - 2) // 2), d[2:2 + ((len(d) - 2) // 2) * 2])  # 2-byte seq header
        for v in smp: sq += v * v; peak = max(peak, abs(v))
        n += len(smp)
finally:
    put("/v1/streams/audio:stop")
rms = math.sqrt(sq / n) / 32768 if n else 0
print("packets=%d samples=%d rms=%.4f peak=%d" % (pkts, n, rms, peak))
