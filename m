Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDF7BAEC
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643127; cv=none; b=q+uItEhp24JIDl+vSDI0rsVLrExHndkcIFUazSgw72qvBbaktxPzaJ9M5InvekUsNi8f3dsYX69lzoCnBfYBGnveSTUfsTUnZw5LghBu84NoDkDY0ULXmnXV/OIpCsgVGgGB2pdmKHFHD3vAbN3jLmi9l4qp3ZO9z3Bovj/5w5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643127; c=relaxed/simple;
	bh=q12GxppowlvRFXq75ryC8R5A1MalQLYi1g7lhdrusLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OYjUGcEDBrG4CdBOylTziRxGlQE7170F2xs1SyfQnpFEGMtiStpmi0J5e1PEX3p1wcp+1iaAB1E6+k0flLIo1Tlrt+qMrZrOHW3/LvalBUoc/wN2RWehXco+OhKoLvxO6r0bHvyJKeRasrsC00hJ0SXXUXK2POhnKLKun6CbsG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NQvxztqh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NQvxztqh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e3f17c6491so18602435ad.2
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643125; x=1713247925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyLlHJKX0lMHHliH3LunddmcG89n9f9Z2NkEHCH/heM=;
        b=NQvxztqhnsyeNezV/FV2aJ6R3VOoDpcyix2Rnq/nUaxZailsaJJZB2Qq+lmBxMgYZ7
         DCc7W3YpBPdyyJi4h8tHQt21/YaiDsQHtIfKGgFxe8JCYD4Iqd0NK8cdsnWXQQAWxVWI
         gRYsFCsKo8oySqpdCXFG89nqf/iXZ+hYOlTnLgttkWRqsbVATYRHJAkVz6lrHetnBUd/
         fX/OvuTeBpb7u/fQpHhI6R1xuWXRnyBtSV5hhFqX0eDwSjLeJx6x0Nc/A+RZQMkV7IMn
         e0VljOlNSBbjfQ3kti3zx5SU2qEt5/nB1aeYgypKQRj24pKz68aTQAgP2guKpdJbXQpO
         P4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643125; x=1713247925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyLlHJKX0lMHHliH3LunddmcG89n9f9Z2NkEHCH/heM=;
        b=CjB0vswajLnczvj1asRDZEZZf9R5k1WS+4ThxF77IPscu7t7nianmiBOEObgDpUlvk
         C1ptWzJbkaqaj3OaFJoZJuADQbCX3KK3wRMtN4jC63RSYIFjKulV5u+60DP2Pv5Ec4oR
         0k9oTDk4bJAPqybxdx0DJxk9IhRa4FYnVqIR82qUGra7juciyIltlDQ84dsbU4u/DQ86
         /XClz9HGR/xtYZXPsRjUJjAzMT58DWScnGc3UCD3EdTSv1Se6gIJXLjKcq1ULmxlJXqq
         2e5rjno9SSJtkypY262hk6d8Z52vSweib8epGjIbnYZQI+zj0P7FyVMhMl0H5MfvCqcq
         4gPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS/QqDHmjJrlCya/9OIrxx7U99teN7x9YzOxZXSVI3h91Twuh9z/8pFSOusxwOMBs3kWogWbv5QIKHr8gXljwUrykKow==
X-Gm-Message-State: AOJu0YxSPUyJA/etthRI1noMoyP0iBbI5LXFn5ORoxJx75uqV23IXlhS
	fFvdcBBVnMG6v3VdXXYTUJJzVvWW2oTsbQgY9dBEfdblKbnS+qI5fLicPdQIpyw=
X-Google-Smtp-Source: AGHT+IGL8mfXw1okbZ4dRjVvOwEcO62l/RlkfUkZG7ORslpV7FBhWFsCcs2aRsgrjDOA1d+dJmo0hA==
X-Received: by 2002:a17:902:e409:b0:1e2:992a:ae3 with SMTP id m9-20020a170902e40900b001e2992a0ae3mr9134870ple.45.1712643125208;
        Mon, 08 Apr 2024 23:12:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:04 -0700 (PDT)
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
Subject: [RFC PATCH 04/12] riscv: update asm call sites with label setup
Date: Mon,  8 Apr 2024 23:10:35 -0700
Message-Id: <20240409061043.3269676-5-debug@rivosinc.com>
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

All call sites written in asm which will be converted to indirect call
form, they need to setup label register (t2/x7) with correct label.

Currently kernel is enabled with consant label of 0x1 for all functions.
Thus label is setup with 0x1 at call site. Eventually when hash over
function signature based label is adopted, such callsites in asm needs
to b updated as well. We need better scheme for that (some macro)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S   | 2 ++
 arch/riscv/kernel/head.S    | 1 +
 arch/riscv/lib/clear_page.S | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index be07355b9eff..a35050a3e0ea 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -219,6 +219,7 @@ SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 	move a0, sp
+	lui t2,0x1
 	tail handle_bad_stack
 SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
@@ -258,6 +259,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	load_per_cpu t0, irq_stack_ptr, t1
 	li	t1, IRQ_STACK_SIZE
 	add	sp, t0, t1
+	lui t2, 0x1
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..6c311517c3b5 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -165,6 +165,7 @@ secondary_start_sbi:
 #endif
 	call .Lsetup_trap_vector
 	scs_load_current
+	lui t2, 0x1
 	tail smp_callin
 #endif /* CONFIG_SMP */
 
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
index 20ff03f5b0f2..16e63ea91baa 100644
--- a/arch/riscv/lib/clear_page.S
+++ b/arch/riscv/lib/clear_page.S
@@ -69,6 +69,7 @@ SYM_FUNC_START(clear_page)
 	ret
 .Lno_zicboz:
 	li	a1, 0
+	lui t2, 0x1
 	tail	__memset
 SYM_FUNC_END(clear_page)
 EXPORT_SYMBOL(clear_page)
-- 
2.43.2

