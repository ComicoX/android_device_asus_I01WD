#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

DEVICE=I01WD
VENDOR=asus

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

HAVOC_ROOT="${MY_DIR}"/../../..

HELPER="${HAVOC_ROOT}/vendor/havoc/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

function blob_fixup() {
    case "${1}" in
    lib/libwfdnative.so)
        sed -i "s/android.hidl.base@1.0.so/libhidlbase.so\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/" "${2}"
        ;;
    lib64/libwfdnative.so)
        sed -i "s/android.hidl.base@1.0.so/libhidlbase.so\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/" "${2}"
        ;;
    esac
}

SECTION=
KANG=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${HAVOC_ROOT}" true "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" \
        "${KANG}" --section "${SECTION}"

# Fix proprietary blobs
patchelf --remove-needed android.hidl.base@1.0.so \
        "${HAVOC_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/lib/libfm-hci.so"
patchelf --remove-needed android.hidl.base@1.0.so \
        "${HAVOC_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/lib64/libfm-hci.so"

sed -i 's/<library name="android.hidl.manager-V1.0-java"/<library name="android.hidl.manager@1.0-java"/g' \
        "${HAVOC_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/etc/permissions/qti_libpermissions.xml"

"${MY_DIR}/setup-makefiles.sh"
