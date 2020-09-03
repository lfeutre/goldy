(defmodule goldy-protocol
  (export
   (lines 1)
   (process-lines 1)
   (process-all-lines 1)))

(include-lib "include/gopher.lfe")

(defun lines
  ((data) (when (is_binary data))
   (binary:split data (binary:list_to_bin (end-line)) '(global)))
  ((_) #""))

(defun process-all-lines (data)
  (io:format "Got data: ~p~n" `(,data))
  (lists:map #'process-lines/1 data))

(defun process-lines (data)
  (io:format "Got list data: ~p~n" `(,data))
  (lists:map (lambda (x) (lfe_io:format "~p~n" `(,x))) data))
  ;(lists:map #'handle-line/1 (lines data))
  ;'ok)

(defun handle-line
  (((binary (item (size 8)) (line bytes)))
   (cond
    ((== item (informational-item)) (handle-info line))
    ((== item (line-item)) (handle-unknown line))
    ('true (handle-unknown line))))
  ((#"")
   (lfe_io:format "~n" '())))

(defun handle-info (line)
  (let ((line (binary:replace line (info-newline) #"" '(global))))
    (lfe_io:format "~s~n" `(,(binary:bin_to_list line)))))

(defun handle-unknown (line)
  (lfe_io:format "~p~n" `(,line)))