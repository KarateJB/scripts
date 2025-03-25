#!/bin/bash
# For Windows, use powershell to generate GUID
uuid=$(powershell -command "[guid]::NewGuid().ToString()")
# For Linux, use uuidgen to generate GUID
# uuid=$(uuidgen)

if [ "$1" == "-hyphen" ]; then
  echo -n "GUID with hyphen: "
  # uuidgen
  echo $uuid
  echo $uuid | clip
else
  uuid_wo_hyphen=$(echo $uuid | tr -d '-')
  echo -n "GUID without hyphen: "
  echo $uuid_wo_hyphen
  echo $uuid_wo_hyphen | clip
fi

