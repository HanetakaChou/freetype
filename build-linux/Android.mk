#
# Copyright (C) YuqiaoZhang(HanetakaChou)
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# https://developer.android.com/ndk/guides/android_mk

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := freetype

LOCAL_SRC_FILES := \
    $(LOCAL_PATH)/../src/autofit/autofit.c \
    $(LOCAL_PATH)/../src/base/ftbase.c \
    $(LOCAL_PATH)/../src/base/ftbbox.c \
    $(LOCAL_PATH)/../src/base/ftbdf.c \
    $(LOCAL_PATH)/../src/base/ftbitmap.c \
    $(LOCAL_PATH)/../src/base/ftcid.c \
    $(LOCAL_PATH)/../src/base/ftfstype.c \
    $(LOCAL_PATH)/../src/base/ftgasp.c \
    $(LOCAL_PATH)/../src/base/ftglyph.c \
    $(LOCAL_PATH)/../src/base/ftgxval.c \
    $(LOCAL_PATH)/../src/base/ftinit.c \
    $(LOCAL_PATH)/../src/base/ftmm.c \
    $(LOCAL_PATH)/../src/base/ftotval.c \
    $(LOCAL_PATH)/../src/base/ftpatent.c \
    $(LOCAL_PATH)/../src/base/ftpfr.c \
    $(LOCAL_PATH)/../src/base/ftstroke.c \
    $(LOCAL_PATH)/../src/base/ftsynth.c \
    $(LOCAL_PATH)/../src/base/ftsystem.c \
    $(LOCAL_PATH)/../src/base/fttype1.c \
    $(LOCAL_PATH)/../src/base/ftwinfnt.c \
    $(LOCAL_PATH)/../src/bdf/bdf.c \
    $(LOCAL_PATH)/../src/bzip2/ftbzip2.c \
    $(LOCAL_PATH)/../src/cache/ftcache.c \
    $(LOCAL_PATH)/../src/cff/cff.c \
    $(LOCAL_PATH)/../src/cid/type1cid.c \
    $(LOCAL_PATH)/../src/gzip/ftgzip.c \
    $(LOCAL_PATH)/../src/lzw/ftlzw.c \
    $(LOCAL_PATH)/../src/pcf/pcf.c \
    $(LOCAL_PATH)/../src/pfr/pfr.c \
    $(LOCAL_PATH)/../src/psaux/psaux.c \
    $(LOCAL_PATH)/../src/pshinter/pshinter.c \
    $(LOCAL_PATH)/../src/psnames/psnames.c \
    $(LOCAL_PATH)/../src/raster/raster.c \
    $(LOCAL_PATH)/../src/sfnt/sfnt.c \
    $(LOCAL_PATH)/../src/smooth/smooth.c \
    $(LOCAL_PATH)/../src/truetype/truetype.c \
    $(LOCAL_PATH)/../src/type1/type1.c \
    $(LOCAL_PATH)/../src/type42/type42.c \
    $(LOCAL_PATH)/../src/winfonts/winfnt.c

LOCAL_CFLAGS :=

ifeq (armeabi-v7a,$(TARGET_ARCH_ABI))
LOCAL_ARM_MODE := arm
LOCAL_ARM_NEON := true
else ifeq (arm64-v8a,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS +=
else ifeq (x86,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS += -mf16c
LOCAL_CFLAGS += -mfma
LOCAL_CFLAGS += -mavx2
else ifeq (x86_64,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS += -mf16c
LOCAL_CFLAGS += -mfma
LOCAL_CFLAGS += -mavx2
else
LOCAL_CFLAGS +=
endif

LOCAL_CFLAGS += -Wall
LOCAL_CFLAGS += -Werror=return-type

LOCAL_CFLAGS += -DFT2_BUILD_LIBRARY
LOCAL_CFLAGS += -fvisibility=hidden

LOCAL_C_INCLUDES :=
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../include

LOCAL_CPPFLAGS := 
LOCAL_CPPFLAGS += -std=c++17

include $(BUILD_STATIC_LIBRARY)
