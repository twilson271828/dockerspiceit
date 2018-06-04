#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"
echo "Taking snapshot 'run'"


mkdir dynlibs
cd dynlibs
cp -av /usgs/pkgs/local/v007/lib/*cspice* .
cp -av /usgs/pkgs/local/v007/lib/*X11*  .
cp -av /usgs/pkgs/local/v007/lib/*xerces-c* .
cp -av /usgs/pkgs/local/v007/lib/*protobuf* .
cp -av /usgs/pkgs/local/v007/lib/*embree* .
cp -av /usgs/pkgs/local/v007/lib/*Bullet3Collision* .
cp -av /usgs/pkgs/local/v007/lib/*gsl* .
cp -av /usgs/pkgs/local/v007/lib/*embree* .
cp -av /usgs/pkgs/local/v007/lib/*superlu_4.3* .
cp -av /usgs/pkgs/local/v007/lib/*BulletCollision* .
cp -av /usgs/pkgs/local/v007/lib/*Bullet3Geometry* .
cp -av /usgs/pkgs/local/v007/lib/*Bullet3Common* .
cp -av /usgs/pkgs/local/v007/lib/*pcl_io* .
cp -av /usgs/pkgs/local/v007/lib/*pcl_common* .
cp -av /usgs/pkgs/local/v007/lib/*LinearMath* .
cp -av /usgs/pkgs/local/v007/lib/*boost* .
cp -av /usgs/pkgs/local/v007/lib/*Qt5DBus* .
cp -av /usgs/pkgs/local/v007/lib/*QtWebApp* .
cp -av /usgs/pkgs/local/v007/lib/*Qt5Network* .
cp -av /usgs/pkgs/local/v007/lib/*Qt5Gui* .
cp -av /usgs/pkgs/local/v007/lib/*Qt5Xml* .
cp -av /usgs/pkgs/local/v007/lib/*Qt5Core* .
cp -av /usgs/pkgs/local/v007/lib/*Qt5Widgets* .

cp -av /usgs/pkgs/local/v007/lib/*lapack* .
cp -av /usgs/pkgs/local/v007/lib/*BulletDynamics* .
cd ../
mkdir staticlibs
cp /usgs/pkgs/isis3beta/isis/lib/libisis3.5.3.a staticlibs
cp /usgs/pkgs/local/v007/lib/libQtWebApp.a staticlibs
cp -r /usgs/pkgs/isis3beta/isis/inc/ .
cp -r /usgs/pkgs/local/v007/include/naif inc

docker build "$DIR" -t "fedora25:deploy"

echo "To explore 'deploy' use:"
echo "docker run --rm -it fedora25:deploy"
