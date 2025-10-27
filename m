Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90732779D
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602963; cv=none; b=E2FpJcZWZ0hjMkyjrIdj2CEW8ghmWytPoekN1cBpn3Z6z/FIio1TUL91jNWa5r8CfJ7ArUQVkcaTlBXFo81Z9uCeYBZOHFQMPGBAs4kCssJ/QiwaO+spnAwpdC3Bps6WHTyiXSOehPToARJWzYuANYwzSsPkQh2WtG9kGKChWBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602963; c=relaxed/simple;
	bh=sziPu79eyvD5bxm6w3iob2MTROBRPT0OguSNJziikAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mae8KDnV+8P7S//MdgKqf24EssXvZW51QCw/k9gepqPROpvtn2egX/jKw4FS7GJFkVvp9q+vbzCqdgnbimUI3s4c0UcQvBKP7xexo1lUTgvsYqhOQAqp5dGLoV/fjUXYemY1KPSgjDQrAvfzH3by5NszEr5wz/lZToumiau3f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3jTGyHhA; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3jTGyHhA"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-7849f67aa1cso65879447b3.1
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 15:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761602961; x=1762207761; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwCqgV/jsCpuFNENq5jXhMXII93Lf46aQUVfoGI8+z4=;
        b=3jTGyHhA0TORfXsUFuMtCKdZWkWE1c6cusxFayjsCryWDfgFfcT+uGAiHyW3DiwAA3
         3fe4WHsDUkoGgnopm6NPDc2XF8tonMRtBX9hDuw7Nq0B5DKcWng3AcUmC5A5sAWavKHG
         QboWKk8rm5tFqWvxISfNc4gbKokBYcRrrwH5mTkzxGY/1ogIjFVPwLWZTbd8aEt5RZmL
         0mcIrzOgdMcviFvdgCX/WIApm+9/KwwiDcI57mWuP4knUDXge1eIZxOqcPE+ckiEzjjk
         VLpzskP+bLRCP6HOXasL+bfmWx85LjqXrlErAA2ofQK26q5lOCgEpcvSUM/kwJiBBG2m
         wlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602961; x=1762207761;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwCqgV/jsCpuFNENq5jXhMXII93Lf46aQUVfoGI8+z4=;
        b=nwFVcGWrW05PJc3JNc29siE4IbsnIiKA7MRXwzgy0axoc7jRAZZMahNPsd7cKG6fa1
         ekLPwbf4qx3qY+bTcrDShbYvRSOgcxLF/5gXkdiDDy/WzK6n8DYGbazEeDA8Ocs3++TP
         GzdFKTZKikaLWvMlluKVAkY6uWIWQ1xQ7QM29tKQGq4slJoqON527LMudfpHGShq59aP
         uJfPdO8ro1dzks3QbyeaVLaeFaEHASpHD4xvK8j2Rq1ow+DIyQVF7UZgJbE4Y5U2zqFp
         6pyiTM+XhQAC+J3/CdRSIIxWI49sZudnR8KIf4EVbPZ9cmeTd1dR6Ebo0MySA1ysRNMk
         JY5A==
X-Forwarded-Encrypted: i=1; AJvYcCXird1D9dqLaZ9nsPETzdVygZ/jgpjzkvU9Cf9z6xaU3CVBN6ZOLIGkhn7ImzliVfVDSUOz@lists.linux.dev
X-Gm-Message-State: AOJu0YwkKOsMz8COpUhrVPPD1lGO8QFdKxTDQXyDdLY1ZfWDF5BPA3y4
	wl1PxbsiHXCveAAe9Rww/d8ZQAd+cFUUYry5ecuOTXGtSboHrhiNdwdxQS+BtRVkmG9Iuw==
X-Google-Smtp-Source: AGHT+IERYKTk7CFG9JtfjEExuQwXg9xYEgJ6CQc4i/hB/7yFnHLLDMO+LTt5qixT9brDCabtmbQLkV0=
X-Received: from yxtw15.prod.google.com ([2002:a53:ed4f:0:b0:63f:2d9a:64cb])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a53:ed41:0:b0:635:4ecf:bdd2
 with SMTP id 956f58d0204a3-63f6ba91b04mr1157323d50.52.1761602961063; Mon, 27
 Oct 2025 15:09:21 -0700 (PDT)
Date: Mon, 27 Oct 2025 22:09:13 +0000
In-Reply-To: <20251027220914.2665978-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251027220914.2665978-1-xur@google.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027220914.2665978-2-xur@google.com>
Subject: [PATCH v4 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index b34a1f4c03967..89a25bac2bbab 100644
--- a/Makefile
+++ b/Makefile
@@ -1198,7 +1198,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1207,16 +1207,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
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
index 0000000000000..9774f02b43b2f
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
2.51.1.838.g19442a804e-goog

