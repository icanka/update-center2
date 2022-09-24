#!/bin/bash
SCRIPT_DIR=$(dirname "$0")
MAIN_DIR=$(readlink -f "$SCRIPT_DIR"/../ 2>/dev/null)

if type -p java &>/dev/null; then
    echo "Found java executable in PATH"
    _java="java"
elif [[ -n $JAVA_HOME ]] && [[ -x $JAVA_HOME/bin/java ]]; then
    echo "Found java executable in JAVA_HOME"
    _java="$JAVA_HOME/bin/java"
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}' | awk -F '.' '{print $1"." $2}')
    if [[ "$version" != "1.8" ]]; then
        echo "Java version (1.8) requirement is not met. Checking /usr/lib/jvm"
        if [[ -d "/usr/lib/jvm/java-8-openjdk" ]]; then
            echo "Found java 1.8 in path /usr/lib/jvm"
            export PATH="/usr/lib/jvm/java-8-openjdk/bin/:$PATH"
        elif [[ -d  "/usr/lib/jvm/java-1.8.0" ]];then
            echo "Found java 1.8 in path /usr/lib/jvm"
            export PATH="/usr/lib/jvm/java-1.8.0/bin/:$PATH"
        fi   
    elif [[ "$version" = "1.8" ]]; then
        echo "Found required java version: $version"
    else
        echo "Cannot determine java version"
        exit 1
    fi
else
    exit 1
fi

export SECRET=$MAIN_DIR/update-site/secret
