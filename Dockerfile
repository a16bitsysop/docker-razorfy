FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/razorfy/master/razorfy.pl

WORKDIR [ /usr/local/bin ]
RUN sed -i -e 's+v[[:digit:]]\..*\/+edge\/+g' /etc/apk/repositories \
&& apk add --no-cache razor \
&& wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" | sed -e s+ETag:.W/++g -e s+\"++g -e 's+^[[:space:]]*++' > /etc/githash

USER nobody 
CMD [ "perl", "razorfy.pl" ]

EXPOSE 11342
