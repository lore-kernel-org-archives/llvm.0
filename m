Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2A7E767
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643139; cv=none; b=PwoYC9C0XehndR5d+XwaqyKxY2dN+gTzh6zqIJ09rr7mC5f3qqpobN8OWJgGY5Hj3CQuzlqiFWwSO2XGtMVs+R1YGcelKdmJltMy1ps+DBHgmTTMwC21ibEvSLBBY2ybcP8jh7CbobaF/EvJZu5wyldFJhScGwdNvTk8FlVYRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643139; c=relaxed/simple;
	bh=wl3aqJRZY3tGjSAdrBhGHd2RCmOZTytU6+iHNOCOXfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKSJtqooon9vEK0mIRXb3FsbfVAp1/MVsSg5DwE3ylG7EVdpiLBd/qsQJ7EzXB9KZ2csNVxFPSLaoRUkSYTKkXp4g6xzTJMrM7+Uadrvc8hAgRilKBBOxrtQGltAe2S8a7DhWqmYxmBKv6KVBrIqYdGrf6Bq1/mTWvdh0l89yxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=umlzJ5st; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="umlzJ5st"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ecf3f001c5so4296035b3a.1
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643137; x=1713247937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dd+qicqNqOTXPUN+vfB0pN9kY+D/OYBSctt1TBOZeY=;
        b=umlzJ5stga/Sc3GqR1vIiED9FajYlhZ5iG9QSlcYrlb20SJIifRs0EdMgCDk+OnamH
         tqj4nsCajdN4qih/RJirdXCH/4IHfC2lXiWgf+OusZKUCGdTeWqCTautnIW49gV2nTDK
         2ZdumDw+W4v0IyyWFB+qcmi0u0g4YW86IhZ0TSpqDASqxzEcv7dGtoOwLRWzGmy1iIjE
         PXr/gO8FkCn4fYujueP7Cq9LppAHu72uOaLPJGZ40chzOzaAB5KJ9oDyQSTNMQgSeBkv
         5pUyxcyGQcG/nDEW+oAohVJ54anZqeyBQ22+0mmclvURu5kSYYubbAS9QFrTQXa792yb
         s6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643137; x=1713247937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Dd+qicqNqOTXPUN+vfB0pN9kY+D/OYBSctt1TBOZeY=;
        b=j9GEWkwHdMEWFLAqat9WFDPEd+te6AyRw1ON7/u7jPjlwKyusUMdlwKlqF2jsv1vRH
         qaTS0WqXOIEMS9L7b0oHx3n2Zib8rJAfYOKTD+I6p3ApNahwvy8Hoz2nCwNUKMnxvCcC
         hKF2pJXzN159f95BkAw1wT62bx/zQidO4Rsjg4GiFUCjH5dBPiJpOJD9vv7nA0XRofB/
         gsoEKbpsBuqf9VwqTa/mbqVcT06y8Rpi0KJkdh3GEWGfJZcmap4rCNNiXTy3BCgzlj4X
         t1b/Bt+TsgLTuiIXM9lfp4KRvAybOn/DglGVfnKTK2/rZg5Y+FBgXpNID5AkX8hBuR6V
         brkA==
X-Forwarded-Encrypted: i=1; AJvYcCXR3SgOBQKoatgujHmqT9blt1Ceh6VaKXEPVUO5dDagJLNHlRV2/JjFecU9mlqWgOIESZc2yJSxs7awt0Z3dooIWcrHkg==
X-Gm-Message-State: AOJu0Yxr0x0c9Vy6QotMqqTtXZAo0dDe9T2Kqw5RINCQBEBnTmsoif6v
	TCBLK9SZ7ZyPVPXY/uq54e8AER0jv1ZgwqLch5WOKMO/qNYVwVZqRDUp+KBiay4=
X-Google-Smtp-Source: AGHT+IGcPqN2fScaedBq3ewRagrgaPjfyc3cvTGWCEiCpjBURAFRRAm2I2dL0qDPjIDkD3S3Bq2SLQ==
X-Received: by 2002:a05:6a20:de15:b0:1a3:e2ed:62af with SMTP id kz21-20020a056a20de1500b001a3e2ed62afmr8155980pzb.34.1712643137498;
        Mon, 08 Apr 2024 23:12:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:17 -0700 (PDT)
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
Subject: [RFC PATCH 10/12] riscv/traps: Introduce software check exception
Date: Mon,  8 Apr 2024 23:10:41 -0700
Message-Id: <20240409061043.3269676-11-debug@rivosinc.com>
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

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

If sw check exception was triggered while in usermode, unknown trap is
triggered for usermode. If sw check exception was triggered for kernel
mode, kernel dies.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/kernel/entry.S               |  3 +++
 arch/riscv/kernel/traps.c               | 20 ++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5a27cefd7805 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 0262b46ab064..89aeae803702 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -353,6 +353,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 05a16b1f0aee..b464355f62b2 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,26 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		/* deliver unknown trap to usermode */
+		do_trap_unknown(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel, die */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {
-- 
2.43.2

