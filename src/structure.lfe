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
  ;   (lambda (x) (funcall (eval (macro-function 'create-tables '()) x)))
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
  ;   (lambda (x) (funcall (eval (macro-function 'create-tables '()) x)))
  ;   (set-table-names)))
  ; XXX until then, manual calls:
  (list
    (create-table in-department (#(type bag)))
    (create-table in-project (#(type bag)))))

(defun get-status (list-of-tuples)
  (case (lists:dropwhile (lambda (x) (== (element 2 x) 'ok))
                         list-of-tuples)
    ('() 'ok)
    (_ 'error)))

(defun init ()
  (let* ((sets (create-set-tables))
         (bags (create-bag-tables))
         (status (get-status (++ sets bags))))
    (tuple
      status
      (list
        (tuple 'create-set-tables sets)
        (tuple 'create-bag-tables bags)))))
