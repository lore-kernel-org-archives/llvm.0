Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527313D240
	for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263979; cv=none; b=mGUECk8weZ9hSKGSjXQf18Itf7kkrrOxikeYr0vI9XnFGky5I6AbvERjw5Uqukc8mcTn4ioKElCfwsjZz75JYHZk1y84pRIRxDpnsSkU4BR63Y/ibAi5KQBjhsD+ngxDupFX4jjWQLnorRUddpA8lasWLAdf6SBFh4ZIcdmhHP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263979; c=relaxed/simple;
	bh=Dx2FUFHDH8Y1zN/f24u2ocIVhF64yQxKbwIv1iUM+u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buhcKNXkRiAFddd2P9tIky6EXOQwlIOGxTp1ekxM0reSErNRNSyXBmjJI3SpfV6Wt6d+0YRutFOTIUsA83IUoEI8j/iKwk07E52nzgxOR3nQy/NvG+YVHVF87w5+irPO95SDHVSHI4XjYPlghBVKC9ZtuB3l1D1Zwcs4AfAlafA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ZWOmx2nK; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZWOmx2nK"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b9f9e7176eso370253eaf.2
        for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263976; x=1718868776; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTElu2O7G4IRv2D6Es7gQcAecPf3onDHBKt+B4ik+4k=;
        b=ZWOmx2nKyektZTXy+zyNIFcc5xcWg9e3+idBRYMXQOKv57qhkH71jJD0D3RTGbLXNe
         6SlSYTjMmM7lbR8muLLGfBXmxk5A6z4SIDcppSU4H+9yGoYl36u4aU/fUQF8qxxm4+Fx
         X6ADbx7HO/vSKvDUYPbB07RTC0Zy6+fOF3tjXFsQZcMLX62r0mr74YjYg9NQlTvzeR9X
         pbv/gv+ZPaBtCOk2+ZYj4jHKfNvNV7+XPW8KjCkjhj+BF2JwMInTkUzKwJWfCrz8OKc7
         f5xGa/fXgpyU7a68PewegAKSg4OdFuc9heou+0+1FRNJUN4Ru9pmWIu+++hbbCs6+t/i
         bWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263976; x=1718868776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTElu2O7G4IRv2D6Es7gQcAecPf3onDHBKt+B4ik+4k=;
        b=XxxxikkRjEPZQKJ5GF7XIeZqIHiH2XgC7DfrMsf4idETEeGeaymr5xyN00VRlulZPo
         zZIFOUfzF9w26ofh1h4EO7SVZbeHrGisNCMu8i+QdNaKkAk8iMmLrtXKeLeHJVEcxJ+E
         ZM32OhM71g7LkACA1HISdinxgar86fCDzDHmIrC8IwBhOFJciddvqPBWUHBzIm0vMwYj
         WAAif63bVnpRqvZNOj1+vV0Tr8TSA1Qg2jc3cowfBA77rH0X8qge9qeS/f17BuRL5x3B
         Xad/8IEQ6KH8opwp+vpMSjPp/5hzakIVq+AJ2BRUZc9nB2NUQt5HmHjWeRasDGEiLrpf
         QaOA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Lj5ClnjN/iPzYLE77HVSQmoBhmmMnUw/YcKKXEt2L4nwHqPjq+RMrISoFHZMIWcfeI63V4a6Khil9BIYmXbh6dm4ng==
X-Gm-Message-State: AOJu0YwyuzefIbDEXfbYUVx5Sl/K9BQl7HK1uu6D/9vqS3x+ufgmrU7r
	4vXTEoeUYHjc3dnaiEz0zzGrYwROrBFVq/WJ2kC0v+wJYeuzh6yvTCD9Qky3SW8=
X-Google-Smtp-Source: AGHT+IGdJsIqWxldlAuacUU8l0dK4I8dOhgAshBKtsVS5QR/psuALrZ1MwA3KVg0EXK2RXnVq6OGZQ==
X-Received: by 2002:a05:6870:c087:b0:254:a9bd:70b2 with SMTP id 586e51a60fabf-2551501e0bfmr4485943fac.59.1718263975852;
        Thu, 13 Jun 2024 00:32:55 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:55 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:09 +0800
Subject: [PATCH 4/8] riscv: ftrace: align patchable functions to 4 Byte
 boundary
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
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

We are changing ftrace code patching in order to remove dependency from
stop_machine() and enable kernel preemption. This requires us to align
functions entry at a 4-B align address.

However, -falign-functions on older versions of GCC alone was not strong
enoungh to align all functions. In fact, cold functions are not aligned
after turning on optimizations. We consider this is a bug in GCC and
turn off guess-branch-probility as a workaround to align all functions.

GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345

The option -fmin-function-alignment is able to align all functions
properly on newer versions of gcc. So, we add a cc-option to test if
the toolchain supports it.

Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig  | 1 +
 arch/riscv/Makefile | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b94176e25be1..80b8d48e1e46 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -203,6 +203,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
 config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
+	depends on $(cc-option,-fmin-function-alignment=4) || !RISCV_ISA_C
 
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 06de9d365088..74628ad8dcf8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -14,8 +14,13 @@ endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux += --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+ifeq ($(CONFIG_CC_IS_CLANG),y)
+	cflags_ftrace_align := -falign-functions=4
+else
+	cflags_ftrace_align := -fmin-function-alignment=4
+endif
 ifeq ($(CONFIG_RISCV_ISA_C),y)
-	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=4 $(cflags_ftrace_align)
 else
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=2
 endif

-- 
2.43.0

