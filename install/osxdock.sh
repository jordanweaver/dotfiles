#!/bin/bash

dockutil --no-restart --remove all
dockutil --no-restart --add "~/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Things.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/GarageBand.app"
dockutil --no-restart --add "/Applications/Evernote.app"
dockutil --no-restart --add "/Applications/SourceTree.app"
dockutil --no-restart --add "~/Applications/Spotify.app"

killall Dock
