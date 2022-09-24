#!/bin/bash
SCRIPT_DIR=$( dirname $0 )
MAIN_DIR=$( readlink -f "$SCRIPT_DIR"/../ 2>/dev/null )
export SECRET=$MAIN_DIR/update-site/secret
export PATH="/usr/lib/jvm/java-8-openjdk/bin/:$PATH"
