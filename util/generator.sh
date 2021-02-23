echo ''
echo '-------------------------------------'
echo 'Start Generator ......'
echo '-------------------------------------'

for i in $@; do
	version=$(sed -n '1p' ./tmp/parse/${i}-result.info)
	dl_base=$(sed -n '2p' ./tmp/parse/${i}-result.info)
	dl_file=$(sed -n '3p' ./tmp/parse/${i}-result.info)
	dl="https://"${dl_base}${dl_file}
	sha256=$(sed -n '4p' ./tmp/parse/${i}-result.info)
	size_raw=$(sed -n '5p' ./tmp/parse/${i}-result.info)
	size=$(awk 'BEGIN{printf "%.3f",('$size_raw'/'1048576')}')" MB"

	sed -i "s|{{${i}-Version}}|$version|g" tmp/chrome.xml
	sed -i "s|{{${i}-SHA256}}|$sha256|g" tmp/chrome.xml
	sed -i "s|{{${i}-dl-main}}|$dl|g" tmp/chrome.xml
	sed -i "s|{{${i}-Size}}|$size_raw|g" tmp/chrome.xml
done
