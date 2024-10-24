HOST_PATH="/Users/anker/OneDrive/Code/active_projects/kahlitos_way/pi_daemon"
CONTAINER_PATH="/opt/code"

sed -i "s|${CONTAINER_PATH}|${HOST_PATH}|g" "${1}"

