#!/bin/bash

rm /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry 1366x768 && bash
