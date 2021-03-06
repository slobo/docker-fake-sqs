# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Fake SQS image based on airdock/base
# TO_BUILD:       docker build --rm -t airdock/fake-sqs .
# SOURCE:         https://github.com/airdock-io/docker-fake-sqs

FROM airdock/base:latest
MAINTAINER Jerome Guibert <jguibert@gmail.com>

RUN apt-get update -qq && apt-get install -y ruby-full && \
   mkdir -p /opt/fake-sqs && cd /opt/fake-sqs && \
   mkdir -p /svr/fake-sqs && \
   gem install fake_sqs && \
  /root/post-install

EXPOSE 4568

CMD ["fake_sqs",  "--database" , "/svr/fake-sqs/database.yml"]
