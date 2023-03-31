#!/usr/bin/env bash

#set -x
echo "pwd is :-" | tee output/output.txt
pwd | tee --append output/output.txt
echo  | tee --append output/output.txt
echo "find baseos dir" | tee --append output/output.txt
find /baseos/ | tee --append output/output.txt
echo  | tee --append output/output.txt

echo "running copy" | tee --append output/output.txt
cp -av --reflink=auto /baseos/2023-02-21-raspios-bullseye-arm64-lite.img /output/test.img
#set +x
echo "running customize" | tee --append output/output.txt
sdmCmd="sdm --customize output/test.img"
sdmCmd="${sdmCmd} --apt-dist-upgrade"
sdmCmd="${sdmCmd} --disable piwiz,swap"
sdmCmd="${sdmCmd} --l10n"
sdmCmd="${sdmCmd} --showapt"
sdmCmd="${sdmCmd} --batch"
sdmCmd="${sdmCmd} --rename-pi testuser"
sdmCmd="${sdmCmd} --password-pi letmein123"
sdmCmd="${sdmCmd} --plugin local-plugins/test-plugin"
sdmCmd="${sdmCmd} --plugin-debug"
sdmCmd="${sdmCmd} --nowpa"
echo "Running ${sdmCmd}"
${sdmCmd} 2>&1 | tee --append output/output.txt
