SIMPLE_SCRIPT_DIR="$( dirname "$0" )"
echo $SIMPLE_SCRIPT_DIR
echo "${SIMPLE_SCRIPT_DIR}/../"
test=$(readlink -f "$SIMPLE_SCRIPT_DIR/../")
echo "${test}"
echo ######

echo "#####################"
echo $*
echo  "#####################"
echo "$@"
