Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE682C9E
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 09:07:46 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id g8-20020adfa488000000b001d8e6467fe8so4545158wrb.6
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 01:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Bko2bBOFt8SFav6I5TjYOIulrzQuEbXeq+2gLbCWAVI=;
        b=sSmlJYozmYThA2O9gEj8NcX81sjnLIMmnNuddGd24vO0kHkAjWApKSsxMBRveAZdas
         lMCb0Hg4j5DWgstoNW22bQKdU6vEZXbY4OHaacX1kjX1iDwHeNdtu25YCr0g9qZDVufe
         wTvexoeRxifXBfzJcQDF9Y+EiulHdFhPHhoLIelkVEW88GJnF+fVq/fbHG8NZjic3fjb
         wfG1Ns+bMU7vM9+zjgLUDwAH+nOVdIZ2LfP5u2t9teBkPIO+lGvyFMBqYQmeG8R5fgP1
         r/ZbtcwgrFs/EhayiW39fNoe2rMfpxYsZRGkZ2FT2ivfDY0Tv2LaycUSO+/w6A2HnnYi
         M26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Bko2bBOFt8SFav6I5TjYOIulrzQuEbXeq+2gLbCWAVI=;
        b=dKdR0kAq+uo8lcc4G4DiDUDvEM5m8hla4gHZlblLJbwlvVvusPbuXT7JGNxt1fXdvH
         Sc4ryTjcHzdyDEkbnaaumDpCcwHx6UW6FGUFY32FrGacj5nU8lxzB9UNuovDb0bC0Eyr
         Xhf/nKo7Pv8DAmynT/QbkxnGVFhrviWNYrqQXAe7xEgj9OKmYhHHaZShyNSM21X7JErz
         SS/p48NS3sOLLvastuHA7dlX2/0Y2HE/oikOvv4k3BZFIJ/9ckkLsaB/J6CZuUyVnuzP
         L8d1hPUIxNjPC2dHBYvtguZw2NQwsPNnaFXFg+XLSTn5msfhUK+7e03/L4Wx4nVgKsnX
         9RsA==
X-Gm-Message-State: AOAM531hAShWfzgro/oxlEu8Jlre86X1dBCUUsPG9IxgZx0G8sxEspB0
	q85by2FErM4F5B/JWkQFkHwbxQGfdg==
X-Google-Smtp-Source: ABdhPJxrdHCArDGaHzsq5ML+QFS3K9GYi+DLIQHLfVABlfCy8j3KELH38OY+E7uZJ2JSgzwZoy2pCDp3IQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:9caa:cc34:599f:ecd4])
 (user=elver job=sendgmr) by 2002:a05:600c:2741:: with SMTP id
 1mr17797025wmw.50.1643620064562; Mon, 31 Jan 2022 01:07:44 -0800 (PST)
Date: Mon, 31 Jan 2022 10:05:21 +0100
In-Reply-To: <20220131090521.1947110-1-elver@google.com>
Message-Id: <20220131090521.1947110-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220131090521.1947110-1-elver@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2 2/2] stack: Constrain and fix stack offset randomization
 with Clang builds
From: Marco Elver <elver@google.com>
To: elver@google.com, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Elena Reshetova <elena.reshetova@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

All supported versions of Clang perform auto-init of __builtin_alloca()
when stack auto-init is on (CONFIG_INIT_STACK_ALL_{ZERO,PATTERN}).

add_random_kstack_offset() uses __builtin_alloca() to add a stack
offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
enabled, add_random_kstack_offset() will auto-init that unused portion
of the stack used to add an offset.

There are several problems with this:

	1. These offsets can be as large as 1023 bytes. Performing
	   memset() on them isn't exactly cheap, and this is done on
	   every syscall entry.

	2. Architectures adding add_random_kstack_offset() to syscall
	   entry implemented in C require them to be 'noinstr' (e.g. see
	   x86 and s390). The potential problem here is that a call to
	   memset may occur, which is not noinstr.

A x86_64 defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:

 | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
 | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to memset() leaves .noinstr.text section
 | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to memset() leaves .noinstr.text section
 | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section

Clang 14 (unreleased) will introduce a way to skip alloca initialization
via __builtin_alloca_uninitialized() (https://reviews.llvm.org/D115440).

Constrain RANDOMIZE_KSTACK_OFFSET to only be enabled if no stack
auto-init is enabled, the compiler is GCC, or Clang is version 14+. Use
__builtin_alloca_uninitialized() if the compiler provides it, as is done
by Clang 14.

Link: https://lkml.kernel.org/r/YbHTKUjEejZCLyhX@elver.google.com
Fixes: 39218ff4c625 ("stack: Optionally randomize kernel stack offset each syscall")
Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
v2:
* Update comment to point out which compilers initialize allocas.
---
 arch/Kconfig                     |  1 +
 include/linux/randomize_kstack.h | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2cde48d9b77c..c5b50bfe31c1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1163,6 +1163,7 @@ config RANDOMIZE_KSTACK_OFFSET
 	bool "Support for randomizing kernel stack offset on syscall entry" if EXPERT
 	default y
 	depends on HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
+	depends on INIT_STACK_NONE || !CC_IS_CLANG || CLANG_VERSION >= 140000
 	help
 	  The kernel stack offset can be randomized (after pt_regs) by
 	  roughly 5 bits of entropy, frustrating memory corruption
diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
index 91f1b990a3c3..1468caf001c0 100644
--- a/include/linux/randomize_kstack.h
+++ b/include/linux/randomize_kstack.h
@@ -17,8 +17,20 @@ DECLARE_PER_CPU(u32, kstack_offset);
  * alignment. Also, since this use is being explicitly masked to a max of
  * 10 bits, stack-clash style attacks are unlikely. For more details see
  * "VLAs" in Documentation/process/deprecated.rst
+ *
+ * The normal __builtin_alloca() is initialized with INIT_STACK_ALL (currently
+ * only with Clang and not GCC). Initializing the unused area on each syscall
+ * entry is expensive, and generating an implicit call to memset() may also be
+ * problematic (such as in noinstr functions). Therefore, if the compiler
+ * supports it (which it should if it initializes allocas), always use the
+ * "uninitialized" variant of the builtin.
  */
-void *__builtin_alloca(size_t size);
+#if __has_builtin(__builtin_alloca_uninitialized)
+#define __kstack_alloca __builtin_alloca_uninitialized
+#else
+#define __kstack_alloca __builtin_alloca
+#endif
+
 /*
  * Use, at most, 10 bits of entropy. We explicitly cap this to keep the
  * "VLA" from being unbounded (see above). 10 bits leaves enough room for
@@ -37,7 +49,7 @@ void *__builtin_alloca(size_t size);
 	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
 				&randomize_kstack_offset)) {		\
 		u32 offset = raw_cpu_read(kstack_offset);		\
-		u8 *ptr = __builtin_alloca(KSTACK_OFFSET_MAX(offset));	\
+		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
 		/* Keep allocation even after "ptr" loses scope. */	\
 		asm volatile("" :: "r"(ptr) : "memory");		\
 	}								\
-- 
2.35.0.rc2.247.g8bbb082509-goog

