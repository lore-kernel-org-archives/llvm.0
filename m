Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140A156FD
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 20:34:53 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-26b357b9bc2so2000876a91.2
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692131692; x=1692736492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfDLHnMbXQceNrVQLGjVUevqJ2xwYxenmhNK/tAF/sk=;
        b=DveYx2ypgHekd9E3zy9CT1ilJONYIrAnPqHRj9ZtXg944Rf0TWVVNG5jaFobMnoKx0
         Qp6jSJbrWh3E2/h9IXPRd2IM3jaJArvh4oKLp7/khzJJ/4YoiwEv/DKqr19Ru89mBaYv
         1gt7hiExW5s9lLZMvCZRWPyrP/GDG1LqMTngfLcIolNUd8lCABgY4ON75DRwtNUOCk8B
         JY5g55OHAze9zUBVPQ+rocjrZ/v9jCkE6obEf+/vP5i9YGYK/d6QF7IAgDOSXS1kHXVD
         FeNp6SoviL3M8abvX30FCaMuBBgTkMnTrZyfZofD7Pl87xvQwDtW7fNUw3gGmTWAH0AY
         dFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131692; x=1692736492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfDLHnMbXQceNrVQLGjVUevqJ2xwYxenmhNK/tAF/sk=;
        b=JvC0FhtkNVgkliszBNBcbhNxsC6mnwUo/Bn3UNyMcCzHgROKLCoLUQgQgDr0Sph6i9
         9TDCCBlrLuICptGLCYq+Lj8HhZw22qR5oOXMzRhB9+VwlirUyHaR2lB5MVjFVgF75Xy5
         PQWsnTrfpssYegbAJTCr7wDEdg7oY4N6hBnqDalcStLCtlm4r72do0tidiL5RRDRcd1B
         0OQYgROiykCBtWEg4lSutoQKapfcwLGkzoOM/k3JRwTCfi7JBJZnKgYlfecElf41oksO
         inga+0svp+GMFDIMkO0IU+g/zfZzGqp1GO51eBl8QL0YIlBmcc0iIwCOm0Ax9F8p56A6
         0Rrg==
X-Gm-Message-State: AOJu0YwDGckmSLPQaEhpxm5i8H+dAoYHkkSK0MLlcfkgpe52NoNZCM+U
	r4AYm/91Tjd2vxO6ZvXZo93BZtpSxMWdTHo6YS0=
X-Google-Smtp-Source: AGHT+IG4n+M3PSO3DhS/2Scpx+tUwpXnKVdLJNTSN6YSIUZ+vrp2chjur8+avcRYM+CJmcVopciJDOywc23KOj4HoFo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90b:4393:b0:263:3437:a0b0 with
 SMTP id in19-20020a17090b439300b002633437a0b0mr3063684pjb.3.1692131692589;
 Tue, 15 Aug 2023 13:34:52 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:34:46 +0000
In-Reply-To: <20230815203442.1608773-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230815203442.1608773-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=samitolvanen@google.com;
 h=from:subject; bh=5ixoDk+W6BxwBv4tIu2eVSrOr56ebYlcn47cfqFXXgA=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk2+FiHUFljIaux+9IC+0XLbF6reJW5Y5V3fbd/
 /MD1Qt4OqyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNvhYgAKCRBMtfaEi7xW
 7kdQDACYUsshok1LuWlv5stJjrwH99NJQrdDSX0WI0YLs+JulAYvsnIPJAatZgneQWhTPWBynMO
 rJ3Ix+mbOgesN6Los5e0Z5iR+60FzUznS4csogCnjAI1+8EEVryA7ygmOnVm4/wnNpslAOjORp7
 byQ+dXEu0N175Wnuc3vqbRnwlcaSIgJR+3bGVEuk8ezzcuTN42WVem7P7gBBgGWi+MzsEtJk9IA
 +oCPRG0zWkpcBkqHS77+B58Wg9Z/YAaYEeyeqUKq1AMU2MIUP1ul8YRN6CX93320mx9vMOO6tff
 vPHHw66ck3QzRW5YPmT1EYusoHAeXpCxw6RBC7i2r5Wyqw/QVNOqtKvrkJuzNmMRFJnl9zlGZbs
 C0IN9uG9VSOuYRky9JDPhBidXrnk7bvsMGzrNuj703Iz9WVkn+LfAUI+Nn/LiYYHYOqhR9w+PRl ERHb8HUO9XJqfcJPtffC4okUlO3NCdKwN6FcN6izZWDFGeuHyBokuvxqemECQWRpFEqkM=
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230815203442.1608773-11-samitolvanen@google.com>
Subject: [PATCH v2 3/6] riscv: Move global pointer loading to a macro
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

In Clang 17, -fsanitize=shadow-call-stack uses the newly declared
platform register gp for storing shadow call stack pointers. As
this is obviously incompatible with gp relaxation, in preparation
for CONFIG_SHADOW_CALL_STACK support, move global pointer loading
to a single macro, which we can cleanly disable when SCS is used
instead.

Link: https://reviews.llvm.org/rGaa1d2693c256
Link: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/include/asm/asm.h      |  8 ++++++++
 arch/riscv/kernel/entry.S         |  6 ++----
 arch/riscv/kernel/head.S          | 15 +++------------
 arch/riscv/kernel/suspend_entry.S |  5 +----
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 8e446be2d57c..f34dd1a526a1 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -109,6 +109,14 @@
 	REG_L \dst, 0(\dst)
 .endm
 
+/* load __global_pointer to gp */
+.macro load_global_pointer
+.option push
+.option norelax
+	la gp, __global_pointer$
+.option pop
+.endm
+
 	/* save all GPs except x1 ~ x5 */
 	.macro save_from_x6_to_x31
 	REG_S x6,  PT_T1(sp)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 39875f5e08a6..2b4248c6b0a9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -75,10 +75,8 @@ _save_context:
 	csrw CSR_SCRATCH, x0
 
 	/* Load the global pointer */
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
+	load_global_pointer
+
 	move a0, sp /* pt_regs */
 	la ra, ret_from_exception
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 11c3b94c4534..79b5a863c782 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -110,10 +110,7 @@ relocate_enable_mmu:
 	csrw CSR_TVEC, a0
 
 	/* Reload the global pointer */
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
+	load_global_pointer
 
 	/*
 	 * Switch to kernel page tables.  A full fence is necessary in order to
@@ -134,10 +131,7 @@ secondary_start_sbi:
 	csrw CSR_IP, zero
 
 	/* Load the global pointer */
-	.option push
-	.option norelax
-		la gp, __global_pointer$
-	.option pop
+	load_global_pointer
 
 	/*
 	 * Disable FPU & VECTOR to detect illegal usage of
@@ -228,10 +222,7 @@ pmp_done:
 #endif /* CONFIG_RISCV_M_MODE */
 
 	/* Load the global pointer */
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
+	load_global_pointer
 
 	/*
 	 * Disable FPU & VECTOR to detect illegal usage of
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index 12b52afe09a4..556a4b166d8c 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -60,10 +60,7 @@ END(__cpu_suspend_enter)
 
 ENTRY(__cpu_resume_enter)
 	/* Load the global pointer */
-	.option push
-	.option norelax
-		la gp, __global_pointer$
-	.option pop
+	load_global_pointer
 
 #ifdef CONFIG_MMU
 	/* Save A0 and A1 */
-- 
2.41.0.694.ge786442a9b-goog

