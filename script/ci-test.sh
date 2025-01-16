#!/bin/bash

set -x +e

make run-rmi-host &
make run-workload &

sleep 5
make run-profiler
OUT=$?

for x in $(jobs -p); do kill $x; done

exit $OUT