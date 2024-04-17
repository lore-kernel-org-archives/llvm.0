Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B00883A18
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342674; cv=none; b=PNhCXogcGABkBlVgWl4+F3kd9isHS9sQVLpkyMi9ZN3I7YkzEx0yn5Zm6eQ6vgZ4sg038i/K8vjMEb++X/vr6mI+z3hge9j201GAOG+4N4EmxPB2XwDED1VuS7DHyfdbJhP5TpakRdULfNu0c1pn87WkZTIQt1iklC2W8YU8LAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342674; c=relaxed/simple;
	bh=IiCE6hgdcjld1MZPZcRl4TpNGTHu2dPhsrHCKPkKa0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIgcHLi2IrNEy8Wbg0PvjqEnq4pP6F6WVTahMs2nxFqQikGtvxeSOYkDvd9y/IrIi9iZjqvDJIWekYjveEspsq9u/2UAmRPOaR6NNkyY8cDLcNHZ0jNH9dGiJ6Kiukw8pzs9nKVZpWrpPVyfZ9ObolqEGP0u1c757ER95wLJwRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpYbvjnI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpYbvjnI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-518e2283bd3so5238000e87.1
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342668; x=1713947468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuvuYq8tTzca01z5gyfyOF2vL2NvZBnLK7rlGaLjsTY=;
        b=CpYbvjnIa3S/27hJ24BPT0VOeZoTTAiR1ptrTe6ooVPSZ4avm9c4KUpkKVI0tSnPax
         noZ+TMwskuwUNEG4JGSdPaTc7JCoXPKWIXdN5svzooJ5LUa4yt00sGieX48zSz3vw97y
         Jv4Tlnrrh3kdWYxhn0R8RniT9NvjikU5uFHZPJi2q9qbBJuOOgMCVRsTQw2aZAjsDqeU
         c5XrWqfEhJNaHUey2DgQy0yJqpxfzLu4rblputrGueOt/yFKjKBcKD7yafkb4QxpUf3/
         5nitpyXuuuhf2YQJ1AKJB5pO7c8bBRqm/qgjX8Bskk7hLpveUblfEpxj6/KQ5+5RAIgc
         9amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342668; x=1713947468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuvuYq8tTzca01z5gyfyOF2vL2NvZBnLK7rlGaLjsTY=;
        b=SC+ORGz0INX7I6CF0SigHzfZiFJliSrGK98KkeauBJPO5pRthFt7SN8LrrF5oKZQYf
         GMZ0G+RhG8lYrynA3dR7blm+vsva3/2vRhFhc2iPkmYBzPSbPDDjqb7uKRVTVLEds3TI
         rzEnrfJx7171wbN1TGmicwHCf0MS2rxECfybCqRIUmv8oiKOFNoiFCLTVY9ZqTVHcn0e
         D26SsDa/U0uik09UPpeLJMTOl9orRZh4VpVMSlFslJ9cvQmp1R8Zr+secwRUu5ZQ6FU4
         TnsxVnopWv6z+CStlGqGfbEzKKolSKKeqOzTZsJiSMkABOTm82eOmX/pl/KcYEuPqe8H
         Oqow==
X-Forwarded-Encrypted: i=1; AJvYcCU9s3xXNKc23PCIfiYJS6Vntxo3ZC+QR0JVG7AHX7JBn8ZBe9KY0VOdPHzhqqudrZfSomJ+M7zzCZCdZimDwXtXD9t9Mw==
X-Gm-Message-State: AOJu0YzIeT2yxJqHes2fCETKQcGhcN8JkIJA7wPUYG4mQ+5vfFob/Y4a
	z8F8lrpcKYhrYApZlBLj9LUaYaXuFanW15bYOKcVd1JjK86HJ2L59x2MT04nxc5jmcUCgML66/D
	2
X-Google-Smtp-Source: AGHT+IHbRQfLQ8Jk7EZ7K0D0B8rfNXK/D/IupFsWh+nA3CMTpPV0M64GKoccuLL+GX2WnXZ0gYYJGw==
X-Received: by 2002:a19:6450:0:b0:513:ca40:fafc with SMTP id b16-20020a196450000000b00513ca40fafcmr10581542lfj.11.1713342667910;
        Wed, 17 Apr 2024 01:31:07 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:56 +0200
Subject: [PATCH v6 07/11] ARM: mm: Type-annotate all per-processor assembly
 routines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-7-6486385eb136@linaro.org>
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

Type tag the remaining per-processor assembly using the CFI
symbol macros, in addition to those that were previously tagged
for cache maintenance calls.

This will be used to finally provide proper C prototypes for
all these calls as well so that CFI can be made to work.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/proc-arm1020.S   | 24 ++++++++++------
 arch/arm/mm/proc-arm1020e.S  | 24 ++++++++++------
 arch/arm/mm/proc-arm1022.S   | 24 ++++++++++------
 arch/arm/mm/proc-arm1026.S   | 24 ++++++++++------
 arch/arm/mm/proc-arm720.S    | 25 +++++++++++------
 arch/arm/mm/proc-arm740.S    | 26 ++++++++++++-----
 arch/arm/mm/proc-arm7tdmi.S  | 34 +++++++++++++++--------
 arch/arm/mm/proc-arm920.S    | 31 ++++++++++++---------
 arch/arm/mm/proc-arm922.S    | 23 +++++++++------
 arch/arm/mm/proc-arm925.S    | 22 +++++++++------
 arch/arm/mm/proc-arm926.S    | 31 +++++++++++++--------
 arch/arm/mm/proc-arm940.S    | 21 +++++++++-----
 arch/arm/mm/proc-arm946.S    | 21 +++++++++-----
 arch/arm/mm/proc-arm9tdmi.S  | 26 ++++++++++++-----
 arch/arm/mm/proc-fa526.S     | 24 ++++++++++------
 arch/arm/mm/proc-feroceon.S  | 30 ++++++++++++--------
 arch/arm/mm/proc-mohawk.S    | 30 ++++++++++++--------
 arch/arm/mm/proc-sa110.S     | 23 +++++++++------
 arch/arm/mm/proc-sa1100.S    | 31 +++++++++++++--------
 arch/arm/mm/proc-v6.S        | 31 +++++++++++++--------
 arch/arm/mm/proc-v7-2level.S |  8 +++---
 arch/arm/mm/proc-v7-3level.S |  8 +++---
 arch/arm/mm/proc-v7.S        | 66 +++++++++++++++++++++++---------------------
 arch/arm/mm/proc-v7m.S       | 41 +++++++++++++--------------
 arch/arm/mm/proc-xsc3.S      | 30 ++++++++++++--------
 arch/arm/mm/proc-xscale.S    | 30 ++++++++++++--------
 26 files changed, 434 insertions(+), 274 deletions(-)

diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 1e014cc5b4d1..e6944ecd23ab 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -57,18 +57,20 @@
 /*
  * cpu_arm1020_proc_init()
  */
-ENTRY(cpu_arm1020_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm1020_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm1020_proc_init)
 
 /*
  * cpu_arm1020_proc_fin()
  */
-ENTRY(cpu_arm1020_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm1020_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000 		@ ...i............
 	bic	r0, r0, #0x000e 		@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm1020_proc_fin)
 
 /*
  * cpu_arm1020_reset(loc)
@@ -81,7 +83,7 @@ ENTRY(cpu_arm1020_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm1020_reset)
+SYM_TYPED_FUNC_START(cpu_arm1020_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -93,16 +95,17 @@ ENTRY(cpu_arm1020_reset)
 	bic	ip, ip, #0x1100 		@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm1020_reset)
+SYM_FUNC_END(cpu_arm1020_reset)
 	.popsection
 
 /*
  * cpu_arm1020_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm1020_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm1020_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_arm1020_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -358,7 +361,7 @@ SYM_TYPED_FUNC_START(arm1020_dma_unmap_area)
 SYM_FUNC_END(arm1020_dma_unmap_area)
 
 	.align	5
-ENTRY(cpu_arm1020_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm1020_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mov	ip, #0
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -368,6 +371,7 @@ ENTRY(cpu_arm1020_dcache_clean_area)
 	bhi	1b
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm1020_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -379,7 +383,7 @@ ENTRY(cpu_arm1020_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm1020_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm1020_switch_mm)
 #ifdef CONFIG_MMU
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mcr	p15, 0, r3, c7, c10, 4
@@ -407,14 +411,15 @@ ENTRY(cpu_arm1020_switch_mm)
 	mcr	p15, 0, r1, c8, c7, 0		@ invalidate I & D TLBs
 #endif /* CONFIG_MMU */
 	ret	lr
-        
+SYM_FUNC_END(cpu_arm1020_switch_mm)
+
 /*
  * cpu_arm1020_set_pte(ptep, pte)
  *
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm1020_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm1020_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -425,6 +430,7 @@ ENTRY(cpu_arm1020_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif /* CONFIG_MMU */
 	ret	lr
+SYM_FUNC_END(cpu_arm1020_set_pte_ext)
 
 	.type	__arm1020_setup, #function
 __arm1020_setup:
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index 7d80761f207a..5fae6e28c7a3 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -57,18 +57,20 @@
 /*
  * cpu_arm1020e_proc_init()
  */
-ENTRY(cpu_arm1020e_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm1020e_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm1020e_proc_init)
 
 /*
  * cpu_arm1020e_proc_fin()
  */
-ENTRY(cpu_arm1020e_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm1020e_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000 		@ ...i............
 	bic	r0, r0, #0x000e 		@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm1020e_proc_fin)
 
 /*
  * cpu_arm1020e_reset(loc)
@@ -81,7 +83,7 @@ ENTRY(cpu_arm1020e_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm1020e_reset)
+SYM_TYPED_FUNC_START(cpu_arm1020e_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -93,16 +95,17 @@ ENTRY(cpu_arm1020e_reset)
 	bic	ip, ip, #0x1100 		@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm1020e_reset)
+SYM_FUNC_END(cpu_arm1020e_reset)
 	.popsection
 
 /*
  * cpu_arm1020e_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm1020e_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm1020e_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_arm1020e_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -345,7 +348,7 @@ SYM_TYPED_FUNC_START(arm1020e_dma_unmap_area)
 SYM_FUNC_END(arm1020e_dma_unmap_area)
 
 	.align	5
-ENTRY(cpu_arm1020e_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm1020e_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mov	ip, #0
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -354,6 +357,7 @@ ENTRY(cpu_arm1020e_dcache_clean_area)
 	bhi	1b
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm1020e_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -365,7 +369,7 @@ ENTRY(cpu_arm1020e_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm1020e_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm1020e_switch_mm)
 #ifdef CONFIG_MMU
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mcr	p15, 0, r3, c7, c10, 4
@@ -392,14 +396,15 @@ ENTRY(cpu_arm1020e_switch_mm)
 	mcr	p15, 0, r1, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
-        
+SYM_FUNC_END(cpu_arm1020e_switch_mm)
+
 /*
  * cpu_arm1020e_set_pte(ptep, pte)
  *
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm1020e_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm1020e_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -408,6 +413,7 @@ ENTRY(cpu_arm1020e_set_pte_ext)
 #endif
 #endif /* CONFIG_MMU */
 	ret	lr
+SYM_FUNC_END(cpu_arm1020e_set_pte_ext)
 
 	.type	__arm1020e_setup, #function
 __arm1020e_setup:
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 53b1541c50d8..05a7f14b2751 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -57,18 +57,20 @@
 /*
  * cpu_arm1022_proc_init()
  */
-ENTRY(cpu_arm1022_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm1022_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm1022_proc_init)
 
 /*
  * cpu_arm1022_proc_fin()
  */
-ENTRY(cpu_arm1022_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm1022_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000 		@ ...i............
 	bic	r0, r0, #0x000e 		@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm1022_proc_fin)
 
 /*
  * cpu_arm1022_reset(loc)
@@ -81,7 +83,7 @@ ENTRY(cpu_arm1022_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm1022_reset)
+SYM_TYPED_FUNC_START(cpu_arm1022_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -93,16 +95,17 @@ ENTRY(cpu_arm1022_reset)
 	bic	ip, ip, #0x1100 		@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm1022_reset)
+SYM_FUNC_END(cpu_arm1022_reset)
 	.popsection
 
 /*
  * cpu_arm1022_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm1022_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm1022_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_arm1022_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -344,7 +347,7 @@ SYM_TYPED_FUNC_START(arm1022_dma_unmap_area)
 SYM_FUNC_END(arm1022_dma_unmap_area)
 
 	.align	5
-ENTRY(cpu_arm1022_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm1022_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mov	ip, #0
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -353,6 +356,7 @@ ENTRY(cpu_arm1022_dcache_clean_area)
 	bhi	1b
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm1022_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -364,7 +368,7 @@ ENTRY(cpu_arm1022_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm1022_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm1022_switch_mm)
 #ifdef CONFIG_MMU
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mov	r1, #(CACHE_DSEGMENTS - 1) << 5	@ 16 segments
@@ -384,14 +388,15 @@ ENTRY(cpu_arm1022_switch_mm)
 	mcr	p15, 0, r1, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
-        
+SYM_FUNC_END(cpu_arm1022_switch_mm)
+
 /*
  * cpu_arm1022_set_pte_ext(ptep, pte, ext)
  *
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm1022_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm1022_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -400,6 +405,7 @@ ENTRY(cpu_arm1022_set_pte_ext)
 #endif
 #endif /* CONFIG_MMU */
 	ret	lr
+SYM_FUNC_END(cpu_arm1022_set_pte_ext)
 
 	.type	__arm1022_setup, #function
 __arm1022_setup:
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 6c6ea0357a77..6800dd7c73f8 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -57,18 +57,20 @@
 /*
  * cpu_arm1026_proc_init()
  */
-ENTRY(cpu_arm1026_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm1026_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm1026_proc_init)
 
 /*
  * cpu_arm1026_proc_fin()
  */
-ENTRY(cpu_arm1026_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm1026_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000 		@ ...i............
 	bic	r0, r0, #0x000e 		@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm1026_proc_fin)
 
 /*
  * cpu_arm1026_reset(loc)
@@ -81,7 +83,7 @@ ENTRY(cpu_arm1026_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm1026_reset)
+SYM_TYPED_FUNC_START(cpu_arm1026_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -93,16 +95,17 @@ ENTRY(cpu_arm1026_reset)
 	bic	ip, ip, #0x1100 		@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm1026_reset)
+SYM_FUNC_END(cpu_arm1026_reset)
 	.popsection
 
 /*
  * cpu_arm1026_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm1026_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm1026_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_arm1026_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -339,7 +342,7 @@ SYM_TYPED_FUNC_START(arm1026_dma_unmap_area)
 SYM_FUNC_END(arm1026_dma_unmap_area)
 
 	.align	5
-ENTRY(cpu_arm1026_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm1026_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	mov	ip, #0
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
@@ -348,6 +351,7 @@ ENTRY(cpu_arm1026_dcache_clean_area)
 	bhi	1b
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm1026_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -359,7 +363,7 @@ ENTRY(cpu_arm1026_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm1026_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm1026_switch_mm)
 #ifdef CONFIG_MMU
 	mov	r1, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
@@ -374,14 +378,15 @@ ENTRY(cpu_arm1026_switch_mm)
 	mcr	p15, 0, r1, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
-        
+SYM_FUNC_END(cpu_arm1026_switch_mm)
+
 /*
  * cpu_arm1026_set_pte_ext(ptep, pte, ext)
  *
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm1026_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm1026_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -390,6 +395,7 @@ ENTRY(cpu_arm1026_set_pte_ext)
 #endif
 #endif /* CONFIG_MMU */
 	ret	lr
+SYM_FUNC_END(cpu_arm1026_set_pte_ext)
 
 	.type	__arm1026_setup, #function
 __arm1026_setup:
diff --git a/arch/arm/mm/proc-arm720.S b/arch/arm/mm/proc-arm720.S
index 3b687e6dd9fd..59732c334e1d 100644
--- a/arch/arm/mm/proc-arm720.S
+++ b/arch/arm/mm/proc-arm720.S
@@ -20,6 +20,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -35,24 +36,30 @@
  *
  * Notes   : This processor does not require these
  */
-ENTRY(cpu_arm720_dcache_clean_area)
-ENTRY(cpu_arm720_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm720_dcache_clean_area)
 		ret	lr
+SYM_FUNC_END(cpu_arm720_dcache_clean_area)
 
-ENTRY(cpu_arm720_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm720_proc_init)
+		ret	lr
+SYM_FUNC_END(cpu_arm720_proc_init)
+
+SYM_TYPED_FUNC_START(cpu_arm720_proc_fin)
 		mrc	p15, 0, r0, c1, c0, 0
 		bic	r0, r0, #0x1000			@ ...i............
 		bic	r0, r0, #0x000e			@ ............wca.
 		mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 		ret	lr
+SYM_FUNC_END(cpu_arm720_proc_fin)
 
 /*
  * Function: arm720_proc_do_idle(void)
  * Params  : r0 = unused
  * Purpose : put the processor in proper idle mode
  */
-ENTRY(cpu_arm720_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm720_do_idle)
 		ret	lr
+SYM_FUNC_END(cpu_arm720_do_idle)
 
 /*
  * Function: arm720_switch_mm(unsigned long pgd_phys)
@@ -60,7 +67,7 @@ ENTRY(cpu_arm720_do_idle)
  * Purpose : Perform a task switch, saving the old process' state and restoring
  *	     the new.
  */
-ENTRY(cpu_arm720_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm720_switch_mm)
 #ifdef CONFIG_MMU
 		mov	r1, #0
 		mcr	p15, 0, r1, c7, c7, 0		@ invalidate cache
@@ -68,6 +75,7 @@ ENTRY(cpu_arm720_switch_mm)
 		mcr	p15, 0, r1, c8, c7, 0		@ flush TLB (v4)
 #endif
 		ret	lr
+SYM_FUNC_END(cpu_arm720_switch_mm)
 
 /*
  * Function: arm720_set_pte_ext(pte_t *ptep, pte_t pte, unsigned int ext)
@@ -76,11 +84,12 @@ ENTRY(cpu_arm720_switch_mm)
  * Purpose : Set a PTE and flush it out of any WB cache
  */
 	.align	5
-ENTRY(cpu_arm720_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm720_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext wc_disable=0
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm720_set_pte_ext)
 
 /*
  * Function: arm720_reset
@@ -88,7 +97,7 @@ ENTRY(cpu_arm720_set_pte_ext)
  * Notes   : This sets up everything for a reset
  */
 		.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm720_reset)
+SYM_TYPED_FUNC_START(cpu_arm720_reset)
 		mov	ip, #0
 		mcr	p15, 0, ip, c7, c7, 0		@ invalidate cache
 #ifdef CONFIG_MMU
@@ -99,7 +108,7 @@ ENTRY(cpu_arm720_reset)
 		bic	ip, ip, #0x2100			@ ..v....s........
 		mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 		ret	r0
-ENDPROC(cpu_arm720_reset)
+SYM_FUNC_END(cpu_arm720_reset)
 		.popsection
 
 	.type	__arm710_setup, #function
diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S
index f2ec3bc60874..78854df63964 100644
--- a/arch/arm/mm/proc-arm740.S
+++ b/arch/arm/mm/proc-arm740.S
@@ -6,6 +6,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -24,21 +25,32 @@
  *
  * These are not required.
  */
-ENTRY(cpu_arm740_proc_init)
-ENTRY(cpu_arm740_do_idle)
-ENTRY(cpu_arm740_dcache_clean_area)
-ENTRY(cpu_arm740_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm740_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm740_proc_init)
+
+SYM_TYPED_FUNC_START(cpu_arm740_do_idle)
+	ret	lr
+SYM_FUNC_END(cpu_arm740_do_idle)
+
+SYM_TYPED_FUNC_START(cpu_arm740_dcache_clean_area)
+	ret	lr
+SYM_FUNC_END(cpu_arm740_dcache_clean_area)
+
+SYM_TYPED_FUNC_START(cpu_arm740_switch_mm)
+	ret	lr
+SYM_FUNC_END(cpu_arm740_switch_mm)
 
 /*
  * cpu_arm740_proc_fin()
  */
-ENTRY(cpu_arm740_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm740_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0
 	bic	r0, r0, #0x3f000000		@ bank/f/lock/s
 	bic	r0, r0, #0x0000000c		@ w-buffer/cache
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm740_proc_fin)
 
 /*
  * cpu_arm740_reset(loc)
@@ -46,14 +58,14 @@ ENTRY(cpu_arm740_proc_fin)
  * Notes   : This sets up everything for a reset
  */
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm740_reset)
+SYM_TYPED_FUNC_START(cpu_arm740_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c0, 0		@ invalidate cache
 	mrc	p15, 0, ip, c1, c0, 0		@ get ctrl register
 	bic	ip, ip, #0x0000000c		@ ............wc..
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm740_reset)
+SYM_FUNC_END(cpu_arm740_reset)
 	.popsection
 
 	.type	__arm740_setup, #function
diff --git a/arch/arm/mm/proc-arm7tdmi.S b/arch/arm/mm/proc-arm7tdmi.S
index 01bbe7576c1c..baa3d4472147 100644
--- a/arch/arm/mm/proc-arm7tdmi.S
+++ b/arch/arm/mm/proc-arm7tdmi.S
@@ -6,6 +6,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -23,18 +24,29 @@
  * cpu_arm7tdmi_switch_mm()
  *
  * These are not required.
- */
-ENTRY(cpu_arm7tdmi_proc_init)
-ENTRY(cpu_arm7tdmi_do_idle)
-ENTRY(cpu_arm7tdmi_dcache_clean_area)
-ENTRY(cpu_arm7tdmi_switch_mm)
-		ret	lr
+*/
+SYM_TYPED_FUNC_START(cpu_arm7tdmi_proc_init)
+	ret lr
+SYM_FUNC_END(cpu_arm7tdmi_proc_init)
+
+SYM_TYPED_FUNC_START(cpu_arm7tdmi_do_idle)
+	ret lr
+SYM_FUNC_END(cpu_arm7tdmi_do_idle)
+
+SYM_TYPED_FUNC_START(cpu_arm7tdmi_dcache_clean_area)
+	ret lr
+SYM_FUNC_END(cpu_arm7tdmi_dcache_clean_area)
+
+SYM_TYPED_FUNC_START(cpu_arm7tdmi_switch_mm)
+	ret	lr
+SYM_FUNC_END(cpu_arm7tdmi_switch_mm)
 
 /*
  * cpu_arm7tdmi_proc_fin()
- */
-ENTRY(cpu_arm7tdmi_proc_fin)
-		ret	lr
+*/
+SYM_TYPED_FUNC_START(cpu_arm7tdmi_proc_fin)
+	ret	lr
+SYM_FUNC_END(cpu_arm7tdmi_proc_fin)
 
 /*
  * Function: cpu_arm7tdmi_reset(loc)
@@ -42,9 +54,9 @@ ENTRY(cpu_arm7tdmi_proc_fin)
  * Purpose : Sets up everything for a reset and jump to the location for soft reset.
  */
 		.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm7tdmi_reset)
+SYM_TYPED_FUNC_START(cpu_arm7tdmi_reset)
 		ret	r0
-ENDPROC(cpu_arm7tdmi_reset)
+SYM_FUNC_END(cpu_arm7tdmi_reset)
 		.popsection
 
 		.type	__arm7tdmi_setup, #function
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index 08a5bac0d89d..a1eec82070e5 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -49,18 +49,20 @@
 /*
  * cpu_arm920_proc_init()
  */
-ENTRY(cpu_arm920_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm920_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm920_proc_init)
 
 /*
  * cpu_arm920_proc_fin()
  */
-ENTRY(cpu_arm920_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm920_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm920_proc_fin)
 
 /*
  * cpu_arm920_reset(loc)
@@ -73,7 +75,7 @@ ENTRY(cpu_arm920_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm920_reset)
+SYM_TYPED_FUNC_START(cpu_arm920_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -85,17 +87,17 @@ ENTRY(cpu_arm920_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm920_reset)
+SYM_FUNC_END(cpu_arm920_reset)
 	.popsection
 
 /*
  * cpu_arm920_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm920_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm920_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
-
+SYM_FUNC_END(cpu_arm920_do_idle)
 
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 
@@ -312,12 +314,13 @@ SYM_FUNC_END(arm920_dma_unmap_area)
 #endif /* !CONFIG_CPU_DCACHE_WRITETHROUGH */
 
 
-ENTRY(cpu_arm920_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm920_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
 	subs	r1, r1, #CACHE_DLINESIZE
 	bhi	1b
 	ret	lr
+SYM_FUNC_END(cpu_arm920_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -329,7 +332,7 @@ ENTRY(cpu_arm920_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm920_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm920_switch_mm)
 #ifdef CONFIG_MMU
 	mov	ip, #0
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -353,6 +356,7 @@ ENTRY(cpu_arm920_switch_mm)
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm920_switch_mm)
 
 /*
  * cpu_arm920_set_pte(ptep, pte, ext)
@@ -360,7 +364,7 @@ ENTRY(cpu_arm920_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm920_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm920_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -368,21 +372,22 @@ ENTRY(cpu_arm920_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm920_set_pte_ext)
 
 /* Suspend/resume support: taken from arch/arm/plat-s3c24xx/sleep.S */
 .globl	cpu_arm920_suspend_size
 .equ	cpu_arm920_suspend_size, 4 * 3
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_arm920_do_suspend)
+SYM_TYPED_FUNC_START(cpu_arm920_do_suspend)
 	stmfd	sp!, {r4 - r6, lr}
 	mrc	p15, 0, r4, c13, c0, 0	@ PID
 	mrc	p15, 0, r5, c3, c0, 0	@ Domain ID
 	mrc	p15, 0, r6, c1, c0, 0	@ Control register
 	stmia	r0, {r4 - r6}
 	ldmfd	sp!, {r4 - r6, pc}
-ENDPROC(cpu_arm920_do_suspend)
+SYM_FUNC_END(cpu_arm920_do_suspend)
 
-ENTRY(cpu_arm920_do_resume)
+SYM_TYPED_FUNC_START(cpu_arm920_do_resume)
 	mov	ip, #0
 	mcr	p15, 0, ip, c8, c7, 0	@ invalidate I+D TLBs
 	mcr	p15, 0, ip, c7, c7, 0	@ invalidate I+D caches
@@ -392,7 +397,7 @@ ENTRY(cpu_arm920_do_resume)
 	mcr	p15, 0, r1, c2, c0, 0	@ TTB address
 	mov	r0, r6			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_arm920_do_resume)
+SYM_FUNC_END(cpu_arm920_do_resume)
 #endif
 
 	.type	__arm920_setup, #function
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 8bcc0b913ba0..aeafac5143f6 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -51,18 +51,20 @@
 /*
  * cpu_arm922_proc_init()
  */
-ENTRY(cpu_arm922_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm922_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm922_proc_init)
 
 /*
  * cpu_arm922_proc_fin()
  */
-ENTRY(cpu_arm922_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm922_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm922_proc_fin)
 
 /*
  * cpu_arm922_reset(loc)
@@ -75,7 +77,7 @@ ENTRY(cpu_arm922_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm922_reset)
+SYM_TYPED_FUNC_START(cpu_arm922_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -87,17 +89,17 @@ ENTRY(cpu_arm922_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm922_reset)
+SYM_FUNC_END(cpu_arm922_reset)
 	.popsection
 
 /*
  * cpu_arm922_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm922_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm922_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
-
+SYM_FUNC_END(cpu_arm922_do_idle)
 
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 
@@ -313,7 +315,7 @@ SYM_FUNC_END(arm922_dma_unmap_area)
 
 #endif /* !CONFIG_CPU_DCACHE_WRITETHROUGH */
 
-ENTRY(cpu_arm922_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm922_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -321,6 +323,7 @@ ENTRY(cpu_arm922_dcache_clean_area)
 	bhi	1b
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm922_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -332,7 +335,7 @@ ENTRY(cpu_arm922_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm922_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm922_switch_mm)
 #ifdef CONFIG_MMU
 	mov	ip, #0
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -356,6 +359,7 @@ ENTRY(cpu_arm922_switch_mm)
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm922_switch_mm)
 
 /*
  * cpu_arm922_set_pte_ext(ptep, pte, ext)
@@ -363,7 +367,7 @@ ENTRY(cpu_arm922_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm922_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm922_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -371,6 +375,7 @@ ENTRY(cpu_arm922_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif /* CONFIG_MMU */
 	ret	lr
+SYM_FUNC_END(cpu_arm922_set_pte_ext)
 
 	.type	__arm922_setup, #function
 __arm922_setup:
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index d0d87f9705d3..191f4fa606c7 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -72,18 +72,20 @@
 /*
  * cpu_arm925_proc_init()
  */
-ENTRY(cpu_arm925_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm925_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm925_proc_init)
 
 /*
  * cpu_arm925_proc_fin()
  */
-ENTRY(cpu_arm925_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm925_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm925_proc_fin)
 
 /*
  * cpu_arm925_reset(loc)
@@ -96,14 +98,14 @@ ENTRY(cpu_arm925_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm925_reset)
+SYM_TYPED_FUNC_START(cpu_arm925_reset)
 	/* Send software reset to MPU and DSP */
 	mov	ip, #0xff000000
 	orr	ip, ip, #0x00fe0000
 	orr	ip, ip, #0x0000ce00
 	mov	r4, #1
 	strh	r4, [ip, #0x10]
-ENDPROC(cpu_arm925_reset)
+SYM_FUNC_END(cpu_arm925_reset)
 	.popsection
 
 	mov	ip, #0
@@ -124,7 +126,7 @@ ENDPROC(cpu_arm925_reset)
  * Called with IRQs disabled
  */
 	.align	10
-ENTRY(cpu_arm925_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm925_do_idle)
 	mov	r0, #0
 	mrc	p15, 0, r1, c1, c0, 0		@ Read control register
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain write buffer
@@ -133,6 +135,7 @@ ENTRY(cpu_arm925_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	mcr	p15, 0, r1, c1, c0, 0		@ Restore ICache enable
 	ret	lr
+SYM_FUNC_END(cpu_arm925_do_idle)
 
 /*
  *	flush_icache_all()
@@ -366,7 +369,7 @@ SYM_TYPED_FUNC_START(arm925_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm925_dma_unmap_area)
 
-ENTRY(cpu_arm925_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm925_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -375,6 +378,7 @@ ENTRY(cpu_arm925_dcache_clean_area)
 #endif
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_arm925_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -386,7 +390,7 @@ ENTRY(cpu_arm925_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm925_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm925_switch_mm)
 #ifdef CONFIG_MMU
 	mov	ip, #0
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -404,6 +408,7 @@ ENTRY(cpu_arm925_switch_mm)
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm925_switch_mm)
 
 /*
  * cpu_arm925_set_pte_ext(ptep, pte, ext)
@@ -411,7 +416,7 @@ ENTRY(cpu_arm925_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm925_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm925_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -421,6 +426,7 @@ ENTRY(cpu_arm925_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif /* CONFIG_MMU */
 	ret	lr
+SYM_FUNC_END(cpu_arm925_set_pte_ext)
 
 	.type	__arm925_setup, #function
 __arm925_setup:
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 6cb98b7a0fee..3bf1d4072283 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -41,18 +41,20 @@
 /*
  * cpu_arm926_proc_init()
  */
-ENTRY(cpu_arm926_proc_init)
+SYM_TYPED_FUNC_START(cpu_arm926_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm926_proc_init)
 
 /*
  * cpu_arm926_proc_fin()
  */
-ENTRY(cpu_arm926_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm926_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm926_proc_fin)
 
 /*
  * cpu_arm926_reset(loc)
@@ -65,7 +67,7 @@ ENTRY(cpu_arm926_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm926_reset)
+SYM_TYPED_FUNC_START(cpu_arm926_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -77,7 +79,7 @@ ENTRY(cpu_arm926_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm926_reset)
+SYM_FUNC_END(cpu_arm926_reset)
 	.popsection
 
 /*
@@ -86,7 +88,7 @@ ENDPROC(cpu_arm926_reset)
  * Called with IRQs disabled
  */
 	.align	10
-ENTRY(cpu_arm926_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm926_do_idle)
 	mov	r0, #0
 	mrc	p15, 0, r1, c1, c0, 0		@ Read control register
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain write buffer
@@ -99,6 +101,7 @@ ENTRY(cpu_arm926_do_idle)
 	mcr	p15, 0, r1, c1, c0, 0		@ Restore ICache enable
 	msr	cpsr_c, r3			@ Restore FIQ state
 	ret	lr
+SYM_FUNC_END(cpu_arm926_do_idle)
 
 /*
  *	flush_icache_all()
@@ -329,7 +332,7 @@ SYM_TYPED_FUNC_START(arm926_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm926_dma_unmap_area)
 
-ENTRY(cpu_arm926_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm926_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -338,6 +341,7 @@ ENTRY(cpu_arm926_dcache_clean_area)
 #endif
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_arm926_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -349,7 +353,8 @@ ENTRY(cpu_arm926_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_arm926_switch_mm)
+
+SYM_TYPED_FUNC_START(cpu_arm926_switch_mm)
 #ifdef CONFIG_MMU
 	mov	ip, #0
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -365,6 +370,7 @@ ENTRY(cpu_arm926_switch_mm)
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm926_switch_mm)
 
 /*
  * cpu_arm926_set_pte_ext(ptep, pte, ext)
@@ -372,7 +378,7 @@ ENTRY(cpu_arm926_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_arm926_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_arm926_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -382,21 +388,22 @@ ENTRY(cpu_arm926_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_arm926_set_pte_ext)
 
 /* Suspend/resume support: taken from arch/arm/plat-s3c24xx/sleep.S */
 .globl	cpu_arm926_suspend_size
 .equ	cpu_arm926_suspend_size, 4 * 3
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_arm926_do_suspend)
+SYM_TYPED_FUNC_START(cpu_arm926_do_suspend)
 	stmfd	sp!, {r4 - r6, lr}
 	mrc	p15, 0, r4, c13, c0, 0	@ PID
 	mrc	p15, 0, r5, c3, c0, 0	@ Domain ID
 	mrc	p15, 0, r6, c1, c0, 0	@ Control register
 	stmia	r0, {r4 - r6}
 	ldmfd	sp!, {r4 - r6, pc}
-ENDPROC(cpu_arm926_do_suspend)
+SYM_FUNC_END(cpu_arm926_do_suspend)
 
-ENTRY(cpu_arm926_do_resume)
+SYM_TYPED_FUNC_START(cpu_arm926_do_resume)
 	mov	ip, #0
 	mcr	p15, 0, ip, c8, c7, 0	@ invalidate I+D TLBs
 	mcr	p15, 0, ip, c7, c7, 0	@ invalidate I+D caches
@@ -406,7 +413,7 @@ ENTRY(cpu_arm926_do_resume)
 	mcr	p15, 0, r1, c2, c0, 0	@ TTB address
 	mov	r0, r6			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_arm926_do_resume)
+SYM_FUNC_END(cpu_arm926_do_resume)
 #endif
 
 	.type	__arm926_setup, #function
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 527f1c044683..cd95fca4656f 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -26,19 +26,24 @@
  *
  * These are not required.
  */
-ENTRY(cpu_arm940_proc_init)
-ENTRY(cpu_arm940_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm940_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm940_proc_init)
+
+SYM_TYPED_FUNC_START(cpu_arm940_switch_mm)
+	ret	lr
+SYM_FUNC_END(cpu_arm940_switch_mm)
 
 /*
  * cpu_arm940_proc_fin()
  */
-ENTRY(cpu_arm940_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm940_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x00001000		@ i-cache
 	bic	r0, r0, #0x00000004		@ d-cache
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm940_proc_fin)
 
 /*
  * cpu_arm940_reset(loc)
@@ -46,7 +51,7 @@ ENTRY(cpu_arm940_proc_fin)
  * Notes   : This sets up everything for a reset
  */
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm940_reset)
+SYM_TYPED_FUNC_START(cpu_arm940_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c5, 0		@ flush I cache
 	mcr	p15, 0, ip, c7, c6, 0		@ flush D cache
@@ -56,16 +61,17 @@ ENTRY(cpu_arm940_reset)
 	bic	ip, ip, #0x00001000		@ i-cache
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm940_reset)
+SYM_FUNC_END(cpu_arm940_reset)
 	.popsection
 
 /*
  * cpu_arm940_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm940_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm940_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_arm940_do_idle)
 
 /*
  *	flush_icache_all()
@@ -202,7 +208,7 @@ arm940_dma_inv_range:
  *	- end	- virtual end address
  */
 arm940_dma_clean_range:
-ENTRY(cpu_arm940_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm940_dcache_clean_area)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 	mov	r1, #(CACHE_DSEGMENTS - 1) << 4	@ 4 segments
@@ -215,6 +221,7 @@ ENTRY(cpu_arm940_dcache_clean_area)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_arm940_dcache_clean_area)
 
 /*
  *	dma_flush_range(start, end)
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 3155e819ae5f..7df7c6e5598a 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -33,19 +33,24 @@
  *
  * These are not required.
  */
-ENTRY(cpu_arm946_proc_init)
-ENTRY(cpu_arm946_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm946_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_arm946_proc_init)
+
+SYM_TYPED_FUNC_START(cpu_arm946_switch_mm)
+	ret	lr
+SYM_FUNC_END(cpu_arm946_switch_mm)
 
 /*
  * cpu_arm946_proc_fin()
  */
-ENTRY(cpu_arm946_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm946_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x00001000		@ i-cache
 	bic	r0, r0, #0x00000004		@ d-cache
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_arm946_proc_fin)
 
 /*
  * cpu_arm946_reset(loc)
@@ -53,7 +58,7 @@ ENTRY(cpu_arm946_proc_fin)
  * Notes   : This sets up everything for a reset
  */
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm946_reset)
+SYM_TYPED_FUNC_START(cpu_arm946_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c5, 0		@ flush I cache
 	mcr	p15, 0, ip, c7, c6, 0		@ flush D cache
@@ -63,16 +68,17 @@ ENTRY(cpu_arm946_reset)
 	bic	ip, ip, #0x00001000		@ i-cache
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_arm946_reset)
+SYM_FUNC_END(cpu_arm946_reset)
 	.popsection
 
 /*
  * cpu_arm946_do_idle()
  */
 	.align	5
-ENTRY(cpu_arm946_do_idle)
+SYM_TYPED_FUNC_START(cpu_arm946_do_idle)
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_arm946_do_idle)
 
 /*
  *	flush_icache_all()
@@ -310,7 +316,7 @@ SYM_TYPED_FUNC_START(arm946_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm946_dma_unmap_area)
 
-ENTRY(cpu_arm946_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_arm946_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -319,6 +325,7 @@ ENTRY(cpu_arm946_dcache_clean_area)
 #endif
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_arm946_dcache_clean_area)
 
 	.type	__arm946_setup, #function
 __arm946_setup:
diff --git a/arch/arm/mm/proc-arm9tdmi.S b/arch/arm/mm/proc-arm9tdmi.S
index a054c0e9c034..c480a8400eff 100644
--- a/arch/arm/mm/proc-arm9tdmi.S
+++ b/arch/arm/mm/proc-arm9tdmi.S
@@ -6,6 +6,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -24,17 +25,28 @@
  *
  * These are not required.
  */
-ENTRY(cpu_arm9tdmi_proc_init)
-ENTRY(cpu_arm9tdmi_do_idle)
-ENTRY(cpu_arm9tdmi_dcache_clean_area)
-ENTRY(cpu_arm9tdmi_switch_mm)
+SYM_TYPED_FUNC_START(cpu_arm9tdmi_proc_init)
 		ret	lr
+SYM_FUNC_END(cpu_arm9tdmi_proc_init)
+
+SYM_TYPED_FUNC_START(cpu_arm9tdmi_do_idle)
+		ret	lr
+SYM_FUNC_END(cpu_arm9tdmi_do_idle)
+
+SYM_TYPED_FUNC_START(cpu_arm9tdmi_dcache_clean_area)
+		ret	lr
+SYM_FUNC_END(cpu_arm9tdmi_dcache_clean_area)
+
+SYM_TYPED_FUNC_START(cpu_arm9tdmi_switch_mm)
+		ret	lr
+SYM_FUNC_END(cpu_arm9tdmi_switch_mm)
 
 /*
  * cpu_arm9tdmi_proc_fin()
  */
-ENTRY(cpu_arm9tdmi_proc_fin)
+SYM_TYPED_FUNC_START(cpu_arm9tdmi_proc_fin)
 		ret	lr
+SYM_FUNC_END(cpu_arm9tdmi_proc_fin)
 
 /*
  * Function: cpu_arm9tdmi_reset(loc)
@@ -42,9 +54,9 @@ ENTRY(cpu_arm9tdmi_proc_fin)
  * Purpose : Sets up everything for a reset and jump to the location for soft reset.
  */
 		.pushsection	.idmap.text, "ax"
-ENTRY(cpu_arm9tdmi_reset)
+SYM_TYPED_FUNC_START(cpu_arm9tdmi_reset)
 		ret	r0
-ENDPROC(cpu_arm9tdmi_reset)
+SYM_FUNC_END(cpu_arm9tdmi_reset)
 		.popsection
 
 		.type	__arm9tdmi_setup, #function
diff --git a/arch/arm/mm/proc-fa526.S b/arch/arm/mm/proc-fa526.S
index 2c73e0d47d08..7c16ccac8a05 100644
--- a/arch/arm/mm/proc-fa526.S
+++ b/arch/arm/mm/proc-fa526.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -26,13 +27,14 @@
 /*
  * cpu_fa526_proc_init()
  */
-ENTRY(cpu_fa526_proc_init)
+SYM_TYPED_FUNC_START(cpu_fa526_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_fa526_proc_init)
 
 /*
  * cpu_fa526_proc_fin()
  */
-ENTRY(cpu_fa526_proc_fin)
+SYM_TYPED_FUNC_START(cpu_fa526_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x000e			@ ............wca.
@@ -40,6 +42,7 @@ ENTRY(cpu_fa526_proc_fin)
 	nop
 	nop
 	ret	lr
+SYM_FUNC_END(cpu_fa526_proc_fin)
 
 /*
  * cpu_fa526_reset(loc)
@@ -52,7 +55,7 @@ ENTRY(cpu_fa526_proc_fin)
  */
 	.align	4
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_fa526_reset)
+SYM_TYPED_FUNC_START(cpu_fa526_reset)
 /* TODO: Use CP8 if possible... */
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
@@ -68,24 +71,25 @@ ENTRY(cpu_fa526_reset)
 	nop
 	nop
 	ret	r0
-ENDPROC(cpu_fa526_reset)
+SYM_FUNC_END(cpu_fa526_reset)
 	.popsection
 
 /*
  * cpu_fa526_do_idle()
  */
 	.align	4
-ENTRY(cpu_fa526_do_idle)
+SYM_TYPED_FUNC_START(cpu_fa526_do_idle)
 	ret	lr
+SYM_FUNC_END(cpu_fa526_do_idle)
 
-
-ENTRY(cpu_fa526_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_fa526_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
 	subs	r1, r1, #CACHE_DLINESIZE
 	bhi	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_fa526_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -97,7 +101,7 @@ ENTRY(cpu_fa526_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	4
-ENTRY(cpu_fa526_switch_mm)
+SYM_TYPED_FUNC_START(cpu_fa526_switch_mm)
 #ifdef CONFIG_MMU
 	mov	ip, #0
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -113,6 +117,7 @@ ENTRY(cpu_fa526_switch_mm)
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate UTLB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_fa526_switch_mm)
 
 /*
  * cpu_fa526_set_pte_ext(ptep, pte, ext)
@@ -120,7 +125,7 @@ ENTRY(cpu_fa526_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	4
-ENTRY(cpu_fa526_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_fa526_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -129,6 +134,7 @@ ENTRY(cpu_fa526_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_fa526_set_pte_ext)
 
 	.type	__fa526_setup, #function
 __fa526_setup:
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index af9482b07a4f..4c70eb0cc0d5 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -44,7 +44,7 @@ __cache_params:
 /*
  * cpu_feroceon_proc_init()
  */
-ENTRY(cpu_feroceon_proc_init)
+SYM_TYPED_FUNC_START(cpu_feroceon_proc_init)
 	mrc	p15, 0, r0, c0, c0, 1		@ read cache type register
 	ldr	r1, __cache_params
 	mov	r2, #(16 << 5)
@@ -62,11 +62,12 @@ ENTRY(cpu_feroceon_proc_init)
 	str_l	r1, VFP_arch_feroceon, r2
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_feroceon_proc_init)
 
 /*
  * cpu_feroceon_proc_fin()
  */
-ENTRY(cpu_feroceon_proc_fin)
+SYM_TYPED_FUNC_START(cpu_feroceon_proc_fin)
 #if defined(CONFIG_CACHE_FEROCEON_L2) && \
 	!defined(CONFIG_CACHE_FEROCEON_L2_WRITETHROUGH)
 	mov	r0, #0
@@ -79,6 +80,7 @@ ENTRY(cpu_feroceon_proc_fin)
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_feroceon_proc_fin)
 
 /*
  * cpu_feroceon_reset(loc)
@@ -91,7 +93,7 @@ ENTRY(cpu_feroceon_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_feroceon_reset)
+SYM_TYPED_FUNC_START(cpu_feroceon_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -103,7 +105,7 @@ ENTRY(cpu_feroceon_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_feroceon_reset)
+SYM_FUNC_END(cpu_feroceon_reset)
 	.popsection
 
 /*
@@ -112,11 +114,12 @@ ENDPROC(cpu_feroceon_reset)
  * Called with IRQs disabled
  */
 	.align	5
-ENTRY(cpu_feroceon_do_idle)
+SYM_TYPED_FUNC_START(cpu_feroceon_do_idle)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain write buffer
 	mcr	p15, 0, r0, c7, c0, 4		@ Wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_feroceon_do_idle)
 
 /*
  *	flush_icache_all()
@@ -413,7 +416,7 @@ SYM_TYPED_FUNC_START(feroceon_dma_unmap_area)
 SYM_FUNC_END(feroceon_dma_unmap_area)
 
 	.align	5
-ENTRY(cpu_feroceon_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_feroceon_dcache_clean_area)
 #if defined(CONFIG_CACHE_FEROCEON_L2) && \
 	!defined(CONFIG_CACHE_FEROCEON_L2_WRITETHROUGH)
 	mov	r2, r0
@@ -432,6 +435,7 @@ ENTRY(cpu_feroceon_dcache_clean_area)
 #endif
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_feroceon_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -443,7 +447,7 @@ ENTRY(cpu_feroceon_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_feroceon_switch_mm)
+SYM_TYPED_FUNC_START(cpu_feroceon_switch_mm)
 #ifdef CONFIG_MMU
 	/*
 	 * Note: we wish to call __flush_whole_cache but we need to preserve
@@ -464,6 +468,7 @@ ENTRY(cpu_feroceon_switch_mm)
 #else
 	ret	lr
 #endif
+SYM_FUNC_END(cpu_feroceon_switch_mm)
 
 /*
  * cpu_feroceon_set_pte_ext(ptep, pte, ext)
@@ -471,7 +476,7 @@ ENTRY(cpu_feroceon_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_feroceon_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_feroceon_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext wc_disable=0
 	mov	r0, r0
@@ -483,21 +488,22 @@ ENTRY(cpu_feroceon_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_feroceon_set_pte_ext)
 
 /* Suspend/resume support: taken from arch/arm/mm/proc-arm926.S */
 .globl	cpu_feroceon_suspend_size
 .equ	cpu_feroceon_suspend_size, 4 * 3
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_feroceon_do_suspend)
+SYM_TYPED_FUNC_START(cpu_feroceon_do_suspend)
 	stmfd	sp!, {r4 - r6, lr}
 	mrc	p15, 0, r4, c13, c0, 0	@ PID
 	mrc	p15, 0, r5, c3, c0, 0	@ Domain ID
 	mrc	p15, 0, r6, c1, c0, 0	@ Control register
 	stmia	r0, {r4 - r6}
 	ldmfd	sp!, {r4 - r6, pc}
-ENDPROC(cpu_feroceon_do_suspend)
+SYM_FUNC_END(cpu_feroceon_do_suspend)
 
-ENTRY(cpu_feroceon_do_resume)
+SYM_TYPED_FUNC_START(cpu_feroceon_do_resume)
 	mov	ip, #0
 	mcr	p15, 0, ip, c8, c7, 0	@ invalidate I+D TLBs
 	mcr	p15, 0, ip, c7, c7, 0	@ invalidate I+D caches
@@ -507,7 +513,7 @@ ENTRY(cpu_feroceon_do_resume)
 	mcr	p15, 0, r1, c2, c0, 0	@ TTB address
 	mov	r0, r6			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_feroceon_do_resume)
+SYM_FUNC_END(cpu_feroceon_do_resume)
 #endif
 
 	.type	__feroceon_setup, #function
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index be3a1a997838..6871395958ce 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -32,18 +32,20 @@
 /*
  * cpu_mohawk_proc_init()
  */
-ENTRY(cpu_mohawk_proc_init)
+SYM_TYPED_FUNC_START(cpu_mohawk_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_mohawk_proc_init)
 
 /*
  * cpu_mohawk_proc_fin()
  */
-ENTRY(cpu_mohawk_proc_fin)
+SYM_TYPED_FUNC_START(cpu_mohawk_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1800			@ ...iz...........
 	bic	r0, r0, #0x0006			@ .............ca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_mohawk_proc_fin)
 
 /*
  * cpu_mohawk_reset(loc)
@@ -58,7 +60,7 @@ ENTRY(cpu_mohawk_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_mohawk_reset)
+SYM_TYPED_FUNC_START(cpu_mohawk_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -68,7 +70,7 @@ ENTRY(cpu_mohawk_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_mohawk_reset)
+SYM_FUNC_END(cpu_mohawk_reset)
 	.popsection
 
 /*
@@ -77,11 +79,12 @@ ENDPROC(cpu_mohawk_reset)
  * Called with IRQs disabled
  */
 	.align	5
-ENTRY(cpu_mohawk_do_idle)
+SYM_TYPED_FUNC_START(cpu_mohawk_do_idle)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	mcr	p15, 0, r0, c7, c0, 4		@ wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_mohawk_do_idle)
 
 /*
  *	flush_icache_all()
@@ -294,13 +297,14 @@ SYM_TYPED_FUNC_START(mohawk_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(mohawk_dma_unmap_area)
 
-ENTRY(cpu_mohawk_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_mohawk_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
 	subs	r1, r1, #CACHE_DLINESIZE
 	bhi	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(cpu_mohawk_dcache_clean_area)
 
 /*
  * cpu_mohawk_switch_mm(pgd)
@@ -310,7 +314,7 @@ ENTRY(cpu_mohawk_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_mohawk_switch_mm)
+SYM_TYPED_FUNC_START(cpu_mohawk_switch_mm)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c14, 0		@ clean & invalidate all D cache
 	mcr	p15, 0, ip, c7, c5, 0		@ invalidate I cache
@@ -319,6 +323,7 @@ ENTRY(cpu_mohawk_switch_mm)
 	mcr	p15, 0, r0, c2, c0, 0		@ load page table pointer
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 	ret	lr
+SYM_FUNC_END(cpu_mohawk_switch_mm)
 
 /*
  * cpu_mohawk_set_pte_ext(ptep, pte, ext)
@@ -326,7 +331,7 @@ ENTRY(cpu_mohawk_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_mohawk_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_mohawk_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext
 	mov	r0, r0
@@ -334,11 +339,12 @@ ENTRY(cpu_mohawk_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
 #endif
+SYM_FUNC_END(cpu_mohawk_set_pte_ext)
 
 .globl	cpu_mohawk_suspend_size
 .equ	cpu_mohawk_suspend_size, 4 * 6
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_mohawk_do_suspend)
+SYM_TYPED_FUNC_START(cpu_mohawk_do_suspend)
 	stmfd	sp!, {r4 - r9, lr}
 	mrc	p14, 0, r4, c6, c0, 0	@ clock configuration, for turbo mode
 	mrc	p15, 0, r5, c15, c1, 0	@ CP access reg
@@ -349,9 +355,9 @@ ENTRY(cpu_mohawk_do_suspend)
 	bic	r4, r4, #2		@ clear frequency change bit
 	stmia	r0, {r4 - r9}		@ store cp regs
 	ldmia	sp!, {r4 - r9, pc}
-ENDPROC(cpu_mohawk_do_suspend)
+SYM_FUNC_END(cpu_mohawk_do_suspend)
 
-ENTRY(cpu_mohawk_do_resume)
+SYM_TYPED_FUNC_START(cpu_mohawk_do_resume)
 	ldmia	r0, {r4 - r9}		@ load cp regs
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0	@ invalidate I & D caches, BTB
@@ -367,7 +373,7 @@ ENTRY(cpu_mohawk_do_resume)
 	mcr	p15, 0, r8, c1, c0, 1	@ auxiliary control reg
 	mov	r0, r9			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_mohawk_do_resume)
+SYM_FUNC_END(cpu_mohawk_do_resume)
 #endif
 
 	.type	__mohawk_setup, #function
diff --git a/arch/arm/mm/proc-sa110.S b/arch/arm/mm/proc-sa110.S
index 4071f7a61cb6..3da76fab8ac3 100644
--- a/arch/arm/mm/proc-sa110.S
+++ b/arch/arm/mm/proc-sa110.S
@@ -12,6 +12,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -32,15 +33,16 @@
 /*
  * cpu_sa110_proc_init()
  */
-ENTRY(cpu_sa110_proc_init)
+SYM_TYPED_FUNC_START(cpu_sa110_proc_init)
 	mov	r0, #0
 	mcr	p15, 0, r0, c15, c1, 2		@ Enable clock switching
 	ret	lr
+SYM_FUNC_END(cpu_sa110_proc_init)
 
 /*
  * cpu_sa110_proc_fin()
  */
-ENTRY(cpu_sa110_proc_fin)
+SYM_TYPED_FUNC_START(cpu_sa110_proc_fin)
 	mov	r0, #0
 	mcr	p15, 0, r0, c15, c2, 2		@ Disable clock switching
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
@@ -48,6 +50,7 @@ ENTRY(cpu_sa110_proc_fin)
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_sa110_proc_fin)
 
 /*
  * cpu_sa110_reset(loc)
@@ -60,7 +63,7 @@ ENTRY(cpu_sa110_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_sa110_reset)
+SYM_TYPED_FUNC_START(cpu_sa110_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -72,7 +75,7 @@ ENTRY(cpu_sa110_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_sa110_reset)
+SYM_FUNC_END(cpu_sa110_reset)
 	.popsection
 
 /*
@@ -88,7 +91,7 @@ ENDPROC(cpu_sa110_reset)
  */
 	.align	5
 
-ENTRY(cpu_sa110_do_idle)
+SYM_TYPED_FUNC_START(cpu_sa110_do_idle)
 	mcr	p15, 0, ip, c15, c2, 2		@ disable clock switching
 	ldr	r1, =UNCACHEABLE_ADDR		@ load from uncacheable loc
 	ldr	r1, [r1, #0]			@ force switch to MCLK
@@ -101,6 +104,7 @@ ENTRY(cpu_sa110_do_idle)
 	mov	r0, r0				@ safety
 	mcr	p15, 0, r0, c15, c1, 2		@ enable clock switching
 	ret	lr
+SYM_FUNC_END(cpu_sa110_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -113,12 +117,13 @@ ENTRY(cpu_sa110_do_idle)
  * addr: cache-unaligned virtual address
  */
 	.align	5
-ENTRY(cpu_sa110_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_sa110_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #DCACHELINESIZE
 	subs	r1, r1, #DCACHELINESIZE
 	bhi	1b
 	ret	lr
+SYM_FUNC_END(cpu_sa110_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -130,7 +135,7 @@ ENTRY(cpu_sa110_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_sa110_switch_mm)
+SYM_TYPED_FUNC_START(cpu_sa110_switch_mm)
 #ifdef CONFIG_MMU
 	str	lr, [sp, #-4]!
 	bl	v4wb_flush_kern_cache_all	@ clears IP
@@ -140,6 +145,7 @@ ENTRY(cpu_sa110_switch_mm)
 #else
 	ret	lr
 #endif
+SYM_FUNC_END(cpu_sa110_switch_mm)
 
 /*
  * cpu_sa110_set_pte_ext(ptep, pte, ext)
@@ -147,7 +153,7 @@ ENTRY(cpu_sa110_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_sa110_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_sa110_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext wc_disable=0
 	mov	r0, r0
@@ -155,6 +161,7 @@ ENTRY(cpu_sa110_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_sa110_set_pte_ext)
 
 	.type	__sa110_setup, #function
 __sa110_setup:
diff --git a/arch/arm/mm/proc-sa1100.S b/arch/arm/mm/proc-sa1100.S
index e723bd4119d3..7c496195e440 100644
--- a/arch/arm/mm/proc-sa1100.S
+++ b/arch/arm/mm/proc-sa1100.S
@@ -17,6 +17,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -36,11 +37,12 @@
 /*
  * cpu_sa1100_proc_init()
  */
-ENTRY(cpu_sa1100_proc_init)
+SYM_TYPED_FUNC_START(cpu_sa1100_proc_init)
 	mov	r0, #0
 	mcr	p15, 0, r0, c15, c1, 2		@ Enable clock switching
 	mcr	p15, 0, r0, c9, c0, 5		@ Allow read-buffer operations from userland
 	ret	lr
+SYM_FUNC_END(cpu_sa1100_proc_init)
 
 /*
  * cpu_sa1100_proc_fin()
@@ -49,13 +51,14 @@ ENTRY(cpu_sa1100_proc_init)
  *  - Disable interrupts
  *  - Clean and turn off caches.
  */
-ENTRY(cpu_sa1100_proc_fin)
+SYM_TYPED_FUNC_START(cpu_sa1100_proc_fin)
 	mcr	p15, 0, ip, c15, c2, 2		@ Disable clock switching
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x000e			@ ............wca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_sa1100_proc_fin)
 
 /*
  * cpu_sa1100_reset(loc)
@@ -68,7 +71,7 @@ ENTRY(cpu_sa1100_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_sa1100_reset)
+SYM_TYPED_FUNC_START(cpu_sa1100_reset)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ invalidate I,D caches
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
@@ -80,7 +83,7 @@ ENTRY(cpu_sa1100_reset)
 	bic	ip, ip, #0x1100			@ ...i...s........
 	mcr	p15, 0, ip, c1, c0, 0		@ ctrl register
 	ret	r0
-ENDPROC(cpu_sa1100_reset)
+SYM_FUNC_END(cpu_sa1100_reset)
 	.popsection
 
 /*
@@ -95,7 +98,7 @@ ENDPROC(cpu_sa1100_reset)
  *   3 = switch to fast processor clock
  */
 	.align	5
-ENTRY(cpu_sa1100_do_idle)
+SYM_TYPED_FUNC_START(cpu_sa1100_do_idle)
 	mov	r0, r0				@ 4 nop padding
 	mov	r0, r0
 	mov	r0, r0
@@ -111,6 +114,7 @@ ENTRY(cpu_sa1100_do_idle)
 	mov	r0, r0				@ safety
 	mcr	p15, 0, r0, c15, c1, 2		@ enable clock switching
 	ret	lr
+SYM_FUNC_END(cpu_sa1100_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -123,12 +127,13 @@ ENTRY(cpu_sa1100_do_idle)
  * addr: cache-unaligned virtual address
  */
 	.align	5
-ENTRY(cpu_sa1100_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_sa1100_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #DCACHELINESIZE
 	subs	r1, r1, #DCACHELINESIZE
 	bhi	1b
 	ret	lr
+SYM_FUNC_END(cpu_sa1100_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -140,7 +145,7 @@ ENTRY(cpu_sa1100_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_sa1100_switch_mm)
+SYM_TYPED_FUNC_START(cpu_sa1100_switch_mm)
 #ifdef CONFIG_MMU
 	str	lr, [sp, #-4]!
 	bl	v4wb_flush_kern_cache_all	@ clears IP
@@ -151,6 +156,7 @@ ENTRY(cpu_sa1100_switch_mm)
 #else
 	ret	lr
 #endif
+SYM_FUNC_END(cpu_sa1100_switch_mm)
 
 /*
  * cpu_sa1100_set_pte_ext(ptep, pte, ext)
@@ -158,7 +164,7 @@ ENTRY(cpu_sa1100_switch_mm)
  * Set a PTE and flush it out
  */
 	.align	5
-ENTRY(cpu_sa1100_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_sa1100_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv3_set_pte_ext wc_disable=0
 	mov	r0, r0
@@ -166,20 +172,21 @@ ENTRY(cpu_sa1100_set_pte_ext)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_sa1100_set_pte_ext)
 
 .globl	cpu_sa1100_suspend_size
 .equ	cpu_sa1100_suspend_size, 4 * 3
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_sa1100_do_suspend)
+SYM_TYPED_FUNC_START(cpu_sa1100_do_suspend)
 	stmfd	sp!, {r4 - r6, lr}
 	mrc	p15, 0, r4, c3, c0, 0		@ domain ID
 	mrc	p15, 0, r5, c13, c0, 0		@ PID
 	mrc	p15, 0, r6, c1, c0, 0		@ control reg
 	stmia	r0, {r4 - r6}			@ store cp regs
 	ldmfd	sp!, {r4 - r6, pc}
-ENDPROC(cpu_sa1100_do_suspend)
+SYM_FUNC_END(cpu_sa1100_do_suspend)
 
-ENTRY(cpu_sa1100_do_resume)
+SYM_TYPED_FUNC_START(cpu_sa1100_do_resume)
 	ldmia	r0, {r4 - r6}			@ load cp regs
 	mov	ip, #0
 	mcr	p15, 0, ip, c8, c7, 0		@ flush I+D TLBs
@@ -192,7 +199,7 @@ ENTRY(cpu_sa1100_do_resume)
 	mcr	p15, 0, r5, c13, c0, 0		@ PID
 	mov	r0, r6				@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_sa1100_do_resume)
+SYM_FUNC_END(cpu_sa1100_do_resume)
 #endif
 
 	.type	__sa1100_setup, #function
diff --git a/arch/arm/mm/proc-v6.S b/arch/arm/mm/proc-v6.S
index 203dff89ab1a..90a01f5950b9 100644
--- a/arch/arm/mm/proc-v6.S
+++ b/arch/arm/mm/proc-v6.S
@@ -8,6 +8,7 @@
  *  This is the "shell" of the ARMv6 processor support.
  */
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
@@ -34,15 +35,17 @@
 
 .arch armv6
 
-ENTRY(cpu_v6_proc_init)
+SYM_TYPED_FUNC_START(cpu_v6_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_v6_proc_init)
 
-ENTRY(cpu_v6_proc_fin)
+SYM_TYPED_FUNC_START(cpu_v6_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x0006			@ .............ca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_v6_proc_fin)
 
 /*
  *	cpu_v6_reset(loc)
@@ -55,14 +58,14 @@ ENTRY(cpu_v6_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_v6_reset)
+SYM_TYPED_FUNC_START(cpu_v6_reset)
 	mrc	p15, 0, r1, c1, c0, 0		@ ctrl register
 	bic	r1, r1, #0x1			@ ...............m
 	mcr	p15, 0, r1, c1, c0, 0		@ disable MMU
 	mov	r1, #0
 	mcr	p15, 0, r1, c7, c5, 4		@ ISB
 	ret	r0
-ENDPROC(cpu_v6_reset)
+SYM_FUNC_END(cpu_v6_reset)
 	.popsection
 
 /*
@@ -72,18 +75,20 @@ ENDPROC(cpu_v6_reset)
  *
  *	IRQs are already disabled.
  */
-ENTRY(cpu_v6_do_idle)
+SYM_TYPED_FUNC_START(cpu_v6_do_idle)
 	mov	r1, #0
 	mcr	p15, 0, r1, c7, c10, 4		@ DWB - WFI may enter a low-power mode
 	mcr	p15, 0, r1, c7, c0, 4		@ wait for interrupt
 	ret	lr
+SYM_FUNC_END(cpu_v6_do_idle)
 
-ENTRY(cpu_v6_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_v6_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #D_CACHE_LINE_SIZE
 	subs	r1, r1, #D_CACHE_LINE_SIZE
 	bhi	1b
 	ret	lr
+SYM_FUNC_END(cpu_v6_dcache_clean_area)
 
 /*
  *	cpu_v6_switch_mm(pgd_phys, tsk)
@@ -95,7 +100,7 @@ ENTRY(cpu_v6_dcache_clean_area)
  *	It is assumed that:
  *	- we are not using split page tables
  */
-ENTRY(cpu_v6_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v6_switch_mm)
 #ifdef CONFIG_MMU
 	mov	r2, #0
 	mmid	r1, r1				@ get mm->context.id
@@ -113,6 +118,7 @@ ENTRY(cpu_v6_switch_mm)
 	mcr	p15, 0, r1, c13, c0, 1		@ set context ID
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_v6_switch_mm)
 
 /*
  *	cpu_v6_set_pte_ext(ptep, pte, ext)
@@ -126,17 +132,18 @@ ENTRY(cpu_v6_switch_mm)
  */
 	armv6_mt_table cpu_v6
 
-ENTRY(cpu_v6_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_v6_set_pte_ext)
 #ifdef CONFIG_MMU
 	armv6_set_pte_ext cpu_v6
 #endif
 	ret	lr
+SYM_FUNC_END(cpu_v6_set_pte_ext)
 
 /* Suspend/resume support: taken from arch/arm/mach-s3c64xx/sleep.S */
 .globl	cpu_v6_suspend_size
 .equ	cpu_v6_suspend_size, 4 * 6
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_v6_do_suspend)
+SYM_TYPED_FUNC_START(cpu_v6_do_suspend)
 	stmfd	sp!, {r4 - r9, lr}
 	mrc	p15, 0, r4, c13, c0, 0	@ FCSE/PID
 #ifdef CONFIG_MMU
@@ -148,9 +155,9 @@ ENTRY(cpu_v6_do_suspend)
 	mrc	p15, 0, r9, c1, c0, 0	@ control register
 	stmia	r0, {r4 - r9}
 	ldmfd	sp!, {r4- r9, pc}
-ENDPROC(cpu_v6_do_suspend)
+SYM_FUNC_END(cpu_v6_do_suspend)
 
-ENTRY(cpu_v6_do_resume)
+SYM_TYPED_FUNC_START(cpu_v6_do_resume)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c14, 0	@ clean+invalidate D cache
 	mcr	p15, 0, ip, c7, c5, 0	@ invalidate I cache
@@ -172,7 +179,7 @@ ENTRY(cpu_v6_do_resume)
 	mcr	p15, 0, ip, c7, c5, 4	@ ISB
 	mov	r0, r9			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_v6_do_resume)
+SYM_FUNC_END(cpu_v6_do_resume)
 #endif
 
 	string	cpu_v6_name, "ARMv6-compatible processor"
diff --git a/arch/arm/mm/proc-v7-2level.S b/arch/arm/mm/proc-v7-2level.S
index 0a3083ad19c2..1007702fcaf3 100644
--- a/arch/arm/mm/proc-v7-2level.S
+++ b/arch/arm/mm/proc-v7-2level.S
@@ -40,7 +40,7 @@
  *	even on Cortex-A8 revisions not affected by 430973.
  *	If IBE is not set, the flush BTAC/BTB won't do anything.
  */
-ENTRY(cpu_v7_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v7_switch_mm)
 #ifdef CONFIG_MMU
 	mmid	r1, r1				@ get mm->context.id
 	ALT_SMP(orr	r0, r0, #TTB_FLAGS_SMP)
@@ -59,7 +59,7 @@ ENTRY(cpu_v7_switch_mm)
 	isb
 #endif
 	bx	lr
-ENDPROC(cpu_v7_switch_mm)
+SYM_FUNC_END(cpu_v7_switch_mm)
 
 /*
  *	cpu_v7_set_pte_ext(ptep, pte)
@@ -71,7 +71,7 @@ ENDPROC(cpu_v7_switch_mm)
  *	- pte   - PTE value to store
  *	- ext	- value for extended PTE bits
  */
-ENTRY(cpu_v7_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_v7_set_pte_ext)
 #ifdef CONFIG_MMU
 	str	r1, [r0]			@ linux version
 
@@ -106,7 +106,7 @@ ENTRY(cpu_v7_set_pte_ext)
 	ALT_UP (mcr	p15, 0, r0, c7, c10, 1)		@ flush_pte
 #endif
 	bx	lr
-ENDPROC(cpu_v7_set_pte_ext)
+SYM_FUNC_END(cpu_v7_set_pte_ext)
 
 	/*
 	 * Memory region attributes with SCTLR.TRE=1
diff --git a/arch/arm/mm/proc-v7-3level.S b/arch/arm/mm/proc-v7-3level.S
index 131984462d0d..bdabc15cde56 100644
--- a/arch/arm/mm/proc-v7-3level.S
+++ b/arch/arm/mm/proc-v7-3level.S
@@ -42,7 +42,7 @@
  * Set the translation table base pointer to be pgd_phys (physical address of
  * the new TTB).
  */
-ENTRY(cpu_v7_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v7_switch_mm)
 #ifdef CONFIG_MMU
 	mmid	r2, r2
 	asid	r2, r2
@@ -51,7 +51,7 @@ ENTRY(cpu_v7_switch_mm)
 	isb
 #endif
 	ret	lr
-ENDPROC(cpu_v7_switch_mm)
+SYM_FUNC_END(cpu_v7_switch_mm)
 
 #ifdef __ARMEB__
 #define rl r3
@@ -68,7 +68,7 @@ ENDPROC(cpu_v7_switch_mm)
  * - ptep - pointer to level 3 translation table entry
  * - pte - PTE value to store (64-bit in r2 and r3)
  */
-ENTRY(cpu_v7_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_v7_set_pte_ext)
 #ifdef CONFIG_MMU
 	tst	rl, #L_PTE_VALID
 	beq	1f
@@ -87,7 +87,7 @@ ENTRY(cpu_v7_set_pte_ext)
 	ALT_UP (mcr	p15, 0, r0, c7, c10, 1)		@ flush_pte
 #endif
 	ret	lr
-ENDPROC(cpu_v7_set_pte_ext)
+SYM_FUNC_END(cpu_v7_set_pte_ext)
 
 	/*
 	 * Memory region attributes for LPAE (defined in pgtable-3level.h):
diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 193c7aeb6703..5fb9a6aecb00 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -7,6 +7,7 @@
  *  This is the "shell" of the ARMv7 processor support.
  */
 #include <linux/arm-smccc.h>
+#include <linux/cfi_types.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/pgtable.h>
@@ -26,17 +27,17 @@
 
 .arch armv7-a
 
-ENTRY(cpu_v7_proc_init)
+SYM_TYPED_FUNC_START(cpu_v7_proc_init)
 	ret	lr
-ENDPROC(cpu_v7_proc_init)
+SYM_FUNC_END(cpu_v7_proc_init)
 
-ENTRY(cpu_v7_proc_fin)
+SYM_TYPED_FUNC_START(cpu_v7_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1000			@ ...i............
 	bic	r0, r0, #0x0006			@ .............ca.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
-ENDPROC(cpu_v7_proc_fin)
+SYM_FUNC_END(cpu_v7_proc_fin)
 
 /*
  *	cpu_v7_reset(loc, hyp)
@@ -53,7 +54,7 @@ ENDPROC(cpu_v7_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_v7_reset)
+SYM_TYPED_FUNC_START(cpu_v7_reset)
 	mrc	p15, 0, r2, c1, c0, 0		@ ctrl register
 	bic	r2, r2, #0x1			@ ...............m
  THUMB(	bic	r2, r2, #1 << 30 )		@ SCTLR.TE (Thumb exceptions)
@@ -64,7 +65,7 @@ ENTRY(cpu_v7_reset)
 	bne	__hyp_soft_restart
 #endif
 	bx	r0
-ENDPROC(cpu_v7_reset)
+SYM_FUNC_END(cpu_v7_reset)
 	.popsection
 
 /*
@@ -74,13 +75,13 @@ ENDPROC(cpu_v7_reset)
  *
  *	IRQs are already disabled.
  */
-ENTRY(cpu_v7_do_idle)
+SYM_TYPED_FUNC_START(cpu_v7_do_idle)
 	dsb					@ WFI may enter a low-power mode
 	wfi
 	ret	lr
-ENDPROC(cpu_v7_do_idle)
+SYM_FUNC_END(cpu_v7_do_idle)
 
-ENTRY(cpu_v7_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_v7_dcache_clean_area)
 	ALT_SMP(W(nop))			@ MP extensions imply L1 PTW
 	ALT_UP_B(1f)
 	ret	lr
@@ -91,38 +92,39 @@ ENTRY(cpu_v7_dcache_clean_area)
 	bhi	2b
 	dsb	ishst
 	ret	lr
-ENDPROC(cpu_v7_dcache_clean_area)
+SYM_FUNC_END(cpu_v7_dcache_clean_area)
 
 #ifdef CONFIG_ARM_PSCI
 	.arch_extension sec
-ENTRY(cpu_v7_smc_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
 	stmfd	sp!, {r0 - r3}
 	movw	r0, #:lower16:ARM_SMCCC_ARCH_WORKAROUND_1
 	movt	r0, #:upper16:ARM_SMCCC_ARCH_WORKAROUND_1
 	smc	#0
 	ldmfd	sp!, {r0 - r3}
 	b	cpu_v7_switch_mm
-ENDPROC(cpu_v7_smc_switch_mm)
+SYM_FUNC_END(cpu_v7_smc_switch_mm)
 	.arch_extension virt
-ENTRY(cpu_v7_hvc_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v7_hvc_switch_mm)
 	stmfd	sp!, {r0 - r3}
 	movw	r0, #:lower16:ARM_SMCCC_ARCH_WORKAROUND_1
 	movt	r0, #:upper16:ARM_SMCCC_ARCH_WORKAROUND_1
 	hvc	#0
 	ldmfd	sp!, {r0 - r3}
 	b	cpu_v7_switch_mm
-ENDPROC(cpu_v7_hvc_switch_mm)
+SYM_FUNC_END(cpu_v7_hvc_switch_mm)
 #endif
-ENTRY(cpu_v7_iciallu_switch_mm)
+
+SYM_TYPED_FUNC_START(cpu_v7_iciallu_switch_mm)
 	mov	r3, #0
 	mcr	p15, 0, r3, c7, c5, 0		@ ICIALLU
 	b	cpu_v7_switch_mm
-ENDPROC(cpu_v7_iciallu_switch_mm)
-ENTRY(cpu_v7_bpiall_switch_mm)
+SYM_FUNC_END(cpu_v7_iciallu_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v7_bpiall_switch_mm)
 	mov	r3, #0
 	mcr	p15, 0, r3, c7, c5, 6		@ flush BTAC/BTB
 	b	cpu_v7_switch_mm
-ENDPROC(cpu_v7_bpiall_switch_mm)
+SYM_FUNC_END(cpu_v7_bpiall_switch_mm)
 
 	string	cpu_v7_name, "ARMv7 Processor"
 	.align
@@ -131,7 +133,7 @@ ENDPROC(cpu_v7_bpiall_switch_mm)
 .globl	cpu_v7_suspend_size
 .equ	cpu_v7_suspend_size, 4 * 9
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_v7_do_suspend)
+SYM_TYPED_FUNC_START(cpu_v7_do_suspend)
 	stmfd	sp!, {r4 - r11, lr}
 	mrc	p15, 0, r4, c13, c0, 0	@ FCSE/PID
 	mrc	p15, 0, r5, c13, c0, 3	@ User r/o thread ID
@@ -150,9 +152,9 @@ ENTRY(cpu_v7_do_suspend)
 	mrc	p15, 0, r10, c1, c0, 2	@ Co-processor access control
 	stmia	r0, {r5 - r11}
 	ldmfd	sp!, {r4 - r11, pc}
-ENDPROC(cpu_v7_do_suspend)
+SYM_FUNC_END(cpu_v7_do_suspend)
 
-ENTRY(cpu_v7_do_resume)
+SYM_TYPED_FUNC_START(cpu_v7_do_resume)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c5, 0	@ invalidate I cache
 	mcr	p15, 0, ip, c13, c0, 1	@ set reserved context ID
@@ -186,22 +188,22 @@ ENTRY(cpu_v7_do_resume)
 	dsb
 	mov	r0, r8			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_v7_do_resume)
+SYM_FUNC_END(cpu_v7_do_resume)
 #endif
 
 .globl	cpu_ca9mp_suspend_size
 .equ	cpu_ca9mp_suspend_size, cpu_v7_suspend_size + 4 * 2
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_ca9mp_do_suspend)
+SYM_TYPED_FUNC_START(cpu_ca9mp_do_suspend)
 	stmfd	sp!, {r4 - r5}
 	mrc	p15, 0, r4, c15, c0, 1		@ Diagnostic register
 	mrc	p15, 0, r5, c15, c0, 0		@ Power register
 	stmia	r0!, {r4 - r5}
 	ldmfd	sp!, {r4 - r5}
 	b	cpu_v7_do_suspend
-ENDPROC(cpu_ca9mp_do_suspend)
+SYM_FUNC_END(cpu_ca9mp_do_suspend)
 
-ENTRY(cpu_ca9mp_do_resume)
+SYM_TYPED_FUNC_START(cpu_ca9mp_do_resume)
 	ldmia	r0!, {r4 - r5}
 	mrc	p15, 0, r10, c15, c0, 1		@ Read Diagnostic register
 	teq	r4, r10				@ Already restored?
@@ -210,7 +212,7 @@ ENTRY(cpu_ca9mp_do_resume)
 	teq	r5, r10				@ Already restored?
 	mcrne	p15, 0, r5, c15, c0, 0		@ No, so restore it
 	b	cpu_v7_do_resume
-ENDPROC(cpu_ca9mp_do_resume)
+SYM_FUNC_END(cpu_ca9mp_do_resume)
 #endif
 
 #ifdef CONFIG_CPU_PJ4B
@@ -220,18 +222,18 @@ ENDPROC(cpu_ca9mp_do_resume)
 	globl_equ	cpu_pj4b_proc_fin, 	cpu_v7_proc_fin
 	globl_equ	cpu_pj4b_reset,	   	cpu_v7_reset
 #ifdef CONFIG_PJ4B_ERRATA_4742
-ENTRY(cpu_pj4b_do_idle)
+SYM_TYPED_FUNC_START(cpu_pj4b_do_idle)
 	dsb					@ WFI may enter a low-power mode
 	wfi
 	dsb					@barrier
 	ret	lr
-ENDPROC(cpu_pj4b_do_idle)
+SYM_FUNC_END(cpu_pj4b_do_idle)
 #else
 	globl_equ	cpu_pj4b_do_idle,  	cpu_v7_do_idle
 #endif
 	globl_equ	cpu_pj4b_dcache_clean_area,	cpu_v7_dcache_clean_area
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_pj4b_do_suspend)
+SYM_TYPED_FUNC_START(cpu_pj4b_do_suspend)
 	stmfd	sp!, {r6 - r10}
 	mrc	p15, 1, r6, c15, c1, 0  @ save CP15 - extra features
 	mrc	p15, 1, r7, c15, c2, 0	@ save CP15 - Aux Func Modes Ctrl 0
@@ -241,9 +243,9 @@ ENTRY(cpu_pj4b_do_suspend)
 	stmia	r0!, {r6 - r10}
 	ldmfd	sp!, {r6 - r10}
 	b cpu_v7_do_suspend
-ENDPROC(cpu_pj4b_do_suspend)
+SYM_FUNC_END(cpu_pj4b_do_suspend)
 
-ENTRY(cpu_pj4b_do_resume)
+SYM_TYPED_FUNC_START(cpu_pj4b_do_resume)
 	ldmia	r0!, {r6 - r10}
 	mcr	p15, 1, r6, c15, c1, 0  @ restore CP15 - extra features
 	mcr	p15, 1, r7, c15, c2, 0	@ restore CP15 - Aux Func Modes Ctrl 0
@@ -251,7 +253,7 @@ ENTRY(cpu_pj4b_do_resume)
 	mcr	p15, 1, r9, c15, c1, 1  @ restore CP15 - Aux Debug Modes Ctrl 1
 	mcr	p15, 0, r10, c9, c14, 0  @ restore CP15 - PMC
 	b cpu_v7_do_resume
-ENDPROC(cpu_pj4b_do_resume)
+SYM_FUNC_END(cpu_pj4b_do_resume)
 #endif
 .globl	cpu_pj4b_suspend_size
 .equ	cpu_pj4b_suspend_size, cpu_v7_suspend_size + 4 * 5
diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index d65a12f851a9..d4675603593b 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -8,18 +8,19 @@
  *  This is the "shell" of the ARMv7-M processor support.
  */
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/page.h>
 #include <asm/v7m.h>
 #include "proc-macros.S"
 
-ENTRY(cpu_v7m_proc_init)
+SYM_TYPED_FUNC_START(cpu_v7m_proc_init)
 	ret	lr
-ENDPROC(cpu_v7m_proc_init)
+SYM_FUNC_END(cpu_v7m_proc_init)
 
-ENTRY(cpu_v7m_proc_fin)
+SYM_TYPED_FUNC_START(cpu_v7m_proc_fin)
 	ret	lr
-ENDPROC(cpu_v7m_proc_fin)
+SYM_FUNC_END(cpu_v7m_proc_fin)
 
 /*
  *	cpu_v7m_reset(loc)
@@ -31,9 +32,9 @@ ENDPROC(cpu_v7m_proc_fin)
  *	- loc   - location to jump to for soft reset
  */
 	.align	5
-ENTRY(cpu_v7m_reset)
+SYM_TYPED_FUNC_START(cpu_v7m_reset)
 	ret	r0
-ENDPROC(cpu_v7m_reset)
+SYM_FUNC_END(cpu_v7m_reset)
 
 /*
  *	cpu_v7m_do_idle()
@@ -42,36 +43,36 @@ ENDPROC(cpu_v7m_reset)
  *
  *	IRQs are already disabled.
  */
-ENTRY(cpu_v7m_do_idle)
+SYM_TYPED_FUNC_START(cpu_v7m_do_idle)
 	wfi
 	ret	lr
-ENDPROC(cpu_v7m_do_idle)
+SYM_FUNC_END(cpu_v7m_do_idle)
 
-ENTRY(cpu_v7m_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_v7m_dcache_clean_area)
 	ret	lr
-ENDPROC(cpu_v7m_dcache_clean_area)
+SYM_FUNC_END(cpu_v7m_dcache_clean_area)
 
 /*
  * There is no MMU, so here is nothing to do.
  */
-ENTRY(cpu_v7m_switch_mm)
+SYM_TYPED_FUNC_START(cpu_v7m_switch_mm)
 	ret	lr
-ENDPROC(cpu_v7m_switch_mm)
+SYM_FUNC_END(cpu_v7m_switch_mm)
 
 .globl	cpu_v7m_suspend_size
 .equ	cpu_v7m_suspend_size, 0
 
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_v7m_do_suspend)
+SYM_TYPED_FUNC_START(cpu_v7m_do_suspend)
 	ret	lr
-ENDPROC(cpu_v7m_do_suspend)
+SYM_FUNC_END(cpu_v7m_do_suspend)
 
-ENTRY(cpu_v7m_do_resume)
+SYM_TYPED_FUNC_START(cpu_v7m_do_resume)
 	ret	lr
-ENDPROC(cpu_v7m_do_resume)
+SYM_FUNC_END(cpu_v7m_do_resume)
 #endif
 
-ENTRY(cpu_cm7_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_cm7_dcache_clean_area)
 	dcache_line_size r2, r3
 	movw	r3, #:lower16:BASEADDR_V7M_SCB + V7M_SCB_DCCMVAC
 	movt	r3, #:upper16:BASEADDR_V7M_SCB + V7M_SCB_DCCMVAC
@@ -82,16 +83,16 @@ ENTRY(cpu_cm7_dcache_clean_area)
 	bhi	1b
 	dsb
 	ret	lr
-ENDPROC(cpu_cm7_dcache_clean_area)
+SYM_FUNC_END(cpu_cm7_dcache_clean_area)
 
-ENTRY(cpu_cm7_proc_fin)
+SYM_TYPED_FUNC_START(cpu_cm7_proc_fin)
 	movw	r2, #:lower16:(BASEADDR_V7M_SCB + V7M_SCB_CCR)
 	movt	r2, #:upper16:(BASEADDR_V7M_SCB + V7M_SCB_CCR)
 	ldr	r0, [r2]
 	bic	r0, r0, #(V7M_SCB_CCR_DC | V7M_SCB_CCR_IC)
 	str	r0, [r2]
 	ret	lr
-ENDPROC(cpu_cm7_proc_fin)
+SYM_FUNC_END(cpu_cm7_proc_fin)
 
 	.section ".init.text", "ax"
 
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index 7975f93b1e14..0e3d8e76376a 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -80,18 +80,20 @@
  *
  * Nothing too exciting at the moment
  */
-ENTRY(cpu_xsc3_proc_init)
+SYM_TYPED_FUNC_START(cpu_xsc3_proc_init)
 	ret	lr
+SYM_FUNC_END(cpu_xsc3_proc_init)
 
 /*
  * cpu_xsc3_proc_fin()
  */
-ENTRY(cpu_xsc3_proc_fin)
+SYM_TYPED_FUNC_START(cpu_xsc3_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1800			@ ...IZ...........
 	bic	r0, r0, #0x0006			@ .............CA.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_xsc3_proc_fin)
 
 /*
  * cpu_xsc3_reset(loc)
@@ -104,7 +106,7 @@ ENTRY(cpu_xsc3_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_xsc3_reset)
+SYM_TYPED_FUNC_START(cpu_xsc3_reset)
 	mov	r1, #PSR_F_BIT|PSR_I_BIT|SVC_MODE
 	msr	cpsr_c, r1			@ reset CPSR
 	mrc	p15, 0, r1, c1, c0, 0		@ ctrl register
@@ -118,7 +120,7 @@ ENTRY(cpu_xsc3_reset)
 	@ already containing those two last instructions to survive.
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I and D TLBs
 	ret	r0
-ENDPROC(cpu_xsc3_reset)
+SYM_FUNC_END(cpu_xsc3_reset)
 	.popsection
 
 /*
@@ -133,10 +135,11 @@ ENDPROC(cpu_xsc3_reset)
  */
 	.align	5
 
-ENTRY(cpu_xsc3_do_idle)
+SYM_TYPED_FUNC_START(cpu_xsc3_do_idle)
 	mov	r0, #1
 	mcr	p14, 0, r0, c7, c0, 0		@ go to idle
 	ret	lr
+SYM_FUNC_END(cpu_xsc3_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -339,12 +342,13 @@ SYM_TYPED_FUNC_START(xsc3_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(xsc3_dma_unmap_area)
 
-ENTRY(cpu_xsc3_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_xsc3_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean L1 D line
 	add	r0, r0, #CACHELINESIZE
 	subs	r1, r1, #CACHELINESIZE
 	bhi	1b
 	ret	lr
+SYM_FUNC_END(cpu_xsc3_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -356,7 +360,7 @@ ENTRY(cpu_xsc3_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_xsc3_switch_mm)
+SYM_TYPED_FUNC_START(cpu_xsc3_switch_mm)
 	clean_d_cache r1, r2
 	mcr	p15, 0, ip, c7, c5, 0		@ invalidate L1 I cache and BTB
 	mcr	p15, 0, ip, c7, c10, 4		@ data write barrier
@@ -365,6 +369,7 @@ ENTRY(cpu_xsc3_switch_mm)
 	mcr	p15, 0, r0, c2, c0, 0		@ load page table pointer
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I and D TLBs
 	cpwait_ret lr, ip
+SYM_FUNC_END(cpu_xsc3_switch_mm)
 
 /*
  * cpu_xsc3_set_pte_ext(ptep, pte, ext)
@@ -390,7 +395,7 @@ cpu_xsc3_mt_table:
 	.long	0x00						@ unused
 
 	.align	5
-ENTRY(cpu_xsc3_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_xsc3_set_pte_ext)
 	xscale_set_pte_ext_prologue
 
 	tst	r1, #L_PTE_SHARED		@ shared?
@@ -403,6 +408,7 @@ ENTRY(cpu_xsc3_set_pte_ext)
 
 	xscale_set_pte_ext_epilogue
 	ret	lr
+SYM_FUNC_END(cpu_xsc3_set_pte_ext)
 
 	.ltorg
 	.align
@@ -410,7 +416,7 @@ ENTRY(cpu_xsc3_set_pte_ext)
 .globl	cpu_xsc3_suspend_size
 .equ	cpu_xsc3_suspend_size, 4 * 6
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_xsc3_do_suspend)
+SYM_TYPED_FUNC_START(cpu_xsc3_do_suspend)
 	stmfd	sp!, {r4 - r9, lr}
 	mrc	p14, 0, r4, c6, c0, 0	@ clock configuration, for turbo mode
 	mrc	p15, 0, r5, c15, c1, 0	@ CP access reg
@@ -421,9 +427,9 @@ ENTRY(cpu_xsc3_do_suspend)
 	bic	r4, r4, #2		@ clear frequency change bit
 	stmia	r0, {r4 - r9}		@ store cp regs
 	ldmia	sp!, {r4 - r9, pc}
-ENDPROC(cpu_xsc3_do_suspend)
+SYM_FUNC_END(cpu_xsc3_do_suspend)
 
-ENTRY(cpu_xsc3_do_resume)
+SYM_TYPED_FUNC_START(cpu_xsc3_do_resume)
 	ldmia	r0, {r4 - r9}		@ load cp regs
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0	@ invalidate I & D caches, BTB
@@ -439,7 +445,7 @@ ENTRY(cpu_xsc3_do_resume)
 	mcr	p15, 0, r8, c1, c0, 1	@ auxiliary control reg
 	mov	r0, r9			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_xsc3_do_resume)
+SYM_FUNC_END(cpu_xsc3_do_resume)
 #endif
 
 	.type	__xsc3_setup, #function
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index bbf1e94ba554..d8462df8020b 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -112,22 +112,24 @@ clean_addr:	.word	CLEAN_ADDR
  *
  * Nothing too exciting at the moment
  */
-ENTRY(cpu_xscale_proc_init)
+SYM_TYPED_FUNC_START(cpu_xscale_proc_init)
 	@ enable write buffer coalescing. Some bootloader disable it
 	mrc	p15, 0, r1, c1, c0, 1
 	bic	r1, r1, #1
 	mcr	p15, 0, r1, c1, c0, 1
 	ret	lr
+SYM_FUNC_END(cpu_xscale_proc_init)
 
 /*
  * cpu_xscale_proc_fin()
  */
-ENTRY(cpu_xscale_proc_fin)
+SYM_TYPED_FUNC_START(cpu_xscale_proc_fin)
 	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
 	bic	r0, r0, #0x1800			@ ...IZ...........
 	bic	r0, r0, #0x0006			@ .............CA.
 	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
 	ret	lr
+SYM_FUNC_END(cpu_xscale_proc_fin)
 
 /*
  * cpu_xscale_reset(loc)
@@ -142,7 +144,7 @@ ENTRY(cpu_xscale_proc_fin)
  */
 	.align	5
 	.pushsection	.idmap.text, "ax"
-ENTRY(cpu_xscale_reset)
+SYM_TYPED_FUNC_START(cpu_xscale_reset)
 	mov	r1, #PSR_F_BIT|PSR_I_BIT|SVC_MODE
 	msr	cpsr_c, r1			@ reset CPSR
 	mcr	p15, 0, r1, c10, c4, 1		@ unlock I-TLB
@@ -160,7 +162,7 @@ ENTRY(cpu_xscale_reset)
 	@ already containing those two last instructions to survive.
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 	ret	r0
-ENDPROC(cpu_xscale_reset)
+SYM_FUNC_END(cpu_xscale_reset)
 	.popsection
 
 /*
@@ -175,10 +177,11 @@ ENDPROC(cpu_xscale_reset)
  */
 	.align	5
 
-ENTRY(cpu_xscale_do_idle)
+SYM_TYPED_FUNC_START(cpu_xscale_do_idle)
 	mov	r0, #1
 	mcr	p14, 0, r0, c7, c0, 0		@ Go to IDLE
 	ret	lr
+SYM_FUNC_END(cpu_xscale_do_idle)
 
 /* ================================= CACHE ================================ */
 
@@ -428,12 +431,13 @@ SYM_TYPED_FUNC_START(xscale_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(xscale_dma_unmap_area)
 
-ENTRY(cpu_xscale_dcache_clean_area)
+SYM_TYPED_FUNC_START(cpu_xscale_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHELINESIZE
 	subs	r1, r1, #CACHELINESIZE
 	bhi	1b
 	ret	lr
+SYM_FUNC_END(cpu_xscale_dcache_clean_area)
 
 /* =============================== PageTable ============================== */
 
@@ -445,13 +449,14 @@ ENTRY(cpu_xscale_dcache_clean_area)
  * pgd: new page tables
  */
 	.align	5
-ENTRY(cpu_xscale_switch_mm)
+SYM_TYPED_FUNC_START(cpu_xscale_switch_mm)
 	clean_d_cache r1, r2
 	mcr	p15, 0, ip, c7, c5, 0		@ Invalidate I cache & BTB
 	mcr	p15, 0, ip, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	mcr	p15, 0, r0, c2, c0, 0		@ load page table pointer
 	mcr	p15, 0, ip, c8, c7, 0		@ invalidate I & D TLBs
 	cpwait_ret lr, ip
+SYM_FUNC_END(cpu_xscale_switch_mm)
 
 /*
  * cpu_xscale_set_pte_ext(ptep, pte, ext)
@@ -479,7 +484,7 @@ cpu_xscale_mt_table:
 	.long	0x00						@ unused
 
 	.align	5
-ENTRY(cpu_xscale_set_pte_ext)
+SYM_TYPED_FUNC_START(cpu_xscale_set_pte_ext)
 	xscale_set_pte_ext_prologue
 
 	@
@@ -497,6 +502,7 @@ ENTRY(cpu_xscale_set_pte_ext)
 
 	xscale_set_pte_ext_epilogue
 	ret	lr
+SYM_FUNC_END(cpu_xscale_set_pte_ext)
 
 	.ltorg
 	.align
@@ -504,7 +510,7 @@ ENTRY(cpu_xscale_set_pte_ext)
 .globl	cpu_xscale_suspend_size
 .equ	cpu_xscale_suspend_size, 4 * 6
 #ifdef CONFIG_ARM_CPU_SUSPEND
-ENTRY(cpu_xscale_do_suspend)
+SYM_TYPED_FUNC_START(cpu_xscale_do_suspend)
 	stmfd	sp!, {r4 - r9, lr}
 	mrc	p14, 0, r4, c6, c0, 0	@ clock configuration, for turbo mode
 	mrc	p15, 0, r5, c15, c1, 0	@ CP access reg
@@ -515,9 +521,9 @@ ENTRY(cpu_xscale_do_suspend)
 	bic	r4, r4, #2		@ clear frequency change bit
 	stmia	r0, {r4 - r9}		@ store cp regs
 	ldmfd	sp!, {r4 - r9, pc}
-ENDPROC(cpu_xscale_do_suspend)
+SYM_FUNC_END(cpu_xscale_do_suspend)
 
-ENTRY(cpu_xscale_do_resume)
+SYM_TYPED_FUNC_START(cpu_xscale_do_resume)
 	ldmia	r0, {r4 - r9}		@ load cp regs
 	mov	ip, #0
 	mcr	p15, 0, ip, c8, c7, 0	@ invalidate I & D TLBs
@@ -530,7 +536,7 @@ ENTRY(cpu_xscale_do_resume)
 	mcr	p15, 0, r8, c1, c0, 1	@ auxiliary control reg
 	mov	r0, r9			@ control register
 	b	cpu_resume_mmu
-ENDPROC(cpu_xscale_do_resume)
+SYM_FUNC_END(cpu_xscale_do_resume)
 #endif
 
 	.type	__xscale_setup, #function

-- 
2.44.0

