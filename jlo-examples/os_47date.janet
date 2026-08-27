# TZ environment variable overrides local timezone for os/date
(os/setenv "TZ" "Asia/Tokyo")
(os/date (os/time) true)
