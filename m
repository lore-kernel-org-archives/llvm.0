Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD7421F00
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 18:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080835; cv=none; b=H/B62IfOvnq5m4hvTIfcstX17QT48FXsqk+5VeBsmb+KNuheQsCJ67F7Yv4lIvhb6PV/D1mviMcdTixPL4vZjbLdpwLwx/fkXV6L3Mr47Dag3O6UliZ81gZW5A3vZP9E542lAdwyRKUwGPMEKdg1Y91Bf8q4UjuKNjVGzo0b7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080835; c=relaxed/simple;
	bh=nM3I23N6J3rf1+A39I1UKYCnI6r93ke/uZ68ANA8cws=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oA8Y4HmzxnpnQWMy1Zrq640hyqpUq6RPFirT2djGzdQpQwEjSUnyHi9Ry8RQ/511kB47JYSMAK7/uWEUimLgrN5rXynQQw2BCqbacDilmVJZkiU6cNPrubgBqoWzf+OZPEZ39Ecm18e52zzVKPCsWzOr66mF2ZQyWDRlf3pPDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJ54k7/L; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJ54k7/L"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-135fe34cb98so15687221c88.0
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780080831; x=1780685631; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYiHWgzyN9qEbPXmYY6E8njhDvnt+Sz3conx1MK3jyc=;
        b=iJ54k7/LR3xyxW2Wr2gdjsZeWjSEXrjDLaNYObk7c56yzSYoSC+HpR9IiI5EzwKHYT
         Zh2JcD061J6VNquNsmXgfdSUrRHiaQIAGZYDSTiFPuOBiA5N5TMnBk+9vqWlZQqgicFI
         x1o0NDjsYwT2lu1Onw2SYSnpsGkwp3wd6ovTUBwuxFFPtFCQ18co3bRmUVWHlBeX7JYf
         Fv7nSGb1u7dj30nK4EhG4ebwWbU4AF7CUei7nKLRJ0OPDfbzqcsBq4NO8QX7c4Ucs5Tg
         Vpa3eCHyzQpei1kmKhl6D8Bw4gcWXsL9w0BLZ02XqnROyxbKedoZpYG0Bt/3sgggL4LH
         irvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080831; x=1780685631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYiHWgzyN9qEbPXmYY6E8njhDvnt+Sz3conx1MK3jyc=;
        b=qN1a/utckEare9I352NDVTpTh9QhC8GFXte4HrkuI1BmYe52T3g6NzSb3RABJSbeil
         tkTpp93VurU6uSAmW/9pkejqORGUu6ZrBmItqaWWczcn520uidY5MYHLUDJ0sxol60l+
         2SVIYQp/Nc4r5HJhhNIZT1mbMhKHCtgs+2BdqkGcgaCNi9vHnFhQ0DlGFriSEqOvy9WP
         PHevfXMFfikE0TeuK9T29/qIyLpRVbrPaNjtWbCTPTpLDf+zh/WcRDN/LPRjI1bUTN+M
         qhAGE6rjRrPK04rzJ1ZpYgiimc1zWSldKiE0xscaBxbz9nebDBvrI+Shh3OsybaUHam0
         Kupw==
X-Forwarded-Encrypted: i=1; AFNElJ8H/Y13RsF8bR01Vw4k60hJwhh7XzgeUKJ10kpm8REh7VGpQlNPOAUrtdhUmAIPjcXfbO5z@lists.linux.dev
X-Gm-Message-State: AOJu0YwTW0DX+neAnT869TDWnAv8f5O6bEny6m7jE19R5PPGrxx+wAmp
	UlGGcY4IVTwl3UNJoKtOpIRelv3zCOip0Zt0Rri4UpVXisloYuAtjjHN5m192/UKSr7JmQ==
X-Received: from dlea10-n2.prod.google.com ([2002:a05:701b:420a:20b0:136:6230:5814])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:60a4:b0:137:6781:7dc5
 with SMTP id a92af1059eb24-137d412b5cdmr466972c88.24.1780080830650; Fri, 29
 May 2026 11:53:50 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:44 -0700
In-Reply-To: <20260529185347.2418373-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529185347.2418373-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529185347.2418373-2-xur@google.com>
Subject: [PATCH v12 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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
2.54.0.823.g6e5bcc1fc9-goog

