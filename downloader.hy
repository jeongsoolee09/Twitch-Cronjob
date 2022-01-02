(import youtube-dl)
(import os.path)

(setv opts {"format" "bestaudio/best"})


(defn lock-file-name [streamer-id]
  f".{streamer-id}.lock")


(defn hold-lock [streamer-id]
  (with [lock-file (open (lock-file-name streamer-id) "w+")]
    (.write lock-file "")))


(defn lock-held? [streamer-id]
  ((. os path exists) (lock-file-name streamer-id)))


(defn release-lock [streamer-id]
  (when (lock-held? streamer-id)
    (.remove os (lock-file-name streamer-id))))


(defn download [streamer-id]
  (when (not (lock-held? streamer-id))
    (hold-lock streamer-id)
    (with [ytdl (.YoutubeDL youtube-dl opts)]
      (.download ytdl [f"https://twitch.tv/{streamer-id}"]))
    (release-lock streamer-id)))
