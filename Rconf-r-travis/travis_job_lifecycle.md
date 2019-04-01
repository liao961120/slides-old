# https://docs.travis-ci.com/user/job-lifecycle

1. OPTIONAL Install `apt addons`
1. OPTIONAL Install `cache components`
1. `before_install`
1. `install`
1. `before_script`
1. `script`
1. OPTIONAL `before_cache` (for cleaning up cache)
1. `after_success` or `after_failure`
1. OPTIONAL `before_deploy`
1. OPTIONAL `deploy`
1. OPTIONAL `after_deploy`
1. `after_script`



If any of the commands in any phases before `script` return a non-zero exit code, the build is broken:

- If `before_install`, `install` or `before_script` returns a non-zero exit code, the build is errored and stops immediately.
- If `script` returns a non-zero exit code, the build is failed, but continues to run before being marked as failed.

The exit code of `after_success`, `after_failure`, `after_script`, `after_deploy` and subsequent stages do not affect the build result. However, if one of these stages **times out**, the build is marked as failed.


deploy:  A non-zero exit code in this phase will mark the build as errored.
