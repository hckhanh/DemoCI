#!/bin/bash

set -e

# Install KVM to run x86 emulator
if [ "${ANDROID_TARGET}" = "x86" ]; then
	echo "[ INSTALL KVM ]"
	egrep -c '(vmx|svm)' /proc/cpuinfo
	# cat /sys/hypervisor/properties/capabilities
	# egrep -c ' lm ' /proc/cpuinfo
	# uname -m
	sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
	groups
	sudo adduser `id -un` kvm
	sudo adduser `id -un` libvirtd
	sudo virsh -c qemu:///system list
fi

# Run emulator
echo no | android create avd --force -n test -t ${ANDROID_API} --abi ${ANDROID_TARGET}

if [ "${ANDROID_TARGET}" = "x86" ]; then
	emulator-x86 -avd test -no-skin -no-audio -no-window -qemu -m 2047 -enable-kvm &
else
	emulator -avd test -no-skin -no-audio -no-window &
fi

android-wait-for-emulator
adb shell input keyevent 82 &
