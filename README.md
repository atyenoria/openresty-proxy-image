# 20150202
## nginx builtin loadbalancer (multihost)
- $ wrk -c 110 -t 110 -d 10 http://l.com/                                                 2.1.6
```
$ wrk -c 110 -t 110 -d 10 http://l.com/                                                 2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    59.99ms    7.33ms  89.24ms   73.53%
    Req/Sec    16.23      4.83    30.00     69.11%
  18338 requests in 10.11s, 14.95MB read
Requests/sec:   1814.13
Transfer/sec:      1.48MB
```

## lua redis load balancer
- $ wrk -c 110 -t 110 -d 10 http://l.com/                                                 2.1.6
```
Running 10s test @ http://l.com/ (multihost)
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   111.91ms   98.91ms   1.24s    93.26%
    Req/Sec    10.49      4.85    40.00     69.75%
  10645 requests in 10.11s, 3.55MB read
  Socket errors: connect 0, read 608, write 0, timeout 0
  Non-2xx or 3xx responses: 10645
Requests/sec:   1053.25
Transfer/sec:    359.56KB
```

# 20150209
## nginx builtin load balancer (single host)
```
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    48.25ms   37.70ms 516.66ms   80.36%
    Req/Sec    23.38     15.31   414.00     82.44%
  25068 requests in 10.09s, 20.44MB read
Requests/sec:   2483.82
Transfer/sec:      2.03MB
```