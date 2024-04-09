Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8236BFA7
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643121; cv=none; b=PdfqGSTVLvQGbF0TAmk6KYLiN73tD8/+4GOJEL10Blpoctf10IpHWoal0bsBwu2u3IAsmCQmLX9bGPFH3o1B5jgbwYqv8dyuD1uuaEvZA2Ra/H2NdvYFZ8o/5PiQFLHFiXFSB6b6RWp7mty25XJfPB/2q9E5ZoEfSIVqG6zUbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643121; c=relaxed/simple;
	bh=aTNO1ABW1f6u/pDlUoZ25RSB4Tc0wK6ofM82v3IX734=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bCpYFqUIj2M6yDiNpnfYosg0JTPOjRfvPp7FQmIR7q4N6XZmhFuISwT9/4uLk8OmP6NqfD4LLsm44wOTXdhXbEvdVaVzs5b2ogtUA5KCRjGQETK2jKsK+6wtxQCOY6lqXDP/x2Pd4EVvTHje5OYljk5w1UCV2l+owpMdNX1SOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ajqASTV7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ajqASTV7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e2bbc2048eso43139735ad.3
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643119; x=1713247919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcuZpfGRgGO4PsnKOQvZ0/6LAFx/q/APYxPAcu5uNV8=;
        b=ajqASTV7zEHUq7f5uqcgQk+vLOqkAAYM+IUqjj0evcGQVEw3LYPS0K2X1smU/2A+oC
         NY8OA2nDhfkX4Q37iHmpLci/LRWBnQNC7tikUq6IoUhOxmmZZEE2c07SAVedS5BTryWP
         botFTc0dIIgG/7fGBAd3zE1/Scr3iVTOujajoM15ekVjQwnM3w8y4xoZ4+WyDVc9QDyN
         JUlWCBvqr31eEsjcqlUfqfAWbM5kNxrai1vEpZKgfbeKDKDSjplpI33EbdVQYhTbFaBd
         AoHnl/04azXxs5eOfjOLgNJOMTXUtyiXrV2Trsw+Z8CzaOjy8WDi3ch2dNx4ZGwnk5dp
         qBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643119; x=1713247919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcuZpfGRgGO4PsnKOQvZ0/6LAFx/q/APYxPAcu5uNV8=;
        b=Ah1lkLvVPe8QqQEOi5jnVjTPa3sfzi//o/AmYzIfCZgBZIQRy3d5ep092avQDz44E2
         Ag1+Xxrx/DpyT1cCJEnAwhygqmGeYfXuq6E2qS7am1tGFce9SQ++DIwm2XNUxN+5Ptw0
         iJtjpSY2Lu3UQu1zuQiW/FFPSUiXN3uAWsDZ2idhp4JBGfrLDybUxSIJoKqokWqSN2HU
         jpeMsqQwyR0Y/U9pKWq+pPb3VY37HpkzzusldvsENxFqMxZB2BgHCuk6XVYu2OygWQd7
         mvSAKhyb84KtPDMIQ6lkE5jLN4Adda36fv4tvEwgFfn0ypVIXW1nm8v7iRzNJGkgYV8F
         2gjA==
X-Forwarded-Encrypted: i=1; AJvYcCXDBM+n+rDMxMyDxMbnW32Gsc8SAM98kgIrUjg8y5Rc4UYNktUPRDkDzj68pYeO1i8KDfhz5BT+VOjJ+xF0t/a/z+0bhQ==
X-Gm-Message-State: AOJu0YyWojdo9HSkIwYz9/nU7bSmIO5pBdGLpvwwCwL2b5MlGsM+RpJz
	EYsIpUj2zHXaFRSnqvS89bq7ttvSVFc71YlK6J+6TmMRTATr9+msO/A3MgMDnHE=
X-Google-Smtp-Source: AGHT+IHz5LLDJm9L/ug/kMuH50Vd0ygUg9H1jlsD50c28BOoXEgFzWtj54FZrZCvoiYay1yGeroD0g==
X-Received: by 2002:a17:902:c401:b0:1e4:6273:bff7 with SMTP id k1-20020a170902c40100b001e46273bff7mr3872287plk.25.1712643119038;
        Mon, 08 Apr 2024 23:11:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:11:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 01/12] riscv: zicfiss / zicfilp extension csr and bit definitions
Date: Mon,  8 Apr 2024 23:10:32 -0700
Message-Id: <20240409061043.3269676-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..9f2b2722b67c 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -196,6 +205,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -214,6 +225,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
-- 
2.43.2

