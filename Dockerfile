ARG METABASE_VERSION

FROM metabase/metabase:${METABASE_VERSION} as metabase
FROM eclipse-temurin:11

COPY --from=metabase /app /app

RUN useradd -ms /bin/sh metabase && chown -R metabase /app
WORKDIR /app
USER metabase

EXPOSE 3000
ENTRYPOINT ["/app/run_metabase.sh"]
