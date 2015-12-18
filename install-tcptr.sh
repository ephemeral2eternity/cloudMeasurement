#!/bin/sh

echo "Installing necessary packages for tcpping!"

rpm -Uvh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/14/Everything/i386/os/Packages/libnet-1.1.4-4.fc14.i686.rpm
rpm -Uvh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/14/Everything/i386/os/Packages/tcptraceroute-1.5-0.8.beta7.fc12.i686.rpm
rpm -Uvh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/14/Everything/i386/os/Packages/bc-1.06.95-1.fc12.i686.rpm

echo "Testing tcpping!"
~/moncloud/tcpping -C -x 5 cache-01.cloudapp.net
