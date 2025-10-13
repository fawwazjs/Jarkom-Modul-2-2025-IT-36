#!/bin/bash

apt-get update
apt-get install apache2-utils -y

ab -n 500 -c 10 http://www.K36.com/static/ > /root/static.out
ab -n 500 -c 10 http://www.K36.com/app/ > /root/app.out

parse() {
  f="$1"
  r=$(grep -E "Complete requests:" "$f" | awk '{print $3}')
  fr=$(grep -E "Failed requests:" "$f" | awk '{print $3}')
  rps=$(grep -E "Requests per second:" "$f" | awk '{print $4}')
  tpr_mean=$(grep -E "Time per request:" "$f" | head -n1 | awk '{print $4}')
  tpr_conc=$(grep -E "Time per request:" "$f" | tail -n1 | awk '{print $4}')
  transfer=$(grep -E "Transfer rate:" "$f" | awk '{print $(NF-2) " " $(NF-1) " " $NF}')
  echo "$r,$fr,$rps,$tpr_mean,$tpr_conc,$transfer"
}

parse /root/static.out > /root/output.csv
parse /root/app.out >> /root/output.csv

awk -F, 'BEGIN {
    printf "| %-18s | %-18s | %-23s | %-23s | %-23s | %-29s |\n", \
           "Requests", "Failed", "Req/Sec", "Time/Req(ms)", "Transfer(KB/s)", "Note";
    print "|--------------------|--------------------|-------------------------|-------------------------|-------------------------|-------------------------------|";
}
{
    printf "| %-18s | %-18s | %-23s | %-23s | %-23s | %-29s |\n", \
           $1, $2, $3, $4, $5, $6;
}' /root/output.csv