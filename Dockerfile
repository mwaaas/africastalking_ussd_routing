FROM kong:0.11-alpine

RUN mkdir -p /usr/src/app/kong/plugins/africastalking_ussd_routing \
    && luarocks install inspect \
    && mkdir -p /usr/local/kong/logs \
    && ln -sf /dev/stdout /usr/local/kong/logs/access.log \
    && ln -sf /dev/stdout /usr/local/kong/logs/error.log \
	&& ln -sf /dev/stdout /usr/local/kong/logs/admin_access.log

WORKDIR /usr/src/app/kong/plugins/africastalking_ussd_routing

# copy plugin to where its expected by Kong architecture
COPY ./src /usr/src/app/kong/plugins/africastalking_ussd_routing

# copy devops
COPY ./devops /usr/src/app/devops

# default environment variables
# Disabling nginx daemon mode
ENV KONG_NGINX_DAEMON="off" \
    # turn off anonymous report to kong-mshape
    KONG_ANONYMOUS_REPORTS="off" \
    LUA_PATH='/usr/src/app/?.lua;./?.lua;./?/init.lua;;;'\
    KONG_CUSTOM_PLUGINS=africastalking_ussd_routing

ENTRYPOINT ["/usr/src/app/devops/docker-entrypoint.sh"]
