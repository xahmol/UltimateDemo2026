# Start the PRG over REST N times; each start must reach "Detection complete".
import sys, time, urllib.request, urllib.parse
HOST = "192.168.1.148"
PRG = sys.argv[1] if len(sys.argv) > 1 else "/usb0/idi8b/ultdemo2026/udemo2026.prg"
N = int(sys.argv[2]) if len(sys.argv) > 2 else 20
neterr = 0
def req(method, path):
    global neterr
    for attempt in range(6):
        try:
            r = urllib.request.Request("http://%s%s" % (HOST, path), method=method)
            return urllib.request.urlopen(r, timeout=10).read()
        except OSError as e:
            neterr += 1
            print("   REST %s %s failed (%s), retrying" % (method, path.split("?")[0], e), flush=True)
            time.sleep(3)
    raise SystemExit("REST interface unreachable")
def screen():
    raw = req("GET", "/v1/machine:readmem?address=0400&length=1000")
    out = []
    for b in raw:
        v = b & 0x7f
        out.append(chr(96 + v) if 1 <= v <= 26 else chr(v + 32) if 65 <= v <= 90 else chr(v) if 32 <= v < 64 else " ")
    return "".join(out)
ok = 0
for i in range(1, N + 1):
    req("PUT", "/v1/runners:run_prg?file=" + urllib.parse.quote(PRG))
    t0 = time.time(); res = "HANG"
    while time.time() - t0 < 20:
        time.sleep(0.25)
        s = screen()
        if "detection complete" in s:
            res = "ok"; break
    dt = time.time() - t0
    line = [s[k*40:(k+1)*40].rstrip() for k in range(25)]
    status = " | ".join(l.strip() for l in line if ":" in l and "[" in l)
    print("%2d %-4s %5.1fs  %s" % (i, res, dt, status[:150]), flush=True)
    if res == "ok": ok += 1
    else: print("   screen:", [l for l in line if l.strip()], flush=True)
print("RESULT %d/%d starts reached detection complete; REST errors: %d" % (ok, N, neterr))
