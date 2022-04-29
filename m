Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EE1869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:01 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id z14-20020a5b0b0e000000b0064848b628cfso8407316ybp.0
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=svE7kVFxuPlWWXguE8ak9oGVScd1Q4Hw38uYtQTvTB0=;
        b=FUoFYj7nrytyx4SQGCiHW92ijRaq67I39GZlpyGeR8NTM7JBhSVqrSH5XEo6AC3s33
         6YkKHAE2q9oeFmrTKUs1tSYTJjtAN96i5EtiDUrkHTNJ7F9pNyevX/fqtpTVyhzDlRbo
         ygW8w7mnl/f/ac4KYXkyTVBJCPUQ7uLY5KreI2pr7rOjr0HziZOezs6YJb+DRgvxqmvU
         2Ojm1ZLAjlxdV9gK1KqwV4JtQZcjNXSEYjw35XVQqvPjpeqRn7S3FLFze1rSeIrqplFC
         BTe4KL/fuc79sjwROMSFVnl3eKltBCdAdu+AkyhU0liNzqOkDRw1+i7197CedoqcHGSp
         XPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=svE7kVFxuPlWWXguE8ak9oGVScd1Q4Hw38uYtQTvTB0=;
        b=gMWu1rsC17bZ5pm1TFHPiYcZ2HNb64C5fcG2N1lpzEE2nZ468oKNr21gkMriHUdhzx
         gByLwgl4FVp1ux2uyYzYeiWkL6lV71Dz13uD1FOpoaPB9UWaQI53nygEBWprb+8Ko4R+
         ynqA9lHDyQj28RDLmIZE5+J8aPR/JLVmrAvoLkEgD1yabna2IjPbYHlwauC3vnrMaRo/
         MvWsAPdfLg2L2kpfb4J0a7f6a1beVeqSi3g/NsJLo41FRtclZ6K62IdSFEhJWVO3WGrn
         1p2x3yRhAUUNXBkDIwsZxDjmznlTKXLCtij7ix+HzZVmHiN9naKWSJM+NM/lcu00YOlh
         AYfg==
X-Gm-Message-State: AOAM533uFkHTiPR/6DSq8yyfFw+liFGzgLX+5m7bWLvbsi7S6IzMBVDa
	vbg+FjGuB2zNC6OnCFOJkODlf/2VhBHd2o6P+3M=
X-Google-Smtp-Source: ABdhPJxy36VnWpTDmVaEj1n6wpH9g3bLRxJK7JnambFm4dQ2hqamT1j8SUFu5O05FMrvWlAjIaN1GHbxJVVSP4ly7Ts=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:1ca:b0:648:b241:65be with
 SMTP id u10-20020a05690201ca00b00648b24165bemr1292760ybh.196.1651264620101;
 Fri, 29 Apr 2022 13:37:00 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:28 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; h=from:subject;
 bh=3j3iVyBHsh++mvfP+DxD8j3SrYI24EpoK/VyI7QxUVI=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExVHq3nlFPfzRWE27X7yYpyk4ANovqw9jbo7ZSD
 aCfwoPWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVQAKCRBMtfaEi7xW7j1FC/
 9mpAG9wikAu1bkYBp0Lg/jv7Wm7fpH2DwKXLlccEeCa1pxSjoSVgx6wZkzGBqugwmN/O7ovT3GkjhQ
 eQ6wRcszZQ7fTIEvFK+vcaeg6XDDudg6DpaxZRR1dAMmt2yUCErrCLOe5tN/ft1R5yKnKLwGRHsYvV
 vUDHffcDPPv60LVfD+5wLq688gEgzU48LyD440gez0N1kY/vqObQpuQlHQTtBE/7qD2ulPR5JdMQu8
 st9Dh0JD/ATz/I1VA+tl38E7FpTEG0fkqECvMS++yK/JtdB1p+lWaUybht6V838s5BbAzbCBuCuG2h
 rAddbV72f5KNjs7b0k+EaHJ0fuNY9jPdM4AFqmgjTDBRmzBmkOUQ0U3lCDBj9dXLor5ywcTq2Iqk1G
 iUekvxJzPaoYKy4o2dQvYBH7YPC2qnSBfn+37GO62vDWM2ayd+N4wwOAQBmy23ARN3CsD5TKITf17Y
 OIawNg6pfn2v1zDPmU2ZUQnd5lwz6WXpEe195D//G1qwQ=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 05/21] cfi: Drop __CFI_ADDRESSABLE
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The __CFI_ADDRESSABLE macro is used for init_module and cleanup_module
to ensure we have the address of the CFI jump table, and with
CONFIG_X86_KERNEL_IBT to ensure LTO won't optimize away the symbols.
As __CFI_ADDRESSABLE is no longer necessary with -fsanitize=kcfi, add
a more flexible version of the __ADDRESSABLE macro and always ensure
these symbols won't be dropped.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/cfi.h      | 20 --------------------
 include/linux/compiler.h |  6 ++++--
 include/linux/module.h   |  4 ++--
 3 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/include/linux/cfi.h b/include/linux/cfi.h
index 4ab51c067007..2cdbc0fbd0ab 100644
--- a/include/linux/cfi.h
+++ b/include/linux/cfi.h
@@ -13,26 +13,6 @@ typedef void (*cfi_check_fn)(uint64_t id, void *ptr, void *diag);
 /* Compiler-generated function in each module, and the kernel */
 extern void __cfi_check(uint64_t id, void *ptr, void *diag);
 
-/*
- * Force the compiler to generate a CFI jump table entry for a function
- * and store the jump table address to __cfi_jt_<function>.
- */
-#define __CFI_ADDRESSABLE(fn, __attr) \
-	const void *__cfi_jt_ ## fn __visible __attr = (void *)&fn
-
-#else /* !CONFIG_CFI_CLANG */
-
-#ifdef CONFIG_X86_KERNEL_IBT
-
-#define __CFI_ADDRESSABLE(fn, __attr) \
-	const void *__cfi_jt_ ## fn __visible __attr = (void *)&fn
-
-#endif /* CONFIG_X86_KERNEL_IBT */
-
 #endif /* CONFIG_CFI_CLANG */
 
-#ifndef __CFI_ADDRESSABLE
-#define __CFI_ADDRESSABLE(fn, __attr)
-#endif
-
 #endif /* _LINUX_CFI_H */
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 219aa5ddbc73..9303f5fe5d89 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -221,9 +221,11 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
  * otherwise, or eliminated entirely due to lack of references that are
  * visible to the compiler.
  */
-#define __ADDRESSABLE(sym) \
-	static void * __section(".discard.addressable") __used \
+#define ___ADDRESSABLE(sym, __attrs) \
+	static void * __used __attrs \
 		__UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
+#define __ADDRESSABLE(sym) \
+	___ADDRESSABLE(sym, __section(".discard.addressable"))
 
 /**
  * offset_to_ptr - convert a relative memory offset to an absolute pointer
diff --git a/include/linux/module.h b/include/linux/module.h
index 1e135fd5c076..87857275c047 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -132,7 +132,7 @@ extern void cleanup_module(void);
 	{ return initfn; }					\
 	int init_module(void) __copy(initfn)			\
 		__attribute__((alias(#initfn)));		\
-	__CFI_ADDRESSABLE(init_module, __initdata);
+	___ADDRESSABLE(init_module, __initdata);
 
 /* This is only required if you want to be unloadable. */
 #define module_exit(exitfn)					\
@@ -140,7 +140,7 @@ extern void cleanup_module(void);
 	{ return exitfn; }					\
 	void cleanup_module(void) __copy(exitfn)		\
 		__attribute__((alias(#exitfn)));		\
-	__CFI_ADDRESSABLE(cleanup_module, __exitdata);
+	___ADDRESSABLE(cleanup_module, __exitdata);
 
 #endif
 
-- 
2.36.0.464.gb9c8b46e94-goog

