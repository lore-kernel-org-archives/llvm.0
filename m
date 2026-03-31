Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383A421893
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972119; cv=none; b=JAgDj+S5c0kxkgsQJQX8ScH7oBAFfeB/amm0+w/tLbKNvg0L3bGObajwIDOxOrfkO3cxQObgMcy3p9oUsqrIzOfE0BeAOl5qXgwbnhe9WWxGFj+u25kOFlVGJcOU5lIyxJm54QcEOwz109CY9JtrA4WATuPqikhRIYTsKnmIc5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972119; c=relaxed/simple;
	bh=pLb70nUROcDCtC8MsDxGNVPoPBV2zge0oM7aB3yEADQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nkbjv1fgzOJPQbWBDLFt3z1Vu4e+8Tt3ej3yjKbl6l20r0OpOA+/bApv/3xmBXdaBNy+e069OdpY28aVcJhX3rbeXn7FxgWkrfpWm0wskdsSr/aZ17DGEdyVx84xiTMmofqjLi8OTdwWZ8FquIx70nkEQB6nmxYwszFzde24Sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNSFRaaF; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNSFRaaF"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1276e71652fso7073524c88.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774972113; x=1775576913; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=uNSFRaaFbeWK+JEfr6K0Vs1bTfKtXj1vL/mk7hTryHbkfeYOgk8/Bivoga/eYQygRU
         9lN9oiqxT5U0e75sfIqfkgrsPVXWRd67J7V4LhVImtb8/5dkqa5nH+hvB3128wMZDKxd
         9VVZnUnvBY1cljwaLbNnyAmnauqhOoHFvSMRgWSKhtz02VW7XulfbTmQXjkhxse5JwHk
         zsxOp86cKoNHRawSURufx5eEVXSsKRqSoX0vNHftt2JpZnj8ufRKTnDOEaHgVgjtp11R
         1ZvpXGLHGlokln/Z7QcbQFPBp6emkyV8QATavsJfqfciHQOMECPt1UbGmnY0odox3wCb
         RLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972113; x=1775576913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=RNjzdCcPzVgQBAWsSsB/e9THCDvhfE+fF6p5tLf0ZGP1sPj25o4FxrJw4UHAJmfCtA
         ies+TTIP67ux5lJB4lUmL/lOJ2eNr+D/BZup/Awi/fwqdzWFod9WPgYKvpbkea+L7ah7
         Y33IxK94E0Q1PQ/QsnNuhSNzbBGzRoxjTtZeb4Au/T8N3sIM5aD/ymgpyJ/Uw6RZUJYv
         Xe6uThvEFrsIZytLJEV5JqGezHtI2oSDacrzxp2whC4SpTwoxBvGbbGa3alGoRsWT1OG
         /X0K9Dyqb2Nf9vwUtjZNPLnuwmeDaXgsXBT9yO0EH39TvkYQnQgYNBMyapGM6zKUUDpx
         sj1A==
X-Forwarded-Encrypted: i=1; AJvYcCV2Lxyc5T4i6Y5rc3yayHBGDbBEmK5/6iF4LXZOH7CrgPYMfwHPdvY+tuEASQAe2/0+9pcq@lists.linux.dev
X-Gm-Message-State: AOJu0YzFWJtn3EvQvA4okHu96ZTtFnPJHgccQezB+5B/Xa0vTlnHTnnH
	WT6lP/8Rt5GA/d2k25wb3Tub1upBjvlUe/GG7Py2w5a5RW631M3dB/R8Iqk5CKFg13GWBQ==
X-Received: from dlbtu10.prod.google.com ([2002:a05:7022:3c0a:b0:12a:7f44:d2e3])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:628c:b0:128:d471:8c1
 with SMTP id a92af1059eb24-12ab2890739mr9071941c88.17.1774972112491; Tue, 31
 Mar 2026 08:48:32 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:48:25 +0000
In-Reply-To: <20260331154827.2793269-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331154827.2793269-2-xur@google.com>
Subject: [PATCH v9 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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

