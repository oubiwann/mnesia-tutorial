###################
LFE Mnesia Tutorial
###################


Introduction
============

This repo holds the source code for the LFE Mnesia Tutorial available `here`_.


Dependencies
------------

This project assumes that you have `rebar`_ installed somwhere in your
``$PATH``.

This project depends upon the following, which installed to the ``deps``
directory of this project when you run ``make deps``:

* `LFE`_ (Lisp Flavored Erlang; needed only to compile)
* `lfeunit`_ (needed only to run the unit tests)


Download
========

Get the code from github and compile it:

.. code:: shell

    $ git clone git@github.com:oubiwann/mnesia-tutorial.git
    $ cd mnesia-tutorial
    $ make get-deps
    $ make compile


Walk-Through
============

.. code:: cl

> (mnesia:create_schema (list (node)))
ok
> (mnesia:start)
ok
> (slurp '"src/structure.lfe")
#(ok structure)
> (create-set-tables)
(#(atomic ok) #(atomic ok) #(atomic ok) #(atomic ok))
> (create-bag-tables)
(#(atomic ok) #(atomic ok))


.. Links
.. -----
.. _here: http://lfe.github.io/tutorials/mnesia/1.html
.. _rebar: https://github.com/rebar/rebar
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
