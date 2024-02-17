#!/bin/bash

printf 'tell application "System Preferences" to reveal pane id "com.apple.preference.dock"\n tell application "System Events" to tell process "System Preferences" to tell window "Dock & Menu Bar"\n click checkbox "Automatically hide and show the menu bar in full screen"\n end tell\n quit application "System Preferences"' | osascript