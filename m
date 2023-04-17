Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77AAD3B
	for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 22:00:15 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-54faf2e22afso135383177b3.7
        for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 15:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681768814; x=1684360814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ROFbMOV6yOo0pF0esK8s0D/4X+P3zglkAv5TCX1cqs=;
        b=a//CU5GAM8cMAJg0CXk4u7gyVLyPhgoZa7x1mGzF/rQPaDLgId/wanEXVqOxXOn+kM
         nYLD5qN/wOUNiFXB0cOc5R3SjZ2OTsHezj0xJbZPmD04sovR1oR5JJGJ/aDfV/cxg3Vd
         LgqjpqZPYfBA1ZhN1IOrM/axxWBCDvl7JA0F8QM1Y1Uc2mEqoG5u1bxgNIRw334OOzg3
         u80lcm6pZMmZoeqG/pLfdVpQafV6hDgyAOCWGYImDTzb2WmqZExgTAbnR58VnCZyCFuV
         TOvJZzJ4Y16C0wl8Sww6Vf9mTUlZvH9no4BT2ZF4AVgExEoUSCU0mCL3ElUO8LkHYyDU
         qENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681768814; x=1684360814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ROFbMOV6yOo0pF0esK8s0D/4X+P3zglkAv5TCX1cqs=;
        b=FuRlq6a/hG4adOMbjnSyquImuWJOHK7Uym8HGB3apEQrE3fcRt54HyWzjfEgrfagFV
         nfIp5+nDXD+ucgJl2OMsEP5PLVIsimuYUTch3Sks45zK+ltq3MnlbSmmPlvcJF7XwFCP
         BqY+l3M1PeAm2bea455GUPnChFyOwcbx78+38Z2mEtURsAra/N7JC6+gyzPEKwQF/U9s
         0q+ztbmDobQz+leVjDtFNTXn35erZABnbvxgsYWFvl3ZChNmmSG+X9TYdG+AGG429gHd
         P3g/EoRI8B9hC5OqWOyil8NxRuYkA3DlVhj5JfF3NseMvVDC/pIZRSjSErUnqjLWfrlz
         iuOQ==
X-Gm-Message-State: AAQBX9ehKxbr2iQk00Y1Y5D5qEJbSyok79OtoMIrcTpJDpXC8LHNQb7t
	6U1iCuXvwLN4Vyqynot/rMmVa9QSachzmeSVfEs=
X-Google-Smtp-Source: AKy350aj8hcRq7cSR+KhDqJVKAfpqj5aUFTlQ600+8xvMXvQ8sXvA/YNrOWGMc/8TS/lRXrMEe/ZtGrMgU+SJgwEYDs=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:e8f1:df30:2fb2:cf8a])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d24e:0:b0:b8b:eea7:525b with SMTP
 id j75-20020a25d24e000000b00b8beea7525bmr10333781ybg.7.1681768814180; Mon, 17
 Apr 2023 15:00:14 -0700 (PDT)
Date: Mon, 17 Apr 2023 15:00:05 -0700
In-Reply-To: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681768810; l=3068;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=Y+mVeYQgxmjVxZ8TAgHiUAti6DIYAGqhexs7SrW7nh8=; b=k+bDSjx2YwwBdTyaFSoJ/8gMZw5tWZUIXNTaKWaFoZOH6WdmTdy6AGNiUQAbqdFMIvIdWAOy0t2k
 GvvIDyIJAK3E9qe3zp8TVxxLQwxMwt4iYQrdD0fLqDyjKVw0SXFx
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v2-1-116f9fe4bbe7@google.com>
Subject: [PATCH v2 1/2] start_kernel: add no_stack_protector fn attr
From: ndesaulniers@google.com
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

Back during the discussion of
commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
we discussed the need for a function attribute to control the omission
of stack protectors on a per-function basis; at the time Clang had
support for no_stack_protector but GCC did not. This was fixed in
gcc-11. Now that the function attribute is available, let's start using
it.

Callers of boot_init_stack_canary need to use this function attribute
unless they're compiled with -fno-stack-protector, otherwise the canary
stored in the stack slot of the caller will differ upon the call to
boot_init_stack_canary. This will lead to a call to __stack_chk_fail
then panic.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94722
Link: https://lore.kernel.org/all/20200316130414.GC12561@hirez.programming.kicks-ass.net/
Tested-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/kernel/smp.c           |  1 +
 include/linux/compiler_attributes.h | 12 ++++++++++++
 init/main.c                         |  3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index f62e5e651bcd..48acae0da034 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1603,6 +1603,7 @@ static void add_cpu_to_masks(int cpu)
 }
 
 /* Activate a secondary processor. */
+__no_stack_protector
 void start_secondary(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index e659cb6fded3..84864767a56a 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -255,6 +255,18 @@
  */
 #define __noreturn                      __attribute__((__noreturn__))
 
+/*
+ * Optional: only supported since GCC >= 11.1, clang >= 7.0.
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no_005fstack_005fprotector-function-attribute
+ *   clang: https://clang.llvm.org/docs/AttributeReference.html#no-stack-protector-safebuffers
+ */
+#if __has_attribute(__no_stack_protector__)
+# define __no_stack_protector		__attribute__((__no_stack_protector__))
+#else
+# define __no_stack_protector
+#endif
+
 /*
  * Optional: not supported by gcc.
  *
diff --git a/init/main.c b/init/main.c
index 5d6365510173..1265c8d11052 100644
--- a/init/main.c
+++ b/init/main.c
@@ -941,7 +941,8 @@ static void __init print_unknown_bootoptions(void)
 	memblock_free(unknown_options, len);
 }
 
-asmlinkage __visible void __init __no_sanitize_address __noreturn start_kernel(void)
+asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
+void start_kernel(void)
 {
 	char *command_line;
 	char *after_dashes;

-- 
2.40.0.634.g4ca3ef3211-goog

