Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C013216
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 22:16:21 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id o81-20020a257354000000b0063d95dd2c83so348814ybc.11
        for <llvm@lists.linux.dev>; Tue, 05 Apr 2022 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=NTGx3vO8sq1dXtBCR5+TJJ5C7vnKyf9ljgD3Rl3d4sc=;
        b=h8iz4EugNtzHw+TkxpZpBYCGCCOw0O9FMz2im/z0uUrLEs+1T52HjzmQ59g+6fbKtW
         DKg7PkBnEW/HsKPM93MnIaFOO4AJeFN+m4VQiDY9nglhzeWUyn99nm3Y+Tfj00E6o1LV
         clW7XpypS22Xo9AG8ovaE+We/efPkEUIcnfi3gTtLrw3lQfMfztiIjqMECCWvzHOrY5a
         mrkFMxmIFvKclS6MRmCe9hcPjAj1px/J8E40FJt/mK7p3ItlwQNHAdg7tKwEalQSnFhZ
         BCqc5MBXlrTwZkAHrKMfLBINPchgzD+FarD1hUAIYdqXoj3yR4SBE9MF9IJLHrUOiWek
         /2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=NTGx3vO8sq1dXtBCR5+TJJ5C7vnKyf9ljgD3Rl3d4sc=;
        b=Sq8Y9z47Bnuof07y0QYCO3gHWw3t4OM+TlsbewRd9LcZLjSk3R1lZXSVg4aFY8XUD+
         480ikIdVa4R6rWsbTIxapRU8CzHxa/JisUyLN7l1fFS8SZnUPDkfsWrJMVntBOCKGLVZ
         FfMwkcXgKO7Y+JjmrlVMY99lxqPDA4cqPG4wOrNn9uBa7KvJK0GhgE3R9ko7R+NO4As9
         iUWP1lvmmub9TVLVq3UsOq66+IK4zPizHcQKB+keFTZFL1YEYCclJ8LCr0fVYjpsxh9X
         t5OCExXFbtYktROrwBzDxxZIOX/8e9w2Q1g1hZdb/oz7m1OBM9KvApZxX+Ila49T6Xfs
         ixzQ==
X-Gm-Message-State: AOAM532Bnpvq/hcVHimqOtJXIOjnY9+2TC00avtpoxM+0f5+qvW0/mSQ
	mfqipMbLlnELnuqBRUU8ryzyJP3HWzsw0a5WCxs=
X-Google-Smtp-Source: ABdhPJyBrG2/HD25BUflFAr/K23ubnstDkiGKDaIC/pKd8iPOdfQRe4MLYYSwsJVi03d+N4cc1D11pTqqJBArQ1QSb8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:1397:2ffa:35b2:9631])
 (user=samitolvanen job=sendgmr) by 2002:a5b:ed1:0:b0:634:15f0:9e87 with SMTP
 id a17-20020a5b0ed1000000b0063415f09e87mr4349556ybs.392.1649196980591; Tue,
 05 Apr 2022 15:16:20 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:16:18 -0700
Message-Id: <20220405221618.633743-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441; h=from:subject;
 bh=/iQgT6IkB64+WL3JrTtJZgkW5s5WmdKdm+zLHBU/Yj8=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBiTL+vZsW7RO18a8xqCkt9rrmxEyA4NPySbVUngQFI
 GoRLlPeJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYky/rwAKCRBMtfaEi7xW7sxGC/
 9fJkMV8Rpp0ZqAPvqv/HJc8HUBS0A0GaV+mAW1Mc7A/GfLHYuxGAej4UZCoReOA/39x6QJvaKX14D2
 6EJpSZDjN7cCi5wI7Py/0keVybKhdtWT0wR/jSk/ghcj8JNx+j2HCzCJPr8McUGQRKSv4wFDd7Tsk0
 ZdP7Dh0reCxpBtYULYfuOxSepm1RVcsazYCtw+k1eMzCIIhswdU6blnr0WS9KS1a2yf/uNNx/O9ZUb
 MSgPXA8pLH8iZAI4kGZgpRtsGwKiglvWb7mxA4vEgUrL8A0rt8hmLGuWH+AaPVVnBqKymT6/Rz9tFF
 RDm/syXq8piAt3sbjdYRww/3twDWf/rt99fVORCBV16i73UCi4U6+LTgTGUjQwZ1sOmenzX7TFuNmi
 SZAY9dsGF809rREBiSpK7NF8Yefj2T+I8Oa9mEHDhUBMD3kM4xi8lEffuaRaFuZAQSY6Ndjsgof+y8
 PjuLLtAIB6ZoKCYxhWWWWARBW6r8eWL0dW48vsLMceES8=
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v2] cfi: Use __builtin_function_start
From: Sami Tolvanen <samitolvanen@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Clang 14 added support for the __builtin_function_start function,
which allows us to implement the function_nocfi macro without
architecture-specific inline assembly and in a way that also works
with static initializers.

Change CONFIG_CFI_CLANG to depend on Clang >=3D 14, define
function_nocfi using __builtin_function_start, and remove the arm64
inline assembly implementation.

Link: https://github.com/llvm/llvm-project/commit/ec2e26eaf63558934f5b73a6e=
530edc453cf9508
Link: https://github.com/ClangBuiltLinux/linux/issues/1353
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Will Deacon <will@kernel.org> # arm64
---
v2:
- Changed CFI_CLANG to depend on Clang 14 instead of
  __builtin_function_start.
- Squashed all three patches into one.

---
 arch/Kconfig                      |  5 +----
 arch/arm64/include/asm/compiler.h | 16 ----------------
 include/linux/compiler-clang.h    | 10 ++++++++++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 29b0167c088b..c1627bce4a3a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -723,10 +723,7 @@ config ARCH_SUPPORTS_CFI_CLANG
 config CFI_CLANG
 	bool "Use Clang's Control Flow Integrity (CFI)"
 	depends on LTO_CLANG && ARCH_SUPPORTS_CFI_CLANG
-	# Clang >=3D 12:
-	# - https://bugs.llvm.org/show_bug.cgi?id=3D46258
-	# - https://bugs.llvm.org/show_bug.cgi?id=3D47479
-	depends on CLANG_VERSION >=3D 120000
+	depends on CLANG_VERSION >=3D 140000
 	select KALLSYMS
 	help
 	  This option enables Clang=E2=80=99s forward-edge Control Flow Integrity
diff --git a/arch/arm64/include/asm/compiler.h b/arch/arm64/include/asm/com=
piler.h
index dc3ea4080e2e..6fb2e6bcc392 100644
--- a/arch/arm64/include/asm/compiler.h
+++ b/arch/arm64/include/asm/compiler.h
@@ -23,20 +23,4 @@
 #define __builtin_return_address(val)					\
 	(void *)(ptrauth_clear_pac((unsigned long)__builtin_return_address(val)))
=20
-#ifdef CONFIG_CFI_CLANG
-/*
- * With CONFIG_CFI_CLANG, the compiler replaces function address
- * references with the address of the function's CFI jump table
- * entry. The function_nocfi macro always returns the address of the
- * actual function instead.
- */
-#define function_nocfi(x) ({						\
-	void *addr;							\
-	asm("adrp %0, " __stringify(x) "\n\t"				\
-	    "add  %0, %0, :lo12:" __stringify(x)			\
-	    : "=3Dr" (addr));						\
-	addr;								\
-})
-#endif
-
 #endif /* __ASM_COMPILER_H */
diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.=
h
index babb1347148c..c84fec767445 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -69,6 +69,16 @@
 #define __nocfi		__attribute__((__no_sanitize__("cfi")))
 #define __cficanonical	__attribute__((__cfi_canonical_jump_table__))
=20
+#if defined(CONFIG_CFI_CLANG)
+/*
+ * With CONFIG_CFI_CLANG, the compiler replaces function address
+ * references with the address of the function's CFI jump table
+ * entry. The function_nocfi macro always returns the address of the
+ * actual function instead.
+ */
+#define function_nocfi(x)	__builtin_function_start(x)
+#endif
+
 /*
  * Turn individual warnings and errors on and off locally, depending
  * on version.
--=20
2.35.1.1094.g7c7d902a7c-goog

