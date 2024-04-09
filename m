Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419417C09E
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643129; cv=none; b=FaWSh48MjiLmHDI8EYRdjAhzfnb+cTiq/yWUELCpNNHKTeJH2f6ZqsBaqrshSFHDGTP1QHMXwcZf0FtzcdoZkfY/alPidbaGIFEDEtfhfYnww/4M14YImV2HQpPy4HpoNhzjPQDl/f5rX9UZNyxdA+2WUdD0KcdQxSfrETrbwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643129; c=relaxed/simple;
	bh=pgcQ0O7mGTa5hgvj/DeLVv7bktEQUMChSoIMdpY1ek4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ccP6RCKKyqIKWy53S6HcH+I0twxWh1dM0u+7f/uc5Ku117e/kvVDMujMJYyOZRrGiKvTMi/8b9fwyKEC59Kp5Sqgiq9DDQMwx6pYFw/hAVPtHOEU0uwf7aiTVYaaVmkKRLkWXcqgeGnXqqybLL3vvWDO8/+fRyc/sl9KtXnMC/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qpg8UQmc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qpg8UQmc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e244c7cbf8so43834625ad.0
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643127; x=1713247927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjtTgkYtpD1hbyyXFcP/z2jvjrG+SfaQnLJvf/Uiuoc=;
        b=qpg8UQmcpRixU/fhWzO4r5E5vIG+EfzHA7BNi29XecBz29Q0rgjzAEQ/e3LTGINhoQ
         IWiXYoP/1l6rhqBre4tHnPzPEZOHQ72+0BLklYESTrusfEB6KI2b7dquuDxPos3QcsOD
         PFfPD8pfnHGHOAgSGSO7u6sxlOmSr5RZKI8qu2irj+RKJULK3sKcEmvlWtPmHKRNJQN+
         qQsyoNsX+95jgW2WZC8Hk3jPXYkKcr668W0Syro5v0OpQNs7E2olnR7HmdoAlTY/qcVn
         W47VWckwdgCEWAwAkN/Er4HHv+UlQ7qKIMkEVj0MOzKvYgtsoUEtpOYB+B36Q7wxfI7D
         u34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643127; x=1713247927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjtTgkYtpD1hbyyXFcP/z2jvjrG+SfaQnLJvf/Uiuoc=;
        b=S50Zdo9IPP5/1ei8CK5X8/9dNpTi+yKIga4yeixTIUafGVKW8YO0uBWrAkf7JQ3E0K
         6XWbCLVBUdxQsPS9R9YJ0p5m6pXILNUQCTcuJu48VNY6iJDfT5w+OMlsbmXOarbfjSVq
         SzZFpMuZm8NOUh+c1TrxEUrOcnkqEt4cu56bhcFREDMLlETAOb7DcANmsO4QPlqOCgV+
         5yGiz6zOas/ejBTUC3vPJv9qXHkgi9oA6aTew8bCGLMiu/j/9cnn+BxQs02DZ+I8z0aL
         cKWLYJuEkBrdZh/fE+yWeCpANQhTnukIF9lUCogQBTwUXenPeGfh3D9U4ojJ1imZFe8G
         gxNw==
X-Forwarded-Encrypted: i=1; AJvYcCWfE+bn5BfiPcLxt6bTDWxjBWh6yLwepmDmW7k53OQsfjLsO0JKOhC+rfXrVIfZqBrTqfPmeBOHdo2/qrCmWx0dYARz3g==
X-Gm-Message-State: AOJu0YzaTi16IwXfDRHvdTqH60SC9olwuu19qY0aEILr7GI1pySwID9d
	ggr3NC/M4egySv0oN12M15w87uPDdJ8lidn3GB4V33jrEiPlwX3ZmuDFYzM9W9k=
X-Google-Smtp-Source: AGHT+IE/zrYmmP+jRMmProhU7OrEkAtvl+lojCdG3T5dMALi5Qk/NiBMoaQSS094JtfcnVR7MBKxhA==
X-Received: by 2002:a17:902:e945:b0:1e4:363b:1d42 with SMTP id b5-20020a170902e94500b001e4363b1d42mr4916637pll.3.1712643127547;
        Mon, 08 Apr 2024 23:12:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:06 -0700 (PDT)
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
Subject: [RFC PATCH 05/12] riscv: fix certain indirect jumps for kernel cfi
Date: Mon,  8 Apr 2024 23:10:36 -0700
Message-Id: <20240409061043.3269676-6-debug@rivosinc.com>
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

Handwritten `__memset` asm routine performs certain static jumps within
function and uses `a5` to do that. This would require a landing pad
instruction at the target. Since its static jump and no memory load is
involved, use `t2` instead which is exempt from requiring a landing pad.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/lib/memset.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 35f358e70bdb..e129ebf66986 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la t2, 3f
 #ifdef CONFIG_64BIT
 	srli a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add t2, t2, a4
+	jr t2
 3:
 	REG_S a1,        0(t0)
 	REG_S a1,    SZREG(t0)
-- 
2.43.2

