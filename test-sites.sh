#!/bin/sh

FILENAME="dane-test-sites.json"

# TODO test we have jq

jq -c '.[]' $FILENAME |
while read site; do
    name=$(echo $site | jq -r .name)
    type=$(echo $site | jq -r .type)
    expected=$(echo $site | jq -r .expected_status)
    if [ $type = "HTTP" ]; then # TODO handle SMTP and XMPP with --starttls
	result=$(tlsa --resolvconf="" --verify $name 2>&1)
	status=$?
	if [ $status != 0 ] && [ $expected = "OK" ]; then
	    echo "Should be OK but is not: $name" >&2 
	else if [ $status = 0 ] && [ $expected = "Broken" ]; then
		 echo "Should be broken but is not: $name" >&2
	     fi
	fi
    fi
done
