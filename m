Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6F135A79
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562369; cv=none; b=brd0wuMfkT6rk2Mw/6Qd3W3+nMWR48hQDtuBHbQO6hbzu2K8LtTyQO7ZKuNF2kiwoqzxzHcTaMamx1/QLsaYJ2XxwEWS8alvZMUMitnZXFMFjk+PxhDcwo0kiG+1hQkYFf4klKCNHeyR+XFKq/hwx584i900llUZ65iEzKeQCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562369; c=relaxed/simple;
	bh=es7nwt1Z8plGrwhcKNpUqYOJPExE/gGaHXH3HFNnqdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebkbCfimSS2YzSQXyk9k4tpoGfLhFO2mJVlqads3Y6rmr8MSpv99es1iTXTLRB0TiaA/EANDNEAblWqnAFJ7OVFp/Gpykofzg7UW1bcj86ychv3FXXRFHlXy5V8YRmBs5W0Orx8Np/Akb4A92LyDDDqZEixOU3049yyV21faPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Y/SdcYpv; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Y/SdcYpv"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5ebc0e13d25so694091eaf.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562367; x=1730167167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOWNg37CI6wBNjlK3WTwIizp4MumcxiO1pDVtn3VcZ8=;
        b=Y/SdcYpvmt0dO+/VDTc4ucclQSGr3qGCmCbfSZ2cVjTrPdsmZbLwRBzTaIvJ6Gtyr/
         p4fqCLxZsgHt07SMGVsKW6dhckCUUSsS4hzcuRwnzzykruOMIAvMRmx7wRbrLZHDLp5B
         Ct5ya+qJQMBEwydiCXsU7FPF9vkJFuaEj6K819U+RWMUi26aCrFzh7PTnChBgUx/5h+W
         OArALuHLI295WdhNK8B7NPE7rvfuwCzyJQRZ5nXYcpkknoQpcvF95t2H93ioGJA16fvl
         CsTz1dx0/Wj2l3TqudCJNhTZvtSopIGHw4v8uz99EyeVdeIxh1ifyqENNOosXQAZkIOS
         zqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562367; x=1730167167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOWNg37CI6wBNjlK3WTwIizp4MumcxiO1pDVtn3VcZ8=;
        b=l/xNr9iwxeAMtnB2NimwHHfVtNdkOjW9p6SbvStUM/huCq2MHQKc6Ui2prnCdn6LVL
         o6VKsbFBSOOF0qXXOnbovKiLAdeKZhOULMO38gOrc0kR+vtEuAuxjfAwGss6gyzJgCh1
         kIcgoq1eFAV6bM9ybdqKdwgUEuFP5abo3P1okIEfsNE4O8umIBTFQq8+RSoe0G9lo/cP
         urwOQciBYPPQmc8IV/yrj89RRaBosqFFxpZozxyiiV6VYGCFaUqggZNZTuSSHiv8+d4/
         UllfkCW+7ALrPduol5yF8XvPd6Dw7l9e/obIKe3eIldLsm1KKOmf+lHMOgTyWBDTcuQK
         DDPw==
X-Gm-Message-State: AOJu0YyVbNUuuqPeF8jeBNHs/PFdtwE+CQUCVwYDFSPXxZCpI8zb2SPy
	0yVcl1a/0hD6bT0FRwH/RnjMrpnD9zcf9bMrMI2gkbkaIrVlC7FC/Y6vwQ1rlyw=
X-Google-Smtp-Source: AGHT+IHErzREUGw6ROMLMvLXYHp4zadEF+Dwq950EYc2048lR/Pu3YsD3Bs92QVrt5aBEWQnl13Wpw==
X-Received: by 2002:a05:6871:109:b0:288:b220:a57e with SMTP id 586e51a60fabf-28cb0184ff2mr946194fac.40.1729562366823;
        Mon, 21 Oct 2024 18:59:26 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:26 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 6/9] riscv: Do not rely on KASAN to define the memory layout
Date: Mon, 21 Oct 2024 18:57:14 -0700
Message-ID: <20241022015913.3524425-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 66673099f734 ("riscv: mm: Pre-allocate vmemmap/direct map/kasan
PGD entries") used the start of the KASAN shadow memory region to
represent the end of the linear map, since the two memory regions were
immediately adjacent. This is no longer the case for Sv39; commit
5c8405d763dc ("riscv: Extend sv39 linear mapping max size to 128G")
introduced a 4 GiB hole between the regions. Introducing KASAN_SW_TAGS
will cut the size of the shadow memory region in half, creating an even
larger hole.

Avoid wasting PGD entries on this hole by using the size of the linear
map (KERN_VIRT_SIZE) to compute PAGE_END.

Since KASAN_SHADOW_START/KASAN_SHADOW_END are used inside an IS_ENABLED
block, it's not possible to completely hide the constants when KASAN is
disabled, so provide dummy definitions for that case.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/kasan.h | 11 +++++++++--
 arch/riscv/mm/init.c           |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index e6a0071bdb56..a4e92ce9fa31 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -6,6 +6,8 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_KASAN
+
 /*
  * The following comment was copied from arm64:
  * KASAN_SHADOW_START: beginning of the kernel virtual addresses.
@@ -33,13 +35,18 @@
 #define KASAN_SHADOW_START	((KASAN_SHADOW_END - KASAN_SHADOW_SIZE) & PGDIR_MASK)
 #define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
 
-#ifdef CONFIG_KASAN
 #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 
 void kasan_init(void);
 asmlinkage void kasan_early_init(void);
 void kasan_swapper_init(void);
 
-#endif
+#else /* CONFIG_KASAN */
+
+#define KASAN_SHADOW_START	MODULES_LOWEST_VADDR
+#define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
+
+#endif /* CONFIG_KASAN */
+
 #endif
 #endif /* __ASM_KASAN_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..1f9bb95c2169 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1494,7 +1494,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 	panic("Failed to pre-allocate %s pages for %s area\n", lvl, area);
 }
 
-#define PAGE_END KASAN_SHADOW_START
+#define PAGE_END (PAGE_OFFSET + KERN_VIRT_SIZE)
 
 void __init pgtable_cache_init(void)
 {
-- 
2.45.1

