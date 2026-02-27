#!/bin/bash

set -euo pipefail;

shopt -s nullglob globstar;

search_term="${1:-}";
search_term="${search_term#/}";

set +u;
prefix=${PASSWORD_STORE_DIR-~/.password-store};
set -u;

password_files=();
password_files=("$prefix"/**/*.gpg);
password_files=("${password_files[@]#"$prefix"/}");
password_files=("${password_files[@]%.gpg}");

password_files=$(printf '%s\n' "${password_files[@]}" | grep -E "${search_term}");

echo "$password_files";
