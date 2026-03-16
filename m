Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30787311C15
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 21:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696587; cv=none; b=PZ1EQD32T5AJ75TdRUj9mg8+N/CECoCPVEUOU3KuoV2IN6rrV4pd7t6hcvwSdfmwmKjtvSwMl7p8M/EOsgd5XjsDDPU7xAT8m4JlayCDVqcabhooLpCO9pXxi7DQb7ic3Ryx7gbapYyvy16jnC9NQvEGdbO+zrW9D9NhczOKWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696587; c=relaxed/simple;
	bh=tGb1M0tRkfKEH3KWUQR/MxlPIzxmfHf/7F+6VNuez4Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Os39AEWu0HmJJRtRYuH53vvTZ/08bRUzPS4HXT2u5CG/f8l4dxE83+yqe35DG9VV7Ce05hdxc5xJk+V0tF4B2mqfXqk/meuR4ZEGouDoS5ZYDX/uZJ7RRxqyuzst0nejBi2kIUroYyEh9kxf/y3q9f2y3wbCFo5PEK1HABeVz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5hiP30d; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5hiP30d"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-127337c8e52so96099516c88.1
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 14:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773696585; x=1774301385; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mA9wHqPkq9Vq1JF9PRYSj3uN1F4IR3mUOXVfm9WMuek=;
        b=U5hiP30dGoqgNsvY9XsNknNKa83cXLRr0GkMQ54dMdM8PqilPlK1GE28G+ollzYyLX
         /Zlqf+2kIlUpCyjkZUK4192/z7T+BVJkzil56PBWzrCQ4Fa4AEiUuMzGXeasgdr2Eq5Z
         h8Mc9Oh3UF7WuH6KoiaNDAIj6tUoh8woKOiwVaYF289tHoQYB7jBrZkz/rDawO8Ko4la
         FW0AQGgg8f+ice+GJTh8p6//IgWqAr87/dUXmNd8NpelaZwNEB40W+UE4LdPFyUjjekz
         HWPN7bgYzm5E0mTyFU9Pvj1M97GiXMt9iWTSNLa/u7Cmxaik3vk0pOPtuOM4l7iXuXq8
         SsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696585; x=1774301385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA9wHqPkq9Vq1JF9PRYSj3uN1F4IR3mUOXVfm9WMuek=;
        b=HEhMchs2mK8Wc91nSlXe9j5wftlJG7FtMkCqfRdJCpBVPPfaIi/YAMuuqfcnC1lEO4
         VJZ0SM2LFDrdz5jSoW+6EpJ2K87O38xTa5pustQkbs81rFZooJclkqDyERhuXiir3yvY
         09tiGW5AFw8AE0ep5F4v3nc+gKJU2iqvRYNK5t2Qhh+xQgeZgwb4kRgrIVjnfwHuyOi3
         2ms9XehQOY7HFUNO3jih4Syidn1nTM2/0CqAidADwT4/k1sm5kR9b2Jpu/Qc4qAUq2vy
         TOXYjvMLM/v/LFXqBzbtXVkuRtCOQY2rryGi9nNpPuJZFBaMJdaV2LE5Xb1T61X8zNil
         enHg==
X-Forwarded-Encrypted: i=1; AJvYcCXK8SX2z3g2tR/9Z8Lm6SdkF0IcgcrON5VSQ3scPs5Ct+DK+GEOxaRIfvA0LkjiHN76F6K/@lists.linux.dev
X-Gm-Message-State: AOJu0YzkB/YVcZtAFMXWEu3lobvy0K61gN5LTf0zxKjSapiHIxMifmuz
	YtlYDfxhh0Mt/EwKXHZ+ETuXNgmpefc5PmJV7KToqu8QrixUFQ/VrCMo6rEPlvMMAu61Hw==
X-Received: from dleb10-n2.prod.google.com ([2002:a05:701b:424a:20b0:128:ee08:8c14])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:618f:b0:11b:f056:a1b3
 with SMTP id a92af1059eb24-128f3d3f175mr8012386c88.11.1773696584848; Mon, 16
 Mar 2026 14:29:44 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:29:29 +0000
In-Reply-To: <20260316212930.120438-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260316212930.120438-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316212930.120438-2-xur@google.com>
Subject: [PATCH v6 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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
Tested-by: Piotr Gorski <piotrgorski@cachyos.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index c9b7bee102e8..ba5eee68d5d2 100644
--- a/Makefile
+++ b/Makefile
@@ -1255,7 +1255,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1264,16 +1264,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
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
index 000000000000..650d44330d1f
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
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
+quiet_cmd_ar_builtin_fixup = AR      $@
+      cmd_ar_builtin_fixup = \
+	rm -f $@; \
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
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
2.53.0.851.ga537e3e6e9-goog

