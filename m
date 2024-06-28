Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702651586D5
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575300; cv=none; b=CYna6lP05wXfSMO73SzWSv7+GLuxfT2LB9KLGqp2mOnDR9L2ekDlnwCMPJNoYT4gIQZCLNCdf98DNVUs+MHPmvGYadLR9mIvmUWhHMmNAHKm6grSERK7NLB1Ffj3x+ihRMz2G2GkbpKWWxbbOTYk5FBcFW0BheiUiphTWd5aIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575300; c=relaxed/simple;
	bh=UhiZWbtPayXSi9RNM0VYEXBYKMhQIiIzIJJ8km3RMRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7Eg6pBgCXaUwPVPnr0Uyd2A9/7Lbz2icF/xCCvRbbKbfWNgGOaGo6vwbki4z5t6L3HYogIfhNw7eM7WPQIpBk2SqTnB82YUhsIjLbyrf/lqYy4C6cV1fsqDsUvanQtScW2kCcNmboMAevUP7d2sOMBWTupiXUrha09wrwSdSvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Au8I/kzw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Au8I/kzw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70698bcd19eso379432b3a.0
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575298; x=1720180098; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBxLbBg2C0mDR/P/oLexeudRwTh8PG2S5E6XUY0XYj8=;
        b=Au8I/kzw3yjxA0EPKEqleBdFoX7EcPONYrlcqo4ZIwx2A8me0Y1JhYPgBH0WQi72Zs
         r50jTM+tKdcHwI1SEoT11MHYInC/w0ESkns+N+gdv3Wm5MHlg0kx9rQthQgxhSKQy/h7
         PrTsuryQo9KzR2wt2+/FaKQj4N+mXdM3o7deQ1PxLwQiU7CXG1WFfBGnCBYQ32xKQUjx
         FFdHVrt0aECdEJP0c39mB4aR+n8OBalp3+hxjdsNaiMi8C6BLBJJSiwdzaWJQFcMl7JL
         i/TVfjKqf2gceyUf0yxj+UbxNQUHIHJQsH3lJqvpVsAkBobpgt5sF9A1+gX2FDgdQQBS
         swbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575298; x=1720180098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBxLbBg2C0mDR/P/oLexeudRwTh8PG2S5E6XUY0XYj8=;
        b=n5x2iW9MAU6Bs39hdPM5J8fktseEVR3Hxt7ZJZnvhmn812PJaXXkxwjG9eaouhEA6z
         Rs+qzG4weX2EdEs90ef/Kx5P+qS8+DxpM4SiWIQQH5iMhEFTDRLyG+kj87GMIS4tV5jF
         UoZfmfEwQsVN2HAhfsJF8UKubIYEVdwrb8V3iIys/V/L3O+NytyehU9bbPtTsSsMIEgu
         0SUc5gvSkPAg7ckEU/ddKDe+mhJngTKYkztDVo12nHKEPVBlFWGLsBPBMKK380A+XBSo
         kwtfODqE/ZZ5h6loFaUtHzq24fPUqZ+Tm9lJZtiGrGLpDenJNUHD2xwlkcfCabsVA0yA
         JfQg==
X-Forwarded-Encrypted: i=1; AJvYcCX90YNojiO0GEaPxuhk9JgPaGzX65i8Y5KyKEtBTizk5MO7MTlmMOMG8SvXiT80WdTLwbIvJeRNAUGz0G4rRSzBFdXWhw==
X-Gm-Message-State: AOJu0YyG8qQHLF/oK5BD6wnafpuPvcuavXhUUhSQI/9DF5i4EuKsaO3/
	/gROWc7FyQOdanZHBp6NWCi5N/zojIh7Iz/sD0VIiRNMQfY9DWh2a7Pk/4QeCcc=
X-Google-Smtp-Source: AGHT+IECg5NMB5OG9EYHIh91F3Lk8CJ30f0YqfGF81UIYveQZi0LXlob9MKuuQ4bFTTbGJMqs4SwPA==
X-Received: by 2002:a05:6a00:1796:b0:705:c0a1:61c5 with SMTP id d2e1a72fcca58-706745ab97cmr20272333b3a.20.1719575297284;
        Fri, 28 Jun 2024 04:48:17 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:44 +0800
Subject: [PATCH v2 1/6] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-1-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4

Some caller-saved registers which are not defined as function arguments
in the ABI can still be passed as arguments when the kernel is compiled
with Clang. As a result, we must save and restore those registers to
prevent ftrace from clobbering them.

- [1]: https://reviews.llvm.org/D68559

Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Closes: https://lore.kernel.org/linux-riscv/7e7c7914-445d-426d-89a0-59a9199c45b1@yadro.com/
Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/asm-offsets.c |  7 +++++++
 arch/riscv/kernel/mcount-dyn.S  | 16 ++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9eb31a7ea0aa..5f81c53dbfd9 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -144,6 +144,13 @@ struct ftrace_regs {
 			unsigned long a5;
 			unsigned long a6;
 			unsigned long a7;
+#ifdef CONFIG_CC_IS_CLANG
+			unsigned long t2;
+			unsigned long t3;
+			unsigned long t4;
+			unsigned long t5;
+			unsigned long t6;
+#endif
 		};
 	};
 };
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index b09ca5f944f7..db5a26fcc9ae 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -497,6 +497,13 @@ void asm_offsets(void)
 	DEFINE(FREGS_SP,	    offsetof(struct ftrace_regs, sp));
 	DEFINE(FREGS_S0,	    offsetof(struct ftrace_regs, s0));
 	DEFINE(FREGS_T1,	    offsetof(struct ftrace_regs, t1));
+#ifdef CONFIG_CC_IS_CLANG
+	DEFINE(FREGS_T2,	    offsetof(struct ftrace_regs, t2));
+	DEFINE(FREGS_T3,	    offsetof(struct ftrace_regs, t3));
+	DEFINE(FREGS_T4,	    offsetof(struct ftrace_regs, t4));
+	DEFINE(FREGS_T5,	    offsetof(struct ftrace_regs, t5));
+	DEFINE(FREGS_T6,	    offsetof(struct ftrace_regs, t6));
+#endif
 	DEFINE(FREGS_A0,	    offsetof(struct ftrace_regs, a0));
 	DEFINE(FREGS_A1,	    offsetof(struct ftrace_regs, a1));
 	DEFINE(FREGS_A2,	    offsetof(struct ftrace_regs, a2));
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 745dd4c4a69c..e988bd26b28b 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -96,7 +96,13 @@
 	REG_S	x8,  FREGS_S0(sp)
 #endif
 	REG_S	x6,  FREGS_T1(sp)
-
+#ifdef CONFIG_CC_IS_CLANG
+	REG_S	x7,  FREGS_T2(sp)
+	REG_S	x28, FREGS_T3(sp)
+	REG_S	x29, FREGS_T4(sp)
+	REG_S	x30, FREGS_T5(sp)
+	REG_S	x31, FREGS_T6(sp)
+#endif
 	// save the arguments
 	REG_S	x10, FREGS_A0(sp)
 	REG_S	x11, FREGS_A1(sp)
@@ -115,7 +121,13 @@
 	REG_L	x8, FREGS_S0(sp)
 #endif
 	REG_L	x6,  FREGS_T1(sp)
-
+#ifdef CONFIG_CC_IS_CLANG
+	REG_L	x7,  FREGS_T2(sp)
+	REG_L	x28, FREGS_T3(sp)
+	REG_L	x29, FREGS_T4(sp)
+	REG_L	x30, FREGS_T5(sp)
+	REG_L	x31, FREGS_T6(sp)
+#endif
 	// restore the arguments
 	REG_L	x10, FREGS_A0(sp)
 	REG_L	x11, FREGS_A1(sp)

-- 
2.43.0

