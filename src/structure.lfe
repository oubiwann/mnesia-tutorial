(defmodule structure
  (export all))

(include-lib "stdlib/include/qlc.hrl")
(include-lib "include/tables.lfe")
(include-lib "include/macros.lfe")

; XXX once we can call macros in a map function, we'll uncomment these and
; use them
;
; (defun set-table-names ()
;   (list 'employee
;         'department
;         'project
;         'manager))
;
; (defun bag-table-names ()
;   (list 'in-department
;         'in-project))

(defun create-set-tables ()
  ; XXX hopefully, the following will work soon!
  ;
  ; (lists:map
  ;   (lambda (x) (funcall (eval (macro-function 'create-tables $ENV) x)))
  ;   (set-table-names)))
  ; XXX until then, manual calls:
  (list
    (create-table employee ())
    (create-table department ())
    (create-table project ())
    (create-table manager ())))

(defun create-bag-tables ()
  ; XXX hopefully, the following will work soon!
  ;
  ; (lists:map
  ;   (lambda (x) (funcall (eval (macro-function 'create-tables $ENV) x)))
  ;   (set-table-names)))
  ; XXX until then, manual calls:
  (list
    (create-table in-department (#(type bag)))
    (create-table in-project (#(type bag)))))

(defun init ()
  (list
    (tuple 'create-set-tables (create-set-tables))
    (tuple 'create-bag-tables (create-bag-tables))))
