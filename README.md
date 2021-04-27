# Errata for the course:

## 20.10

### Swarm Jobs!

- As of Docker version `20.10` support for `jobs` has been added!
- [read the jobs docs here](https://docs.docker.com/engine/reference/commandline/service_create/#running-as-a-job).
- `mode` option has two new values: 
  - `replicated-job`
  - `global-job`
- `jobs` are run to `completion`
  - `completion` = return code 0
- IMO comingling `service` and `job` concepts is somewhat confusing albeit they have many options in common.. but a `service` is an abstraction of a `daemon` or `long-running process` whereas a `job` is run once
  - A `docker jobs` or similar might be nice
    - But, `mode` works and avoids a slew of new docker commands and subcommands
  - Many `service` options aren't applicable, like `restart-condition`, `update` and `rollback` options
- `replicated-job`s use the `replicas` setting to specify how many
- `global-job`s run one per node (matching any placement constraints)
  - as nodes are added, each will have a task for each `global-job`


## 17.10 

- `docker service` commands no longer run detached by default as of `17.10`
  - This is nice because you get a **progress indicator** in the new interactive mode
  - If you want to run detached simply pass `--detach`
  - Applies to `service create`, `service update`, `service rollback`, and `service scale`
  - For command examples before and after this change and a history of the change, check out this PR, it's great: [docker/cli#525](https://github.com/docker/cli/pull/525)
  
Updated as of 17.10

Keep an eye out for future changes, this is the easiest spot for me to update.
