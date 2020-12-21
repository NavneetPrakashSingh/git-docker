FROM jekyll/jekyll:latest

ENV WORKING_DIR=""
ENV GIT_REPO=""
ENV GIT_BRANCH="main"
ENV GIT_ORIGIN="origin"
ENV COMMIT_EMAIL="NavneetPrakashSingh"
ENV COMMIT_USER="NavneetPrakashSingh@users.noreply.github.com"

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
COPY . .
RUN ls
RUN chmod +x build.sh
RUN ["bash","build.sh"]
RUN ls