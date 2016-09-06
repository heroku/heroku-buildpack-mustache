Heroku Buildpack to Render Mustache Templates at Runtime
========================================================

🚨 Highly experiemental. Probably doesn't work yet.

Render environment variables into files at runtime.

Super handy to generate configuration files with [12-factor](https://12factor.net/config) style.

Usage
------

Add this buildpack to your app:

```bash
heroku buildpacks:add https://github.com/heroku/heroku-buildpack-mustache.git
```

Create the file `mustache_templates.conf` in your repo. Each line is a set of arguments for [`mo`](https://github.com/tests-always-included/mo).

```
public/index.html.mustache > public/index.html
public/robots.txt.mustache > public/robots.txt
```

### `mo --help`

> Mo is a mustache template rendering software written in bash.  It inserts environment variables into templates.
>
> Simply put, mo will change `{{VARIABLE}}` into the value of that environment variable. You can use `{{#VARIABLE}}content{{/VARIABLE}}` to conditionally display content or iterate over the values of an array.
>
> Learn more about mustache templates at https://mustache.github.io/

Useful `mo` options:

```
--false       - Treat the string "false" as empty for conditionals.
--source=FILE - Load FILE into the environment before processing templates.
```
