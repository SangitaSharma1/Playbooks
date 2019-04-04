#!/bin/bash
cd /root;
awk '/dir/' <(ls -lrth)| awk '{print $9}' > /tmp/reponames.txt;
awk -v sz="$(wc -l < /tmp/reponames.txt)" 'NR<=(sz-4)' /tmp/reponames.txt  > /tmp/finalized.txt;

while read i; do
        rm -rf "$i"
done </tmp/finalized.txt
