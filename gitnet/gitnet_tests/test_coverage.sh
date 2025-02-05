#!/bin/bash
# A script for checking test coverage.
coverage run -a test_get.py
coverage run -a test_netgen.py
coverage run -a test_network.py
coverage run -a test_log.py
coverage run -a test_helpers.py
coverage run -a test_commit_log.py
coverage report -m
coverage report -m > coverage_report.md
coverage erase

echo "
## 9 lines will not be run with our tests:
    - log.py            line 188,189,190,192
    - helpers.py        line 29 and 212
    - multigraph.py     line 98 or line 104
    - test_get.py       line 32
    - test_network.py   line 641 or line 643" >> coverage_report.md
