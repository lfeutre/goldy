;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Defaults6   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun default-port () 70)
(defun default-receive-timeout () 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   RFC 1436   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun file-item () 0)
(defun dir-item () 1)
(defun cso-phone-book-item () 2)
(defun error () 3)
(defun binhex-item () 4)
(defun dos-archive-item () 5)
(defun uuencoded-item () 6)
(defun index-search-item () 7)
(defun telnet-session-item () 8)
(defun binary-file-item () 9)
(defun redundant-server-item () #\+)
(defun tn3270-session-item () #\t)
(defun gif-item () #\g)
(defun image-item () #\i)

(defun end-line () "\r\n")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Gopher II   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun calendar-item () #\c)
(defun word-processing-item () #\d) ; word, wordstar, word perfect, etc.
(defun html-item () #\h)
(defun informational-item () #\i)
(defun page-item () #\p) ; tex, latex, rtf, etc. 
(defun mbox-item () #\m)
(defun sound-item () #\s)
(defun xml-item () #\x)
(defun video-item () #\;)
(defun line-item () #\?)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Other   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun info-newline () #"\tfake\t(NULL)\t0")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   LFE Records   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrecord item
  type
  display-string
  selector
  hostname
  port
  terms)

;;; End of include file

(defun --loaded-gopher-include-- ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function in an included file is printed to stdout).

  This function needs to be the last one in this include."
  'ok)
