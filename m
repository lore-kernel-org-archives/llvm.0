Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519D54F95
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710185512; cv=none; b=OhZ3CmZSn94WTermgR9EBCQAHpNHA7hE7YvCCDj34SMV5oFqgeFA5GorUVEjfVN4SZt2vat5rUVht1o/T9KT/uE4f4ZBFc8Wv3geuPByiCZb/g43qIk6ouD6SHVquH2yg6w5/o9/ef5uArcNpd/qLUdLlB4MO5NdcbhYCUZ0ec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710185512; c=relaxed/simple;
	bh=P9wUwpcw3NHUEai0EY+p4WNxdtLcGXphsLbKEdtDEg4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=py9m1K0u0x1tHOkB9UgcDQ4koAhJPVtQzR38kWhyr9O/5Hl+kbBlAr2A+ltQYJ+lBqfo8TaRhWa3M27GRCPBvwPfsCNF9cMdrkP4O8cMkdrVz4w1jpVpjo+Q2tnxAaKnzQ1mC49+XiQ4JgQCi7SK5FvOHnP4C+R6uuS736P5qGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gc4KPRQ0; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gc4KPRQ0"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6e6a02357b9so177977b3a.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710185510; x=1710790310; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cy5o6m+sWD55XX6nTI+EYS+h0yuQMLX62AkaGtKJN/Q=;
        b=gc4KPRQ0XjFDLsj4MzSuD9omnPpcdDjFzQWl4o2Cg4xfP1wjLDAuy9m1kvX3cgdZ+u
         qFpsRvcUuNuUVUuO8prUCExOcJe4fLokjXdHPDAEhLyi2J12wACgQuzANowiFtMHNtu6
         sDrhw3UbTCl2voWNVgJ2+rx5lKln3Hqy0X8No0ZOComeeOkw+1bfHpu6JraeKOB4kzGD
         L/Jw1aA/GBDeUICB8HXY8ILl23TR8neC6w+UhaTGU4WokV5ThDAeNI6PZb3Psb/YlDaS
         vjaYPg8cb77rHz9yA9XDbfC3r9SfRNHq9140/7jftq2/C38yS9Yh1qjNnqrNuU9QWq6T
         NIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710185510; x=1710790310;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cy5o6m+sWD55XX6nTI+EYS+h0yuQMLX62AkaGtKJN/Q=;
        b=vdXxdD4K/AR5QVLM/gA4Z3xOG2bU0/s6JS+V1HwVwFchqSxsYWjgzFqMRv0Pilq7ST
         mWaZywocvz25GCjETO1XpuCYq1fiCfAz/JdtmB1lQ1t9TCab+l2sr1t8CutIzkLuhimh
         3TUNSW4Is0hUb8mkR1gK8DPzu7Qnto2DRVC18rM8UiiJHb7KTFCKCSMWTM3g9G58GPjR
         cvqmrNGWpQ03RcvTJpMcf0jTuokqxk3Rx7PoIUk0buAosTR5xdkgyQ5EnYFjYM3XRoYr
         3UxjofhH9HSP/l8h5SNuvn6soPpre/72jvLKusEKPzPbn9YMbiAZm42iOid2OTwFxZHG
         0Rvg==
X-Forwarded-Encrypted: i=1; AJvYcCUVhShCWzXaiy7upCGEmJVtSpO0G82ruclMH1VPFWjKqZWniJmi1onBNjxhTRPbWPNQRynOwQTS6dFj6VU5Urw32iCSjg==
X-Gm-Message-State: AOJu0Yy4qM6A7C5qNBVBop0w0n/E+ZmI1ITE7xjGnTa/q3z9u6MxFM+J
	Cmw3GDXFUt30SqpfFH4i/7rvc6RjbK2Fajf6/NmQ4am0seeCYFJm/xhRUCYyIaKVnvcr1BQaMib
	WRws6VG+3o00MDY2AGMIT1k+Fbg==
X-Google-Smtp-Source: AGHT+IFl5rL/5hZzllSQT4kNPhf7K+Mzylld0CDU7EGjFVl6h6YIMbKzhC0pm5GcEpFQvIHX+1rha7stYdM8mqFbCkQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:2ea7:b0:6e6:4946:93e3 with
 SMTP id fd39-20020a056a002ea700b006e6494693e3mr151620pfb.3.1710185510021;
 Mon, 11 Mar 2024 12:31:50 -0700 (PDT)
Date: Mon, 11 Mar 2024 19:31:44 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5091; i=samitolvanen@google.com;
 h=from:subject; bh=P9wUwpcw3NHUEai0EY+p4WNxdtLcGXphsLbKEdtDEg4=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBl71wfJnj+5L8FG37zVyJNxfMfNJoY0VJs0yMLB
 xU3BtR6b7+JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZe9cHwAKCRBMtfaEi7xW
 7vAYC/9OQ9Z2KvfsxsRPYjStOgFF960iLZz4U2Yg1Pc04nqTJhJOjAA0LlXHVE6XdGCQ1MK2xTv
 OtI1cV6vtQnAMtpfTPLFdvIwuZ7Op/oYW6FpyU/OLXUZHYssSN6b7f06hUuWdsIDjznZtaHuKaY
 yFBq8JY8H/+aWai3ZaR8aAAUpZti8u3nbZiePGtPhrgQz/PyBjy4Qux9cHB7dCasmi01Km62Od3
 GmaGGdIVhg4OQ4LJag7l9WlxfAIqgCWAojhrslIMlDg24sTaGc6KTE7NRwOS8Jx5Op+MvJGVA9c
 C7Gmr975CCDLfX0MxbY1PmLctEXAJ77Ft9BsCg68UI1YUBgFJD8S/dBlrdbHpfFo/1UeYHIjFdz
 cs1NQ4lXP1lnxvRItHh5uODri1JStub2sD6YywSrGnF/3qkqpI0ey8ybdthU1mYp4WMWFPQwdAA d78nKkyQmeeQTFJU3AiRd6nZpO4pnRf1iCIAOPk55HAB1cx9UwVaE61BAY5z/eARLf3Oo=
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240311193143.2981310-2-samitolvanen@google.com>
Subject: [PATCH] riscv: Fix syscall wrapper for >word-size arguments
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The current syscall wrapper macros break 64-bit arguments on
rv32 because they only guarantee the first N input registers are
passed to syscalls that accept N arguments. According to the
calling convention, values twice the word size reside in register
pairs and as a result, syscall arguments don't always have a
direct register mapping on rv32.

Instead of using `__MAP(x,__SC_LONG,__VA_ARGS__)` to declare the
type of the `__se(_compat)_sys_*` functions on rv32, change the
function declarations to accept `ulong` arguments and alias them
to the actual syscall implementations, similarly to the existing
macros in include/linux/syscalls.h. This matches previous
behavior and ensures registers are passed to syscalls as-is, no
matter which argument types they expect.

Fixes: 08d0ce30e0e4 ("riscv: Implement syscall wrappers")
Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/include/asm/syscall_wrapper.h | 53 +++++++++++++++++-------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/include/asm/syscall_wrapper.h
index eeec04b7dae6..980094c2e976 100644
--- a/arch/riscv/include/asm/syscall_wrapper.h
+++ b/arch/riscv/include/asm/syscall_wrapper.h
@@ -12,25 +12,51 @@
 
 asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
 
-#define SC_RISCV_REGS_TO_ARGS(x, ...)				\
-	__MAP(x,__SC_ARGS					\
-	      ,,regs->orig_a0,,regs->a1,,regs->a2		\
+#ifdef CONFIG_64BIT
+
+#define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
+	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
+
+#define SC_RISCV_REGS_TO_ARGS(x, ...)							\
+	__MAP(x,__SC_ARGS								\
+	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
 	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
 
+#else
+/*
+ * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
+ * implementation when >word-size arguments are used.
+ */
+#define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
+	__diag_push();									\
+	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
+			"Type aliasing is used to sanitize syscall arguments");		\
+	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
+					ulong)						\
+			__attribute__((alias(__stringify(___se_##prefix##name))));	\
+	__diag_pop();									\
+	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
+	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
+
+#define SC_RISCV_REGS_TO_ARGS(x, ...) \
+	regs->orig_a0,regs->a1,regs->a2,regs->a3,regs->a4,regs->a5,regs->a6
+
+#endif /* CONFIG_64BIT */
+
 #ifdef CONFIG_COMPAT
 
 #define COMPAT_SYSCALL_DEFINEx(x, name, ...)						\
 	asmlinkage long __riscv_compat_sys##name(const struct pt_regs *regs);		\
 	ALLOW_ERROR_INJECTION(__riscv_compat_sys##name, ERRNO);				\
-	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
 	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
-	asmlinkage long __riscv_compat_sys##name(const struct pt_regs *regs)		\
+	__SYSCALL_SE_DEFINEx(x, compat_sys, name, __VA_ARGS__)				\
 	{										\
-		return __se_compat_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
+		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
 	}										\
-	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	asmlinkage long __riscv_compat_sys##name(const struct pt_regs *regs)		\
 	{										\
-		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
+		return __se_compat_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
 	}										\
 	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
@@ -51,19 +77,18 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
 #define __SYSCALL_DEFINEx(x, name, ...)						\
 	asmlinkage long __riscv_sys##name(const struct pt_regs *regs);		\
 	ALLOW_ERROR_INJECTION(__riscv_sys##name, ERRNO);			\
-	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
 	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
-	asmlinkage long __riscv_sys##name(const struct pt_regs *regs)		\
-	{									\
-		return __se_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
-	}									\
-	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	__SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)				\
 	{									\
 		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
 		__MAP(x,__SC_TEST,__VA_ARGS__);					\
 		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
 		return ret;							\
 	}									\
+	asmlinkage long __riscv_sys##name(const struct pt_regs *regs)		\
+	{									\
+		return __se_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}									\
 	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
 #define SYSCALL_DEFINE0(sname)							\
-- 
2.44.0.278.ge034bb2e1d-goog

