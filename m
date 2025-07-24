Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E6246794
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400238; cv=none; b=pwkBwV+2ntgo+0CuJnC06JVZtmbaZGUCGwRfAJ35gM3YXGzXlepttqdj3KZzJiiwVvyKxaFB0E28oUOz5CWFAvdA/50zErSB6duicyKs/mU39i7BVgD8S8VS7QhqrsTjTdORWy/9o8eaOzFHEWbeMkikOAmfAVtq8XNkxxezstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400238; c=relaxed/simple;
	bh=DtTsCEflgrt1r4FC6hlq3qopTxtenPFkOWKMBZTbVcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sllCRRg2MdDIBDjVfz1EdCUYl69x/uRU0L7NolW90FF2l1TS4iRlg1pYlUhVsdu7bl0TEAD7zgeCpcCL1r9dRvm0Pp5gxDivjQzqLs/44uEHPeFWk7XwE1Y1lTP7AOcEQfXh+Jxqv9NcJCgzo8bvXXqLkPrNk3HEMKkbwq/u0AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FUFa9Rd4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FUFa9Rd4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23f8d27eeeaso14502585ad.2
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400236; x=1754005036; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gkm+U+Z8JovOoe8ArAZBSUqCVEx3YFZYKLxHXbXYTzk=;
        b=FUFa9Rd48aeCuQicX3iNFB6jjSBLZlr74ak0IjnXFRmo8MR9rt1p3CLp+GdQjE2mYz
         EB15KhXRojWXtTNSpubmQg0cOhSgSqR+Yx+3bMiRKAVkCx5Ixy6+nY14BCN9fEH0L3fe
         9NcAnBj2AWEltbl3IlWPl3mug21YgyO/jrWoq9N+gF0HBtDLPx+HfZaI/lgXovB2W3X7
         alfR4rEwX2prTrI2ll6s8p1xSSr4nMcO0vghdn7EkqAPwofJkXgRkXiB8euKK6FcLZ35
         Ltci8JNFShWNJKzzkI/ZxG6Fw98vvGhjGH4O316PYTz2xkY0G8smbh6OUnlU9iV3+w18
         bkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400237; x=1754005037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkm+U+Z8JovOoe8ArAZBSUqCVEx3YFZYKLxHXbXYTzk=;
        b=PcJc78CHwOi/AfrFLg4JFTBHDABo6MPvLmQQBLkt+VbxfkxO8fo/LknfTW/K/eXIsX
         adiQmmSjGtg3BbuA81QzouRwj+FejGKsQcbcsBns+QVepaZXF18zLEG9M59iTbBAOye/
         79fDC6JeHLMKvB01Iz2SNefjPlGqMiNyxbug6/mrGqn/PHwBeDONcTj+DcXD7PsPJAIW
         V1RNNrfmIDZgrd2wMyRNz6JI3EXzYaRAqZFJmxLEfLZ1CecAt7hkAzTpNdT3YuK6bt2q
         CjIPf6XzPaGSgOcXxbysX0u9kNrES1KaiuYHA/jPiYF3ElQJfDORXr8N7Kj8FcC87B+3
         TcMA==
X-Forwarded-Encrypted: i=1; AJvYcCX5nwlFBDR4VWVMnYYOtimtc3y7hY/+zFLuGkCMAduHCXsZ3otN+ekQexBb6dbmaEm4wIbY@lists.linux.dev
X-Gm-Message-State: AOJu0YwGVz0yoXIV3xP520QPA1We2ZMX/HFsa2Lg5tmy51A9mg79ewVR
	acqzaSQiKUVuSHL/qQS+cQLxEn/QJio3FzRZy0e28pDucHru5jzcdxmaFctHq7QCyw0=
X-Gm-Gg: ASbGncu51yituwnBjSnKJeBSiYVBBY6LkbNcudKijW+wyFMyQEKxeUbxGIlcdbBH9uO
	BYIEpB8FqxEvRqQztt5jgnqOKv7XtW+s7e6tWoTsPV3VR7f8TUtWUmFmPfAAzzoPV30zSHY5d8H
	1UO2g2wflZn5k46082T5u8ts+OYe8BPJBjhAZ2uxJ7/pu+U8gfsjbE/5fvFO5WfjllpQJUUPzc+
	r5+Kx9HMwW+WztZS10g5fApe6O8HJ8PCC5uF6mDR4jz3isVGfLQ4CiWbF4K31xejYLD3/FWRg7t
	v1hve0bCjPvX5uGCH9F3Tg0SixAg0KC+xt7ruhMtYxVtvn3G8K2vEZFXCRFq4hGo6nz22SRlA7Z
	X2v/ZeUDJmGZFeC+9J12jU+ICMy4PD57Y
X-Google-Smtp-Source: AGHT+IH5SBpkVu16UrwUXGB277v+OXuJbFLj21IH8FU8jVfnMFq+cBM3PPB90wB16oPa9iIZanRWnA==
X-Received: by 2002:a17:903:24c:b0:234:9094:3fb1 with SMTP id d9443c01a7336-23f981afcb2mr126281075ad.35.1753400236613;
        Thu, 24 Jul 2025 16:37:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:58 -0700
Subject: [PATCH 05/11] riscv: enable landing pad enforcement
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Enables landing pad enforcement by invoking a SBI FWFT call.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index e4d55126dc3e..e6a9fad86fae 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -536,6 +536,7 @@ void asm_offsets(void)
 	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
 	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
 	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
 	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 #endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..59af044bf85c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -185,6 +185,16 @@ secondary_start_sbi:
 1:
 #endif
 	scs_load_current
+
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_LANDING_PAD
+	li a1, 1 /* enable landing pad for supervisor */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall	/* check for error condition and take appropriate action */
+#endif
+
 	call smp_callin
 #endif /* CONFIG_SMP */
 
@@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
 #endif
 	scs_load_current
 
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_LANDING_PAD
+	li a1, 1 /* enable landing pad for supervisor */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall	/* check for error condition and take appropriate action */
+#endif
+
 #ifdef CONFIG_KASAN
 	call kasan_early_init
 #endif

-- 
2.43.0

