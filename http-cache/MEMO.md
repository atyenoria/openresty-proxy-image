# 20160209

## wordpress before install nocache
$ ./test_http                                                                           2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   259.54ms  147.66ms 648.47ms   63.65%
    Req/Sec     4.78      4.19    40.00     76.58%
  4211 requests in 10.10s, 1.45MB read
Requests/sec:    416.96
Transfer/sec:    146.99KB



## wordpress before install gzip
$ ./test_http                                                                           2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   247.20ms   59.16ms 441.27ms   69.80%
    Req/Sec     3.99      1.75    10.00     88.85%
  4388 requests in 10.10s, 1.42MB read
Requests/sec:    434.32
Transfer/sec:    144.21KB


## wordpress before install cache

$ ./test_http                                                                           2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   265.01ms  203.07ms 606.08ms   45.02%
    Req/Sec     5.54      6.32    99.00     91.56%
  4076 requests in 10.05s, 1.40MB read
Requests/sec:    405.42
Transfer/sec:    142.93KB


## wordpress before install gzip + cache
$ ./test_http                                                                           2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   266.54ms  163.30ms 592.09ms   53.66%
    Req/Sec     5.28      3.97    20.00     65.10%
  4070 requests in 10.10s, 1.40MB read
Requests/sec:    402.83
Transfer/sec:    142.01KB





## nginx static file (cache)
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.17ms    4.46ms 122.06ms   95.58%
    Req/Sec    90.38     19.57   693.00     84.43%
  99579 requests in 10.06s, 81.19MB read
Requests/sec:   9900.31
Transfer/sec:      8.07MB




## wordpress install page (cache)
$ wrk -c 110 -t 110 -d 10 http://l.com/                                                 2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   460.25ms  100.61ms 712.60ms   84.20%
    Req/Sec     1.72      0.69    10.00     61.26%
  2323 requests in 10.10s, 818.95KB read
Requests/sec:    230.03
Transfer/sec:     81.09KB











## wordpress after install (cache)
$ wrk -c 110 -t 110 -d 10 http://l.com/                                                 2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    28.22ms   20.25ms 363.15ms   91.45%
    Req/Sec    39.12     21.88   653.00     94.24%
  42910 requests in 10.10s, 404.19MB read
Requests/sec:   4247.72
Transfer/sec:     40.01MB


## wordpress after install (no cache)
$ wrk -c 110 -t 110 -d 10 http://l.com/                                                 2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   754.35ms  107.32ms 930.22ms   91.83%
    Req/Sec     1.09      0.63    10.00     96.92%
  1395 requests in 10.10s, 13.15MB read
Requests/sec:    138.15
Transfer/sec:      1.30MB


## wordpress before install (no cache)                                                                       2.1.6
Running 10s test @ http://l.com/
  110 threads and 110 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   149.10ms  160.68ms 625.09ms   78.72%
    Req/Sec    23.44     36.81   163.00     86.40%
  11249 requests in 10.10s, 4.32MB read
  Non-2xx or 3xx responses: 9277
Requests/sec:   1113.99
Transfer/sec:    438.56KB

