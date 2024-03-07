Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD412DD95
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821332; cv=none; b=bsqh2ec309W08athV2EvmSIcGqYM0jqyhwPPjPHHJ4SVwQmiOGkpEUiPtLsUUUqIY+cbcVWil361U40SGRjQLlW4VOf8mBBnsQiEQWwNI4S/rKmncSWzgIGwkfHCdR/TouTNkV15/AbPCO0IEUzQXfqRJRuyn6pkwVwnhStfZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821332; c=relaxed/simple;
	bh=/o6zaQY4fnqF2Jew1Rvu4uhun6oJ98Aihl37DKENFnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmqdeGOtiqJbbpZZX71IOevK+eWgAb7EznCv0BWBtkEmpsCRcM3CYm9EjV2cYXrobbLdjdh0JCShiI6789+biGZufCBoFG/qpUWj0UKlQ1h2kcCkhA9eTOfURigDyOMyspb2ahwcNwEymDhMRnPsceDGPtaxIquBtkI7FNcCZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWO/+tPf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWO/+tPf"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51364c3d5abso988414e87.2
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821328; x=1710426128; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC3pcDM1Ey3dTkjBKsVJTDPbi3o492y4kegvDdvubjY=;
        b=aWO/+tPfejYE80JYXIa6rx8PZGOLZxoSbAGCjUe3PgwTY8jCgMKv9kUvDX8/Trh8mO
         6AH6dA3OdyUXf5xbVRoa7Qim607DqDk8UpYA6gdhnKTI7nn7owDWrVEC0ESOVU5igD28
         O12xVRiczrZQseOXUlphC6sn9Qm42wseDNIgHlZ7ujBryLGoI6afgvD3WLrjejsdbVys
         PhsnAFALYmpbswIoO5718RrJCf4CpK6WAd0fmfUmgTIHEACfcu54f52pbDfXo/RMzZKT
         1/OMrfOmyC4sZEL8jTy1LV8VyvYeaoBv6oPyFS3Xcwo1ZdWF6HbGiSfpmx5Hr1athQX8
         zp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821328; x=1710426128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC3pcDM1Ey3dTkjBKsVJTDPbi3o492y4kegvDdvubjY=;
        b=AUqrxitbegSWF8jWloddF53Z5/BzfggG4qwYFlQ6yYIUilSPIWJP8YfEW9f519F9bI
         qKMvAVduruV1UBPWMTxL6ww1LC+3WqSjRoT1bQ0XMHYguhwu/WTi/44lMN77ANuSfOpn
         vJZ1eckFh6S5MAGBIEryKD6DI65w3E+r6WapidHv8ne5ZR2h3VGphNSrZC5TWRkgfOoh
         s9oBb0p1zit7sZY6CnCxSpi+3HF3yJ3Tn5R0UamP8yRCeuNVJM96kV0K+FTpEvtKwvkj
         njcO5q3Txqcx0fztSPB8LNl3YqzmyZJXyTHP0P5benkVR859AjWgKs2T03/Ck3vht5zt
         8vDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9kZT2ATy4wNtPCHNVHhKLu3CV0fYKhEynHsgvScwVd+T1huH8RqOsbeQ3QIAYrblxJPmDdOv7XSZ/iT254di6DPaNxw==
X-Gm-Message-State: AOJu0YxntYrI4nR0v1CKISUEppmrcFEM0OfVwFLqJygDQxiu0cVXwYOz
	f0qbitENZRm7VGLCCId1kgBYtsN79BWuRfiVlKDL/20zv5hm2mo9Gze73LLFmaI=
X-Google-Smtp-Source: AGHT+IELgAm1/45/O9CskIcUj9k8CU3DbEr4VnQhmRSWgTo2h/a2mNo6b8VOMOqIzgSwAxzWHUGx1A==
X-Received: by 2002:a05:6512:33d3:b0:513:83c5:3724 with SMTP id d19-20020a05651233d300b0051383c53724mr1014083lfg.37.1709821328286;
        Thu, 07 Mar 2024 06:22:08 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:03 +0100
Subject: [PATCH v2 4/9] ARM: proc: Use inlines instead of defines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-4-cc74ea0306b3@linaro.org>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
In-Reply-To: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

We currently access the per-cpu vtable with defines such
as:

  define cpu_proc_init PROC_VTABLE(_proc_init)

Convert all of these instances to static inlines instead:

  static inline __nocfi void cpu_proc_init(void)
  {
        PROC_VTABLE(_proc_init)();
  }

This has the upside that we can add the __nocfi tag to
the inline function so CFI can skip over this and work,
and we can simplify some platform code that was looking
into the symbol table to be able to call cpu_reset(),
now we can just call it instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/common/mcpm_entry.c    | 10 ++------
 arch/arm/include/asm/proc-fns.h | 57 +++++++++++++++++++++++++++++++++--------
 arch/arm/mach-sunxi/mc_smp.c    |  7 +----
 3 files changed, 50 insertions(+), 24 deletions(-)

diff --git a/arch/arm/common/mcpm_entry.c b/arch/arm/common/mcpm_entry.c
index e013ff1168d3..3e19f246caff 100644
--- a/arch/arm/common/mcpm_entry.c
+++ b/arch/arm/common/mcpm_entry.c
@@ -234,13 +234,10 @@ int mcpm_cpu_power_up(unsigned int cpu, unsigned int cluster)
 	return ret;
 }
 
-typedef typeof(cpu_reset) phys_reset_t;
-
 void mcpm_cpu_power_down(void)
 {
 	unsigned int mpidr, cpu, cluster;
 	bool cpu_going_down, last_man;
-	phys_reset_t phys_reset;
 
 	mpidr = read_cpuid_mpidr();
 	cpu = MPIDR_AFFINITY_LEVEL(mpidr, 0);
@@ -298,8 +295,7 @@ void mcpm_cpu_power_down(void)
 	 * the kernel as if the power_up method just had deasserted reset
 	 * on the CPU.
 	 */
-	phys_reset = (phys_reset_t)(unsigned long)__pa_symbol(cpu_reset);
-	phys_reset(__pa_symbol(mcpm_entry_point), false);
+	cpu_reset(__pa_symbol(mcpm_entry_point), false);
 
 	/* should never get here */
 	BUG();
@@ -376,7 +372,6 @@ static int __init nocache_trampoline(unsigned long _arg)
 	unsigned int mpidr = read_cpuid_mpidr();
 	unsigned int cpu = MPIDR_AFFINITY_LEVEL(mpidr, 0);
 	unsigned int cluster = MPIDR_AFFINITY_LEVEL(mpidr, 1);
-	phys_reset_t phys_reset;
 
 	mcpm_set_entry_vector(cpu, cluster, cpu_resume_no_hyp);
 	setup_mm_for_reboot();
@@ -387,8 +382,7 @@ static int __init nocache_trampoline(unsigned long _arg)
 	__mcpm_outbound_leave_critical(cluster, CLUSTER_DOWN);
 	__mcpm_cpu_down(cpu, cluster);
 
-	phys_reset = (phys_reset_t)(unsigned long)__pa_symbol(cpu_reset);
-	phys_reset(__pa_symbol(mcpm_entry_point), false);
+	cpu_reset(__pa_symbol(mcpm_entry_point), false);
 	BUG();
 }
 
diff --git a/arch/arm/include/asm/proc-fns.h b/arch/arm/include/asm/proc-fns.h
index 280396483f5d..9bd6bf5f901a 100644
--- a/arch/arm/include/asm/proc-fns.h
+++ b/arch/arm/include/asm/proc-fns.h
@@ -131,18 +131,55 @@ static inline void init_proc_vtable(const struct processor *p)
 }
 #endif
 
-#define cpu_proc_init			PROC_VTABLE(_proc_init)
-#define cpu_check_bugs			PROC_VTABLE(check_bugs)
-#define cpu_proc_fin			PROC_VTABLE(_proc_fin)
-#define cpu_reset			PROC_VTABLE(reset)
-#define cpu_do_idle			PROC_VTABLE(_do_idle)
-#define cpu_dcache_clean_area		PROC_TABLE(dcache_clean_area)
-#define cpu_set_pte_ext			PROC_TABLE(set_pte_ext)
-#define cpu_do_switch_mm		PROC_VTABLE(switch_mm)
+static inline void __nocfi cpu_proc_init(void)
+{
+	PROC_VTABLE(_proc_init)();
+}
+static inline void __nocfi cpu_check_bugs(void)
+{
+	PROC_VTABLE(check_bugs)();
+}
+static inline void __nocfi cpu_proc_fin(void)
+{
+	PROC_VTABLE(_proc_fin)();
+}
+static inline void __nocfi cpu_reset(unsigned long addr, bool hvc)
+{
+	PROC_VTABLE(reset)(addr, hvc);
+}
+static inline int __nocfi cpu_do_idle(void)
+{
+	return PROC_VTABLE(_do_idle)();
+}
+static inline void __nocfi cpu_dcache_clean_area(void *addr, int size)
+{
+	PROC_TABLE(dcache_clean_area)(addr, size);
+}
+#ifdef CONFIG_ARM_LPAE
+static inline void __nocfi cpu_set_pte_ext(pte_t *ptep, pte_t pte)
+{
+	PROC_TABLE(set_pte_ext)(ptep, pte);
+}
+#else
+static inline void __nocfi cpu_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext)
+{
+	PROC_TABLE(set_pte_ext)(ptep, pte, ext);
+}
+#endif
+static inline void __nocfi cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
+{
+	PROC_VTABLE(switch_mm)(pgd_phys, mm);
+}
 
 /* These two are private to arch/arm/kernel/suspend.c */
-#define cpu_do_suspend			PROC_VTABLE(do_suspend)
-#define cpu_do_resume			PROC_VTABLE(do_resume)
+static inline void __nocfi cpu_do_suspend(void *p)
+{
+	PROC_VTABLE(do_suspend)(p);
+}
+static inline void __nocfi cpu_do_resume(void *p)
+{
+	PROC_VTABLE(do_resume)(p);
+}
 #endif
 
 extern void cpu_resume(void);
diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
index 277f6aa8e6c2..791eabb7d433 100644
--- a/arch/arm/mach-sunxi/mc_smp.c
+++ b/arch/arm/mach-sunxi/mc_smp.c
@@ -646,17 +646,12 @@ static bool __init sunxi_mc_smp_cpu_table_init(void)
  *
  * We need the trampoline code to enable CCI-400 on the first cluster
  */
-typedef typeof(cpu_reset) phys_reset_t;
-
 static int __init nocache_trampoline(unsigned long __unused)
 {
-	phys_reset_t phys_reset;
-
 	setup_mm_for_reboot();
 	sunxi_cluster_cache_disable_without_axi();
 
-	phys_reset = (phys_reset_t)(unsigned long)__pa_symbol(cpu_reset);
-	phys_reset(__pa_symbol(sunxi_mc_smp_resume), false);
+	cpu_reset(__pa_symbol(sunxi_mc_smp_resume), false);
 	BUG();
 }
 

-- 
2.34.1

