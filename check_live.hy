(import requests)
(import json)
(import [bs4 [BeautifulSoup]])


(defn live? [streamer-id]
  (setv full-url f"https://twitch.tv/{streamer-id}")
  (setv contents (as-> requests req
                      (.get req full-url)
                      (. req content)
                      (decode req "utf-8")))
  (setv dom (BeautifulSoup contents "lxml"))
  (try
    (setv json-obj (.loads json ((. dom script get_text))))
    (setv is-live (get json-obj 0 "publication" "isLiveBroadcast"))
    (setv description (get json-obj 0 "description"))
    (except [json.JSONDecodeError]
      (setv is-live False)
      (setv description None)))
  {"is-live" is-live "description" description})
