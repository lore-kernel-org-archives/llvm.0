Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A63DBD61
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891168; cv=none; b=ogikAaD5trDH08Vx7/1X9p6zjK9ewJN+7T5MWkhy4yFGGwiOvAf+Kw5s03k837B450j8KhwT21c77sA9MdFxaT5jWcTVwH9MngBStEmvG1vJ5oh6c4B6zczLKZ8h05vAHfNYLHNGVZt5lwRfejz9Ec3IXyntHxkibXn2oREFPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891168; c=relaxed/simple;
	bh=pLb70nUROcDCtC8MsDxGNVPoPBV2zge0oM7aB3yEADQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KPhwXfbhLF0pp9CwX+EO1OC3ewP3chiXxYvDRDmyshSgatKuk/cewJR7llZbzXeXmitPHt/41KCbNw7ExtpkK8Fz3mTqgK5yXS0eaFInlAbg5F0XHdcZSufC9+SV1sqOGAR89bnKYhGJPdLMOvYoMFcWQwnqMh1M7Uo5xHLg5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/lKc9BC; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/lKc9BC"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c5b48baf75so3342528eec.0
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774891166; x=1775495966; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=v/lKc9BCjelmJv59JCidLEr0KvCVno1WXUYsUERP6tI2NJUYyaA2s52P+UxWf0CfK7
         9xgYWv/oH3zBMZ07IZG0hw0djRivgwo5gLtWK2G4qKT7Zui37T/173NNQGGWXg3XHJIY
         aGjBg2ZIdLTArVnB/7E9TnTdHfg/Gf8EnUX2UA/vgezFP5gKcJLx1/uHdKLRq8/ypSp6
         f6bpWVVhsEcYJHUtWdRf0oDSSyAmnjg6pGvQWcs8a2m2AXhxotCbVSIDXggwdYsfZu1P
         WrIBVwcamSEih3sNILmcFUzZALfijmVc00r/2S33GiUk3ltJNcRjpks//nCsonBN8nAx
         kPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891166; x=1775495966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=pjlK2tusfiz+iyaRDnaJzI/EyDxmvsYhkJElLc9KvbR4C4+gJjj13bnK3TWPkCgxLQ
         eavJgrSq5XLNv91Au6QMUCmketDeI0N9EE73W/aG5QC8OimtfDs8MLT77Dfg1yspjbFq
         sG193bE9HLPfSiy/yIaPMqFwa8mUc99KSHCW6lODGvjAhzk5C1fG+jNYEKKxeG/M7TVN
         0PJ/Q2uBPPgU3KUqOVEmM/HQCA0epmiQRrGun5eKgYWH7e1OcruZ+erZvS3v9bg8Qam0
         KjqOnMgnBmuwNOf6nAkkX0J8rqpUA4mbow5bDRq81JPsXLy4soH2Dt26kNwdpeu3soHe
         sjLA==
X-Forwarded-Encrypted: i=1; AJvYcCW6oj6dfk2cfD+moXXpHPBFK7nTSf6iRoX0ol2ol0xYen3fgFOD2EGyyHQzy4NsSkaj5ybD@lists.linux.dev
X-Gm-Message-State: AOJu0YzCCmMYYCBPFHS/jJEY9G8FJhczD87fJ/huxgudfGjsrZtw/HeR
	HEmBglE/9Vx+AUMCOSBI8IQ1On0O5YChhA/sycu17inM52faXIfXhuE2yZa1SR74F79gxw==
X-Received: from dyaa28.prod.google.com ([2002:a05:693c:40dc:b0:2c1:88d:a44c])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ec0a:b0:2c5:50fe:c795
 with SMTP id 5a478bee46e88-2c550ff2592mr4030214eec.29.1774891165926; Mon, 30
 Mar 2026 10:19:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:19:17 +0000
In-Reply-To: <20260330171920.2026779-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260330171920.2026779-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260330171920.2026779-2-xur@google.com>
Subject: [PATCH v8 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

From: Masahiro Yamada <masahiroy@kernel.org>

Move the build rule for vmlinux.a to a separate file in preparation
for supporting distributed builds with Clang ThinLTO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Rong Xu <xur@google.com>
Signed-off-by: Rong Xu <xur@google.com>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index a8d8ed711f9b..69ccf9b8507d 100644
--- a/Makefile
+++ b/Makefile
@@ -1264,7 +1264,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1273,16 +1273,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 KBUILD_MODULES := y
 endif
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
-quiet_cmd_ar_vmlinux.a = AR      $@
-      cmd_ar_vmlinux.a = \
-	rm -f $@; \
-	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+PHONY += vmlinux_a
+vmlinux_a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_a
 
-targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-	$(call if_changed,ar_vmlinux.a)
+vmlinux.a: vmlinux_a
+	@:
 
 PHONY += vmlinux_o
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
new file mode 100644
index 000000000000..9774f02b43b2
--- /dev/null
+++ b/scripts/Makefile.vmlinux_a
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+PHONY := __default
+__default: vmlinux.a
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+# Link of built-in-fixup.a
+# ---------------------------------------------------------------------------
+
+# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+quiet_cmd_ar_builtin_fixup = AR      $@
+      cmd_ar_builtin_fixup = \
+	rm -f $@; \
+	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+
+targets += built-in-fixup.a
+built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(call if_changed,ar_builtin_fixup)
+
+# vmlinux.a
+# ---------------------------------------------------------------------------
+
+targets += vmlinux.a
+vmlinux.a: built-in-fixup.a FORCE
+	$(call if_changed,copy)
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
-- 
2.53.0.1018.g2bb0e51243-goog

