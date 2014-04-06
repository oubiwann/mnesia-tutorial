(defmodule querying
  (export all))

(include-lib "stdlib/include/qlc.hrl")
(include-lib "include/tables.lfe")

(defun show-data (table-name)
  (mnesia:transaction
    (lambda ()
      (mnesia:foldl
        (lambda (x _) (lfe_io:format '"~p~n" (list x)))
        0
        table-name))))