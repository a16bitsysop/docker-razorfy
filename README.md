# docker-razorfy
Alpine based Dockerfile to install [razorfy](https://github.com/HeinleinSupport/razorfy) as a docker container.

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/razorfy.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/razorfy/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/razorfy.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/razorfy/)
[![](https://images.microbadger.com/badges/version/a16bitsysop/razorfy.svg)](https://microbadger.com/images/a16bitsysop/razorfy "Get your own version badge on microbadger.com")

## Github
Github Repository: [https://github.com/a16bitsysop/docker-razorfy](https://github.com/a16bitsysop/docker-razorfy)

## Environment Variables
| Name                | Desription                        | Default   |
| ------------------- | --------------------------------- | --------- |
| RAZORFY_BINDADDRESS | Address that razorfy binds to     | 127.0.0.1 |
| RAZORFY_BINDPORT    | Port that razorfy listens on      | 11342     |
| RAZORFY_MAXTHREADS  | Maximum numbers of threads to use | 2000      |
| RAZORFY_DEBUG       | Set to 1 to enable debug logging  | 0         |


## Examples
**To run a container exposing razorfy port with verbose logging**
```
#docker container run -p 11342:11342 -d --name razorfy --env RAZORFY_BINDADDRESS=0.0.0.0 --env RAZORFY_DEBUG=1 a16bitsysop/razorfy
```
