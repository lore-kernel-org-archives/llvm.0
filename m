Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF36AA2
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 17:08:32 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b18-20020a253412000000b006b0177978eeso13746119yba.21
        for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=iWnES1pFYzHVUNvKDDC7IskVPtyree/SzxRpzQjJgRo=;
        b=HHCpxX2DIr9qOkpDvkzJdZ4DNF4wd3GDXyiH66fJVnkfY1acDfviaytJGunaSY1J/l
         xaRB0zrpnOC2rrK4IQlzgGsc6/h/fS1p20QvBvS3BevuxjB3EiJZdK47WJ82r2UjGxQd
         Gn4Qx1ZxQNiN3uaVKxqXTFaHAS/xjqMKxQk66LcV3rKbVfwIzeZaooOKNVXqJBv94x7x
         kGRDLoh8QW8ot/n9C2jeduDN8XIARrLKNe4sMjNvWUSws627h2J6leTImoH5PoJ0mJmF
         zsuK6WAFZDbNH5XXr4/RSlf0TQzHd4F2laR9wwfb6Qfv5II7M+3Vgn8qMCEjun97yHzq
         NWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=iWnES1pFYzHVUNvKDDC7IskVPtyree/SzxRpzQjJgRo=;
        b=v6gBPXsNzOFcIbaK0ny65prqCjpXDXte9cDp3AJTLX2Rv5v+0yINHkYZywWQZgrtqO
         5yNNLj5FZHEU3CI6ZKVvBC24Sevas3EmJBpTRRaE/Qyq8O2KHuvdGmXylNpCrtzsEXfB
         nJdwcIhFgX3abPfK5MnRzZW1gtMYPTCkoEmVRPu6HgwMmB/Bqo3ctElVQoy7+gZoHCCX
         MEleWKicpghJGiPVkR/+l/dLSlwuFej2lSxXzR4vgCCijfmDjSSz4mZbYIuH8YefRUo+
         ldWgVgQ4IYAlLmdZBrVT8Sw2KC7nACdxeYFl+wFwnAqHX/Ze+Tn8eYlDVoG3cyrUrOXM
         ydbw==
X-Gm-Message-State: ACrzQf1j/TE0kuf5NykowF97R6Xi0GtNdw03EYve0DUN6BJkw3ZxX0Mi
	iKfKptJOCMzr2zPeHw86k7Nxl1NKeKZ2sTABTuU=
X-Google-Smtp-Source: AMsMyM4EFCM3bN6h7D0OyMqPYl1HtTnhcU0oaIuHfajrcKHDqQw9WJudalwTWzZBL9qvB8DIz1Lgn3bntzkR6Q17Spc=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:2923:f5c9:c5a4:11b5])
 (user=ndesaulniers job=sendgmr) by 2002:a25:3bd4:0:b0:6a8:cdae:268b with SMTP
 id i203-20020a253bd4000000b006a8cdae268bmr15814196yba.418.1663607311828; Mon,
 19 Sep 2022 10:08:31 -0700 (PDT)
Date: Mon, 19 Sep 2022 10:08:28 -0700
In-Reply-To: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663607308; l=6591;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=Y54K6A9C+u/ehYEhrriogrYnsj/r5DOmQuWtQlQ8/dE=;
 b=cadXOabK1UmkKFuvAQIj1NMX5OR51/qoeXoK8Ah7d/GLz2AjYs4o9dNCNtZlV54fZH9KGDvsQix5
 xjPgsQ/3D/m9G4JIxqA5tP6vvSvLPYxwCfQZEhSafbAdlnQSoaVp
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220919170828.3718437-1-ndesaulniers@google.com>
Subject: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

cc-ifversion is GCC specific. Replace it with compiler specific
variants. Update the users of cc-ifversion to use these new macros.

Link: https://github.com/ClangBuiltLinux/linux/issues/350
Link: https://lore.kernel.org/llvm/CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com/
Suggested-by: Bill Wendling <morbo@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v3 -> v4:
* Split into its own patch again from series, as per Masahiro.
* Rebase on top of b0839b281c427e844143dba3893e25c83cdd6c17 and update
  clang -Wformat logic in scripts/Makefile.extrawarn, as per Masahiro.

 Documentation/kbuild/makefiles.rst          | 29 ++++++++++++---------
 Makefile                                    |  6 ++---
 drivers/gpu/drm/amd/display/dc/dml/Makefile |  2 +-
 scripts/Makefile.compiler                   | 10 ++++---
 scripts/Makefile.extrawarn                  |  4 +--
 5 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 11a296e52d68..ee7e3ea1fbe1 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -682,22 +682,27 @@ more details, with real examples.
 	In the above example, -Wno-unused-but-set-variable will be added to
 	KBUILD_CFLAGS only if gcc really accepts it.
 
-    cc-ifversion
-	cc-ifversion tests the version of $(CC) and equals the fourth parameter
-	if version expression is true, or the fifth (if given) if the version
-	expression is false.
+    gcc-min-version
+	gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater than
+	or equal to the provided value and evaluates to y if so.
 
 	Example::
 
-		#fs/reiserfs/Makefile
-		ccflags-y := $(call cc-ifversion, -lt, 0402, -O1)
+		cflags-$(call gcc-min-version, 70100) := -foo
 
-	In this example, ccflags-y will be assigned the value -O1 if the
-	$(CC) version is less than 4.2.
-	cc-ifversion takes all the shell operators:
-	-eq, -ne, -lt, -le, -gt, and -ge
-	The third parameter may be a text as in this example, but it may also
-	be an expanded variable or a macro.
+	In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
+	$(CONFIG_GCC_VERSION) is >= 7.1.
+
+    clang-min-version
+	clang-min-version tests if the value of $(CONFIG_CLANG_VERSION) is greater
+	than or equal to the provided value and evaluates to y if so.
+
+	Example::
+
+		cflags-$(call clang-min-version, 110000) := -foo
+
+	In this example, cflags-y will be assigned the value -foo if $(CC) is clang
+	and $(CONFIG_CLANG_VERSION) is >= 11.0.0.
 
     cc-cross-prefix
 	cc-cross-prefix is used to check if there exists a $(CC) in path with
diff --git a/Makefile b/Makefile
index 298f69060f10..411c8480b37e 100644
--- a/Makefile
+++ b/Makefile
@@ -790,7 +790,6 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 
 KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
-KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
@@ -972,7 +971,6 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += -Wno-maybe-uninitialized
 endif
 
-ifdef CONFIG_CC_IS_GCC
 # The allocators already balk at large sizes, so silence the compiler
 # warnings for bounds checks involving those possible values. While
 # -Wno-alloc-size-larger-than would normally be used here, earlier versions
@@ -984,8 +982,8 @@ ifdef CONFIG_CC_IS_GCC
 # ignored, continuing to default to PTRDIFF_MAX. So, left with no other
 # choice, we must perform a versioned check to disable this warning.
 # https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
-KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
-endif
+KBUILD_CFLAGS-$(call gcc-min-version, 90100) += -Wno-alloc-size-larger-than
+KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index cb81ed2fbd53..d70838edba80 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -34,7 +34,7 @@ dml_ccflags := -mhard-float -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+ifneq ($(call gcc-min-version, 70100),y)
 IS_OLD_GCC = 1
 endif
 endif
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 94d0d40cddb3..9d18fb91890e 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -61,9 +61,13 @@ cc-option-yn = $(call try-run,\
 cc-disable-warning = $(call try-run,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
-# cc-ifversion
-# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
+# gcc-min-version
+# Usage: cflags-$(call gcc-min-version, 70100) += -foo
+gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo y)
+
+# clang-min-version
+# Usage: cflags-$(call clang-min-version, 110000) += -foo
+clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && echo y)
 
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 6ae482158bc4..5769c1939d40 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -48,7 +48,7 @@ else
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
 # Clang before clang-16 would warn on default argument promotions.
-ifeq ($(shell [ $(CONFIG_CLANG_VERSION) -lt 160000 ] && echo y),y)
+ifneq ($(call clang-min-version, 160000),y)
 # Disable -Wformat
 KBUILD_CFLAGS += -Wno-format
 # Then re-enable flags that were part of the -Wformat group that aren't
@@ -56,7 +56,7 @@ KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wformat-extra-args -Wformat-invalid-specifier
 KBUILD_CFLAGS += -Wformat-zero-length -Wnonnull
 # Requires clang-12+.
-ifeq ($(shell [ $(CONFIG_CLANG_VERSION) -ge 120000 ] && echo y),y)
+ifeq ($(call clang-min-version, 120000),y)
 KBUILD_CFLAGS += -Wformat-insufficient-args
 endif
 endif
-- 
2.37.3.968.ga6b4b080e4-goog

