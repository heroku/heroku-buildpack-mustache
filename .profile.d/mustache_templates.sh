#!/bin/bash

# Fail immediately on non-zero exit code.
set -e
# Fail immediately on non-zero exit code within a pipeline.
set -o pipefail
# Fail on undeclared variables.
set -u
# Debug, echo every command
#set -x

for template_args in $(cat mustache_templates.conf); do
  echo "------> Render mustache template: ${template_args}"
  eval ".heroku/mustache_templates/bin/mo ${template_args}"
done