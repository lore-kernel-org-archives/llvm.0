Received: from mail-yx1-f74.google.com (mail-yx1-f74.google.com [74.125.224.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FA02D2394
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 19:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469126; cv=none; b=o/8zeOVv45hbckM/Dso2XE8V4thC3y8FFrTOQvHNXmH5AZrKp4Cx0dxKAFliqOrYvHtZhwCsUBM1P6o8SsnbSA9n9t+8+JCwJROp6u9fNr/3h0RFNZMRHPlUBPhXVwFcaukDDyuBCHB/to95hHVwmz2VE0YahgDK5FcCOO97uLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469126; c=relaxed/simple;
	bh=7hZJVFkdIfTmvalRXi5Libvp24ccfs8HyqnQSUB6V5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=se5fR0I8tDkR3haDcHdKI2T62Hh7MVUMrsmelfwbknZzSe/gbjiYD/qgHuRvRfUF03qpqvjsx4Ml74PsoQ5/B7+HN18ywjiI2Hi09pnfIVmolKYgcy4F/UAT4KEsAzZCJDpKp2caG3+EBiqaEC4TQRriSN542UGdbasxpJ+9VJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=McAjkWjr; arc=none smtp.client-ip=74.125.224.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="McAjkWjr"
Received: by mail-yx1-f74.google.com with SMTP id 956f58d0204a3-63cb028728bso10813366d50.2
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760469123; x=1761073923; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTzthtl7Wa7asoY7x1cmJ9taUGPGsRkaB7TH32ms+Iw=;
        b=McAjkWjrrwlWG1fyoayWmlDCUnKUowoUsbsOJUBkSnX2lGnuvilPGSWJQBDCa/r2XP
         X1h2QBqXwgYS7I0gr/U8iu69hhX06CUoD27nbjUxJ0ob7mhkuAUmlnNW5BWusRVZU/Ae
         YlbS2K1w9YRI19sDJtOAcfe3da4Y3sZgoxLxedugwdmW+L+0Zx4eWGEjRdWUVio3ZvlG
         63vRVm8MuMz78NSBcdzXs/LY/DnhMcP856dMQHCCFys8Ib9pv530hqcBySUtzHn2vgeG
         Jk3iOKWLHvB80IsgPPG5BldPLFCkzwt5iqyx+XinoZaFR9DDO2THoLIaGELgexdDvJ8x
         35TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469123; x=1761073923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTzthtl7Wa7asoY7x1cmJ9taUGPGsRkaB7TH32ms+Iw=;
        b=tRX5O0gWzLk56KNUH/T8gfftPWRIWhuIDUWTS7QFm4TMKdevtFL1yfN36uA1JJpaXL
         GENP4vMZmJHycyLr4tjdiJfikG9hoVxqeDdAa5NiN2cesEMA6vUoilffKHLvRFlddB6Y
         Qg5MOcoobAWgE9a4fMJLwotHiSbRJprLMZUEm4CgHSGCfoWwIluei5+zEzlVLyFOsatp
         X9gIN+m6L8JdH+Ha+QpCu+PpFXEXQWC64LlHUB1VJ0w2fOgPf4Lg3mZSLXt7cm+FbX8W
         AVgfCxvnGr1GWfB2/sKe1T66u/GiISIW4NappzY53hSKs3jG0TA//eG8+Dmd2FQHrxag
         iz7A==
X-Forwarded-Encrypted: i=1; AJvYcCWqgrxHNEeH+jz7e/oF6aFph0qZ37TKVLcbTWY/hAqCaxJaApqqwviysj+TZDfBvhIx/vG1@lists.linux.dev
X-Gm-Message-State: AOJu0YwEeMG/Jz9263SNC3MiLp0gunQ6J7RzUjosHZuO6w0bhDuxRSJl
	K0lhHnm1NO76Lsfr6+w2iXGn3VuTVCPJH974fNaVCypfCg3u5jM8IElAJMtOa0DRyTfbrA==
X-Google-Smtp-Source: AGHT+IHwQOX/dXbeDQWkS8bkoVL1lPfoiTSNYulq1q1NsBWe/XUwcHB9R0EaTveL9zV4HNtOfNvb1jY=
X-Received: from ybdt35.prod.google.com ([2002:a25:f623:0:b0:eb3:7397:f4b])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:2513:20b0:63c:f5a6:f2fb
 with SMTP id 956f58d0204a3-63cf5a70641mr9544759d50.61.1760469122851; Tue, 14
 Oct 2025 12:12:02 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:11:54 +0000
In-Reply-To: <20251014191156.3836703-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251014191156.3836703-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <20251014191156.3836703-3-xur@google.com>
Subject: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

AutoFDO and Propeller build currently does not support kernel modules,
but the corresponding build flags are still being set.

This change suppresses these build flags for modules. These flags can
be re-enabled once Propeller support for kernel modules is added.

Change-Id: I3f8bf88ff1fb435f903ba861a7b9a87f6123fa0c
Signed-off-by: Rong Xu <xur@google.com>
---
 Makefile                   |  9 +++++----
 scripts/Makefile.autofdo   |  9 ++++++---
 scripts/Makefile.lib       |  9 ++++++---
 scripts/Makefile.propeller | 12 ++++++++----
 scripts/Makefile.vmlinux_o |  3 ++-
 5 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca7163..3fd0c364ff84e 100644
--- a/Makefile
+++ b/Makefile
@@ -1230,14 +1230,15 @@ PHONY += vmlinux
 # not for decompressors. LDFLAGS_vmlinux in arch/*/boot/compressed/Makefile is
 # unrelated; the decompressors just happen to have the same base name,
 # arch/*/boot/compressed/vmlinux.
-# Export LDFLAGS_vmlinux only to scripts/Makefile.vmlinux.
+# Export LDFLAGS_vmlinux only to scripts/Makefile.vmlinux, and
+# scripts/Makefile.vmlinux_o.
 #
 # _LDFLAGS_vmlinux is a workaround for the 'private export' bug:
 #   https://savannah.gnu.org/bugs/?61463
 # For Make > 4.4, the following simple code will work:
-#  vmlinux: private export LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
-vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
-vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
+#  vmlinux vmlinux_o: private export LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
+vmlinux vmlinux_o: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
+vmlinux vmlinux_o: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 vmlinux: vmlinux.o $(KBUILD_LDS) modpost
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux
 
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 1caf2457e585c..5bcfcef273745 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -14,11 +14,14 @@ ifdef CLANG_AUTOFDO_PROFILE
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
+  _ldflags_autofdo := --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  _ldflags_autofdo += -plugin-opt=-split-machine-functions
   ifdef CLANG_AUTOFDO_PROFILE
-    KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    _ldflags_autofdo += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
-  KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
-  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
+  # TODO: change LDFLAGS_vmlinux to KBUILD_LDFLAGS when kernel modules
+  # are supported.
+  LDFLAGS_vmlinux += $(_ldflags_autofdo)
 endif
 
 export CFLAGS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 53c02fc3b348a..0f6874e8d584d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -108,20 +108,23 @@ endif
 #
 # Enable AutoFDO build flags except some files or directories we don't want to
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
-#
+# TODO: change '$(part-of-builtin)' to '$(is-kernel-object)' when the AutoFDO
+# build supports modules.
 ifeq ($(CONFIG_AUTOFDO_CLANG),y)
 _c_flags += $(if $(patsubst n%,, \
-	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
+	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(part-of-builtin)), \
 	$(CFLAGS_AUTOFDO_CLANG))
 endif
 
 #
 # Enable Propeller build flags except some files or directories we don't want to
 # enable (depends on variables AUTOFDO_PROPELLER_obj.o and PROPELLER_PROFILE).
+# TODO: change '$(part-of-builtin)' to '$(is-kernel-object)' when the Propeller
+# build supports modules.
 #
 ifdef CONFIG_PROPELLER_CLANG
 _c_flags += $(if $(patsubst n%,, \
-	$(PROPELLER_PROFILE_$(target-stem).o)$(PROPELLER_PROFILE)$(is-kernel-object)), \
+	$(PROPELLER_PROFILE_$(target-stem).o)$(PROPELLER_PROFILE)$(part-of-builtin)), \
 	$(CFLAGS_PROPELLER_CLANG))
 endif
 
diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index 48a660128e256..fa018098506b8 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -3,7 +3,7 @@
 # Enable available and selected Clang Propeller features.
 ifdef CLANG_PROPELLER_PROFILE_PREFIX
   CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
-  KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
+  _ldflags_propeller := --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
 else
   # Starting with Clang v20, the '-fbasic-block-sections=labels' option is
   # deprecated. Use the recommended '-fbasic-block-address-map' option.
@@ -26,14 +26,18 @@ endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_PROPELLER_PROFILE_PREFIX
-    KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
+    _ldflags_propeller += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
   else
     ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
-       KBUILD_LDFLAGS += --lto-basic-block-address-map
+       _ldflags_propeller += --lto-basic-block-address-map
     else
-       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+       _ldflags_propeller += --lto-basic-block-sections=labels
     endif
   endif
 endif
 
+# TODO: change LDFLAGS_vmlinux to KBUILD_LDFLAGS when kernel modules
+# are supported.
+LDFLAGS_vmlinux += $(_ldflags_propeller)
+
 export CFLAGS_PROPELLER_CLANG
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 23c8751285d79..ee070bf35385a 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -56,7 +56,8 @@ vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
 
 quiet_cmd_ld_vmlinux.o = LD      $@
       cmd_ld_vmlinux.o = \
-	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
+	$(LD) $(KBUILD_LDFLAGS) \
+	$(filter-out -pie, $(LDFLAGS_vmlinux)) -r -o $@ \
 	$(vmlinux-o-ld-args-y) \
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
-- 
2.51.0.788.g6d19910ace-goog

