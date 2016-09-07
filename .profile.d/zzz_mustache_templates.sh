#!/bin/bash

# Render mustache templates defined in mustache_templates.conf into themselves.
# Script name begins with "zzz" to run after other `.profile.d/` scripts.

# Fail immediately on non-zero exit code.
set -e
# Debug, echo every command
#set -x

for template in $(cat mustache_templates.conf); do
  echo "------> Render mustache template: ${template}"
  temporary_file="${template}.mustache"
  mv "${template}" "${temporary_file}"
  eval ".heroku/mustache_templates/bin/mo ${temporary_file} > ${template}"
done
