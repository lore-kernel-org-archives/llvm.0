Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F31494D7
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625789; cv=none; b=kFRNCrwu6goCAh7hHDQZVJc9go9BR0IjNiJc1Yq2KKlLt0SV7Ntnq/1JK/LzNv3zO+OFpquQ0QMLwdtjI1EKmWOD5mRZd9fovsydJrL8BUm+c2VOnHS+AyY0uEIB7YjnR1R2l0rXIFPRQ/BAC0gniq14gWI6c3BJpkY8MH4VUUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625789; c=relaxed/simple;
	bh=Qv8nmYUrxUE/459kyj79Hni82zDBkNjYFIvQQBP9BGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEGlLZfQMX8MjAxlRrafsdydVNboOaITTIzd+C0xpd+epdUByreQmz8Pamz5q2Fwqtkro3/NDaG4pUgs6RAZtzzonEnFXBSEfY4j6AQrH1CW1F75Vx1HEOZGzicl9O26cWcoBanCoBjsL+XyRJ+Bn9mJel2mMvwhJ1wzOJj5g/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=WJwLM/02; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WJwLM/02"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3842468a12.2
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625788; x=1724230588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+LcB4MC6Qgfr9kzwjEWl/9KLwOZpaXC6CA7cxVGJTI=;
        b=WJwLM/029aesH409l5de5PddKwVborLN9koiYMx2m3S4S0w9PswCWpn2iT4TjkQMuC
         NQV+7VSqi8uS/E6ZPbtaVVlCBy7RdXDVfkl83pFnToOLLU5+kCJnF8JdDZMzfp6BzfQE
         0im59oqxIeJAT+mqsoqTIrRpCAEbLEWkUrOcjObFovfk5rXmdtfdEDDXJwNemxz5VKJe
         DdnXhF46BiIhAZb/ASUnjFWUFv0SNyriHWOhxFdPuONCDTcKcSFaM5m96bLRaW5xOrN1
         ez1CmE6Qr5t1yfmzhhLxy3wgk9fGzuGxAHTj8PddbTFAV9vHffpheyYnd9ukb77ddZxv
         0qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625788; x=1724230588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+LcB4MC6Qgfr9kzwjEWl/9KLwOZpaXC6CA7cxVGJTI=;
        b=QkWNIB0C3ghV30cfVE+PbZ5iOwAKEeC63+stxR+kcytkrAr2SrT/xts6ahZidE6ecI
         KqUdyrFqYeEUCt9V6tbO4PntQuoZuijD0g5wGpCkilHgaNRAgLl/z+0ZEt0dTe/JSgR2
         9YnkKAWj/wmOHpw18mBwOaTZtQiVJmRIZnNT5tjphARA8h/fEzHHJJRAsf8CUUX1bYVV
         paKzEA8kypKKfNmiq0Hq+rGxZsfDDqsJXUy8NyxN2DdE64PzIBhLseER8+Il5tNbWGCw
         Wq6+wSDrZGMxoBTGHPxzNITXUgnTvEhoSxRhHSgfCmNmn0Gs3+JDXb3hEplcurkaeLiQ
         eUqw==
X-Gm-Message-State: AOJu0Yxw5VvhIdy3OdSVyFuq95K4z3M6R0P8mnR89wrFEtXS5+/CNsCG
	oYFvOtcKdz24VPnQ0M1g/Hl/yobAE/9fiZu57FG0TSSEwDtuqTnbvr0D5TMnz9c=
X-Google-Smtp-Source: AGHT+IHeop/4tDtqPSIvDLepGfrszpRVvQ8NysDbzpZjr3VmMUvS3QBFyPVJf7l/syUiJf9jHvayiw==
X-Received: by 2002:a05:6a20:c88b:b0:1c4:c879:b770 with SMTP id adf61e73a8af0-1c8eae8dd79mr2680167637.23.1723625787615;
        Wed, 14 Aug 2024 01:56:27 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 4/7] riscv: Do not rely on KASAN to define the memory layout
Date: Wed, 14 Aug 2024 01:55:32 -0700
Message-ID: <20240814085618.968833-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
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
index 8b698d9609e7..1667f1b05f5a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1492,7 +1492,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 	panic("Failed to pre-allocate %s pages for %s area\n", lvl, area);
 }
 
-#define PAGE_END KASAN_SHADOW_START
+#define PAGE_END (PAGE_OFFSET + KERN_VIRT_SIZE)
 
 void __init pgtable_cache_init(void)
 {
-- 
2.45.1

