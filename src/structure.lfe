(defmodule structure
  (export all))

(include-lib "stdlib/include/qlc.hrl")
(include-lib "deps/lfe-utils/include/utils-macros.lfe")
(include-lib "include/tables.lfe")


(defun table-names ()
  (list 'employee
        'department
        'project
        'manager))

(defun bag-table-names ()
  (list 'in-department
        'in-project))

(defun create-table (table-name)
  (let ((attrs `(#(attributes
                 (records-,table-name)))))
    (mnesia:create_table table-name attrs)))

; (defun create-bag-table (table-name)
;   (let ((meta-data (list
;                      (tuple 'type 'bag)
;                      (tuple 'attributes
;                             (record-info table-name)))))
;    (: mnesia create_table table-name meta-data)))

; (defun init ()
;   (: lists map #'create-table/1 (table-names))
;   (: lists map #'create-bag-table/1 (bag-table-names)))

