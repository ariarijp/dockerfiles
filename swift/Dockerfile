# ref: https://developer.ibm.com/swift/2015/12/15/running-swift-within-docker/
FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

ENV SWIFT_VERSION 2.2-SNAPSHOT-2016-01-11-a
ENV SWIFT_PLATFORM ubuntu14.04

RUN apt-get update && \
    apt-get install -y clang libpython2.7 libicu52 libxml2 libedit2 wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz -C / --strip 1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

CMD ["swift"]
