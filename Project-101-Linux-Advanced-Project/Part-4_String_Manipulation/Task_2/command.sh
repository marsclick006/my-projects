#!/bin/bash

awk '{gsub(/\\n/,"\n")}1' certificate.pem | tee new.pem
