Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6267C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:25 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id q2-20020a170902dac200b00168b3978426so268514plx.17
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=McmKeDfQU54OT2ddjesNbtVSHYxn5HOZJ/k/YIxSA2Q=;
        b=pKSmswC9i7CgIKNd8Ueb3Mz+6W8hfA6K3s8z6NmKiL9LavoDEDZ6LuI6xYKZyL/Qkr
         160+qtQ1m3Pr4c4JAr7nYajwE1TSz/y2E1Rrx9U++y9J2+JSWlXRC5Nl3ytA7Ul5xzdO
         LISOUP2H04z2pfT/iuQxpK756TTuJdOX8Llgnt3mEUhHJ4JH2+YFORRQmfjqRsJn4Bha
         d2lJj5ycPYMuGuK+7809rBwk55D2MIZfdYbMtD+yfSi3pj5+WYVoynmFYFomThVrwt7o
         j7kMxaeyxnvLaVO3AbnVftP4ICSRzwZIOsIGKZKiAR/cybwHZ+1F8gwFFjHtiLh7Ahn2
         MnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=McmKeDfQU54OT2ddjesNbtVSHYxn5HOZJ/k/YIxSA2Q=;
        b=yEh1ZYJPCGjZnJ5ZdJv7KebjICxaM0wWkfwTFWe/lFbD0ObVRMzfoVLWbs4kNFklVY
         nF9KDCGiueZ+dcnbR8lu9WPBnsTHUY08+NXoyy19lw1SKLEQyETEKS4QPElsi+gjWvYQ
         Vr1wtAhqo4Sv/u7U6GguRTkdaqySaq7GH5Bf2Ejm4KOXlnXfAmUnWcoYWIXwwGag5Myq
         lSb/7t9CQxyzok/hY8s4vSAkDmm85aS7uqMZUuoZ8EZgTstAalEHzAOu6OkJCuVDe9p2
         vuNX4ADF0Gjfr4NSo+PABaYCkQv6Nj+AZnxgkQUSGy3aFh88cNetvIHNtACaqXSo7gU8
         wVvQ==
X-Gm-Message-State: AOAM532eYWMGqMls6B4dR5TV7/NcLMdumFyH+fx3PZW0mzWAgGe4cYFe
	kZyw0F3HZFmc0b2JTDwQk0BF553KJHtWk8KlHMw=
X-Google-Smtp-Source: ABdhPJwgQhAUrkZ2E3ncordFI1QLNbwk0KpIEhulvG6cFyGBziAQCqlrz6Jc+ed47AfAPj4RJHLMezGZqpWcUfbVd+4=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a65:4149:0:b0:3fb:1476:d0dc with SMTP
 id x9-20020a654149000000b003fb1476d0dcmr41179133pgp.373.1654904124994; Fri,
 10 Jun 2022 16:35:24 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:34:57 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-5-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262; h=from:subject;
 bh=hbOGCW0Qi8kWOELjdrp8JGjjRWA8+I9n0fNulcEZcDg=; b=owEB7AET/pANAwAKAUy19oSLvFbuAcsmYgBio9UtgU/4jH18jloCAgXuwbucQRi4omU8/F8NLShQ
 oWKWan2JAbIEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLQAKCRBMtfaEi7xW7sBKC/
 iex5GdKDqwH+DynVX5SiIJ/O/kBiCxebuuv+PRNnuuu5NP3jE7hyT+5F6E93ER1zUiBBK717u3FgLM
 L/KlhU6pU7G104AQ8tdX1EU7D34Q2YLaJaHJT0vOywEEKfCCVNO+h3Nx/jZ+PHXxg1QbXtXlSWqwD4
 +/kvY1WrcT2i0BoLP1VvzxkSbZ3OIWtWezPEJtmHsP0Zy1M3HZLifJAwutTnmdIsdpv9vZQ68g8N1R
 S/V+L3L0LNtSorcPqo4u5nmqsCPPmIuNp+YSGzEHyyTivV/J+hlSsjueuuG+FneyECj2fZXlEwrptx
 UaYbxCmG+FVcXob7aFxve9hYP4mWfcFcfo7ktgXDRFpRdlXdFOIESUIV0VgVIUuD5GwLoCwcU7BXjp
 LBOlYl7jufqbE7cbRH0s3GrWLWgb9tXfwvkRiQYvNAsCxgZdDhOJu/Agg+kRH9qOBXZVA7xHUVh+3c
 PHYJe+YwgEv/MPvMx4VnjwfiMUUrjuw0CqB1kic5eKMA==
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 04/20] cfi: Drop __CFI_ADDRESSABLE
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
Reviewed-by: Kees Cook <keescook@chromium.org>
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
index 01ce94b58b42..63be1c23d676 100644
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
index abd9fa916b7d..efecd65a976d 100644
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
2.36.1.476.g0c4daa206d-goog

