Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E414A17997
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891699; cv=none; b=CcMfZ10WAHBQ7fVkdPKNCVuyLCwPURg9ODnWoO/JxkzyUNuiIwc1WCpubPIeMgnNSqJihMhteXH128jgbaRgBnnl1jZLZ+7Xe8GFNoCa/b1GYTxFcDUXplQpQTMqUTGwz5JADoJD3mXLzGCDG4654a5u83O7B5P6CjBVTPnS0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891699; c=relaxed/simple;
	bh=/o6zaQY4fnqF2Jew1Rvu4uhun6oJ98Aihl37DKENFnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVSLnxDwalVsReCB+E4GUGeWY6/FysL+HWrP11k+eAxPyG2INm+P9F8gJSh8NcangG00wPjFE4RTIJnTEeuSS7oUPn93OW7xQFJmB79UbF7UW1o98f46V05rkLZ8BI2u+uYq+Z8MqZvO85J3KmBo2Cry6TVR1aGxZSD/VusTj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UD9DOTe4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UD9DOTe4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so343287566b.0
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891696; x=1709496496; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC3pcDM1Ey3dTkjBKsVJTDPbi3o492y4kegvDdvubjY=;
        b=UD9DOTe4m0Fl+zfchLREtVaQYpLZ6S5rsN/qLavxsK5HWBSZRMwCIVoEkvUc6T1BXh
         eM0srmPT1TL1t2b2LrgWO4RU/UmXnkM9d9T1XBGIW7LWY/g3qS0k1DeknVjTLizx+iYj
         tS+UxmpocpsGXXxFQSW6AwEtp25ByNfUpBkYg44ZlJtwpTBEEQs6iCSvSIjdxzYVMBaO
         qBnNi26kWmFT5Rcufl2ob8x/ePDlGRtGnDD/lci1a6/zBorkntgfk9UauaMemtSelyZT
         44v2HKet2RX58sju0SQMTOsGjkjs/15DDJFWUk+prbYTXknmXcKljCviOjdY+bwRKJ+A
         FGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891696; x=1709496496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC3pcDM1Ey3dTkjBKsVJTDPbi3o492y4kegvDdvubjY=;
        b=AoAecmfl4VJoSxFt6+Mf2f3OnSr5HRek5MelWfsMmyRmk1GG+/RKInMkq5ATlXF8Km
         jc9+ylO8byEhXtUGX3tnGwSDFFe1bt7pgE1iMxcUr1MLRnAiw7PSk6TQVAhJ1Ngr5wRg
         pojHt6l/ISIcIVWw/3PE6jHX4OJc7DSmts/HLHortrIyoDZ5ZwpONU53wy2wEUHOPu5n
         KXcXDk9WuBcrhQMcKHos9qb/TkcZQ4d9WhoRYZg8xm81rlpzmw2cW7VPreKnSNXKnS+Y
         1wrIRZPZ+9bksiSeo5jw03GFvOMYfMPP14mKj9S7ECUKYhxL54mcIBC8Qug9SvTrZ5Ek
         V98A==
X-Forwarded-Encrypted: i=1; AJvYcCWbmYmMmLVTIJIQC1Ap7JTwj6G20GShRVIXVvcOmaGXIYeMVtrfEb19dOiAbxy299CMpp9jXfr66h4pefeq/HfqQwy+CQ==
X-Gm-Message-State: AOJu0YzID7WcPWrqFDjIo525uNMdcSQ3lS2soaASJ1VfbiZvbAGfam+9
	KAWy3/7yCRYuUY4Yd0RQgzM/86h58uKRKTJiY62dc2ThCsUfKJoHxr5e3E+DjvI=
X-Google-Smtp-Source: AGHT+IFhKSmAMGVKE3e79lh/Twxe14kufH36JgG8EFNdH/4PPIzZ7artQFAubFyeEzB2wpB3+rihOg==
X-Received: by 2002:a17:907:208f:b0:a3f:421:26a5 with SMTP id pv15-20020a170907208f00b00a3f042126a5mr4791471ejb.12.1708891696123;
        Sun, 25 Feb 2024 12:08:16 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:13 +0100
Subject: [PATCH 4/7] ARM: proc: Use inlines instead of defines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-4-6943306f065b@linaro.org>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
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

