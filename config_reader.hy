(import os.path)
(import youtube-dl)


(defn read-config []
  (with [config-file (open "twitchconfig.json" "r+")]
    (setv configdict (.load json config-file)))
  {:streamers (get configdict "streamers")})
