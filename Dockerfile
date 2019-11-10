FROM alpine:edge

LABEL name="aws-cdk-java-github-action" \
      version="1.0.0" \
      repository="https://github.com/cmsd2/aws-cdk-java-github-action" \
      homepage="https://github.com/cmsd2/aws-cdk-java-github-action" \
      "com.github.actions.name"="aws-cdk-java-github-action" \
      "com.github.actions.description"="GitHub Action using AWS CDK for Java" \
      "com.github.actions.icon"="box" \
      "com.github.actions.color"="blue" \
      "maintainer"="Chris Dawes <cmsd2@cantab.net>"

RUN apk --no-cache add nodejs nodejs-npm openjdk11
RUN npm install -g aws-cdk

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
