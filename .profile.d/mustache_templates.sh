#!/bin/bash

# Fail immediately on non-zero exit code.
set -e
# Fail immediately on non-zero exit code within a pipeline.
set -o pipefail
# Fail on undeclared variables.
set -u
# Debug, echo every command
#set -x

for template in $(cat mustache_templates.conf); do
  echo "------> Render mustache template: ${template}"
  local temporary_file = "${template}.mustache"
  mv "${template}" "${temporary_file}"
  eval ".heroku/mustache_templates/bin/mo ${temporary_file} > ${template}"
done
