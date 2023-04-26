#!/usr/bin/env bash
pg_version=$1
os_version=$2
version=$(curl -sX GET "https://pkgs.alpinelinux.org/packages?name=postgresql$pg_version-client&branch=v$os_version&arch" | grep -oP '(?<=<td class="version">)[^<]*' 2>/dev/null)
version="${version%%_*}"
version="${version%%-*}"
printf "%s" "${version}"
