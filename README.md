# docker-razorfy

This repository has moved to: https://gitlab.com/container-email/razorfy

Alpine based Dockerfile to install [razorfy](https://github.com/HeinleinSupport/razorfy) as a docker container.

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/razorfy.svg?style=plastic)](https://hub.docker.com/r/a16bitsysop/razorfy/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/razorfy.svg?style=plastic)](https://hub.docker.com/r/a16bitsysop/razorfy/)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/a16bitsysop/razorfy/latest?style=plastic)](https://hub.docker.com/r/a16bitsysop/razorfy/)
[![Github SHA](https://img.shields.io/badge/dynamic/json?style=plastic&color=orange&label=Github%20SHA&query=object.sha&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fa16bitsysop%2Fdocker-razorfy%2Fgit%2Frefs%2Fheads%2Fmain)](https://github.com/a16bitsysop/docker-razorfy)
[![GitHub Super-Linter](https://github.com/a16bitsysop/docker-razorfy/workflows/Super-Linter/badge.svg)](https://github.com/marketplace/actions/super-linter)

RAZORFY_BINDADDRESS is already set to 0.0.0.0 to listen to all interfaces, this is done in the razor .profile file.

## Github
Github Repository: [https://github.com/a16bitsysop/docker-razorfy](https://github.com/a16bitsysop/docker-razorfy)

## Environment Variables
| Name                | Desription                                             | Default   |
| ------------------- | ------------------------------------------------------ | --------- |
| RAZORFY_BINDPORT    | Port that razorfy listens on                           | 11342     |
| RAZORFY_MAXTHREADS  | Maximum numbers of threads to use                      | 2000      |
| RAZORFY_DEBUG       | Set to 1 to enable debug logging                       | 0         |
| TIMEZONE            | Timezone to use inside the container, eg Europe/London | unset     |

## Examples
**To run a container exposing razorfy port with verbose logging**
```bash
#docker container run -p 11342:11342 -d --name razorfy --env RAZORFY_DEBUG=1 a16bitsysop/razorfy
```
