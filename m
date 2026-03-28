Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63232B99F
	for <llvm@lists.linux.dev>; Sat, 28 Mar 2026 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660778; cv=none; b=dvGb8tVDXT7yd/pXVreNSjUlhlFmKceHId+72aGuovQOnQANSBfvjIxSZuTmm8QqQPzeyQJT5zyFCrsjdtsQbAnTGKi1JLKN1sSJBcUbWsO0hOLLWNxocedxMk4k0h64KGVajfK6Gj9OYPfjHsBk+mrGTFRd0Xx5cGvPC0T1LPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660778; c=relaxed/simple;
	bh=pLb70nUROcDCtC8MsDxGNVPoPBV2zge0oM7aB3yEADQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l/qgB1k1MGJSM7tndVAAJdqznSnR05ocxtQA7kOkabqdjQD56R1AilXYI2TJjXa+JOAgt6HoDOJ2t8mMP0Qlu+d4dJ+jW20cW59jIXT1t9uQ46Map+GImOsAMPpaevrW1iJhEhrV5lLy02osy1ZGJuBFtzXHaU8OvLMnXLzqldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKayP1ZQ; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKayP1ZQ"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2799029eec.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 18:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660773; x=1775265573; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=fKayP1ZQ13rK1IyXuqtZJaLPmL3FDJdrXc1HFiXzHw0AQCV8EGqnf8+3zwnWd3eJjA
         jLBZJwrHGuaDlmrfSarhmTN2pi3NrPWY/RnMRxzF0SyHd0CCCwo+wTIO/RkJpfZy+1Ky
         D+qvctB4rDSUnALdHmq0qwTAPuwerGrR7+RzGdYvWYBG3UfKESC4zTFSquQBbWgUv6EB
         VaBEbdKQJf9Va43HV03ZYU/5w3laFGv/Z5KWwnRRGYncAGTrEIR3wfmbvkJqjOf5DhXL
         Oyb97h7N5Tk1wB0zynv1Yg93y3zUZ63WYcoXqtLJybooLpZuhyaspzu0nyXuLz03M6Af
         Bt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660773; x=1775265573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=ZyDhV6hvTjA27d1FQXBTkAwwrKZRXVZv39ftRNRoS112tjerL8Zke9xU3XZj4FjLj0
         WsJMr8ZfBfczNktzWCBFjfeDRwxdJguD8sVDYJ88RajVDg3V3hdFbVe4qd9j3OFHqmFA
         iYtvcc5I0aMWs6/44TOSQfDLDYJqLCAKYw0sqb9z06BiLty1eijj/3G7vHGupr+tvACg
         PQfsJ8LVS5qQItcCpq/iUvpo5/sYsRgHZWynDHnZglB6hVAHtfdmi43ReYa7NS+BtQew
         0uN6r2NGgnR5FXAWqWjt1kQSnbtMrctJVpOH2Ic1uO8/QTztrtEn+22gZ/v9T4g8Cv7x
         d8OA==
X-Forwarded-Encrypted: i=1; AJvYcCXSW/UCl5JivTzsRj1WJyEXoA6h7acMnmWNHKbjZkjxrHGHhegWBTdLk4SSbvmOMv3IFC3c@lists.linux.dev
X-Gm-Message-State: AOJu0YxibPDMihmqA2MspzvaZugoBJbgm79Q0OUT5/lEJl33AbRlVQaA
	8GGck0zmSZZTpPvB5Di5qZ3KtEaxNoxoHA2McbzS1kDzRmexMf2GcC/CsTR0UW+5ez6BEA==
X-Received: from dleb17-n2.prod.google.com ([2002:a05:701b:4251:20b0:128:e734:a2bd])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b8a:b0:123:330b:3a0
 with SMTP id a92af1059eb24-12ab28617bamr2690906c88.14.1774660772475; Fri, 27
 Mar 2026 18:19:32 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:25 +0000
In-Reply-To: <20260328011927.3569802-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-2-xur@google.com>
Subject: [PATCH v7 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
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

