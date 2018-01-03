#!/bin/sh

for extension in $(awk -F',' '{for (i = 1 ; i <= NF ; i++) print $i}' <<< "${POSTGRES_EXTENSIONS}"); do
	echo "loading ${extension} extension..."
	psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c "CREATE EXTENSION IF NOT EXISTS ${extension};" >/dev/null 2>&1
done
