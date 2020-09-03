(defmodule goldy-client
  (behaviour gen_server)
  (export
   (init 1)
   (start_link 1)
   (handle_call 3)
   (handle_cast 2)
   (handle_info 2)
   (terminate 2)
   (code_change 3))
  (export
   (connect 1)
   (send 1)))

(include-lib "include/gopher.lfe")

(defrecord state
  socket)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   gen_server Implementation   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun init (opts)
  "Initialize the client."
  ;; The options passed to init should be an LFE property list of the form:
  ;;  ```
  ;;   '(#(host "gopher.quux.org")
  ;;     #(port 70))
  ;;  ```
  ;; The port is optional; if not provided, the default defined in the include
  ;; file will be used.
  (process_flag 'trap_exit true)
  (let* ((host (proplists:get_value 'host opts))
         (port (proplists:get_value 'port opts (default-port)))
         (`#(ok ,socket) (gen_tcp:connect `#(,host) port '(#(active true) binary))))
    `#(ok ,(make-state socket socket))))

(defun start_link (opts)
  (gen_server:start_link (MODULE) opts '()))

(defun handle_cast (_msg state)
  `#(noreply ,state))

(defun handle_call
  (('stop _from state)
   `#(stop shutdown ok state))
  ((`#(echo ,msg) _from state)
   `#(reply ,msg state))
  ((message _from state)
   `#(reply ,(unknown-command) ,state)))

(defun handle_info
  ((`#(EXIT ,_from normal) state)
   `#(noreply ,state))
  ((`#(EXIT ,pid ,reason) state)
   (io:format "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,state))
  ((_msg state)
   `#(noreply ,state)))

(defun terminate (_reason state

(defun code_change (_old-vsn state _extra)
  `#(ok ,state))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Client API   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun connect (opts)
  (start_link opts))

(defun send (line)
  )