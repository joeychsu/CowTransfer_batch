
nj=10

echo -n "" > file_url.txt
file_list=`ls youtube_split`
for file_name in $file_list ; do

	local_md5=$(md5sum youtube_split/${file_name} | awk '{print $1}')
	update_info=`./cowtransfer-uploader -p ${nj} youtube_split/${file_name}`
	url=`echo $update_info | grep "Destination" | awk '{print $2}'`
	echo "${file_name} ${local_md5} ${url}" >> file_url.txt

done
