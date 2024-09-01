FROM nginx:1.14.0-alpine

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

RUN apk --no-cache add python3 py3-pip && pip3 install --trusted-host pypi.org --trusted-host files.pythonhosted.org j2cli

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/*

COPY /dist /usr/share/nginx/html

COPY nginx.conf.j2 /templates/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
