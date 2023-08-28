Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FD14287
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 19:58:44 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d745094c496so4449365276.1
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 12:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252724; x=1693857524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GN6X1nlK+F0kjkEC50FG9os31FAuUCJYmCM49+1obnI=;
        b=q81rXqLshiF0sln/xS3h/1Wt74xT2Rdg2j7FkroNKWNJx+s5YHbY+oxX80kCoOEdXg
         Z7tbUBEmnha1x55o337Yu6Lp+PK9LnYIpjNDnXpf7Vvob1fBYdUFHdVNRYzgfh16aSLv
         eFNKGP5rRTkOAMSM3mrjAPNqs5knGLIBbNRZAC6qGU+CNi/lzLXAiQhO62xa0d/tNvJ+
         HZQCnftScs5HC5H/QHtUIo0uBGDaDIJXYW2D2SPFvrSpGGn81MfWM1OEFhJRudgn2+le
         WexQrz+RIoMq4d/FZyHuGt5KMF8ZH4GobjeJX5y+t0Ma6T4e2S48xP0NJhR5CYYZChPH
         OKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252724; x=1693857524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GN6X1nlK+F0kjkEC50FG9os31FAuUCJYmCM49+1obnI=;
        b=lnPIrovrcekitMb2yY5QpX/OMPAwHFrzOszxfERxiMVs5CDYMfIiT55yt3NgAF5R9I
         BM5OpQ9NAVuX1bvdf+D8z8i1CWEhgbP9ScSZ7Rlqr13zmK7lf07qyARiygK9SqN9Wjx2
         792p4mBA96t1FPLqyeacuu9c8ZW/s6RwriYN5M8Mf1WMrxjsEyDvOI968vAfWSmryv4X
         aRG0UATUBbQ5UmUS8Ww/Ib2AfR/FT7gOw3o4J9htQy99keiSjh1oABeFPKa4uMBLCSqS
         /d/DMgUnhw5TL5QxUmLc5wKaCJYe0PzjUqNvTzC0Zqa77umZygsU6CVh+nYu8VnhAkRe
         LKrQ==
X-Gm-Message-State: AOJu0YxuWed5itdcdo9hvFbBg13Ycb3NlxamVY4vddvaoPw4hyDWAOHV
	YHGDm5aojHwL/c0UwCny9s3GGnES0s54RDs2MYM=
X-Google-Smtp-Source: AGHT+IH/uHwJj6+qOeylfRyEPqpB+nnMtItRxR7gf+ULc0gWYu3yZPJVS4kkyblR9fUvFWo2HvJU3EuGasR5rTd2B1w=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:9011:0:b0:d5d:b03c:49b2 with SMTP
 id s17-20020a259011000000b00d5db03c49b2mr820198ybl.11.1693252723904; Mon, 28
 Aug 2023 12:58:43 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:37 +0000
In-Reply-To: <20230828195833.756747-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230828195833.756747-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=samitolvanen@google.com;
 h=from:subject; bh=Chgku5okNNw1TPF+7h/tJxx5VnEIks6hZ2ypKsZTKYg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxqRbtkifAND8x/XfLzfQWcnICH3txr02qPt
 4eiKf2aYjSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8agAKCRBMtfaEi7xW
 7sqPC/4yfD8F4LJhON/0j9LDQmdASW7omk5GP9QTz9u9V2kMfasvvS5/J6shUYxruhqnrbLQBUp
 oZG+GjK1FZXYmm2NhWg4FLwoGp73evhYqS3wI+Ft3xabSmr5Na3lU51SZXDGqV8uyQ7euwUibuM
 1IB+PWku6qCOxTHa+PmjyOlXV/KauzFtIzwmz+0x5d45qcRehgOD29B8x93CCG4ocGo16RTP8LI
 F/iGt9KvESUFJHI8k0VjTovZNvf6YxjaSUpyeHxe3VVQSccGWV/T3h55eOORae0j0Myri46bWi6
 G6OIOjCjM5wvPYvwQTVyYFnbv5wTS0DJqhUWZt3ZEVviB/dFtXNBfxwtPWVuNItQMaZQ/8iaxqH
 ZZt1G2FWe/DvsQ5lHk95L6xpiDHTU8W8m68q4rh/0qju4f8K6jxJcN6sSbo2s98UyF1YVfErhSD UX5opXBgLT/rq9utajC5hslrYEgFPNP1pUHjVWRg8zD8f17xYD7/57e0gz+NISpgLceIs=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-11-samitolvanen@google.com>
Subject: [PATCH v3 3/6] riscv: Move global pointer loading to a macro
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
2.42.0.rc2.253.gd59a3bf2b4-goog

