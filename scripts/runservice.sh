#!/bin/bash

SERVICE=$1
if pgrep -x "$SERVICE" &> /dev/null;
then 
    brew services restart "$SERVICE"
else
    brew services start "$SERVICE"
fi
