Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724834F465
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676121; cv=none; b=HummXffCxzLEoahsNUe1QuZw2B9YfrO+vMF341l43Shc5CqRCigp4NKe7qXtCZRwvHV7q6TH0yHnEq/2OHQWVUqWJlvul2zWQ/SgRieBTVwSOZz2mMZ6MWwCjnjk4Pvn1yqI4/bG19a/ytTUp0rIXkHTCpe+k1hXd84NAuX2kzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676121; c=relaxed/simple;
	bh=WgKzjafwH7TVHq/wIftKYDsK8eXAkXDqosj1lO8Z+ss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=muiOQZMOI8JzRHqcyMQn8qVfWrt0t7JLoYYCrNZFZuTtx43trsQjAo0VLZAvjWmU3JAZcJr4Y0wFIfTM7XagNLTrsgZzG86LZ85A8CmAvgKKawHuFLx6OThRFip+ZLyDse5X3OQZTm3DZhy1q4UH3q5BjjWpF6XPEt+PoXZWUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fs1VHpZP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fs1VHpZP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3304def7909so4882086a91.3
        for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761676119; x=1762280919; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/650juIRrFR+/zBE4AsJfIehjRLeu/NobhGC5TTIp60=;
        b=fs1VHpZPA+WNIFzzyhmt/AzUovt7yEYQQCnrPvdT+CByhSho8Gw8n2VZmmFSOkAoYF
         VXV0blH6nbIeM3ApMyfqx3tUTQr1wRjs6bxumaiHZTKePKX6oS4iAEhC9kWuN1ZglmnC
         t8qGjwiwar4umz/waaTGw4RiKMMzqad48HSM7nB94WyablkFSqXnuAKs4sTJ7sfMu1Cq
         7Rd/KIgSYKN2wnfLC+zQFgFRCejBxokgxy1eSrog46Si4HtAPU5titfsi9dtt5RcJTmM
         sbyOEB4YdOJbLHSN2PNlHG0B7IOlm+89DcepZ2YeA4Wf8c9h/bhuoU701OAxigUHTyD0
         CLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761676119; x=1762280919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/650juIRrFR+/zBE4AsJfIehjRLeu/NobhGC5TTIp60=;
        b=WnPgoI6ZchMmrUY6PPlMSx4h9m/BcNEQTwHhL9MBgyP+Voun2inNDmISQdOFBhqXvo
         QLssL0eUJxwrIU27h3GgZGZkMb+fMvzBH+3U8jl/nXet2JjU/jzPd3eDmjCxuiZIKboy
         mpkHKoHSFZbacgwL2eLi0chXJdHXKWzDYYlKuA6afu07IX2eWAapFLLVqohgrLuArPn/
         2CVexfFn6xoylBjXmqoTAD5TtTOR7Zy7+By1rqXRAxF3jzFXM5mpiAprgEcDUV0Kg6EK
         3/FoemLGysrPfXdGy0X4Q6IBM6wo3RBlnoddrFmlsaL3ackJSDpUe+SyYYIE4vEve0LB
         925Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg7HmFgpj5OJuD3Bhevw+xyrIehwQBQjYIQaHs+RTs9so6i/Q1b276hFotB4kmVz2lDZHz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2MRjWsiT2f2wIHibOSxMtT2wPYptSkbbquQLxHe3dXxO9VhOn
	XZwQBb00vgZjojbHuAij3IqD0J2pRNl6GxoE1irsQReVLoRXyM5jZu7sId6QgC/365t8Yw==
X-Google-Smtp-Source: AGHT+IEuaqPA4h6d9Z15XGnhnp3xsDJZ2pRkvpl/6jf0iWxm9m5r06Z5/t55EDVczMXO06zO/bVxqNA=
X-Received: from pjbru2.prod.google.com ([2002:a17:90b:2bc2:b0:33b:a0ae:940])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8a:b0:330:797a:f504
 with SMTP id 98e67ed59e1d1-3403a15d128mr7164a91.3.1761676118599; Tue, 28 Oct
 2025 11:28:38 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:28:21 +0000
In-Reply-To: <20251028182822.3210436-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028182822.3210436-2-xur@google.com>
Subject: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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
2.51.1.851.g4ebd6896fd-goog

