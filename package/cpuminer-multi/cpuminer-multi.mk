################################################################################
#
# cpuminer-multi
#
################################################################################

CPUMINER_MULTI_VERSION = 1.3.1
CPUMINER_MULTI_SOURCE = v$(CPUMINER_MULTI_VERSION)-multi.tar.gz
CPUMINER_MULTI_SITE = https://github.com/tpruvot/cpuminer-multi/archive
CPUMINER_MULTI_LICENSE = GPLv2
CPUMINER_MULTI_LICENSE_FILES = COPYING
CPUMINER_MULTI_DEPENDENCIES = libcurl openssl jansson
CPUMINER_MULTI_CONF_OPTS = --with-curl --with-crypto CFLAGS="-O2 -Ofast -flto -fuse-linker-plugin -ftree-loop-if-convert-stores -DUSE_ASM"
CPUMINER_MULTI_AUTORECONF = YES

define CPUMINER_MULTI_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_GARIMPO_PATH)/package/cpuminer-multi/S99cpuminer \
                $(TARGET_DIR)/etc/init.d/S99cpuminer
endef

$(eval $(autotools-package))
