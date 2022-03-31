Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42DA4C
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 21:56:57 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id bt26so1578672lfb.3
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 14:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5/V3Ppw/qitPursR+7CAkeFCCgQmdXdvGMRe0ZnPWU=;
        b=e1FFrPkG1ZIU2AnelJMZJj26kfEzrzR5n811c5f5YJue2DqnotZS7FtJ4wIuEDJj48
         nX9VHMGo+Nb9F5OzpYx2GZ5mmUmz6YOCPx6ms//qFi3D5PLCAGdSry589Q1lr1wtc5Xr
         A1vLmhtsrSYo0k0QTOShbXCE0PqeKdtJKEAE7nmhdbeBOy60FjRMOAvMTs81PvFMT4dX
         cobkI6Al2+i6DkCHhSDYA5Ec884E+ld7PvoMIXWdDyFrYI0xCZRU2y6ATzWjeEXvEaDx
         YJOa35UeitLPhclE2stlTQHTZl5lLtWQcgl4BiTRl0S+V+OoWVsS8yigFCfr+ecg0TYX
         I7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5/V3Ppw/qitPursR+7CAkeFCCgQmdXdvGMRe0ZnPWU=;
        b=tLftmeqdvb/6R8p0lTSI10VMcBmgonks4UEFI2lrkTrbBlNMTNRW+HlNGkdgpKzh7g
         LDn5o1KpKEXmN7y6Zf15QZGHZTgQmuC6KvtgHKCTunobSXA04vNAQY/kQLT9WVwY5kaR
         Akz4nPiDJnB4shudmo76cX4o0kgs3A0fE8/OZSqlvJM3GdOapGEb9n0A7L2y4Ezqfqk/
         QIzCsIrrim2SFDiUjXINsczgZg/oKhhQt8UBfXhcjeTt5OU0xcZ7XkHEUOOkk1fPxQpe
         +pCiJv3uVKFa1gPmNUZPQYFugTdulKmq/5C66HSKankd8OpSlf+4D8NTK8yb6meAcssF
         534w==
X-Gm-Message-State: AOAM530LFgZNYVRCuxR57yTkKJyo+xfpdBXYAu+EaxcKhDPOpS9ZYMkZ
	6znCt/zjp+6WDMhU+4JS9Lc=
X-Google-Smtp-Source: ABdhPJzy4Bqt3mhcetavw7lWOhsd6LFjmLJaxselo/aO+36hXhoXXJBjdmcJCVeE8bZDC8IkH3JXTQ==
X-Received: by 2002:a05:6512:2214:b0:44a:348a:d72 with SMTP id h20-20020a056512221400b0044a348a0d72mr12190683lfu.416.1648763815000;
        Thu, 31 Mar 2022 14:56:55 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:31b:6d9:f5ff:fecb:a8ab])
        by smtp.googlemail.com with ESMTPSA id u2-20020a2e9f02000000b0024af5f27771sm38800ljk.32.2022.03.31.14.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 14:56:54 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: 
Cc: Grigory Vasilyev <h0tc0d3@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yury Norov <yury.norov@gmail.com>,
	Yonghong Song <yhs@fb.com>,
	Adrian Ratiu <adrian.ratiu@collabora.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] Fix kernel build with LLVM=1
Date: Fri,  1 Apr 2022 00:56:58 +0300
Message-Id: <20220331215659.3800-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wrong logic is using 1 as a suffix instead of -1.
So the build script tries to find clang1 file instead of clang.

GEN     Makefile
HOSTCC  scripts/basic/fixdep
/bin/sh: line 1: clang1: command not found
make[2]: *** [/build/linux/scripts/Makefile.host:95: scripts/basic/fixdep] Error 127
make[1]: *** [/build/linux/Makefile:564: scripts_basic] Error 2
make: *** [Makefile:219: __sub-make] Error 2

Fixes: b8321ed4a40c("Merge tag 'kbuild-v5.18-v2'")

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
Reported-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 Makefile                       | 4 ++--
 tools/scripts/Makefile.include | 4 ++--
 tools/testing/selftests/lib.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 18ecb49f1af6..efca890d4ea3 100644
--- a/Makefile
+++ b/Makefile
@@ -426,8 +426,8 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 ifneq ($(LLVM),)
 ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
-else ifneq ($(filter -%,$(LLVM)),)
-LLVM_SUFFIX := $(LLVM)
+else ifneq (,$(findstring -, $(LLVM)))
+LLVM_SUFFIX := $(filter -%, $(LLVM))
 endif
 
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0efb8f2b33ce..c7a56d7f0bad 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -54,8 +54,8 @@ endef
 ifneq ($(LLVM),)
 ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
-else ifneq ($(filter -%,$(LLVM)),)
-LLVM_SUFFIX := $(LLVM)
+else ifneq (,$(findstring -, $(LLVM)))
+LLVM_SUFFIX := $(filter -%, $(LLVM))
 endif
 
 $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 2a2d240cdc1b..42af066cf39e 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -3,8 +3,8 @@
 ifneq ($(LLVM),)
 ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
-else ifneq ($(filter -%,$(LLVM)),)
-LLVM_SUFFIX := $(LLVM)
+else ifneq (,$(findstring -, $(LLVM)))
+LLVM_SUFFIX := $(filter -%, $(LLVM))
 endif
 
 CC := $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
-- 
2.35.1

