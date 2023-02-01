Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D18E63B3
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 16:25:26 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8B0F841AE6
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1675268717;
	bh=OElsN2B6oYe7JjTL/MB6S55CTh27xT/JZrDvUvGw7EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=CKJq77LSKXOmGI9W/Qoo99edlBB7VlMkHpywlwmsvbNSaj8IyNNdDzfTpKM33Siyr
	 8H1npz3pjNU+qGHXaunaZoPaFLqVCh/PSGX0N1RnL5xlqJ3X/7/jVNqBer87Gxkb8h
	 SvDH8DxYeliawX5Xf7810OYQMfkOrH6dfTUZB5pCzx6X1kzgk7CT/uXEmT1ZfHnd0W
	 b3ZqVcnBmHRuQWi2jqnEddNuo4nha10Hl3vUUFMbQFgzYhCu4F/bDHUwjIpurDAvtF
	 qEAhO9+6Q5uQhQ4DNs2JHl+CnGaHnO/fDJnBCcNCppLvmr2t3/g9q+y5isBodVaIZa
	 LOd+fUI7ksWIw==
Received: by mail-ed1-f70.google.com with SMTP id w16-20020a056402129000b004a1f1a2e79dso11088683edv.23
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 08:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OElsN2B6oYe7JjTL/MB6S55CTh27xT/JZrDvUvGw7EU=;
        b=yCFkjYXMx+7d21qKCXnCfvmg9tsDbU3xCSdaALEs3/IDV5iwx9SIlr5nLDDw/EWe9S
         Gkx75Uo0u+8TpmuaDt7kZQUmowCxS3ryPTBrGxw9/CT2zXZnfDy8dqp7jCPdDilNeGNH
         EceXx2ZaCcxjsDcga7SGe6G/B7aLA/qlQgUFSfRDtKLbRnd3YKHOh4oLFmgZfMqoTtuU
         Q5FzOiNF4A9+zXuTdXDR9gXh30jMws/tpDW92jn31E+tHRhPYDOaUde57BNqZ+1+4SGC
         RbxYqytgLtitDv1uarkma2i8fzwHX/wlrCrCWiWgkqKTEciYpx5n8kSzpujghUQVvvio
         stqw==
X-Gm-Message-State: AO0yUKXW6CYbBX3Slbs3zeQ4vLg1GnpbXDcx4YxBsPBPWXuxMmNyvJxc
	zlov6nniJrCySVE6IIvk7W9wHwgSI6hMrcvzfqrwPQS5dMXxfVfAqU4s4PcdsuMlXVG1pQ796u8
	59eSbNate45nBuoGANWrovgIZJ023FhA=
X-Received: by 2002:aa7:d28d:0:b0:49e:cd82:cc73 with SMTP id w13-20020aa7d28d000000b0049ecd82cc73mr2677513edq.29.1675268710190;
        Wed, 01 Feb 2023 08:25:10 -0800 (PST)
X-Google-Smtp-Source: AK7set87e3jGFTwZ5fDhhRd87yEPErdmmzA5DTnB2EXH4B5prJ6a+BvWsg5BinBnDcrK78zstNahYg==
X-Received: by 2002:aa7:d28d:0:b0:49e:cd82:cc73 with SMTP id w13-20020aa7d28d000000b0049ecd82cc73mr2677490edq.29.1675268709972;
        Wed, 01 Feb 2023 08:25:09 -0800 (PST)
Received: from localhost.localdomain ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id n10-20020a056402514a00b0049148f6461dsm8536194edd.65.2023.02.01.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:25:09 -0800 (PST)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: akpm@linux-foundation.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Marco Elver <elver@google.com>,
	Dan Li <ashimida@linux.alibaba.com>,
	llvm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] arch/Kconfig: Fix indentation
Date: Wed,  1 Feb 2023 17:24:35 +0100
Message-Id: <20230201162435.218368-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518054801.364376-1-juergh@canonical.com>
References: <20220518054801.364376-1-juergh@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

---
v3:
  - Fix author and SOB email addresses.
  - Don't add trailing comment to endmenu statement. Not everybody
    likes that.
v2:
  Fix subject prefix: (ARM: Konfig: -> arch/Kconfig:).
---
 arch/Kconfig | 128 +++++++++++++++++++++++++--------------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 12e3ddabac9d..e3511afbb7f2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -35,7 +35,7 @@ config HOTPLUG_SMT
 	bool
 
 config GENERIC_ENTRY
-       bool
+	bool
 
 config KPROBES
 	bool "Kprobes"
@@ -55,26 +55,26 @@ config JUMP_LABEL
 	depends on HAVE_ARCH_JUMP_LABEL
 	select OBJTOOL if HAVE_JUMP_LABEL_HACK
 	help
-	 This option enables a transparent branch optimization that
-	 makes certain almost-always-true or almost-always-false branch
-	 conditions even cheaper to execute within the kernel.
+	  This option enables a transparent branch optimization that
+	  makes certain almost-always-true or almost-always-false branch
+	  conditions even cheaper to execute within the kernel.
 
-	 Certain performance-sensitive kernel code, such as trace points,
-	 scheduler functionality, networking code and KVM have such
-	 branches and include support for this optimization technique.
+	  Certain performance-sensitive kernel code, such as trace points,
+	  scheduler functionality, networking code and KVM have such
+	  branches and include support for this optimization technique.
 
-	 If it is detected that the compiler has support for "asm goto",
-	 the kernel will compile such branches with just a nop
-	 instruction. When the condition flag is toggled to true, the
-	 nop will be converted to a jump instruction to execute the
-	 conditional block of instructions.
+	  If it is detected that the compiler has support for "asm goto",
+	  the kernel will compile such branches with just a nop
+	  instruction. When the condition flag is toggled to true, the
+	  nop will be converted to a jump instruction to execute the
+	  conditional block of instructions.
 
-	 This technique lowers overhead and stress on the branch prediction
-	 of the processor and generally makes the kernel faster. The update
-	 of the condition is slower, but those are always very rare.
+	  This technique lowers overhead and stress on the branch prediction
+	  of the processor and generally makes the kernel faster. The update
+	  of the condition is slower, but those are always very rare.
 
-	 ( On 32-bit x86, the necessary options added to the compiler
-	   flags may increase the size of the kernel slightly. )
+	  ( On 32-bit x86, the necessary options added to the compiler
+	    flags may increase the size of the kernel slightly. )
 
 config STATIC_KEYS_SELFTEST
 	bool "Static key selftest"
@@ -98,9 +98,9 @@ config KPROBES_ON_FTRACE
 	depends on KPROBES && HAVE_KPROBES_ON_FTRACE
 	depends on DYNAMIC_FTRACE_WITH_REGS
 	help
-	 If function tracer is enabled and the arch supports full
-	 passing of pt_regs to function tracing, then kprobes can
-	 optimize on top of function tracing.
+	  If function tracer is enabled and the arch supports full
+	  passing of pt_regs to function tracing, then kprobes can
+	  optimize on top of function tracing.
 
 config UPROBES
 	def_bool n
@@ -154,21 +154,21 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
 config ARCH_USE_BUILTIN_BSWAP
 	bool
 	help
-	 Modern versions of GCC (since 4.4) have builtin functions
-	 for handling byte-swapping. Using these, instead of the old
-	 inline assembler that the architecture code provides in the
-	 __arch_bswapXX() macros, allows the compiler to see what's
-	 happening and offers more opportunity for optimisation. In
-	 particular, the compiler will be able to combine the byteswap
-	 with a nearby load or store and use load-and-swap or
-	 store-and-swap instructions if the architecture has them. It
-	 should almost *never* result in code which is worse than the
-	 hand-coded assembler in <asm/swab.h>.  But just in case it
-	 does, the use of the builtins is optional.
+	  Modern versions of GCC (since 4.4) have builtin functions
+	  for handling byte-swapping. Using these, instead of the old
+	  inline assembler that the architecture code provides in the
+	  __arch_bswapXX() macros, allows the compiler to see what's
+	  happening and offers more opportunity for optimisation. In
+	  particular, the compiler will be able to combine the byteswap
+	  with a nearby load or store and use load-and-swap or
+	  store-and-swap instructions if the architecture has them. It
+	  should almost *never* result in code which is worse than the
+	  hand-coded assembler in <asm/swab.h>.  But just in case it
+	  does, the use of the builtins is optional.
 
-	 Any architecture with load-and-swap or store-and-swap
-	 instructions should set this. And it shouldn't hurt to set it
-	 on architectures that don't have such instructions.
+	  Any architecture with load-and-swap or store-and-swap
+	  instructions should set this. And it shouldn't hurt to set it
+	  on architectures that don't have such instructions.
 
 config KRETPROBES
 	def_bool y
@@ -720,13 +720,13 @@ config LTO_CLANG_FULL
 	depends on !COMPILE_TEST
 	select LTO_CLANG
 	help
-          This option enables Clang's full Link Time Optimization (LTO), which
-          allows the compiler to optimize the kernel globally. If you enable
-          this option, the compiler generates LLVM bitcode instead of ELF
-          object files, and the actual compilation from bitcode happens at
-          the LTO link step, which may take several minutes depending on the
-          kernel configuration. More information can be found from LLVM's
-          documentation:
+	  This option enables Clang's full Link Time Optimization (LTO), which
+	  allows the compiler to optimize the kernel globally. If you enable
+	  this option, the compiler generates LLVM bitcode instead of ELF
+	  object files, and the actual compilation from bitcode happens at
+	  the LTO link step, which may take several minutes depending on the
+	  kernel configuration. More information can be found from LLVM's
+	  documentation:
 
 	    https://llvm.org/docs/LinkTimeOptimization.html
 
@@ -1330,9 +1330,9 @@ config ARCH_HAS_CC_PLATFORM
 	bool
 
 config HAVE_SPARSE_SYSCALL_NR
-       bool
-       help
-          An architecture should select this if its syscall numbering is sparse
+	bool
+	help
+	  An architecture should select this if its syscall numbering is sparse
 	  to save space. For example, MIPS architecture has a syscall array with
 	  entries at 4000, 5000 and 6000 locations. This option turns on syscall
 	  related optimizations for a given architecture.
@@ -1356,35 +1356,35 @@ config HAVE_PREEMPT_DYNAMIC_CALL
 	depends on HAVE_STATIC_CALL
 	select HAVE_PREEMPT_DYNAMIC
 	help
-	   An architecture should select this if it can handle the preemption
-	   model being selected at boot time using static calls.
+	  An architecture should select this if it can handle the preemption
+	  model being selected at boot time using static calls.
 
-	   Where an architecture selects HAVE_STATIC_CALL_INLINE, any call to a
-	   preemption function will be patched directly.
+	  Where an architecture selects HAVE_STATIC_CALL_INLINE, any call to a
+	  preemption function will be patched directly.
 
-	   Where an architecture does not select HAVE_STATIC_CALL_INLINE, any
-	   call to a preemption function will go through a trampoline, and the
-	   trampoline will be patched.
+	  Where an architecture does not select HAVE_STATIC_CALL_INLINE, any
+	  call to a preemption function will go through a trampoline, and the
+	  trampoline will be patched.
 
-	   It is strongly advised to support inline static call to avoid any
-	   overhead.
+	  It is strongly advised to support inline static call to avoid any
+	  overhead.
 
 config HAVE_PREEMPT_DYNAMIC_KEY
 	bool
 	depends on HAVE_ARCH_JUMP_LABEL
 	select HAVE_PREEMPT_DYNAMIC
 	help
-	   An architecture should select this if it can handle the preemption
-	   model being selected at boot time using static keys.
+	  An architecture should select this if it can handle the preemption
+	  model being selected at boot time using static keys.
 
-	   Each preemption function will be given an early return based on a
-	   static key. This should have slightly lower overhead than non-inline
-	   static calls, as this effectively inlines each trampoline into the
-	   start of its callee. This may avoid redundant work, and may
-	   integrate better with CFI schemes.
+	  Each preemption function will be given an early return based on a
+	  static key. This should have slightly lower overhead than non-inline
+	  static calls, as this effectively inlines each trampoline into the
+	  start of its callee. This may avoid redundant work, and may
+	  integrate better with CFI schemes.
 
-	   This will have greater overhead than using inline static calls as
-	   the call to the preemption function cannot be entirely elided.
+	  This will have greater overhead than using inline static calls as
+	  the call to the preemption function cannot be entirely elided.
 
 config ARCH_WANT_LD_ORPHAN_WARN
 	bool
@@ -1407,8 +1407,8 @@ config ARCH_SUPPORTS_PAGE_TABLE_CHECK
 config ARCH_SPLIT_ARG64
 	bool
 	help
-	   If a 32-bit architecture requires 64-bit arguments to be split into
-	   pairs of 32-bit arguments, select this option.
+	  If a 32-bit architecture requires 64-bit arguments to be split into
+	  pairs of 32-bit arguments, select this option.
 
 config ARCH_HAS_ELFCORE_COMPAT
 	bool
-- 
2.34.1

