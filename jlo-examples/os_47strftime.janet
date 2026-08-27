# TZ environment variable overrides local timezone for os/strftime
(os/setenv "TZ" "Asia/Tokyo")
(os/strftime "%Y-%m-%d %a %I:%M %p" (os/time) true)
