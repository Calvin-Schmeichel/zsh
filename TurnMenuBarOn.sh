#!/bin/bash

printf 'tell application "System Preferences" to reveal pane id "com.apple.preference.dock"\n tell application "System Events" to tell process "System Preferences" to tell window "Dock & Menu Bar"\n set theCheckbox to checkbox "Automatically hide and show the menu bar in full screen"\n if value of theCheckbox is 1 then\n   click theCheckbox\n end if\n end tell\n quit application "System Preferences"' | osascript