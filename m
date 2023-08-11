Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C6329D4
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 23:36:06 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1bb962ada0dso32314365ad.2
        for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691796966; x=1692401766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqSttns2QMMHKhEq1iT/6N0civk3/DgixVYj3d7z750=;
        b=X34fuYj30ll5ylhB7Aqg1vD8KbeZ19k7cBalDKC4+jHgFwr/RyYNj6Pr6V61x2DfL+
         EJCnT8nIK0diol/XAn3zkp0CBQHYK32A+lAxwsdw8V0WmgFSaGLh6MeDrKTy+O1YtGQL
         lRW4ToSimJ7KM73g7/WgJ/lZD0oHxf4tn3qUdGyg4O4aRd94vZCmXlgckCK9wtoEnTIx
         By1wmnSVOyT/6qltlLMq/NHoH3JbmEp+o19oXoVJJzJxY75DUC/F8bAwXqxVHXMraBwG
         CNQJwBuxXfuA8b8ReBpbrRr4G875agXduf79V73IbjdTK0GMrf/tPtRPCyES9mwJzUQL
         9upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796966; x=1692401766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqSttns2QMMHKhEq1iT/6N0civk3/DgixVYj3d7z750=;
        b=USi2mzoXSUOBkxzot3WxY9D1THSqQ3WsfcmboONYUBu+ORHq4ElbcVdunf3ToZc7zK
         XXTn0Wl9qXEqXNmtKglckQqX+pGdLbeRwE0FDShbz8lJ+CcNNnPHdC0Qfwl8rwFPJCrj
         XnnbLrsY4vcZoPl+0BVnAfdSAAE3Ss4HOi7e82Ta35SqPiOvnZf7XQt/maTbuDRjtP2Z
         BD1jilPF54smno0QlHc7CdG/rN95ZqdtOLX8nQitz8mTM/S6Hm/zCZzXu3LUT6e1ky/n
         KgK9Jwjlnm49JPnQxk4OfwJzI8VQS4ElJaqN7RdAip5lDQopsrBFG4XpSkpx4CLS5FEw
         8F+g==
X-Gm-Message-State: AOJu0YyPKGraP5jgWv0ds5nu3A7yqNYj0ItFa/LM/hAXWullLFy3ZKTq
	WpE7VDQ8FqqfudZXaFlb7ATebQ1wkIx8qiCvlPA=
X-Google-Smtp-Source: AGHT+IHmoLAUiv8fk25rU3LsIqT4bGf0NYp3Jdy7r9PrFn7vgSF/A8z6XY7y0W3PdKsPxdaEB7q92Ncr+0mp/5dgQt8=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:da90:b0:1bc:8249:2547 with
 SMTP id j16-20020a170902da9000b001bc82492547mr1100101plx.12.1691796965861;
 Fri, 11 Aug 2023 16:36:05 -0700 (PDT)
Date: Fri, 11 Aug 2023 23:36:00 +0000
In-Reply-To: <20230811233556.97161-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=samitolvanen@google.com;
 h=from:subject; bh=tt28FmYKneUlEuS934Ul5UfwYg3GE/8Wy9t+zpPCYws=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk1sXcZHCAlTnd4EYJhbusgalCGC+w098BuJsGg
 pjfWx3ysWCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNbF3AAKCRBMtfaEi7xW
 7vtjC/9aDXQZ1XeqW1KEFEIdmhB56J7RualjvUaGwqw1lObaqRwOTOHqVWWF23giW/63wj+kC2d
 uHjLduotttcVZkHZsC6bSVritbMUdqcBJPktHpbake9N1DDHjOKuNQV7Nb8/N4fdKLoTbsIhX8J
 c9wUZRHH+uECCk0s/Vthl8g0IjkG8bxxiTWZPmj9U6cBnZreRQNTMLyS0VAeDbMe1fDLYwCxUOD
 m7jKpu3cmKHJ0+q07Tw7ImOGqjT+v/47NwVRAfE3wnQ2qG23TXar0JY6Ve/GXc8Cl5iQqIkW8I6
 vqNSlOuam4C9fCr1mNVlroRnndKOjNwoqNMGFOpCRRtZboI2i9jEI4sy77bqFyu9Z2AaZODMEky
 Z8lDTU3yZB+Dfy0y9jrRLlFmdooFQZZqg92id+407SgbATsSpewepWk6+xfbx/2ctL/zCdrzrKE Wqbc1Mw5wnbcu9O9FXMhy5KyHuHKxN0/EpYpF8+0511pfnh6hGOTgck63WxCg0nkRDL/o=
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811233556.97161-10-samitolvanen@google.com>
Subject: [PATCH 3/5] riscv: Move global pointer loading to a macro
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
index 13815a7f907a..c53388f784a2 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -103,6 +103,14 @@
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
2.41.0.640.ga95def55d0-goog

