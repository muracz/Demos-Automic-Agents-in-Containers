#!/bin/sh
#set -x 
# Reset Public Key 

curl -k --request POST -u "$automic_global_rest_user:$automic_global_rest_pass" "$automic_global_rest_endpoint/ae/api/v1/0/system/agents/$automic_global_name/resetpublickey"

# Download Package

echo "Create Agent package"
URL="$automic_global_rest_endpoint/ae/api/v1/$automic_global_client/system/agentpacks"

BODY="{\"platform\" : \"UNIX\", \"operating_system\" : \"Linux\",
\"operating_system_architecture\" : \"x64\", \"name\" : \"$automic_global_name\" }" 

LOCATION=$(curl --header "Content-Type: application/json" --request POST \
--data "$BODY" \
-k \
--user "$automic_global_rest_user:$automic_global_rest_pass" \
--dump-header - \
"$URL" | grep -i "location" | cut -d" " -f2)

ZIP_URL="$(sed -e 's/[[:space:]]*$//' <<<${LOCATION})"
echo "Download $ZIP_URL"

curl --user "$automic_global_rest_user:$automic_global_rest_pass" -k "$ZIP_URL" --output "tmp.zip"
unzip tmp.zip 
# Enable log to standardout
sed -i "s/^MsgToStdout.*=.*/MsgToStdout=yes/g" agent/bin/ucxjlx6.ini
rm tmp.zip
chmod 4755 ./agent/bin/ucxjlx6
./agent/bin/ucxjlx6