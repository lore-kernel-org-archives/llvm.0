Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391CB14F75
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148549; cv=none; b=P6yUusEMw8uVpVd8jICwV1dKPS+dO2s0UafDzscIP5u9iiMP2/A+uNhJwrYRsN0Mk7YCl90uQh5mFvASnsDPAkxS5BWNBngkh7QVOUT+rz5YNfKcm45X4DLPoFdTGermSt13CRvw+IyX8ibnHMVB9zzULGkALDxmPHMOZtYcSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148549; c=relaxed/simple;
	bh=/o6zaQY4fnqF2Jew1Rvu4uhun6oJ98Aihl37DKENFnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfxEZ6BsAg2ExXDUsAjWrf/Au8BLwRtD8jw8QrvY81T/bXKn2wT5cEsTGxFP+G+SU3qCZkgnFpUyCLS40/xl+HjIMDPw0YdbDPC14TNFaK8ntR3EcZw7SGNVPYuZRTWk6lj4H4N3RBu/XcKhDcf27frNzUMq/T5ZqKDUaRxMwUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwzlhlRk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwzlhlRk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a45606c8444so485500566b.3
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148545; x=1710753345; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC3pcDM1Ey3dTkjBKsVJTDPbi3o492y4kegvDdvubjY=;
        b=UwzlhlRkV13j3xgUQkEdUMvY16YD+2puPyW2u/iMF140g8NAVdo3zh92RERMZ15khg
         VymzZ/t6brBRuzxFHvHVubm7t9MBbBLfp+QminujCRddCtbWkVGISjxndEWMqEELR93q
         1D2ooDSLt4Nr4j3pNSvEkoMgHnKcxbS1G9j5D7SPt8zRV7fUj+XtlO7WBjsqwv+P03Vo
         6m+/UzzH44oTs31Ei9O2f/x9+k55XTXIjEeQRzUP/a0Rly98WTXudk1dHOKu3MQHkhko
         qsBQ2f2iVK9/2vAqp3G6lZYkli4SB003X7OrWwowHJMQdt5b9MZDBIPYwR7MK7OW5KR2
         yrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148545; x=1710753345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC3pcDM1Ey3dTkjBKsVJTDPbi3o492y4kegvDdvubjY=;
        b=YvKYvZbntwquVjynHT4fzA/C83EPbx31wD5JS8KmtVM8Ym/vO1JeK41IwRF7TpPgH0
         zO2DGX3IklbWAQySYwedWI7Rss/dJBcPsqoWGaPiig8XLCei/YmyQ7rzaHBtU2atXWuN
         q5GmfByR/bSRnIjEnuUGDnxHz62Ir4xk6Dnv1n0ExWS/AHtH1qw/gHi3sEYnTbzmC1bc
         9BJ7yceKOGXAME6+Yk0V1X1bwnvHkuXXJ2lnkERtQQ1u8DfBnYaygUoR5ysWs46XQN0D
         4/xdwMedsVmOIVwa6s/kK7waLZRq2OaCG5Kx40+udnR/e4rBaXPm+lAcJJp/1pgz6Nfe
         ySxw==
X-Forwarded-Encrypted: i=1; AJvYcCUijZrY2y4R2rkKMK7d3tf6JKGj2y/cZnbh8vVHhjAHKUWIovpTNkGNaLJ6HHTINsMWxL7+wkqCuHaivdIyChMZLgUZtA==
X-Gm-Message-State: AOJu0YyuSN2Bsuwi5bUxcJCuXY+Z1XdpFceJW0loRAP9wt9qqzUJM/qq
	55BiZXH5A3P94KW0nqfx6NjPLbo9kpP7quKYtqbp0xIor/zrI1xpbMwXqL2eBog=
X-Google-Smtp-Source: AGHT+IHnoP9Neiaxh4cMQS0Li2Badk1tKeVSTV4l0nW+mWDMoHOdvGFF1ah8Zrqeue8KfpfRml35pA==
X-Received: by 2002:a17:906:5f89:b0:a43:dd85:e171 with SMTP id a9-20020a1709065f8900b00a43dd85e171mr3244028eju.69.1710148545613;
        Mon, 11 Mar 2024 02:15:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:41 +0100
Subject: [PATCH v3 4/9] ARM: proc: Use inlines instead of defines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-4-224a0f0a45c2@linaro.org>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
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

