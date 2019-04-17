#!/usr/bin/env bash
# Code developed by JRM3

export PYTHONPATH=/home/dkennetz/PrimerTK/src:$PYTHONPATH

SKIP_COVERED=""
COVERAGE=""

usage() {
    echo "run_tests.sh [-h] [--coverage] [--skip-covered]"
}

while [[ ! -z $1 ]]; do
    case $1 in
        --skip-covered) SKIP_COVERED="--skip-covered"; COVERAGE=True; ;;
        --coverage) COVERAGE=True; ;;
        -h) usage && exit 0; ;;
    esac
    shift
done

if [[ $COVERAGE ]]; then
    coverage run -m unittest discover ./ -p "test*.py" -b
    coverage_report=$(mktemp)
    coverage report $SKIP_COVERED --include="/home/dkennetz/PrimerTK/src/genome_iterator_sv.py" -m > $coverage_report
#    coverage report $SKIP_COVERED -m > $coverage_report
    cat $coverage_report
    rm $coverage_report
else
    python3 -m unittest discover ./ -p "test*.py" -b
fi