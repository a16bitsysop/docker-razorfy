FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/razorfy/master/razorfy.pl

RUN apk add --no-cache razor \
&& cd /usr/local/bin \
&& wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" | sed -e s+ETag:.W/++g -e s+\"++g -e 's+^[[:space:]]*++' > /etc/githash \
&& chmod +x razorfy.pl \
&& addgroup razor 2>/dev/null \
&& adduser -D --gecos "razor antispam" --ingroup razor razor 2>/dev/null \
&& mkdir /home/razor/.razor && chown razor:razor /home/razor/.razor

WORKDIR /home/razor/.razor
COPY --chown=razor:razor razor-agent.conf .
COPY --chown=razor:razor profile ../.profile

WORKDIR /usr/local/bin
COPY entrypoint.sh .

CMD [ "entrypoint.sh" ]

EXPOSE 11342
