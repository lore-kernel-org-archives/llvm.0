Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49C45BE1
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856802; cv=none; b=QbfnJFyKI5OHgiVoh/KKDQ+mJ2vJUtroh2P3uq2BMUhBqQXvGqKwqejd5LKJ3+V7yzg9XGyMjFFhnUQ7FUpKL6r5eRpvhcONI10qTY3g977Gs15IhOADN0kndaxrYDl+PaRmmr4fuhXVaCEHBypAq6L5D2MN5t5hK/YAEYk2sxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856802; c=relaxed/simple;
	bh=AranqSPM97DF2oP+iNvqBcwWVr/m0LNuEhIzFI9Jvs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WEl15J7HVQony2eBlt5KL1iJUQgcNGD1lQx7AJ4K+YlW0Io/v6yLbw+EaLZNYch3+WbBktnzAJFVUODMWzc42/+EvSWdNioY6vmalJ+R5KoZ80fvv1hS9IfRyDbidk95Y+kAndWdqd8O4xoTSfdLMnX/7vic+PlsvhGrUuPtdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMz0lan3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMz0lan3"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-518931f8d23so5614681e87.3
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856798; x=1714461598; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyMcBwbBfqsAhnzqR39ms1qCEKXYkwgtanMTW7elrw8=;
        b=nMz0lan3t049N2qDTQp86jrGyIpUeXNEpftQbMkqEJegDDluPLJ/HRsSNDQ30xRNIP
         o9h/92urbZyLddp9ieJb+pdLEDoYMC08VGeWgUH2Woh3uMJiBpkupKx3UhNn6efGLHDe
         ch1D+flIokpnJ/95CUBrrXWnv0IXL5Qgej/Qe586ZFI1vDN5KS/buKLOOugTVdLnw3aN
         8pDJBU8b0+pGLTePy7rMe6s9ceT9MNQRoj+beZcJnGums6D5rTrflO9hmGHS4JcRJyRq
         2YXMf91+qvHoStyiLFwng9DsG3PLhcvPuLoos7ZEjedoIEklydGSNHqNJ6vnuy1v1o14
         xGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856798; x=1714461598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyMcBwbBfqsAhnzqR39ms1qCEKXYkwgtanMTW7elrw8=;
        b=D5YmaLYk8sRhAih9YuVsfI9gryTiAtBY+hqUAz+FOxejiJy75rCQJ6Y2lgbjJEOsLB
         rUjmyG52bY5EoAj/i9ksYO+8GFD8OGE0PLWMd0e6NQXVonm7CIAsejfMliLDoljzCyK7
         v8XvniRQGj8g2g4uBHCVVR9xJZVW4BqYyDFa16MSjl1qIjJjduAq750XOMQSaw88THEp
         vn7Fu342yerTQy6flkd1BnzzNGghvZWTAmoVjoki7Om2S+fi3WAtLb2vqpYZWFWLjCuX
         te95hTL3v6jJGVwsB/PEHvT8Je1iDEmubCo9J9AikHwnP7ktbCYyNVQTS48XeKEn4aD2
         qPQw==
X-Forwarded-Encrypted: i=1; AJvYcCXd2TV/x2vBsgubvgS0u2WUgxLFCWwMspp1Li51GsHPjH1DKkPdi1bDy/l9tUTZXbH7HJPXNAFNGdWoZdwGfLDsNtJuHw==
X-Gm-Message-State: AOJu0YyqT+Ys0qF03W5BCnoC2TWnpFNQMwAJ3LzRJBb2WKsQf9IlOXca
	K1VEqV8I3tUYTKw+WXaXqaAjcNmO6POaiEvTOsbbH/MJjvN1DjHKFv/WlSP9qQA=
X-Google-Smtp-Source: AGHT+IH+rj0nz2mAvktrGS44Ih3WGmcW+LsHDi0wDLC229TXC2y3QGqqXMgg4/TsRS6tZEP/UwhTyQ==
X-Received: by 2002:a05:6512:4809:b0:518:d4c3:4682 with SMTP id eo9-20020a056512480900b00518d4c34682mr7324488lfb.24.1713856797668;
        Tue, 23 Apr 2024 00:19:57 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:19:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 09:19:52 +0200
Subject: [PATCH v8 6/9] ARM: mm: Define prototypes for all per-processor
 calls
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-arm32-cfi-v8-6-08f10f5d9297@linaro.org>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
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
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
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

