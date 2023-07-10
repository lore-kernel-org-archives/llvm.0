Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59B12B90
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 18:35:52 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-262d8c40189so6119548a91.0
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014151; x=1691606151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lmw3qam11jRSo1H1z3ye084M7cKP++evQKCp2c6VGA=;
        b=mBak734wMFR6S9+GtbGpTrkghWF+xr1fRhSK0yzJKLx0aVQpIh/dJA08JpJj0Dspmv
         +KbhrJ1C2ctjEr/1mPfjOLMv2MbYo0us/2F7/8vx2tcXngA5q7eTaZ67JcQRTRYHOu5h
         8muHVf2PQjWeu46I51Zsb1knY7eaQnEy4NmF1rWIF9TEchAsuxDYzeXnnAtTHL23VWH+
         oxJSCthj46MWSMAttTVrGpHOMejythMECwFTW988R748Ji6HIYOI2Dtt6GQ+aEaySBSr
         YdYX6GRMU7PTiffp1+4F4pOPCeWqwdawHz7JdI8gfFK8pVDdHxB4qkSizIV8TETm576h
         gD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014151; x=1691606151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lmw3qam11jRSo1H1z3ye084M7cKP++evQKCp2c6VGA=;
        b=WyMC9+GZD8cK6MqJ+Tj7VL16wEi9ILF9ConHY4w3t82ar0LdRWtnSJpZ2W0Rzh17Ef
         0ScyWD0JtE49E0IbTqi0uVOGO9yfNpRAr3lP8LXXtXJaN94BTAupavm16KBj1IKMfR0p
         z5ooyN6jEAGYbZ8wGcXhMY+aWWl6lakGt11VgWKKf0gqGjKs7SGOR45K/bUvLEZDVcgf
         IzOXAL6uHUo2dFovucl61am9LI6CXxqBLEi5CCAC0H5INztjk+cL80q2JpL+HYz8loE5
         3T5FERwldWhTGlUI/W6j1QciykD/5ucUNVt/EPdIE+ckN37tXi+DilFDF0odT2sjwb29
         mcIw==
X-Gm-Message-State: ABy/qLYF9OhEgLR/Cbf7Y4AjvzNaJCjRAobGVYc9dWf4VOMFdoWzV62l
	/sQFgIc5bMGsDLdQtGTs48cbAGnSBpWAQJAYhKA=
X-Google-Smtp-Source: APBJJlFU00+7gY7YBrESlPEsWXN0HjjU8yiIxkSBDPukNPRNwI/iq87FZheK3yIXtLj3iPKAZwQFHXwHjUoK9+pnV18=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:d511:b0:263:4d9e:64f1 with
 SMTP id t17-20020a17090ad51100b002634d9e64f1mr11001626pju.0.1689014151573;
 Mon, 10 Jul 2023 11:35:51 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:47 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996; i=samitolvanen@google.com;
 h=from:subject; bh=q4ijnPW2Mn1tvBetsRvgpl+qoFykStv8yW3UK+1fGGg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+ABPMDmB0fh0LjTs3/VHFrPcBar3PHMmw3b
 h6Q9A6DPKuJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgAAKCRBMtfaEi7xW
 7jgpC/9553yUfoqA9C4FRMa2OFuUbOCPwbvDRNsX7Y9zDAkutsoIgeg23FWNH3zegBmF5hA7+uW
 gmc4wt+WIt8lObecQrM8afOor4zIgp36iPBEyXWKQWiV6rzZqTev31yXsHzaeOxi/S0pUVykNZ2
 BVisTBwjLdMO2wO0WJRMCtoQheGw7NreTHf6ke1uYaqM71zvVaIijKaJL82bOoZGYc9tuUSeBnw
 i7Ve2L/W+lCEs0THbayq+7Z+wGOQ3f8YyU5VedjHsi1v0wki1Q0ekFH5I/BhQDq65ae4cHHfBQZ
 8faWYq/uAteKnSDn52Y5KqaH9pnHBKpFpYAUSI4Y1m1s1JQlpKwyIWsL+v9Lv5VqnVibdLXvZRD
 baULUYdoNKvc0fUPv746yPn/Ty1RsLoyaulv1PWezPFQ2WvsaAlhmAHtxKrC4tm19h8ptxDztlL MUIMlLVQLmpTSJZH9C4VsYCQuhJhmC6eljPY8UdNAn8rs0Lsd0Bzo6uRDWaYza3fi9HwQ=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-10-samitolvanen@google.com>
Subject: [PATCH v2 2/6] riscv: Add types to indirectly called assembly functions
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_CFI_CLANG, assembly functions indirectly called
from C code must be annotated with type identifiers to pass CFI
checking. Use the SYM_TYPED_START macro to add types to the
relevant functions.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S        | 5 +++--
 arch/riscv/kernel/suspend_entry.S | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 8a6e5a9e842a..6c9469050f4c 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -3,6 +3,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/unistd.h>
@@ -47,13 +48,13 @@
 	addi	sp, sp, 4*SZREG
 	.endm
 
-ENTRY(ftrace_stub)
+SYM_TYPED_FUNC_START(ftrace_stub)
 #ifdef CONFIG_DYNAMIC_FTRACE
        .global MCOUNT_NAME
        .set    MCOUNT_NAME, ftrace_stub
 #endif
 	ret
-ENDPROC(ftrace_stub)
+SYM_FUNC_END(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index 12b52afe09a4..f7960c7c5f9e 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -5,6 +5,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
@@ -58,7 +59,7 @@ ENTRY(__cpu_suspend_enter)
 	ret
 END(__cpu_suspend_enter)
 
-ENTRY(__cpu_resume_enter)
+SYM_TYPED_FUNC_START(__cpu_resume_enter)
 	/* Load the global pointer */
 	.option push
 	.option norelax
@@ -94,4 +95,4 @@ ENTRY(__cpu_resume_enter)
 
 	/* Return to C code */
 	ret
-END(__cpu_resume_enter)
+SYM_FUNC_END(__cpu_resume_enter)
-- 
2.41.0.255.g8b1d071c50-goog

