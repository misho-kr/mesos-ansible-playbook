#!/bin/bash

usage () {
  echo ""
  echo "usage: $0 <dir>"
  echo ""
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

root_dir="${1}"

if [[ ! -d "${root_dir}" ]]; then
  echo "error: ${root_dir} is not directory"

  usage
  exit 2
fi

if [[ ! -w "${root_dir}" ]]; then
  echo "error: ${root_dir} is no writable"

  usage
  exit 2
fi

exec \
  find "${root_dir}" -type f \( -name "*.Po" -o -name "*.Plo" \) \
      -exec cp /dev/null {} \; -print