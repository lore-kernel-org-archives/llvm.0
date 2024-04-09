Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659E7F46F
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643143; cv=none; b=fBoWRV/E2BayMcP8gngvQq4NFwZIL/wziNEH78uQ1SY/057cxzX8CpFbLtovVYRYWKx/IjXAf7DhdacR/iDYKwnlBNWrt6v4fER07E5I2jSkiexdxDyrQr2Sy6Av1NUxs+tgHOtwgHuN6EOPVm/UjYo7DlAGasiYzSj1cMHYNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643143; c=relaxed/simple;
	bh=1SikFsWtrh4t3FaHmFJAwNEHKw890mcnFlSrj+OgNFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c1sHijOxAyN0qIc/jbtr3yqhwzJ9GrUwZQ2fxTjsZrtqGCkXeBNt36Y7SCI6LxhBKHWzYrddw+5Hf9jC19KmEnkvMLaNKRHeTw8HjtatFpH2FSFGBHbl9y88iG9HBnfTksuhdUZ5C0PlflmaxzOxJZbIVTEzBvtpQGDFc2nbdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RTEXWhRS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RTEXWhRS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dff837d674so44942405ad.3
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643141; x=1713247941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eyLRloSfAm4VAbw2mb0vtlUweaMWaSGQ+4ZLH4p8KE=;
        b=RTEXWhRSWSWZHnAIbPzIGWKC2NvSttRBk1kfDLvHAA6aWl/OE3y1IVlY6kwjUi6VTL
         R6YMQR1bzh+QA190mYKxMnE7OTzfIDAz6ZQmdqb0f37Zq7Z9hgItFkexrEGV3djCkKHj
         s9sh9VMjWAx9aGusnlMQ2A9EKRcMwxoL7yFFUDInmKZdv8/yeb8W+Lm/Fm2IT31qIrDN
         G65PTymVOCpvs9xI61OpCW4dbXDQc3SKXeMwh3vtSUM2XRxqBfp0OwXXRQ4086tBjlRJ
         V6YSzNsHpdFfqvvxTqFgZxlBcS2icUEJP53eN4LXAVVR2aVZJxExLdqKJ8hJQdH2blRR
         0ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643141; x=1713247941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eyLRloSfAm4VAbw2mb0vtlUweaMWaSGQ+4ZLH4p8KE=;
        b=Fex6vArJhFQkFIZjVO0q+OLyzS0zQp0ImOahS6QDzG2m2tCc9BweIroLmm+Qijmxv7
         FZ0/LBOx4u//gnv6kJXA02MgshTPOPrzuXHSFuxhgUvxRNGtJLv3LsDE2OoDf2/WgCPo
         /k89TfcRaCQfFJLK2Kt3BQDmfo+t30X9OsQKIdsdPMDZo66pyvLqSYnT1JO+svRpfGVe
         3rxDm51hooYCcURZ+qB6hlg81H3JCG4QNVXNbP3nJQm6txrgZoXcMyGPQv1hOUhZxFgf
         HGiT/Aglgny9GGi1/hkE26f73kaxeSVxEc2TWiurBxknGQc65cfj2HPNlZI76GMDb6nj
         bnhw==
X-Forwarded-Encrypted: i=1; AJvYcCW/du8QmcWZxqOAxURVFIZmZUJp0DBmRuBntg+ktjFZ4CxL1hHrYbOAf632vKypde+GGLfP5EkXI5rCqTm+xlWcN3BonQ==
X-Gm-Message-State: AOJu0YxLwEhyJcsYi8S0c4tZij8Ud4mH/1VavSevSBZ2JrbYQPBWXG/j
	yYUy5bIobFMRdmw3Brxg9d4nEJrkjzGQOjWWesQ+f0EPp5Or6GhafcreItBlW/A=
X-Google-Smtp-Source: AGHT+IF/+B5dCZZ2fDAsFsANYw0fpAWmmT/lMg64J6EsXmicMtuMSgnbMt5ZcKKjDaAElTdglXn3vA==
X-Received: by 2002:a17:903:2d2:b0:1e4:1f86:88d6 with SMTP id s18-20020a17090302d200b001e41f8688d6mr5701471plk.17.1712643141573;
        Mon, 08 Apr 2024 23:12:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:21 -0700 (PDT)
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
Subject: [RFC PATCH 12/12] riscv: enable kernel shadow stack and landing pad enforcement
Date: Mon,  8 Apr 2024 23:10:43 -0700
Message-Id: <20240409061043.3269676-13-debug@rivosinc.com>
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

This patch enables kernel shadow stack and landing pad enforcement by
invoking a SBI call. As of now it just issues a SBI_EXT_BASE and a hacked
up opensbi implementation sets the LPE/SSE bits in menvcfg

Eventually, we should have fwft [1] interface using which kernel should be
able to set this enforcement properly

[1] - https://lists.riscv.org/g/tech-prs/message/833

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/head.S | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bc248c137c90..1e5bc7b2ee75 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,6 +164,13 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	/*
+	 * Temp hack to get menvcfg.SSE=1 and menvcfg.LPE=1 by invoking
+	 * SBI_EXT_BASE
+	 */
+	li a6, 0
+	li a7, 0x10
+	ecall
 	scs_load_current t0
 	lui t2, 0x1
 	tail smp_callin
@@ -313,6 +320,13 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	/*
+	 * Temp hack to get menvcfg.SSE=1 and menvcfg.LPE=1 by invoking
+	 * SBI_EXT_BASE
+	 */
+	li a6, 0
+	li a7, 0x10
+	ecall
 	scs_load_current t0
 
 #ifdef CONFIG_KASAN
-- 
2.43.2

