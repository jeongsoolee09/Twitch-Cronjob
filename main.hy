(import [check-live [live?]])
(import [config-reader [read-config]])
(import [downloader [download]])


(defmain []
  (setv streamer-ids (read-config))
  (for [streamer-id streamer-ids]
    (when (live? streamer-id)
      (download streamer-id))))
