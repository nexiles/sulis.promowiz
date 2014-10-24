JAVA_VERSION="1.7"
MOUNT_POINT="/Volumes/settr-vm-ptc"
IP="192.168.100.117"

test -d $MOUNT_POINT || mkdir $MOUNT_POINT
mount | grep "$MOUNT_POINT" >/dev/null || {
    mount_smbfs //pdmlink:pdmlink@$IP/settr-vm-ptc $MOUNT_POINT
}

# java 1.7
export JAVA_HOME=$(/usr/libexec/java_home -v$JAVA_VERSION)


export WT_HOME="$MOUNT_POINT/wt10/windchill"
#export NX_HOME="$MOUNT_POINT/nexiles"
export IPYTHONDIR="$(pwd)/src/.ipython"
export PYTHONUSERBASE="$(pwd)/src/local"
export SENCHA_VERSION="4.0.1.45"

export WTUSER="wtadmin"
export WTPASS="wtadmin"

echo "JAVA_HOME=$JAVA_HOME"
echo "WT_HOME=$WT_HOME"
echo "IPYTHONDIR=$IPYTHONDIR"
echo "PYTHONUSERBASE=$PYTHONUSERBASE"
