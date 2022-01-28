#!/bin/bash

nj=10

while read line; do
	# reading each line
	file_name=`echo $line | awk '{print $1}'`
	remote_md5=`echo $line | awk '{print $2}'`
	url=`echo $line | awk '{print $3}'`
	if [ -f $file_name ]; then
		local_md5=$(md5sum $file_name | awk '{print $1}')
		if [ "$local_md5" == "$remote_md5" ]; then
			echo "$0: Skipping $file_name, successfully retrieved already."
		else 
			echo "$0: $file_name corrupted or out-of-date, start to re-download."
			./cowtransfer-uploader -p ${nj} $url
		fi
	else 
		./cowtransfer-uploader -p ${nj} $url
	fi
done < file_url.txt
