CONTAINER_PATH="/opt/code"
echo $HOST_PATH

sed -i "s|${CONTAINER_PATH}|$HOST_PATH|g" "${1}"

