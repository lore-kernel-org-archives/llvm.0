Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7584B40800E
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816574; cv=none; b=Y26Tf18eHrvJWHl343NBedFLsdWZPxasUeAiatMs5hsHlfAlmuND2XkczM9ghPIp2GWQlebzXyWg7boI5QBBkLCNA5HE4B52wLCZic9Lr8X0/BttG+X5NkUzml6UJ0sHdsYhaL+PYhQkKn6072caG2yrZCb2C+sjRG4bUX7D1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816574; c=relaxed/simple;
	bh=TZMl/vbynpYCMuoy+zlBxwb8SZbk6c3T9r8Vgf0xHtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SYkhcG8eWuA5ro6T9b0JZefMg/Pk35cOiJL8WjI1YyerLwl3z6zBEyYw37yKAYFHvDkNe7RMUFACAVm9FFU/Ugumc4cUyAUa/hKyBz7Y/CsJ17wLGS///iI8KCrPxX4UL3VaF8d2m0jaTIBtS/uop0lLkh6JL+aTeO5wu5qXxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g6osNMZZ; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g6osNMZZ"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1329791f18fso17112214c88.1
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816572; x=1780421372; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiEM96aKYd3kcaWuwa98b5ndrq8URQSfe6VJqlTBd7w=;
        b=g6osNMZZvSXcxVMqOG+L/8hgRV1uEuR74fL8h/c94Vqlpamm7Htang2DZhdSSs+/aR
         2I1KvdHNCfjy5oevFqh+MO2rvfQ4A9D0iMCE1wWnCDKbf6ZgUUSJrobIOeVX43ZURgEO
         HioBLDMjMo8cseNWOxoReRmk+vKlTqMsmjUeNIx4T9JAzrL34y9NO2J8n0rziOFrgx/1
         EXVRzJwgmqiADPkEimV0zrOzPBV10aT6buLnl7/MLjrxJEX16hni6F4BTeXdsiJb/FPt
         L6KyCf2i9vgGTTCwg7uvUf2BDJZ9On0IurSQJinDwIAEC6shUbjuji22RZ/I9hM3UHRq
         B4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816572; x=1780421372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiEM96aKYd3kcaWuwa98b5ndrq8URQSfe6VJqlTBd7w=;
        b=pteDdwfcpn+lpeZUF4vXgu6svODBh5J2rdsIsOAPahUgVboqfXHgHJAd9ING+oEZnK
         H9gPazeGcMEJKveREcUVk2UZRi1HQco8aVgvXfgo+n/G4wTXlrcP78io597vfEW6zeEO
         VDntUNTAeQLgOFmj2P06vL8Cguw1/HPAl4ezkYHuEF4DiaBe2hQGURJRNVXDUXwvEX0n
         xLPYty5LTpZfcXPlzRppYex19DLXv8EPpOQ/G+WmUwg3Uurmcv7iMdwm1AD7nDuPG+QS
         kjFnOw4ve1MOw9zDl4I5jIEYJo+SzYLrW3/sDm0xvhGfKm81c6449CE+kV7gDI/uprpI
         0hpg==
X-Forwarded-Encrypted: i=1; AFNElJ9frxYdMNd8ItuiuMS7MzcYqvW/vrs/aodcaJKJWe9V8k0whvnz8xhA3eCyIO9vtTAFhLkc@lists.linux.dev
X-Gm-Message-State: AOJu0YyglaH6WYHo1SRS6B6lafOLU3NXe+KnQiHX6ZocLumKZKoFeOYx
	js3pa7IRjgcRJuN+h8CUGq05lekoSuFROeXfmdQ3v65GtG2eF0VG5hHdO4HwG/Ee/hSlwA==
X-Received: from dlzz41.prod.google.com ([2002:a05:7022:4a9:b0:135:e6d6:d140])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:689d:b0:127:5cd6:fa45
 with SMTP id a92af1059eb24-1365f818ee5mr8035316c88.14.1779816571294; Tue, 26
 May 2026 10:29:31 -0700 (PDT)
Date: Tue, 26 May 2026 10:29:24 -0700
In-Reply-To: <20260526172926.2717929-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260526172926.2717929-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526172926.2717929-2-xur@google.com>
Subject: [PATCH v10 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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
Tested-by: Piotr Gorski <piotrgorski@cachyos.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Rong Xu <xur@google.com>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index e27c91ea56fc..0fce9557a115 100644
--- a/Makefile
+++ b/Makefile
@@ -1291,7 +1291,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1300,16 +1300,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
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
2.54.0.746.g67dd491aae-goog

