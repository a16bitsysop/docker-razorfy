FROM alpine:3.13
LABEL maintainer="Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/razorfy/master/razorfy.pl

# hadolint ignore=DL3018
RUN addgroup razor 2>/dev/null \
&& adduser -D --gecos "razor antispam" --ingroup razor razor 2>/dev/null \
&& mkdir /home/razor/.razor && chown razor:razor /home/razor/.razor \
&& apk add -u --no-cache razor

WORKDIR /home/razor/.razor
COPY --chown=razor:razor razor-agent.conf .

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./

SHELL [ "/bin/ash", "-o", "pipefail", "-c" ]
RUN wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" | sed -e s+\"++g -e 's+.*ETag:\ ++' > /etc/githash \
&& chmod +x razorfy.pl

CMD [ "entrypoint.sh" ]
EXPOSE 11342
