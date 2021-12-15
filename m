Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E4173
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 21:18:56 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id l145-20020a25cc97000000b005c5d04a1d52so45750159ybf.23
        for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 13:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=rfVzBKQXio+HJXcXyWZGxwvKV+1ieQCkHCR6oMZnhoQ=;
        b=iCmR+gGbmyXOnWlggmkLKgqCZETL+UsDkC4M0h8JwWcI/caMbap6KncjxKcGqAxSI9
         hg+KsaOr1/lqwi6oydwa7pC4tdpKk4hh61iRMdMEBqU5D6FcLcdMvk2GKsPur5Cqdi72
         qELjEG2pnXAOLoJrD7ymmQGb9iIaqE9laajR3IyLxMgQkVyPZj9Cy1nPbfN0ky7zA9ok
         JIFrQYfgjpingUFtYiY5q79aX3t43WGvmK9hexSIDAQj2+oehgoPatjx+H2+nRO+fCvn
         Y0gbmDgLOW6PDfd/cHz0vDNgdlpT60jDhUAVdlcmmpDRR6fv2mKtaXPcT4FejCGODoLQ
         6GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=rfVzBKQXio+HJXcXyWZGxwvKV+1ieQCkHCR6oMZnhoQ=;
        b=cdYuhn+NSfVUDoHPo9kwloMYnm7eBPQKzqxsXdG0FzAE47+1RNgb1JdS2USo/lcThQ
         T1lRgp8Vedg3sznxQv+Naqr0aE9fNdwnX+7QDV5aiOilH0857Q4Y1Q+8+vCNihrzzIec
         bT7hox31dO++Z83MPwL4xzZ6HFdRmxP9mVD952PW8RioMN8GzWMcwIffsMF1llnRRQtt
         mg+8wFuyVGBsuSKKno0a6nCVZ0KQ1Ep+32ncqol7HAZBm4icDkbLa2DWeoMw1CUGLsR3
         tG9U+LGr+zdDU68IEVI8yEmufzMQuJU4jptFF1IPG0Rp3qD8Khu5P3nKmYTx7bO0+Hpw
         KkVw==
X-Gm-Message-State: AOAM530CGlWrJSkFdDQ/S8x4AjyVCe88P5sSYrQWsJGcHHWhuOUgFkdZ
	otST/jmjAbHtUHsjGtJYJk91yuBV
X-Google-Smtp-Source: ABdhPJzCzD5XDaWR+cmfxbrVDviEasAJCo8xjv8+n9ymRKD84WfniioScLNBi8V7FVqJq9QXE97EAFMVxQ==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:ec97:1221:3aa:f18f])
 (user=morbo job=sendgmr) by 2002:a25:ae12:: with SMTP id a18mr8586004ybj.412.1639603135579;
 Wed, 15 Dec 2021 13:18:55 -0800 (PST)
Date: Wed, 15 Dec 2021 13:18:47 -0800
Message-Id: <20211215211847.206208-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH] x86: use builtins to read eflags
From: Bill Wendling <morbo@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

GCC and Clang both have builtins to read from and write to the
EFLAGS register. This allows the compiler to determine the best way
to generate the code, which can improve code generation.

Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/x86/include/asm/irqflags.h | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index c5ce9845c999..574fb44b82f7 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -15,25 +15,11 @@
  * Interrupt control:
  */
 
-/* Declaration required for gcc < 4.9 to prevent -Werror=missing-prototypes */
-extern inline unsigned long native_save_fl(void);
-extern __always_inline unsigned long native_save_fl(void)
-{
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
-}
+#ifdef CONFIG_X86_64
+#define native_save_fl()	__builtin_ia32_readeflags_u64()
+#else
+#define native_save_fl()	__builtin_ia32_readeflags_u32()
+#endif
 
 static __always_inline void native_irq_disable(void)
 {
-- 
2.34.1.173.g76aa8bc2d0-goog

