LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := curl

COMMON_CFLAGS := -DANDROID \
-Wpointer-arith -Wwrite-strings -Wunused -Winline \
-Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long \
-Wfloat-equal -Wno-multichar -Wsign-compare -Wno-format-nonliteral \
-Wendif-labels -Wstrict-prototypes -Wdeclaration-after-statement \
-Wno-system-headers -Wno-typedef-redefinition -Wno-unused-variable -DHAVE_CONFIG_H

COMMON_CFLAGS += -I$(NDK_PATH)/platforms/$(TARGET_PLATFORM)/arch-arm/usr/include

CSOURCES := amigaos.c asyn-ares.c asyn-thread.c base64.c bundles.c conncache.c \
           connect.c content_encoding.c cookie.c curl_addrinfo.c curl_fnmatch.c \
           curl_gethostname.c curl_gssapi.c curl_memrchr.c curl_multibyte.c \
           curl_ntlm.c curl_ntlm_core.c curl_ntlm_msgs.c curl_ntlm_wb.c curl_rtmp.c \
           curl_sasl.c curl_sasl_sspi.c curl_sspi.c curl_threads.c dict.c dotdot.c \
           easy.c escape.c file.c fileinfo.c formdata.c ftp.c ftplistparser.c \
           getenv.c getinfo.c gopher.c hash.c hmac.c hostasyn.c hostcheck.c \
           hostip4.c hostip6.c hostip.c hostsyn.c http2.c http.c http_chunks.c \
           http_digest.c http_negotiate.c http_negotiate_sspi.c http_proxy.c \
           idn_win32.c if2ip.c imap.c inet_ntop.c inet_pton.c krb5.c ldap.c llist.c \
           md4.c md5.c memdebug.c mprintf.c multi.c netrc.c non-ascii.c nonblock.c \
           nwlib.c nwos.c openldap.c parsedate.c pingpong.c pipeline.c pop3.c \
           progress.c rawstr.c rtsp.c security.c select.c sendf.c share.c slist.c \
           smtp.c socks.c socks_gssapi.c socks_sspi.c speedcheck.c splay.c ssh.c \
           strdup.c strequal.c strerror.c strtok.c strtoofft.c telnet.c tftp.c \
           timeval.c transfer.c url.c version.c warnless.c wildcard.c x509asn1.c \
           vtls/axtls.c vtls/curl_darwinssl.c vtls/curl_schannel.c vtls/cyassl.c \
           vtls/gskit.c vtls/gtls.c vtls/nss.c vtls/openssl.c vtls/polarssl.c \
           vtls/polarssl_threadlock.c vtls/qssl.c vtls/vtls.c

LOCAL_SRC_FILES := $(addprefix ../../curl/lib/,$(CSOURCES))
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../curl/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../curl/lib
    
ifeq ($(TARGET_ARCH),x86)
	LOCAL_CFLAGS := $(COMMON_CFLAGS)
else
	LOCAL_CFLAGS := -mfpu=vfp -mfloat-abi=softfp -fno-short-enums $(COMMON_CFLAGS)
endif

LOCAL_CPPFLAGS += -std=gnu++0x

include $(BUILD_STATIC_LIBRARY)
