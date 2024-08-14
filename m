Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06845149DE9
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625791; cv=none; b=i1xMBTCcV5L+LBvMU2zWuQRzyxPiR2DEXHS/7aekTKIeVHIwVBA5JeOhBrYfiV3PAUOkhhis4fN8P5YUlixC0nuzsac32bEfcpIjM3SxjKRnNh8X6zeVKYphv+y+y6xB2DiM8oOsQhnvDw9HJkic5A1ZyaY7PXk1fHyXdhlV+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625791; c=relaxed/simple;
	bh=Jwqj+kFZYI0WjOz3quIwyH3tnTx1KhxDrMuycqhBqy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQnR6asA67R6iz9LI4k49KTzxS6G+mYOthAwHHLJ8HXDhIwdNvtaAH0SYL1zdVc73FSL0fr2CcfGcUGqcYwQpFrzsTDknUZWES3zFFaVcWvMLNChQa+02zWZfaTDQeEd8hxviB/kit8/q1M5v5n/mbaQPdPg3YshWCsC0SeQVJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=P6aXb/Uj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="P6aXb/Uj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3581064a12.0
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625789; x=1724230589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtxoKtjWvRqhjS0z2DQnl5gBuyvoRF+9CVzVIMvmZ6E=;
        b=P6aXb/Ujk1YGqN4IePNYlr8EeAXhMvHKLy+80It0YjQhL8r3zqD6lGjzc6l9jRlAm5
         Z31uezwZnUJiXjuIWVByEJ5rNChzC2KJ1jnyrZswYIVBu+yT09AOfIwOr8jkSD8rFkYk
         TIuxPIolrqCWWZP33aoiKZgfpxOfN9ax6DtqM+qG2rgO+7EZUQeetmsolRfee+3TIzSz
         a1nADQ87FAL0HChlx5/ncbQcWnahyEk5lDvm8Qc2I/cNrkOCWgOqKZLsb5VZaNr3O0KK
         XcBZHU6XZIX/dsFes4yDspBWUZlIFi12Kkv9QFi27bFJq/w+GVvZ0a4k2mJ98E3sQeVW
         eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625789; x=1724230589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtxoKtjWvRqhjS0z2DQnl5gBuyvoRF+9CVzVIMvmZ6E=;
        b=dMpcfe9grV4uUmAWpsFsc5sEOZylH+OaQZb7hc3XewG2aJDCtJ/sW1OYzZ2b6Pf+N0
         ufAijHhI1ZRj/kCFK2PTsPxIMaH5gfRyVXwsoNCDMgg+FfmpYihz4sGPE1Sh7Emdn1IM
         v5lzoxAigtBDhmPUGTyE68MgAccU7vbcMTLN/lUiKM7g+ug/clbFHvkPbZLfLSUBUIQF
         Xpo0fksbw+nSmjNA0Vf7A3t8pCDbNW81jnjEOhPP/vddthxxtnvqnor2wUyyKaqB+Zqc
         gQ/kkWwfGuncJ9ZINT5GXwJtlUV3E+Mm0q0s3x11Q8Wb+Ubc8N1vTNLDiuXCb64fGp1x
         gz7Q==
X-Gm-Message-State: AOJu0YwC4LMjHs44zq7PgswQcTHhkyon1LA/7JtBTqymWs6QU/fPPNmK
	t1ckQ1VbmNx3aqL4Xbjt4+m7xKZR7Hk7YRyLuB12c5Syg9CFVTiEMOTIK5MCLD4=
X-Google-Smtp-Source: AGHT+IGKwvtrSq7d8JlTCA95HrODYZub/jNh1CadsEDvmYgd02vgRRSnG6ohafRUbcvHgfRX7yetxA==
X-Received: by 2002:a05:6a20:4f25:b0:1c8:edba:b9ca with SMTP id adf61e73a8af0-1c8edbabc7fmr1261808637.1.1723625789313;
        Wed, 14 Aug 2024 01:56:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:28 -0700 (PDT)
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
Subject: [RFC PATCH 5/7] riscv: Align the sv39 linear map to 16 GiB
Date: Wed, 14 Aug 2024 01:55:33 -0700
Message-ID: <20240814085618.968833-6-samuel.holland@sifive.com>
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

The KASAN implementation on RISC-V requires the shadow memory for the
vmemmap and linear map regions to be aligned to a PMD boundary (1 GiB).
For KASAN_GENERIC (KASAN_SHADOW_SCALE_SHIFT == 3), this enforces 8 GiB
alignment for the memory regions themselves. KASAN_SW_TAGS uses 16-byte
granules (KASAN_SHADOW_SCALE_SHIFT == 4), so now the memory regions must
be aligned to a 16 GiB boundary.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index 077b968dcc81..ed71b3b1b784 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -47,11 +47,11 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
-   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
-   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
-   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | direct mapping of all physical memory
+   ffffffc2fea00000 | -244    GB | ffffffc2feffffff |    6 MB | fixmap
+   ffffffc2ff000000 | -244    GB | ffffffc2ffffffff |   16 MB | PCI io
+   ffffffc300000000 | -244    GB | ffffffc3ffffffff |    4 GB | vmemmap
+   ffffffc400000000 | -240    GB | ffffffd3ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd400000000 | -176    GB | fffffff3ffffffff |  128 GB | direct mapping of all physical memory
                     |            |                  |         |
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 7ede2111c591..09d15567b0b8 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
+#define PAGE_OFFSET_L3		_AC(0xffffffd400000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
-- 
2.45.1

