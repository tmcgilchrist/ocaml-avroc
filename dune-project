(lang dune 2.4)
(name avro)
(generate_opam_files true)
(license MIT)
(maintainers "Sidharth Kuruvila <sidharth.kuruvila@gmail.com>" "Tim McGilchrist <timmcgil@gmail.com>")
(authors "Sidharth Kuruvila <sidharth.kuruvila@gmail.com>" "Tim McGilchrist <timmcgil@gmail.com>" )
(source (github tmcgilchrist/ocaml-avro))
(documentation "https://tmcgilchrist.github.io/ocaml-avro/")

(package
 (name avro)
 (depends
  (ocaml (>= 4.08.0))
  (dune (>= 2.4))
  (ctypes (>= 0.19))
  ctypes-foreign
  (conf-libffi (>= 2.0))
  (ounit2 (and (>= 2.2) :with-test)))
 (synopsis "OCaml bindings to Apache Avro's c library"))

(package
 (name avro-example)
 (depends
  (ocaml (>= 4.08.0))
  (dune (>= 2.4))
  (ctypes (>= 0.19))
  ctypes-foreign
  (conf-libffi (>= 2.0))
  (avro :version))
 (synopsis "Example code for avro library"))
