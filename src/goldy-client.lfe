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
   (start 1)
   (send 0) (send 1)
   (stop 0)))

(include-lib "include/gopher.lfe")

(defun SERVER () (MODULE))

(defrecord state
  host
  port
  connected
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
  `#(ok ,(init-state opts)))

(defun start_link (opts)
  (gen_server:start_link `#(local ,(SERVER))
                         (MODULE)
                         opts
                         '()))

(defun handle_cast (_msg state)
  `#(noreply ,state))

(defun handle_call
  (('#(stop) _from state)
   `#(stop shutdown ok state))
  ((`#(send ,line) _from (= (match-state host h port p) state))
   (let ((`#(ok ,sock) (gen_tcp:connect h p '(#(active true) binary))))
     (gen_tcp:send sock line)
     (prog1
       `#(reply ,(goldy-protocol:process-all-lines (receive-lines)) ,state)
       (gen_tcp:shutdown sock 'read_write))))
  ((message _from state)
   `#(reply unknown-command ,state)))

(defun handle_info
  ((`#(EXIT ,_from normal) state)
   `#(noreply ,state))
  ((`#(EXIT ,pid ,reason) state)
   (io:format "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,state))
  ((_msg state)
   `#(noreply ,state)))

(defun terminate
  ((_reason state)
   'ok))

(defun code_change (_old-vsn state _extra)
  `#(ok ,state))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Client API   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun start (opts)
  (start_link opts))
  
(defun stop ()
  (gen_server:call (SERVER) `#(stop)))

(defun send ()
  (send ""))

(defun send (line)
  (gen_server:call (SERVER) `#(send ,(++ line (end-line)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Private Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun init-state (opts)
  (make-state host (proplists:get_value 'host opts)
              port (proplists:get_value 'port opts (default-port))))

(defun receive-lines ()
  (receive-lines '() (default-receive-timeout)))

(defun receive-lines (buffer timeout)
  (receive
    (`#(tcp ,_port ,data)
     (receive-lines `(,data . ,buffer) timeout))
    ;;(`#(tcp_closed ,_port)
    ;; (receive-line buffer timeout))
    (msg
     (receive-lines `(,msg . ,buffer) timeout))
    (after timeout
      (lists:reverse buffer))))