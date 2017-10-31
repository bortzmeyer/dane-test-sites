# dane-test-sites
A list of public TLS sites using DANE, for testing programs

The list includes both working sites and (sometimes deliberately) broken sites. It is in a structured format, JSON. Pull-requests are welcome, as well as demands to be added as a commiter.

The idea is to ad only static info in the file: dynamic stuff, such as the DNSSEC status (valid or bogus) or the various TLSA fields (such as usage) should be produced automatically by programs, for easier maintenance.

## TODO

Programs to produce nice outputs such as:

* HTML, for nice Web pages
* JSON annotated with, for instance, testing results added automatically