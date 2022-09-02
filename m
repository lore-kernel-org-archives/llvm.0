Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81E3200
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 21:37:55 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id m5-20020a170902f64500b0016d313f3ce7so1925828plg.23
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 14:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=/mc1MiX+U2pcHLov/3qEbkqcM9lCxpiueiff0h+FJ+U=;
        b=Q2EerrFu6GSc9+qdM21d39Ok1/UrtvKv9CPuKZnNEjP+CBLHM0P/0qMaUquffuhaKx
         pfR483A9uJppNTh7XewDu1pr6uVOLwVHqAdfY2GAW7FSLlYIqCWJ6cmhqo7Bsvvm8lXD
         7CQbeNE1Z1V3usBkx72vBtT5Ua8wkk9nDQGc7DXXqQxcYykqCJHrUiQO0LVf0Q8IOV2K
         JP5NhWrhb9tF20Wz2nA9xYX3Jnl4yUgNAMmYYoGgqfoEVEtbVxpwT3MjcpCzaxqzGTsy
         GpjqMb9a0HMBon5oX8PcVmDy1Pl3GOgMtHAqsunGj01rTDfSPzAhrLxPXKYffWw9712W
         6JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=/mc1MiX+U2pcHLov/3qEbkqcM9lCxpiueiff0h+FJ+U=;
        b=uvZpJgYXeeGGL54lFwKFnE0Gc/Bt0ih4RmYX1ZxdE9mdmBk02PG6XJlOL3P2sMcdb2
         Yr+4qhUVKsnB+33c6JuDF2rVTDWT/61zftRdpkklUHpVqbg5BH45B3gs9rdAGSj65aex
         ulebONcVuxIf9QKYr9yrMfZZiU4r8MCD7yhy1dTXnWmf54GmgskiwB5GauUH1Cvs5Z1M
         KX8qmAiMv1Q9LV2TI44Hk6Xhq3hLVCbllQU3iHfBRiZumEFyuWKADpknJ6sQ+EjFoI7u
         xVOyy9W1jGRFJsOt7x4xf/wn6WeIeAOehJ279/ujfqteuuy64CxGJYR8eHQfCsrW7KV4
         h/iw==
X-Gm-Message-State: ACgBeo1hLFgv/syWOEXBhu751vXetrod2E0Rqkgm3ps45aY5bl7vqrqg
	08ThiAIqMRHQUYy622UVzOhjgYNJ
X-Google-Smtp-Source: AA6agR4vXimw+E+0wnnf6E1awMel1BX3dAVTkK6yP715BhMBnACJPtNt15ZWtHDxbpZ1ZWi9c/wI5TnJhw==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a17:903:1cf:b0:176:8160:ac60 with SMTP id
 e15-20020a17090301cf00b001768160ac60mr106488plh.113.1662154675336; Fri, 02
 Sep 2022 14:37:55 -0700 (PDT)
Date: Fri,  2 Sep 2022 21:37:49 +0000
In-Reply-To: <20220902213750.1124421-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220902213750.1124421-1-morbo@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220902213750.1124421-2-morbo@google.com>
Subject: [PATCH 1/2] x86/paravirt: clean up typos and grammaros
From: Bill Wendling <morbo@google.com>
To: Juergen Gross <jgross@suse.com>, "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, 
	Alexey Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

Drive-by clean up of the comment.

[ Impact: cleanup]

Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/x86/include/asm/paravirt_types.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 89df6c6617f5..f04157456a49 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -328,7 +328,7 @@ int paravirt_disable_iospace(void);
  * Unfortunately, this is a relatively slow operation for modern CPUs,
  * because it cannot necessarily determine what the destination
  * address is.  In this case, the address is a runtime constant, so at
- * the very least we can patch the call to e a simple direct call, or
+ * the very least we can patch the call to a simple direct call, or,
  * ideally, patch an inline implementation into the callsite.  (Direct
  * calls are essentially free, because the call and return addresses
  * are completely predictable.)
@@ -339,10 +339,10 @@ int paravirt_disable_iospace(void);
  * on the stack.  All caller-save registers (eax,edx,ecx) are expected
  * to be modified (either clobbered or used for return values).
  * X86_64, on the other hand, already specifies a register-based calling
- * conventions, returning at %rax, with parameters going on %rdi, %rsi,
+ * conventions, returning at %rax, with parameters going in %rdi, %rsi,
  * %rdx, and %rcx. Note that for this reason, x86_64 does not need any
  * special handling for dealing with 4 arguments, unlike i386.
- * However, x86_64 also have to clobber all caller saved registers, which
+ * However, x86_64 also has to clobber all caller saved registers, which
  * unfortunately, are quite a bit (r8 - r11)
  *
  * The call instruction itself is marked by placing its start address
@@ -360,22 +360,22 @@ int paravirt_disable_iospace(void);
  * There are 5 sets of PVOP_* macros for dealing with 0-4 arguments.
  * It could be extended to more arguments, but there would be little
  * to be gained from that.  For each number of arguments, there are
- * the two VCALL and CALL variants for void and non-void functions.
+ * two VCALL and CALL variants for void and non-void functions.
  *
  * When there is a return value, the invoker of the macro must specify
  * the return type.  The macro then uses sizeof() on that type to
- * determine whether its a 32 or 64 bit value, and places the return
+ * determine whether it's a 32 or 64 bit value and places the return
  * in the right register(s) (just %eax for 32-bit, and %edx:%eax for
- * 64-bit). For x86_64 machines, it just returns at %rax regardless of
+ * 64-bit). For x86_64 machines, it just returns in %rax regardless of
  * the return value size.
  *
- * 64-bit arguments are passed as a pair of adjacent 32-bit arguments
+ * 64-bit arguments are passed as a pair of adjacent 32-bit arguments;
  * i386 also passes 64-bit arguments as a pair of adjacent 32-bit arguments
  * in low,high order
  *
  * Small structures are passed and returned in registers.  The macro
  * calling convention can't directly deal with this, so the wrapper
- * functions must do this.
+ * functions must do it.
  *
  * These PVOP_* macros are only defined within this header.  This
  * means that all uses must be wrapped in inline functions.  This also
-- 
2.37.2.789.g6183377224-goog

