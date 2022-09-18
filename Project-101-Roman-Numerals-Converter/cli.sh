#!/bin/bash

aws cloudformation create-stack --stack-name RomanNumeralsConverter --template-body file://cfn-template.yaml --parameters ParameterKey=KeyPair,ParameterValue=firstkey

#Please run the script where template file where it is.