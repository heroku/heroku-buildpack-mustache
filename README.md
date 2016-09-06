Heroku Buildpack to Render Mustache Templates at Runtime
========================================================

🚨 Highly experiemental. Probably doesn't work yet.

Render environment variables into files at runtime.

Super handy to generate configuration files with [12-factor](https://12factor.net/config) style.

Utilizes [Mo](https://github.com/tests-always-included/mo): [Mustache templates](http://mustache.github.io) in pure bash.

Usage
------

Add this buildpack to your app:

```bash
heroku buildpacks:add https://github.com/heroku/heroku-buildpack-mustache.git
```

Create the file `mustache_templates.conf` in your repo. Each line is the path/name of a file (relative to the repo root) that will be rendered with Mustache replacements:

```
public/index.html
public/robots.txt
```

Each template will be rendered to itself, a file of the same name. A `.mustache` suffixed file containing the original content will be leftover. This file-replacement trick supports inserting environment variables into files that are otherwise untouchable.
