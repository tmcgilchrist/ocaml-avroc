Ocaml Avro C
============

An OCaml ctypes wrapper for Apache Avro C library.

Building
--------

``` shell
# Install depedencies
opam install --deps-only . --with-test

# Build everything with dune
dune build @all

# Run tests
dune build @runtest
```

Running the quickstop example
----------

``` shell
dune exec -- example/quickstop.exe
```

References
----------

 * [Avro C library](https://avro.apache.org/docs/current/api/c/index.html)
 * [Haskell Avro library](https://github.com/haskell-works/avro)


 depexts: [["avro-c"] {os = "macos" & os-distribution = "homebrew"}]