## quick-load-incremental.sh

A utility to do some load testing in 1 minute.

This script assumes you have [vegeta](https://github.com/tsenart/vegeta) available.

## Usage

```
URL=example.com SLEEP=5 DURATION=10s INITIAL=1 INCREASE=10 ./quick-load-incremental.sh
```

* `URL`: the URL you want to hit (can't specify more than one, it's quick load after all ;))
* `SLEEP`: a cooling time between load runs
* `DURATION`: how long each load test runs for
* `INITIAL`: starting RPS
* `INCREASE`: the increase in RPS between each load test

For example `URL=example.com SLEEP=5 DURATION=10s INITIAL=1 INCREASE=10` means:

* hit example.com
* the duration of each load test is 10 seconds
* we start with 1 RPS
* the second load test will use 11 RPS
* the third 21 RPS
* between each tests give the server 5 seconds to cool down

You can store those variables inside a file called `conf.txt` in order to load it directly.

If you create a `targets.txt` file (compatible with vegeta's [target file](https://github.com/tsenart/vegeta#attack)) it will be used instead of `URL` environment var.

If you want to add a timeout you can do it like that: `timeout 10s ./quick-load-incremental.sh`

You can always stop the script with `ctrl+c`. No biggie.

## License

[WTFPL](http://www.wtfpl.net/) 
