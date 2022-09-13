#!/bin/bash

#uzun yöntem (long method)
cat event_history.csv | grep serdar | grep TerminateInstance | tee result.txt
cat result.txt | cut -d',' -f10 >> result1.txt
cat result.txt | cut -d',' -f12 >> result1.txt
cat result.txt | cut -d',' -f14 >> result1.txt
cat result.txt | cut -d',' -f16 >> result1.txt
cat result.txt | cut -d',' -f18 >> result1.txt
cat result.txt | cut -d',' -f20 >> result1.txt
cat result1.txt | awk '/resourceName/' > result.txt
rm result1.txt
cat result.txt | cut -d':' -f2 | tee result.txt
cat result.txt | sort | uniq | tee result.txt
cat result.txt | sed 's/""/ /' | sed 's/""}]"/ /' | sed 's/""}/ /' | tee result.txt

#kısa yöntemler (short methods)
#cat event_history.csv | grep -i serdar | grep -i terminateinstance | egrep -o "i-[a-z, A-Z, 0-9]{17}" | sort | uniq | tee result.txt
#cat event_history.csv | grep serdar | grep TerminateInstance | grep -E -o "i-[0-9, a-z]{17} | sort | uniq | tee result.txt
#cat event_history.csv | grep -i "serdar" | grep -i "terminate" | grep -Eo "i-.{17}" | sort | uniq | tee result.txt
