#!/bin/bash

if [[ "$#" < 2 ]]; then
	echo "Usage: $0 <rootdir> [<.deb>, <.deb>, ...]"
	echo "  Install .deb(s) to rootdir simply."
fi

dest="$1"
shift

status_file="$dest/data/data/io.neoterm/files/usr/var/lib/dpkg/status"

while [[ "$#" != 0 ]]; do
	file="$1"
	shift
	dpkg -X "$file" "$dest"
	dpkg -e "$file" "$dest"

	cat "$dest/control" >> "$status_file"
	echo "Status: install ok installed" >> "$status_file"
	echo >> "$status_file"
done

