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

## Refresh coming soon! (2nd edition)

I'm working on a refresh to this course to update it for changes since the 1st edition was published!
- It will be condensed, so some content won't make the cut. 
  - Fortunately, the vast majority of the current course is still applicable and thus you can always watch the expanded 1st edition (current course) after the refresh (2nd edition) comes out!
  - Both are linked 
    - on my [author page](https://www.pluralsight.com/authors/wes-mcclure).
    - and under **Links** Below

## Links

- Getting Stated with Docker Swarm (2nd edition):
  - Status: WIP, eta May 2021
  - Course: (Link Pending)  
  - Repo: [g0t4/course2-swarm-gs](https://github.com/g0t4/course2-swarm-gs)
- Getting Stated with Docker Swarm Mode (1st edition)
  - Status: current course
  - Course: [1st edition Getting Started with Docker Swarm Mode](https://www.pluralsight.com/courses/docker-swarm-mode-getting-started)
  - Repo: [g0t4/docker-swarm-mode-getting-started](https://github.com/g0t4/docker-swarm-mode-getting-started)
