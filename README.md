# postgresql-createdb

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-zenjoy%2Fpostgresql--createdb-lightgrey?style=flat)](https://hub.docker.com/r/zenjoy/postgresql-createdb)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/zenjoy/docker-postgresql-createdb?label=version)](https://github.com/zenjoy/docker-postgresql-createdb/tags)
[![License](https://img.shields.io/github/license/zenjoy/docker-postgresql-createdb)](https://github.com/zenjoy/docker-postgresql-createdb/blob/main/LICENSE)

A small helper container to initialize Postgres databases using GitOps. Available on Docker Hub or
GitHub Container Registry (GHCR) for AMD64 or ARM64.

```sh
# Docker Hub
docker pull zenjoy/postgres-createdb:latest

# GHCR
docker pull ghcr.io/zenjoy/postgres-createdb:latest
```

## Usage

The following environment variables are used for configuration:

| Variable                 | Description                                            | Default     |
| ------------------------ | ------------------------------------------------------ | ----------- |
| `POSTGRES_HOST`          | Hostname of the Postgres server                        |             |
| `POSTGRES_SUPER_USER`    | User to connect to the Postgres server                 | `postgres`  |
| `POSTGRES_SUPER_PASS`    | Password to connect to the Postgres server             |             |
| `POSTGRES_DB`            | Name of the database to create                         |             |
| `POSTGRES_USER`          | Username to create for the database, will become owner |             |
| `POSTGRES_PASS`          | Password for the user to create for the database       |             |
| `POSTGRES_LOCALE`        | Locale to use for the created database                 | nl_BE.UTF-8 |
| `POSTGRES_RESET`         | Set to "YES" to drop the database if it exists         |             |
| `POSTGRES_RESET_CONFIRM` | Set to "YES" to confirm that you really want this      |             |
| `POSTGRES_USER_FLAGS`    | Extra flags to append to the `createuser` command      |             |

## Container signatures

All images are automatically signed via [Cosign](https://docs.sigstore.dev/cosign/overview/) using
[keyless signatures](https://docs.sigstore.dev/cosign/keyless/). You verify the integrity of these
images as follows:

```sh
cosign verify \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp https://github.com/zenjoy/docker-postgresql-createdb/.github/workflows/ \
  zenjoy/postgres-createdb:latest
```

## Contributing

Feel free to contribute and make things better by opening an
[Issue](https://github.com/zenjoy/docker-postgresql-createdb/issues) or
[Pull Request](https://github.com/zenjoy/docker-postgresql-createdb/pulls).

## License

View [license information](https://github.com/zenjoy/docker-postgresql-createdb/blob/main/LICENSE)
for the software contained in this image.
