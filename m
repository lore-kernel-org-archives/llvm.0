Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B54168
	for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 02:13:22 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id iw6-20020a0562140f2600b004118fe44fa1so13224562qvb.13
        for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 18:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZKMSXc/jMpfaWf09da1q1+bGVDKO4UknzJqykhMae6A=;
        b=l6Y6bBb+/+l32vwPuzGN7A9dFXMTvRQCL3ovIAmmchpqjAgEAqfkrgiU2tIzAdk9Mz
         ZMnpKYfMFjTpTTaFB/mfp8OIRxoxrlZssdgJo7qMc3eNNbnfwuDMGJtXaE17T413mD3D
         l7H3+oEYiEv2u2e49F8Q2ws9Hx5TIRMpxnu5mnJuh3DdH24x++jmmhXgRWR3e8a9RbLL
         2ZHo/+7UvGdmjW+P5Ju3RfjU1aq8biiKUbgRH0GPNu0Ynf+PqCIAAXKTAHu5C5Y/RMav
         6otZGsfKdujl6gXvE4Rq0CoYlBtu3ntGgK65p8zGDX5ybb8TOTCbMPkosKs4/HnYe3/n
         StUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZKMSXc/jMpfaWf09da1q1+bGVDKO4UknzJqykhMae6A=;
        b=ZPDv6g857PW8e6X6U1U8mgo7Cp2sM6pwvpZp10t/GCF72cIYNEBCMLO1Y5rlBqSfVt
         RZVjQ4hoPAE4bWqnJAuZYdYluQmHetwpHr5zMSmniZnx+e6vhD9hV6idzOcaSsdtMW9E
         4DpkwmLwT7zIK9XdMDHJ2w/kCa1APngXGRM++7qSCPMQF0CfzrqPj0oii0m5BmvO9+vD
         F/ZIiViMAyDKCePBS1Ek+Ghzhc+AB7/IqjqvKyscvowziAG3Lic2Y9SYbSeiUakyEQW/
         LKBQ0GEqbyR0tU6c7peQoFQua22f3bEzX9GvvQj6e9h9J/vQIU5Mf26JfC4Gdm/ovWDu
         NNiw==
X-Gm-Message-State: AOAM532+0FwBARHZ4gPDUkcu6qwF5pzIiACXg/Hiq7V7qesdtJ4OianP
	s6SOlzuuBgQnH1x7H4de1Ysq3ZBB
X-Google-Smtp-Source: ABdhPJxo6vwMu5T1jCd3ePKlfu15nHs4yCppVyGgyut6kZlmLUd7MRrHj7ma0rTHGnDXZqK377rvDH34uQ==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:8428:9f56:bf21:1fd5])
 (user=morbo job=sendgmr) by 2002:a05:622a:5d2:: with SMTP id
 d18mr21144819qtb.154.1640744001849; Tue, 28 Dec 2021 18:13:21 -0800 (PST)
Date: Tue, 28 Dec 2021 18:12:58 -0800
In-Reply-To: <20211215211847.206208-1-morbo@google.com>
Message-Id: <20211229021258.176670-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211215211847.206208-1-morbo@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH v2] x86: use builtins to read eflags
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

However, using builtins is benefiical in general, because it removes the
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

Signed-off-by: Bill Wendling <morbo@google.com>
---
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
index c5ce9845c999..27f919ea7ac3 100644
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
2.34.1.448.ga2b2bfdf31-goog

