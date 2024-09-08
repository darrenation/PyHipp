#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Start Times"

for file in rplpl-slurm.queue1-dy-m5-4xlarge-1.1.out rplspl-slurm.queue1-dy-m5-4xlarge-1.2.out; do
    echo "==> $file <=="
    grep "time.struct_time" $file | head -1
done

echo ""
echo "End Times"


for file in rplpl-slurm.queue1-dy-m5-4xlarge-1.1.out rplspl-slurm.queue1-dy-m5-4xlarge-1.2.out; do
    echo "==> $file <=="
    grep "time.struct_time" $file | tail -1
    tail -2 $file | head -1
    tail -1 $file
done
