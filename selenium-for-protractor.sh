#!/bin/bash

BASE_DIR=`dirname $0`

echo ""
echo "Starting Selenium Server"
echo "-------------------------------------------------------------------"


echo "Setup"
$BASE_DIR/node_modules/protractor/bin/webdriver-manager update  --standalone --chrome

#echo "Run server"
#$BASE_DIR/node_modules/protractor/bin/webdriver-manager start >> /dev/null
