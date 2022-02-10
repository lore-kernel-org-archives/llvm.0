Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDCE2F22
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 22:32:15 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id b64-20020a256743000000b0061e169a5f19so14601001ybc.11
        for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 14:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gl08/uxFVlmi2wSTq5+9dUe3B/HwzYiRuJoJTn+segs=;
        b=BdC/fKhWAhUYwCbX8kX1FDzZtTY9aXZLZxD44qMz+MrqHmpo9XxkQ1C7btl4i+KBVV
         2Ttqt8x0eMP9PuQygYLTj0RxfbJGpXIFw5IZjpN/3or4BSXmsMctd17EhXpz9MgID3jO
         Q70qwhcGZZ8Q9ILF3wfH79Moln9rfUCDFOmkxEJ40b7+4WFJRQmCmCZl6Gv+hi3LgMGZ
         WQJEhU9pRiMZ2Kl2UcNgWBheBv/L/Q+B9jAavghoGDh76uwwOd+etdfMAMGK2thVbD7W
         cLh1JCBDeH/t5HCTavnLVT+ygkAhzWIOeOoVs5j7GDPwte7Qo8aRpEKtRHBfxq58hsKf
         RM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gl08/uxFVlmi2wSTq5+9dUe3B/HwzYiRuJoJTn+segs=;
        b=OayJTzxvdd8XzhjPgYdQn0H8WSlY9/RVj22Pd3W4hIb/J+MNfcdb4GurGxZ66EMoYb
         VjxtihrMTx2UHTpPSCSfFH8ik6KtO4XFkWwWU/gRa22brn0qCGdiheP+yWdJvvCV18Tk
         yMgeGig8uQSsG0j+4xZdcLFU/8vBlBfirwlzczS45+lbQOOCHVtefCgjVh7SUkvZrlIx
         OXcLcvWgKPAJ08LLNwuROijByPqcX1wsVyL7guK2931fWudb/KbhB3y3LLyg0VS1z5Lh
         DJaBQMw0jXdqDmRMZAvwFrMyTWIXIhSzW1OkK2RCy/TZ1vwdz5vB5NZEoBVxqTLcHWTq
         /H0A==
X-Gm-Message-State: AOAM530gfEqa/PccUAWan4ilbQkhI9C7brAbApMTpWoiP+eH3m7/73Cn
	aFUFTHFamtqrretOELqF1D2VgNaQ
X-Google-Smtp-Source: ABdhPJzsflLFTtrCxYLYUbOG68XKxeYHkfS3xyNJorZcxmlFdOO6bvUPqjcNKP1xFAdasYI3UiPhTZ8wNQ==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:2f6e:60d0:d1d5:6d5b])
 (user=morbo job=sendgmr) by 2002:a25:3285:: with SMTP id y127mr9242337yby.205.1644532334603;
 Thu, 10 Feb 2022 14:32:14 -0800 (PST)
Date: Thu, 10 Feb 2022 14:31:34 -0800
In-Reply-To: <20220204005742.1222997-1-morbo@google.com>
Message-Id: <20220210223134.233757-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220204005742.1222997-1-morbo@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v4] x86: use builtins to read eflags
From: Bill Wendling <morbo@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

GCC and Clang both have builtins to read and write the EFLAGS register.
This allows the compiler to determine the best way to generate this
code, which can improve code generation.

This issue arose due to Clang's issue with the "=rm" constraint.  Clang
chooses to be conservative in these situations, and so uses memory
instead of registers. This is a known issue, which is currently being
addressed.

However, using builtins is beneficial in general, because it removes the
burden of determining what's the way to read the flags register from the
programmer and places it on to the compiler, which has the information
needed to make that decision. Indeed, this piece of code has had several
changes over the years, some of which were pinging back and forth to
determine the correct constraints to use.

With this change, Clang generates better code:

Original code:
        movq    $0, -48(%rbp)
        #APP
        # __raw_save_flags
        pushfq
        popq    -48(%rbp)
        #NO_APP
        movq    -48(%rbp), %rbx

New code:
        pushfq
        popq    %rbx
        #APP

Note that the stack slot in the original code is no longer needed in the
new code, saving a small amount of stack space.

There is no change to GCC's output:

Original code:

        # __raw_save_flags
        pushf ; pop %r13        # flags

New code:

        pushfq
        popq    %r13    # _23

Signed-off-by: Bill Wendling <morbo@google.com>
---
v4: - Clang now no longer generates stack frames when using these builtins.
    - Corrected misspellings.
v3: - Add blurb indicating that GCC's output hasn't changed.
v2: - Kept the original function to retain the out-of-line symbol.
    - Improved the commit message.
    - Note that I couldn't use Nick's suggestion of

        return IS_ENABLED(CONFIG_X86_64) ? ...

      because Clang complains about using __builtin_ia32_readeflags_u32 in
      64-bit mode.
---
 arch/x86/include/asm/irqflags.h | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 87761396e8cc..f31a035f3c6a 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -19,20 +19,11 @@
 extern inline unsigned long native_save_fl(void);
 extern __always_inline unsigned long native_save_fl(void)
 {
-	unsigned long flags;
-
-	/*
-	 * "=rm" is safe here, because "pop" adjusts the stack before
-	 * it evaluates its effective address -- this is part of the
-	 * documented behavior of the "pop" instruction.
-	 */
-	asm volatile("# __raw_save_flags\n\t"
-		     "pushf ; pop %0"
-		     : "=rm" (flags)
-		     : /* no input */
-		     : "memory");
-
-	return flags;
+#ifdef CONFIG_X86_64
+	return __builtin_ia32_readeflags_u64();
+#else
+	return __builtin_ia32_readeflags_u32();
+#endif
 }
 
 static __always_inline void native_irq_disable(void)
-- 
2.35.1.265.g69c8d7142f-goog

