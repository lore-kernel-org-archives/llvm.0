Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A5469E
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 05:48:13 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EE67B3FFC9
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 05:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1652852886;
	bh=OuYcIW78oTiw+Sz2rhEVAmrHB11Rr6sr/ed5JNrvcwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=aJB5w/tkPTc9ob45y7EY1Z4raeEI0mx5ge2EfyP4TnjeneTv3uM/6frRW3yZWn7Y2
	 di4zRHHd3QO2xDiPdmHnyK/EkDJIbhcnrDVtake8BE4W5RSMQM8S5JH0IHesBrPEt1
	 4XhCwhxe3bENu7qE78avaI+zRAnWt8LOvt28x5neJUWT9FcJA1jGNh1qGvY9GM3m8G
	 j3bikRCUabwfxWTQJY81wonWmFw+6iCYk1ve/ayEMYwJtkU+6oM8MbbErmK8qyO2Qa
	 utuClE3GbESeGS1Y8OPV5Hw1BnWX0ZQXF0RASwcVCslUzWJAKQX0KVVqdQu49KaNDD
	 uUMQHKX6rr0mA==
Received: by mail-ej1-f70.google.com with SMTP id go17-20020a1709070d9100b006f46e53a2a9so382135ejc.10
        for <llvm@lists.linux.dev>; Tue, 17 May 2022 22:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OuYcIW78oTiw+Sz2rhEVAmrHB11Rr6sr/ed5JNrvcwk=;
        b=lXO4yTxT2WTc7huO23kEUdwUP1RODer37Ru02HLi1QwU7tsp51IIQaEekuZCQLPT+o
         kGaFfGUwTfhB7j0Q3dUpjO2iIujEHJcfZxPXUhajD+3IYtxh0qWz2HD67hH47UWOfU6R
         e5z0pNe9sC3zzbf8LmH4tCRz8xBIqKZnbS/E1sN/uNkH+v5I5BPQibWy5p/Wl6W8qD5W
         +Sle1FdinwnSmjocm+IBdEROgL5EZXOCZAsP335EnlBUQyzc4A8l/NHoPhftuaGFD0Oq
         WWeTLUkNsKsq0su4+Hes/nWXaBMCOCdWE92KD707dsM2u2UsAnSv0yVvA39d9rOvZ4Ng
         dSbw==
X-Gm-Message-State: AOAM530WM4LGfZfeGCkwMpCVBR/oanBhJyQMVzflECLLc1SHtdxHD4+G
	aqk+JquUNYbu9nfCmzUQxgn1o0oP9L8gh0qJdWyTaaK+j3z9pr3df+Vcw5+YKIR1kTB5nEyAGSw
	4KF468WJjm+khV7bZFjKhwr00YAlWHq4=
X-Received: by 2002:a17:906:2294:b0:6f3:bd02:95a3 with SMTP id p20-20020a170906229400b006f3bd0295a3mr22217729eja.201.1652852886233;
        Tue, 17 May 2022 22:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsM5guVQhEMwbqlHeH0ltEm3owbFLAO6FNX1R+3hR4rTF5TMvbDnm/h3oEhbEjA5RRjkcMvQ==
X-Received: by 2002:a17:906:2294:b0:6f3:bd02:95a3 with SMTP id p20-20020a170906229400b006f3bd0295a3mr22217710eja.201.1652852885906;
        Tue, 17 May 2022 22:48:05 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id e18-20020a170906749200b006f3ef214e17sm513630ejl.125.2022.05.17.22.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 22:48:05 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	llvm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH v2] arch/Kconfig: Fix indentation and add comments
Date: Wed, 18 May 2022 07:48:01 +0200
Message-Id: <20220518054801.364376-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517141024.331475-1-juergh@canonical.com>
References: <20220517141024.331475-1-juergh@canonical.com>
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

While add it, add trailing comments to endmenu statements for better
readability.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>

---
v2:
  Fix subject prefix (ARM: Kconfig: -> arch/Kconfig)

---
 arch/Kconfig | 130 +++++++++++++++++++++++++--------------------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 31c4fdc4a4ba..65091088b1fd 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -28,7 +28,7 @@ config HOTPLUG_SMT
 	bool
 
 config GENERIC_ENTRY
-       bool
+	bool
 
 config KPROBES
 	bool "Kprobes"
@@ -47,26 +47,26 @@ config JUMP_LABEL
 	depends on HAVE_ARCH_JUMP_LABEL
 	depends on CC_HAS_ASM_GOTO
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
@@ -90,9 +90,9 @@ config KPROBES_ON_FTRACE
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
@@ -146,21 +146,21 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
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
@@ -686,13 +686,13 @@ config LTO_CLANG_FULL
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
 
@@ -1284,9 +1284,9 @@ config ARCH_HAS_CC_PLATFORM
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
@@ -1309,35 +1309,35 @@ config HAVE_PREEMPT_DYNAMIC_CALL
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
 	depends on HAVE_ARCH_JUMP_LABEL && CC_HAS_ASM_GOTO
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
@@ -1360,8 +1360,8 @@ config ARCH_SUPPORTS_PAGE_TABLE_CHECK
 config ARCH_SPLIT_ARG64
 	bool
 	help
-	   If a 32-bit architecture requires 64-bit arguments to be split into
-	   pairs of 32-bit arguments, select this option.
+	  If a 32-bit architecture requires 64-bit arguments to be split into
+	  pairs of 32-bit arguments, select this option.
 
 config ARCH_HAS_ELFCORE_COMPAT
 	bool
@@ -1380,4 +1380,4 @@ source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
 
-endmenu
+endmenu # "General architecture-dependent options"
-- 
2.32.0

