Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4042139F
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342673; cv=none; b=Jy1NlOhxNteOufo60Jd7HrT2iwzxkvO1uiVPkUnW9XoLUkC0V31/Mdg/sM2c9jgGSOgJaQ9LRa19sVw/9XUufS8OzQiShSMrP8nFrJ09DOoj5U8jQiZWUZj88jzZEcHVerggwNeGOMPlhKrhLXavL4X9qBhVKLBeHThUsi1A7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342673; c=relaxed/simple;
	bh=Ccc6bHVff8J0HWtrBqIFaStSzNA05M6Doabtt/ZYQr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sahc/R0M4gn/RHjQfJ+phZ4skcrNa3tf3y2qCq8ItCT0WV8XP3eTxIcDx0KggIxU/bxEkFPR7nfDAiHPusHkPS3xZIuhS1r6bcQK2UVqcUrA/ETwDLCZSbJXI9/qQlQa18+XRx/gwHhGQhMvBfDzk9Bj7JW9yUxcs31qBZAEfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vei7nebg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vei7nebg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d3776334so6747592e87.1
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342669; x=1713947469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEWqcVwxPihHlHVj+XEGbwe/qqfujZwXRKtTnbCyyHc=;
        b=vei7nebggv+OVoc7iyP0Gk3cDdmDmusrpYDu9jmmtefSsKuU8O/qtGotG1iX9PwPOF
         upPyPBX/rZWscBIGuHT7FRy6sLMiM+6kIieyK2ekXs57127YBN/wrXUvOXHnN+or3EuJ
         YHhtXpnXTKYIy+OUiL4rfjbL7fhDFmFmMGWjczIpP92vA4LUxlI4h8nOheFc2sJ5MC9c
         9EjtfY0Rp5AYIoIN6nmihYist/9MjAswczHSwYr6GZ4sogMUzY28lpvX+pWJW6wz41GE
         vI5GewsQd6JiIk0uzzzq0P+1W8b+qzhTCFxBP4X6+iDh77WHdpnGnBBoZkupJtP33BxV
         IVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342669; x=1713947469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEWqcVwxPihHlHVj+XEGbwe/qqfujZwXRKtTnbCyyHc=;
        b=Q7Do3bKLtthSi4FV+ft0jjZ7MJHX/kQx1KAJ0Bo3/3VxguOVf7viTyxI217qJS+Kt0
         n5gMaCTEUYKT49K/mX0NwvJA3e8HtB6TCatpQ4uZ3MOS81ked0o7xMbt7/y7bocHzHd7
         sn1ieTTsNswugYjwn7PYtXxkNiAw+htqbuh4O5W7o2mTfx1vHwKl/tyx60SSPDEbwTYW
         P+BnPksfu0Rbkb5spE1Tvtk8RahwBYyQEfNyPcKnjFd5pL//P39d4DPLCDxnjJdc2kb+
         aoDg7mH1+uWN+nCCKZZvHRn8dmTQ0CAIcTriDjvP1yr1tTmVDMcyTARw7OD10uUjW5bO
         yeHg==
X-Forwarded-Encrypted: i=1; AJvYcCVo212GLYvqH69jUNgU04WKz7PPPnqOTsTdkZXYFrcnP86E4R7Xi9Sotm9E2gkjOMDit6aTsUaD8nROALH/2pS5OIEkhw==
X-Gm-Message-State: AOJu0YwNrkYeiAW1zuPc80TLGzKTRkDzHn+YZekkpBlSkjX5Kl7tlT79
	oyNrhfB3p2J+dNkGunVGgNO6NPjq5t8lpdwRm1+7EZfoHg8bz/DRX1kacxoDBNU=
X-Google-Smtp-Source: AGHT+IHtv5Rf4wlbW/cPlHHJpDu5U8HtgAve+2/Tax58XuzLtFn8uNRo1szjiBqtAN6DJpJyGrBqAQ==
X-Received: by 2002:a05:6512:1386:b0:519:813:7f5c with SMTP id fc6-20020a056512138600b0051908137f5cmr5763119lfb.0.1713342668939;
        Wed, 17 Apr 2024 01:31:08 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:57 +0200
Subject: [PATCH v6 08/11] ARM: mm: Define prototypes for all per-processor
 calls
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-8-6486385eb136@linaro.org>
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Each CPU type ("proc") has assembly calls for initializing and
setting up the MM context, idle and so forth.

These calls have the C form of e.g.:

void cpu_arm920_init(void);

However this prototype is not really specified, instead it is
generated by the glue code in <asm/glue-proc.h> and the prototype
is implicit from the generic prototype defined in <asm/proc-fns.h>
such as cpu_proc_init() in this case. (This is a bit similar to
the "interface" or inheritance concept in other languages.)

To be able to annotate these assembly calls for CFI, they all need
to have a proper C prototype per CPU call.

Define these in a new C file that is only compiled when we use
CFI, and add __ADDRESSABLE() to each so the compiler knows that
these will be addressed (they are not explicitly called in C, they
are called by way of cpu_proc_init() etc).

It is a bit of definitions, but we do not expect new ARM32 CPUs
to appear very much so it should be pretty static.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/Makefile |   1 +
 arch/arm/mm/proc.c   | 500 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 501 insertions(+)

diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index 17665381be96..f1f231f20ff9 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_CPU_V6)		+= proc-v6.o
 obj-$(CONFIG_CPU_V6K)		+= proc-v6.o
 obj-$(CONFIG_CPU_V7)		+= proc-v7.o proc-v7-bugs.o
 obj-$(CONFIG_CPU_V7M)		+= proc-v7m.o
+obj-$(CONFIG_CFI_CLANG)		+= proc.o
 
 obj-$(CONFIG_OUTER_CACHE)	+= l2c-common.o
 obj-$(CONFIG_CACHE_B15_RAC)	+= cache-b15-rac.o
diff --git a/arch/arm/mm/proc.c b/arch/arm/mm/proc.c
new file mode 100644
index 000000000000..bdbbf65d1b36
--- /dev/null
+++ b/arch/arm/mm/proc.c
@@ -0,0 +1,500 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file defines C prototypes for the low-level processor assembly functions
+ * and creates a reference for CFI. This needs to be done for every assembly
+ * processor ("proc") function that is called from C but does not have a
+ * corresponding C implementation.
+ *
+ * Processors are listed in the order they appear in the Makefile.
+ *
+ * Functions are listed if and only if they see use on the target CPU, and in
+ * the order they are defined in struct processor.
+ */
+#include <asm/proc-fns.h>
+
+#ifdef CONFIG_CPU_ARM7TDMI
+void cpu_arm7tdmi_proc_init(void);
+__ADDRESSABLE(cpu_arm7tdmi_proc_init);
+void cpu_arm7tdmi_proc_fin(void);
+__ADDRESSABLE(cpu_arm7tdmi_proc_fin);
+void cpu_arm7tdmi_reset(void);
+__ADDRESSABLE(cpu_arm7tdmi_reset);
+int cpu_arm7tdmi_do_idle(void);
+__ADDRESSABLE(cpu_arm7tdmi_do_idle);
+void cpu_arm7tdmi_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm7tdmi_dcache_clean_area);
+void cpu_arm7tdmi_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm7tdmi_switch_mm);
+#endif
+
+#ifdef CONFIG_CPU_ARM720T
+void cpu_arm720_proc_init(void);
+__ADDRESSABLE(cpu_arm720_proc_init);
+void cpu_arm720_proc_fin(void);
+__ADDRESSABLE(cpu_arm720_proc_fin);
+void cpu_arm720_reset(void);
+__ADDRESSABLE(cpu_arm720_reset);
+int cpu_arm720_do_idle(void);
+__ADDRESSABLE(cpu_arm720_do_idle);
+void cpu_arm720_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm720_dcache_clean_area);
+void cpu_arm720_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm720_switch_mm);
+void cpu_arm720_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm720_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM740T
+void cpu_arm740_proc_init(void);
+__ADDRESSABLE(cpu_arm740_proc_init);
+void cpu_arm740_proc_fin(void);
+__ADDRESSABLE(cpu_arm740_proc_fin);
+void cpu_arm740_reset(void);
+__ADDRESSABLE(cpu_arm740_reset);
+int cpu_arm740_do_idle(void);
+__ADDRESSABLE(cpu_arm740_do_idle);
+void cpu_arm740_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm740_dcache_clean_area);
+void cpu_arm740_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm740_switch_mm);
+#endif
+
+#ifdef CONFIG_CPU_ARM9TDMI
+void cpu_arm9tdmi_proc_init(void);
+__ADDRESSABLE(cpu_arm9tdmi_proc_init);
+void cpu_arm9tdmi_proc_fin(void);
+__ADDRESSABLE(cpu_arm9tdmi_proc_fin);
+void cpu_arm9tdmi_reset(void);
+__ADDRESSABLE(cpu_arm9tdmi_reset);
+int cpu_arm9tdmi_do_idle(void);
+__ADDRESSABLE(cpu_arm9tdmi_do_idle);
+void cpu_arm9tdmi_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm9tdmi_dcache_clean_area);
+void cpu_arm9tdmi_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm9tdmi_switch_mm);
+#endif
+
+#ifdef CONFIG_CPU_ARM920T
+void cpu_arm920_proc_init(void);
+__ADDRESSABLE(cpu_arm920_proc_init);
+void cpu_arm920_proc_fin(void);
+__ADDRESSABLE(cpu_arm920_proc_fin);
+void cpu_arm920_reset(void);
+__ADDRESSABLE(cpu_arm920_reset);
+int cpu_arm920_do_idle(void);
+__ADDRESSABLE(cpu_arm920_do_idle);
+void cpu_arm920_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm920_dcache_clean_area);
+void cpu_arm920_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm920_switch_mm);
+void cpu_arm920_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm920_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_arm920_do_suspend(void *);
+__ADDRESSABLE(cpu_arm920_do_suspend);
+void cpu_arm920_do_resume(void *);
+__ADDRESSABLE(cpu_arm920_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_ARM920T */
+
+#ifdef CONFIG_CPU_ARM922T
+void cpu_arm922_proc_init(void);
+__ADDRESSABLE(cpu_arm922_proc_init);
+void cpu_arm922_proc_fin(void);
+__ADDRESSABLE(cpu_arm922_proc_fin);
+void cpu_arm922_reset(void);
+__ADDRESSABLE(cpu_arm922_reset);
+int cpu_arm922_do_idle(void);
+__ADDRESSABLE(cpu_arm922_do_idle);
+void cpu_arm922_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm922_dcache_clean_area);
+void cpu_arm922_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm922_switch_mm);
+void cpu_arm922_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm922_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM925T
+void cpu_arm925_proc_init(void);
+__ADDRESSABLE(cpu_arm925_proc_init);
+void cpu_arm925_proc_fin(void);
+__ADDRESSABLE(cpu_arm925_proc_fin);
+void cpu_arm925_reset(void);
+__ADDRESSABLE(cpu_arm925_reset);
+int cpu_arm925_do_idle(void);
+__ADDRESSABLE(cpu_arm925_do_idle);
+void cpu_arm925_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm925_dcache_clean_area);
+void cpu_arm925_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm925_switch_mm);
+void cpu_arm925_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm925_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM926T
+void cpu_arm926_proc_init(void);
+__ADDRESSABLE(cpu_arm926_proc_init);
+void cpu_arm926_proc_fin(void);
+__ADDRESSABLE(cpu_arm926_proc_fin);
+void cpu_arm926_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_arm926_reset);
+int cpu_arm926_do_idle(void);
+__ADDRESSABLE(cpu_arm926_do_idle);
+void cpu_arm926_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm926_dcache_clean_area);
+void cpu_arm926_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm926_switch_mm);
+void cpu_arm926_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm926_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_arm926_do_suspend(void *);
+__ADDRESSABLE(cpu_arm926_do_suspend);
+void cpu_arm926_do_resume(void *);
+__ADDRESSABLE(cpu_arm926_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_ARM926T */
+
+#ifdef CONFIG_CPU_ARM940T
+void cpu_arm940_proc_init(void);
+__ADDRESSABLE(cpu_arm940_proc_init);
+void cpu_arm940_proc_fin(void);
+__ADDRESSABLE(cpu_arm940_proc_fin);
+void cpu_arm940_reset(void);
+__ADDRESSABLE(cpu_arm940_reset);
+int cpu_arm940_do_idle(void);
+__ADDRESSABLE(cpu_arm940_do_idle);
+void cpu_arm940_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm940_dcache_clean_area);
+void cpu_arm940_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm940_switch_mm);
+#endif
+
+#ifdef CONFIG_CPU_ARM946E
+void cpu_arm946_proc_init(void);
+__ADDRESSABLE(cpu_arm946_proc_init);
+void cpu_arm946_proc_fin(void);
+__ADDRESSABLE(cpu_arm946_proc_fin);
+void cpu_arm946_reset(void);
+__ADDRESSABLE(cpu_arm946_reset);
+int cpu_arm946_do_idle(void);
+__ADDRESSABLE(cpu_arm946_do_idle);
+void cpu_arm946_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm946_dcache_clean_area);
+void cpu_arm946_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm946_switch_mm);
+#endif
+
+#ifdef CONFIG_CPU_FA526
+void cpu_fa526_proc_init(void);
+__ADDRESSABLE(cpu_fa526_proc_init);
+void cpu_fa526_proc_fin(void);
+__ADDRESSABLE(cpu_fa526_proc_fin);
+void cpu_fa526_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_fa526_reset);
+int cpu_fa526_do_idle(void);
+__ADDRESSABLE(cpu_fa526_do_idle);
+void cpu_fa526_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_fa526_dcache_clean_area);
+void cpu_fa526_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_fa526_switch_mm);
+void cpu_fa526_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_fa526_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM1020
+void cpu_arm1020_proc_init(void);
+__ADDRESSABLE(cpu_arm1020_proc_init);
+void cpu_arm1020_proc_fin(void);
+__ADDRESSABLE(cpu_arm1020_proc_fin);
+void cpu_arm1020_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_arm1020_reset);
+int cpu_arm1020_do_idle(void);
+__ADDRESSABLE(cpu_arm1020_do_idle);
+void cpu_arm1020_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm1020_dcache_clean_area);
+void cpu_arm1020_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm1020_switch_mm);
+void cpu_arm1020_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm1020_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM1020E
+void cpu_arm1020e_proc_init(void);
+__ADDRESSABLE(cpu_arm1020e_proc_init);
+void cpu_arm1020e_proc_fin(void);
+__ADDRESSABLE(cpu_arm1020e_proc_fin);
+void cpu_arm1020e_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_arm1020e_reset);
+int cpu_arm1020e_do_idle(void);
+__ADDRESSABLE(cpu_arm1020e_do_idle);
+void cpu_arm1020e_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm1020e_dcache_clean_area);
+void cpu_arm1020e_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm1020e_switch_mm);
+void cpu_arm1020e_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm1020e_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM1022
+void cpu_arm1022_proc_init(void);
+__ADDRESSABLE(cpu_arm1022_proc_init);
+void cpu_arm1022_proc_fin(void);
+__ADDRESSABLE(cpu_arm1022_proc_fin);
+void cpu_arm1022_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_arm1022_reset);
+int cpu_arm1022_do_idle(void);
+__ADDRESSABLE(cpu_arm1022_do_idle);
+void cpu_arm1022_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm1022_dcache_clean_area);
+void cpu_arm1022_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm1022_switch_mm);
+void cpu_arm1022_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm1022_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_ARM1026
+void cpu_arm1026_proc_init(void);
+__ADDRESSABLE(cpu_arm1026_proc_init);
+void cpu_arm1026_proc_fin(void);
+__ADDRESSABLE(cpu_arm1026_proc_fin);
+void cpu_arm1026_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_arm1026_reset);
+int cpu_arm1026_do_idle(void);
+__ADDRESSABLE(cpu_arm1026_do_idle);
+void cpu_arm1026_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_arm1026_dcache_clean_area);
+void cpu_arm1026_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_arm1026_switch_mm);
+void cpu_arm1026_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_arm1026_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_SA110
+void cpu_sa110_proc_init(void);
+__ADDRESSABLE(cpu_sa110_proc_init);
+void cpu_sa110_proc_fin(void);
+__ADDRESSABLE(cpu_sa110_proc_fin);
+void cpu_sa110_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_sa110_reset);
+int cpu_sa110_do_idle(void);
+__ADDRESSABLE(cpu_sa110_do_idle);
+void cpu_sa110_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_sa110_dcache_clean_area);
+void cpu_sa110_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_sa110_switch_mm);
+void cpu_sa110_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_sa110_set_pte_ext);
+#endif
+
+#ifdef CONFIG_CPU_SA1100
+void cpu_sa1100_proc_init(void);
+__ADDRESSABLE(cpu_sa1100_proc_init);
+void cpu_sa1100_proc_fin(void);
+__ADDRESSABLE(cpu_sa1100_proc_fin);
+void cpu_sa1100_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_sa1100_reset);
+int cpu_sa1100_do_idle(void);
+__ADDRESSABLE(cpu_sa1100_do_idle);
+void cpu_sa1100_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_sa1100_dcache_clean_area);
+void cpu_sa1100_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_sa1100_switch_mm);
+void cpu_sa1100_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_sa1100_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_sa1100_do_suspend(void *);
+__ADDRESSABLE(cpu_sa1100_do_suspend);
+void cpu_sa1100_do_resume(void *);
+__ADDRESSABLE(cpu_sa1100_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_SA1100 */
+
+#ifdef CONFIG_CPU_XSCALE
+void cpu_xscale_proc_init(void);
+__ADDRESSABLE(cpu_xscale_proc_init);
+void cpu_xscale_proc_fin(void);
+__ADDRESSABLE(cpu_xscale_proc_fin);
+void cpu_xscale_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_xscale_reset);
+int cpu_xscale_do_idle(void);
+__ADDRESSABLE(cpu_xscale_do_idle);
+void cpu_xscale_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_xscale_dcache_clean_area);
+void cpu_xscale_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_xscale_switch_mm);
+void cpu_xscale_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_xscale_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_xscale_do_suspend(void *);
+__ADDRESSABLE(cpu_xscale_do_suspend);
+void cpu_xscale_do_resume(void *);
+__ADDRESSABLE(cpu_xscale_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_XSCALE */
+
+#ifdef CONFIG_CPU_XSC3
+void cpu_xsc3_proc_init(void);
+__ADDRESSABLE(cpu_xsc3_proc_init);
+void cpu_xsc3_proc_fin(void);
+__ADDRESSABLE(cpu_xsc3_proc_fin);
+void cpu_xsc3_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_xsc3_reset);
+int cpu_xsc3_do_idle(void);
+__ADDRESSABLE(cpu_xsc3_do_idle);
+void cpu_xsc3_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_xsc3_dcache_clean_area);
+void cpu_xsc3_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_xsc3_switch_mm);
+void cpu_xsc3_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_xsc3_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_xsc3_do_suspend(void *);
+__ADDRESSABLE(cpu_xsc3_do_suspend);
+void cpu_xsc3_do_resume(void *);
+__ADDRESSABLE(cpu_xsc3_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_XSC3 */
+
+#ifdef CONFIG_CPU_MOHAWK
+void cpu_mohawk_proc_init(void);
+__ADDRESSABLE(cpu_mohawk_proc_init);
+void cpu_mohawk_proc_fin(void);
+__ADDRESSABLE(cpu_mohawk_proc_fin);
+void cpu_mohawk_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_mohawk_reset);
+int cpu_mohawk_do_idle(void);
+__ADDRESSABLE(cpu_mohawk_do_idle);
+void cpu_mohawk_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_mohawk_dcache_clean_area);
+void cpu_mohawk_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_mohawk_switch_mm);
+void cpu_mohawk_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_mohawk_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_mohawk_do_suspend(void *);
+__ADDRESSABLE(cpu_mohawk_do_suspend);
+void cpu_mohawk_do_resume(void *);
+__ADDRESSABLE(cpu_mohawk_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_MOHAWK */
+
+#ifdef CONFIG_CPU_FEROCEON
+void cpu_feroceon_proc_init(void);
+__ADDRESSABLE(cpu_feroceon_proc_init);
+void cpu_feroceon_proc_fin(void);
+__ADDRESSABLE(cpu_feroceon_proc_fin);
+void cpu_feroceon_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_feroceon_reset);
+int cpu_feroceon_do_idle(void);
+__ADDRESSABLE(cpu_feroceon_do_idle);
+void cpu_feroceon_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_feroceon_dcache_clean_area);
+void cpu_feroceon_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_feroceon_switch_mm);
+void cpu_feroceon_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_feroceon_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_feroceon_do_suspend(void *);
+__ADDRESSABLE(cpu_feroceon_do_suspend);
+void cpu_feroceon_do_resume(void *);
+__ADDRESSABLE(cpu_feroceon_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_FEROCEON */
+
+#if defined(CONFIG_CPU_V6) || defined(CONFIG_CPU_V6K)
+void cpu_v6_proc_init(void);
+__ADDRESSABLE(cpu_v6_proc_init);
+void cpu_v6_proc_fin(void);
+__ADDRESSABLE(cpu_v6_proc_fin);
+void cpu_v6_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_v6_reset);
+int cpu_v6_do_idle(void);
+__ADDRESSABLE(cpu_v6_do_idle);
+void cpu_v6_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_v6_dcache_clean_area);
+void cpu_v6_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_v6_switch_mm);
+void cpu_v6_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_v6_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_v6_do_suspend(void *);
+__ADDRESSABLE(cpu_v6_do_suspend);
+void cpu_v6_do_resume(void *);
+__ADDRESSABLE(cpu_v6_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CPU_V6 */
+
+#ifdef CONFIG_CPU_V7
+void cpu_v7_proc_init(void);
+__ADDRESSABLE(cpu_v7_proc_init);
+void cpu_v7_proc_fin(void);
+__ADDRESSABLE(cpu_v7_proc_fin);
+void cpu_v7_reset(void);
+__ADDRESSABLE(cpu_v7_reset);
+int cpu_v7_do_idle(void);
+__ADDRESSABLE(cpu_v7_do_idle);
+#ifdef CONFIG_PJ4B_ERRATA_4742
+int cpu_pj4b_do_idle(void);
+__ADDRESSABLE(cpu_pj4b_do_idle);
+#endif
+void cpu_v7_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_v7_dcache_clean_area);
+void cpu_v7_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+/* Special switch_mm() callbacks to work around bugs in v7 */
+__ADDRESSABLE(cpu_v7_switch_mm);
+void cpu_v7_iciallu_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_v7_iciallu_switch_mm);
+void cpu_v7_bpiall_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_v7_bpiall_switch_mm);
+#ifdef CONFIG_ARM_LPAE
+void cpu_v7_set_pte_ext(pte_t *ptep, pte_t pte);
+#else
+void cpu_v7_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+#endif
+__ADDRESSABLE(cpu_v7_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_v7_do_suspend(void *);
+__ADDRESSABLE(cpu_v7_do_suspend);
+void cpu_v7_do_resume(void *);
+__ADDRESSABLE(cpu_v7_do_resume);
+/* Special versions of suspend and resume for the CA9MP cores */
+void cpu_ca9mp_do_suspend(void *);
+__ADDRESSABLE(cpu_ca9mp_do_suspend);
+void cpu_ca9mp_do_resume(void *);
+__ADDRESSABLE(cpu_ca9mp_do_resume);
+/* Special versions of suspend and resume for the Marvell PJ4B cores */
+#ifdef CONFIG_CPU_PJ4B
+void cpu_pj4b_do_suspend(void *);
+__ADDRESSABLE(cpu_pj4b_do_suspend);
+void cpu_pj4b_do_resume(void *);
+__ADDRESSABLE(cpu_pj4b_do_resume);
+#endif /* CONFIG_CPU_PJ4B */
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+#endif /* CONFIG_CPU_V7 */
+
+#ifdef CONFIG_CPU_V7M
+void cpu_v7m_proc_init(void);
+__ADDRESSABLE(cpu_v7m_proc_init);
+void cpu_v7m_proc_fin(void);
+__ADDRESSABLE(cpu_v7m_proc_fin);
+void cpu_v7m_reset(unsigned long addr, bool hvc);
+__ADDRESSABLE(cpu_v7m_reset);
+int cpu_v7m_do_idle(void);
+__ADDRESSABLE(cpu_v7m_do_idle);
+void cpu_v7m_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_v7m_dcache_clean_area);
+void cpu_v7m_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
+__ADDRESSABLE(cpu_v7m_switch_mm);
+void cpu_v7m_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext);
+__ADDRESSABLE(cpu_v7m_set_pte_ext);
+#ifdef CONFIG_ARM_CPU_SUSPEND
+void cpu_v7m_do_suspend(void *);
+__ADDRESSABLE(cpu_v7m_do_suspend);
+void cpu_v7m_do_resume(void *);
+__ADDRESSABLE(cpu_v7m_do_resume);
+#endif /* CONFIG_ARM_CPU_SUSPEND */
+void cpu_cm7_proc_fin(void);
+__ADDRESSABLE(cpu_cm7_proc_fin);
+void cpu_cm7_dcache_clean_area(void *addr, int size);
+__ADDRESSABLE(cpu_cm7_dcache_clean_area);
+#endif /* CONFIG_CPU_V7M */

-- 
2.44.0

