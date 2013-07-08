#!/usr/bin/env bash

while [ 1 ]; do
  sysctl hw.acpi.thermal.tz0.temperature
  sudo nvclock -T
  sleep 10
  clear
done
