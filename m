Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2452F4E
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 20:39:55 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-317955c99a5so156187b3.9
        for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hwEgWIR0X85RGbQAj+svKs+3iD8LEQXAbh8uTtcQjN8=;
        b=GYpZo5sqQ8SQSD4HyIyKmvltTLLdATTj+vC4WuZ1I0yMVvJFKVCF4SN8OiKWc/ww1M
         Dja/Suxxoj05vcezMVDShUNx64G6Ltu3JLQM0haK1k2UMD2SmyWRQyljdU6ENT+Qsulr
         LKaM+46LNEBcDeSNLAY4vMtfCl7R34EJE/u15ce+vn4HC8+L2f12VUtYJXxMD1z5PdWK
         dYRbMnUmEuCHAjqdL2aaa9jBEClpUPug0WPGRe6Ypm64iBu6exPbyFoOuGutn5GbRkni
         iqJZrgId1nAWlErB89kLdJa1Erc85Uj9PDRP8BhF13MWJplaJLHyQXvm8BvVxYsbPWRd
         Td3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hwEgWIR0X85RGbQAj+svKs+3iD8LEQXAbh8uTtcQjN8=;
        b=N09wPpC0vZdSqmdk6z79i4CNxQdb7wm162dlKRrU/s2RtlSKWXPeyJ1gmt7UOztIMj
         TJBSpy+o/4mBhkye4mmPp+Mt0n4ZWeTps/PW3YM71SfuYsos2hNTB0R66lVjc7gGatIo
         Q38JPihIgAZ6bo6/NTcEBrWD/flpuwetObbPCVdp97tsVTz8vmoS2vbSDBfeLVEgQRvP
         GfJ92eBKOqqOw+emoJInW8drwWbQxRJxxm1LIBvcWPNkfFagBKZMY9rcOjXnzN/1fICL
         hj6iGRB2kKQFDQ985dwE8JFAlmWSWvnynSZNyB6KpCtlDJ8/J6GjFfLX5xlV8pCnLnKV
         VflQ==
X-Gm-Message-State: AJIora9AL4noLWvDd6Y8gwkerRl6wHtmjx4P6cxW25NXS8a4ICSz92Ka
	LYLxkv/PUKQQMRqxLQFFN3Hwlh+4/KNB9UvwqZ8=
X-Google-Smtp-Source: AGRyM1vhWQDkQUMsanYQiT8DtJL648P2moNgLjHrALU55AH+aSb47mlB2poP2REKbLw5J+IRKKSwbpYUjSr4aNLSuKo=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:7e0c:dc00:6576:994e])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:df90:0:b0:30c:2910:1b21 with SMTP
 id i138-20020a0ddf90000000b0030c29101b21mr14025781ywe.223.1655498394201; Fri,
 17 Jun 2022 13:39:54 -0700 (PDT)
Date: Fri, 17 Jun 2022 13:39:48 -0700
Message-Id: <20220617203948.3714905-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655498387; l=2636;
 s=20211004; h=from:subject; bh=ufYK5a8BPMKRRuKsgMjeRCb9dbi3hV+UvS6IFEpaf8U=;
 b=9/ATX7BxXQb89TKRCMMKH7sZW7gJbC7H4+0wHvip644aAWcz8gXewtghL0H78X35puGlVEg6no/J
 6UX1kw7VCGJ01v+7imdOmTpBrKVmLY4c/tera3lBspgRRIt5hJXR
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH] scripts/Makefile.clang: set --target for host based on make -v
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

We're working on providing statically linked images of clang to host on
kernel.org. We're building them in Alpine Linux based Docker containers,
which are MUSL based systems.

In order to keep bootstrapping simpler, I'd like for them to have an
implicit default --target of x86_64-alpine-linux-musl (set via LLVM's
cmake variable LLVM_DEFAULT_TARGET_TRIPLE).

Similarly, if one were to use a different build of clang meant for a
glibc or bionic based system on a MUSL based host, we'd prefer to use
the correct MUSL based triple for target hosts.

Borrowed from the Zen of Python: Explicit is better than implicit. Let's
be explicit about the target triple for HOSTCC when building with
HOSTCC=clang or LLVM=1.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile               |  3 +--
 scripts/Makefile.clang | 10 ++++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1a6678d817bd..87712d9b043c 100644
--- a/Makefile
+++ b/Makefile
@@ -600,10 +600,9 @@ endif
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
+HOSTCC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(HOSTCC) --version 2>/dev/null | head -n 1))
 
-ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
-endif
 
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 87285b76adb2..a4505cd62d7b 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,3 +1,4 @@
+ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 # Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
 # endianness and -m32/-m64 to set word size based on Kconfigs instead of
 # relying on the target triple.
@@ -39,3 +40,12 @@ CLANG_FLAGS	+= -Werror=ignored-optimization-argument
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
+endif
+
+# If HOSTCC is clang, set the host target triple explicitly; do not rely on
+# implicit defaults.
+ifneq ($(findstring clang,$(HOSTCC_VERSION_TEXT)),)
+HOST_TRIPLE		:= --target=$(shell make --version | head -n2 | tail -n1 | cut -d ' ' -f 3)
+KBUILD_HOSTCFLAGS	+= $(HOST_TRIPLE)
+KBUILD_HOSTLDFLAGS	+= $(HOST_TRIPLE)
+endif

base-commit: 79fe0f863f920c5fcf9dea61676742f813f0b7a6
-- 
2.36.1.476.g0c4daa206d-goog

