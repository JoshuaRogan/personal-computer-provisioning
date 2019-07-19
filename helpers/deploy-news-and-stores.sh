# https://wikia-inc.atlassian.net/wiki/spaces/FT/pages/428245211/News+Stories+Runbook?utm_term=page&utm_source=connie-slack&utm_medium=referral-external
## f2
dt git-sync --repo f2
dt deploy --app f2 --repo f2@master --env verify
dt deploy --app f2 --repo f2@master --env prod

## Upstream
dt git-sync --repo upstream
dt deploy --app upstream --repo upstream@master --env verify
dt deploy --app upstream --from verify --env prod
