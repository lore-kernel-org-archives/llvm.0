Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA99628E0D
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 22:48:07 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d852a6749bcso18019855276.0
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854887; x=1696459687; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZRzZZUde58Au/vMHi9s1sr9e50uKHmMzB9hG9Emfi8=;
        b=HP11XVW2XZ4je7a9JawWLsq3M+oNcYlfsXSxgkGHxUtTY3yYk/QrIdGCi/hA41negO
         t+rsP/7+2lzbXCUhwGEAEjPy2Tzu0WlqR1KU/U9+TFc5hjysV8Csk5bnRIxN7OFSVGu6
         z9gMbhSsXDOHGZLg05ffSLFr8IRC6QlH5u93HI+6qund1bIxkVn3rNMwaEDfDhYQQ99W
         lKK0qEjMom71K61rIU6mO8PF75zCVb80XUMuyf/AmH9NClFdRnWFOcEW2pPqeYeAcHQX
         vSBOEA05aghO7R0RuFFUH+E8znbm8Rs+eq7piY6D0KSD54KAhB4jl1a7WLqnzW0xH2aZ
         iwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854887; x=1696459687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZRzZZUde58Au/vMHi9s1sr9e50uKHmMzB9hG9Emfi8=;
        b=sLsAhP8VI1t8hMSyuZSt+KR76B6FumC8PVLKxIR5h7zZtJgBwPJ5944T5OgbXGfD36
         Suqs+rObzq5U0tnvceHm/x1ZqsctqjGdp4RatW88YwF8DmE7UrLROSJy4mICBME69y2j
         wLiz+NJY/CYxyHZq5ak9fbK22FKrdKM9SfnnP519/Y7t79Y4vRJ1SlzBHsjQXD03RUzT
         ekx+IxtHmySpcv5R08gg06RJrbLw9Lphe1DyuIOyAsqtNxleD12ez4CxkUJ+oJRTkZHT
         q9nQEjsesxs2m1GQdZQigqqbG3PIK5aqxbvNdZ7JmpI7tyJnOi0siBJPvWpdrFXGPxOx
         m9/Q==
X-Gm-Message-State: AOJu0YyE8NonfBFa1R9F0T4jmJIJ4rOHgexI1MHrnpbeX5soJ9JArUdU
	n5ZSnv9rj8ydYXl7UUBBh1foUYOIOuN6riWJQmI=
X-Google-Smtp-Source: AGHT+IHxA01ww/gyg3znhBfLop3CsLNtadfoLfadsJ+aTBN8Cew9KjwVh2b0BcNDR7oyVphEb0igmcTzaPy309ZP/TI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:77c8:0:b0:d86:56f4:e4a3 with SMTP
 id s191-20020a2577c8000000b00d8656f4e4a3mr47419ybc.13.1695854886912; Wed, 27
 Sep 2023 15:48:06 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:48:01 +0000
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230927224757.1154247-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282; i=samitolvanen@google.com;
 h=from:subject; bh=R9zKwYTLpHe6QQ7XyQD72MWWY4El/ER6AIXVUR/GJUM=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdZRzIvfGvPyQVjyzKduUT/iUIvXAAcWfD+
 dGjTCtj8a6JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7vxkC/4lyaxKokcSbtqaj17rhTY1rhzJjWKwRCnuvZWzRstnDuir45jKziPslpAWi1iVs4RHF5x
 qreszbKjdycXuhJYRxcRe6hhHwB+MraLf+Jmo9RRUrC5vJrRwF4G4jMYJlYoEvCtKXrin9W7kYA
 lSX1MRkRZB7fwcX+42TsHFgVDTdkCgHi2VXX9HyMdy1BEjocetNYmgpwSy3jb/2sYwU9rOeEP+d
 xPuWVYmhdclejB1IRxi1FlxFV9dtGt/8drHYZaS0+mhI+6oC98fA8xqDLchezP4eqDL2BbTrAop
 m4GCYz2lwbxsAvQuj/G8ryvpfdC9INZUpo49ZnuqH9bAEQFLNBDL8W24eDJfiIggFROFKvicuWf
 bmwVX9GWrCQzHkG6Z9sT735briNXedUmD5tg1TizousIT92Wq54P/gQRA4WXCwWgeZMTTTQ7m2M 4Akymo49EdgXk6dPjkQb4//KenjqGWTqBerQSlGLryhBvRQrAAVQW0OWp3/+xHxCLiuOs=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-11-samitolvanen@google.com>
Subject: [PATCH v4 3/6] riscv: Move global pointer loading to a macro
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
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
Tested-by: Nathan Chancellor <nathan@kernel.org>
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
index a306562636e4..6215dcf2e83b 100644
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
index 3710ea5d160f..a0484d95d8fb 100644
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
index f7960c7c5f9e..d5cf8b575777 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -61,10 +61,7 @@ END(__cpu_suspend_enter)
 
 SYM_TYPED_FUNC_START(__cpu_resume_enter)
 	/* Load the global pointer */
-	.option push
-	.option norelax
-		la gp, __global_pointer$
-	.option pop
+	load_global_pointer
 
 #ifdef CONFIG_MMU
 	/* Save A0 and A1 */
-- 
2.42.0.515.g380fc7ccd1-goog

