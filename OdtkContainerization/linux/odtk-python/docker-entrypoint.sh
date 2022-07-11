#!/bin/bash
source scl_source enable ${PYTHON_PACKAGE}
odtkruntime &
python $@