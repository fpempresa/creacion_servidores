#!/bin/sh

# Grab command-line arguments
cmdlnargs="$@"

: ${OO_INSTALL_KEEP_ASSETS:="false"}
: ${OO_INSTALL_CONTEXT:="origin"}
: ${TMPDIR:=/tmp}
[[ $TMPDIR != */ ]] && TMPDIR="${TMPDIR}/"

if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
then
  echo "Checking for necessary tools..."
fi
for i in ruby ssh scp
do
  command -v $i >/dev/null 2>&1 || { echo >&2 "OpenShift installation requires $i but it does not appear to be available. Correct this and rerun the installer."; exit 1; }
done
if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
then
  echo "...looks good."
fi

# All instances of oo-install-20150316-1531 are replaced during packaging with the actual package name.
if [[ -e ./oo-install-20150316-1531.tgz ]]
then
  if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
  then
    echo "Using bundled assets."
  fi
  cp oo-install-20150316-1531.tgz ${TMPDIR}/oo-install-20150316-1531.tgz
elif [[ $OO_INSTALL_KEEP_ASSETS == 'true' && -e ${TMPDIR}/oo-install-20150316-1531.tgz ]]
then
  if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
  then
    echo "Using existing installer assets."
  fi
else
  echo "Downloading oo-install package..."
  curl -s -o ${TMPDIR}oo-install-20150316-1531.tgz https://install.openshift.com/oo-install-20150316-1531.tgz
fi

if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
then
  echo "Extracting oo-install to temporary directory..."
fi
tar xzf ${TMPDIR}oo-install-20150316-1531.tgz -C ${TMPDIR}

if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
then
  echo "Starting oo-install..."
else
  clear
fi
RUBYDIR='1.9.1/'
RUBYVER=`ruby -v`
if [[ $RUBYVER == ruby\ 1\.8* ]]
then
  RUBYDIR='1.8/'
elif [[ $RUBYVER == ruby\ 2\.* ]]
then
  RUBYDIR=''
fi
GEM_PATH="${TMPDIR}oo-install-20150316-1531/vendor/bundle/ruby/${RUBYDIR}gems/"
RUBYLIB="${TMPDIR}oo-install-20150316-1531/lib:${TMPDIR}oo-install/vendor/bundle"
for i in `ls $GEM_PATH`
do
  RUBYLIB="${RUBYLIB}:${GEM_PATH}${i}/lib/"
done
GEM_PATH=$GEMPATH RUBYLIB=$RUBYLIB OO_INSTALL_CONTEXT=origin OO_VERSION='base' OO_INSTALL_VERSION='Build 20150316-1531' sh -c "${TMPDIR}oo-install-20150316-1531/bin/oo-install ${cmdlnargs}"

if [ $OO_INSTALL_CONTEXT != 'origin_vm' ]
then
  if [ $OO_INSTALL_KEEP_ASSETS == 'true' ]
  then
    echo "oo-install exited; keeping temporary assets in ${TMPDIR}"
  else
    echo "oo-install exited; removing temporary assets."
    rm -rf ${TMPDIR}oo-install-20150316-1531*
  fi
fi

exit
