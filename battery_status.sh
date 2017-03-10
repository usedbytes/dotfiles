#!/bin/bash

BAT_SYSFS=/sys/class/power_supply/BAT1
AC_SYSFS=/sys/class/power_supply/BAT1

CAPACITY=$(cat ${BAT_SYSFS}/capacity)

DRAIN_UW=$(cat ${BAT_SYSFS}/power_now)
DRAIN=$(bc <<< "scale=2; ${DRAIN_UW}/1000000")

echo -n "${CAPACITY}% (${DRAIN} W)"
