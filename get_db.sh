#!/bin/sh

matter=$1
cases_dir="$HOME/git/omnix/amici_php/config/cases"
case_conf="$cases_dir/$matter/case_conf.php"

if [ ! -f "$case_conf" ]; then
    echo "invalid or non-existing matter code"
    echo "usage: get_db matter"
    return 1
fi

awk '/SessionServer/ { print $3 }' $case_conf | sed "s/['\"]\(.*\)\.amicillc\.com['\"];/\1/g"
