#!/bin/bash

set -euo pipefail;

shopt -s nullglob globstar;

if [[ $# -eq 0 ]]; then
    echo "Usage: pass find-list <pattern>" >&2;
    exit 1;
fi;

search_term="${1:-}";
search_term="${search_term#/}";
action='tail';

set +u;
prefix=${PASSWORD_STORE_DIR-~/.password-store};
set -u;

password_files=();
password_files=("$prefix"/**/*.gpg);
password_files=("${password_files[@]#"$prefix"/}");
password_files=("${password_files[@]%.gpg}");

password_files=$(printf '%s\n' "${password_files[@]}" | grep -E "${search_term}");

for password_file in $password_files; do
    echo '----------------------------------------';
    echo "$password_file";
    echo '----------------------------------------';
    pass "$action" "$password_file" 2>/dev/null;
    echo '========================================';
done;
