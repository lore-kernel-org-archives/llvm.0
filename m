Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572375;
	b=cSQf49+MQ+/+dsYqw7j8phrSM1P5KjDutEjnQH/Ux109mcX+/nWQJNi5R70MEW730sdE
	 2m5WC3/yY5WirInw5xUtKqGHy50SXRNQccR+iWj2Z8yrGe9OXxSyJB0fxfuMi0gDMWVR/
	 QKmPgDhJM0bKsnko+gNByuTe35ggIQ6uvTjsYHbLywD3G3CNU9zBCQUxXHsUukyK0RW3y
	 MpnfCWL+cuQa1Us9SDk/pLWv1XtiSvyjonS8GPvv0pSwE+j7KFbWFGgy41SqySuXt/ld/
	 nckMfYvQpyseb891ro881yQiQ69AO6wIb/E0AlJZzPcEXM/mo8WlL25WUhlpT5fAkZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572375;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y4GzxxtTEuBZUaPlWRdAzjl7PmaiAgGGsLZ5VGRX/Ds=;
	b=E3jg8RS9zBdxMpUV8NqzOugof2f2HZ/RAflNa0GEewaeSvBNPg+zw2BEq9oSDZvy+Jhi
	 QafVyCQ8zsSVEguvxKriPy6XD4bH2YzvnNDcYqdqQG/I4HXZWP/Oz6O6Vyc3VWwukfJMJ
	 e2sYBa/MXZ1XscNd8VTxLwhDW35/+20JVE3AjHfPB6n7x+7j9EJpyi2gMSXOcLF6DGgmn
	 lf5RIaosH714nSvPHl+j5dryQ5jJXRFTCiWApcLq9lXuI++D+xu3nxt8DFi0pCn2kp+TD
	 ExbP2cLQlGYC9OlmtDMK/VKOx9p2s6zdP/al55S1jTVu4WTFL8KxCcs8fBegf+orxrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hBmZX0vN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B2C606A31E;
	Wed, 25 Nov 2026 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hBmZX0vN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FD61F000C0;
	Wed, 25 Nov 2026 02:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572374;
	bh=Y4GzxxtTEuBZUaPlWRdAzjl7PmaiAgGGsLZ5VGRX/Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hBmZX0vN1F3iE7vKZerONam5pPT9x161xDplnavWhxNtYS1WaxUbtrMhvXeLahLtr
	 m6V2WOecPa9lhER7kpeYGmLiXxkzbKM4AzMU3+KgO2iRD4XHe/rNZAk/z7k/YQqlmO
	 KktRquAqY4fm6NLy3gSL0psJyQ0h2zlPNd/R4UcPmWiFoNLV3bQBMTsaoTAGFAUFwE
	 X760YV8gvYmEtxPIKNqWGtiqWRsb6d8h6PtoHvkX7wgun6xZYvusjCn6XJwopwROIT
	 bXloVxubmn6JCoA1rptX9b589C2rKZ9FBto8rhzF1nv6RQ8lV2xzKmAOYD+0PxUW3j
	 FLu1YAxERwFsQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v3 01/19] coverage: move gcov and kcov under kernel/coverage/
Date: Tue, 24 Nov 2026 21:05:45 -0500
Message-ID: <20261125020603.3934222-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel carries more than one code coverage implementation, each
with its own directory, Kconfig menu, build plumbing and debugfs
interface. Start consolidating them by moving the existing
implementations next to each other:

  kernel/gcov/  -> kernel/coverage/gcov/
  kernel/kcov.c -> kernel/coverage/kcov.c

Both are configured from a new "Code coverage" menu in
kernel/coverage/Kconfig, which is sourced from "Kernel Testing and
Coverage" where the KCOV options used to live. The gcov options move
there from "General architecture-dependent options".

The Kconfig symbols and their dependencies are unchanged, and so are the
per-object compiler flags of kcov.o, which move to
kernel/coverage/Makefile.

The move is visible in one place. When gcov profiles the whole kernel,
the data of its own base.o shows up in debugfs under
kernel/coverage/gcov/ instead of kernel/gcov/. lcov looks for
kernel/gcov/base.gcno there to detect the kernel build directory and no
longer finds it, so "lcov --capture" needs the build directory passed
with -b, as it already does when gcov's own files aren't profiled.

Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com> # gcov
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 MAINTAINERS                           |  8 +++-
 arch/Kconfig                          |  2 -
 include/linux/sched.h                 |  2 +-
 kernel/Makefile                       | 15 +------
 kernel/coverage/Kconfig               | 65 +++++++++++++++++++++++++++
 kernel/coverage/Makefile              | 16 +++++++
 kernel/{ => coverage}/gcov/Kconfig    |  0
 kernel/{ => coverage}/gcov/Makefile   |  0
 kernel/{ => coverage}/gcov/base.c     |  0
 kernel/{ => coverage}/gcov/clang.c    |  2 +-
 kernel/{ => coverage}/gcov/fs.c       |  0
 kernel/{ => coverage}/gcov/gcc_4_7.c  |  0
 kernel/{ => coverage}/gcov/gcc_base.c |  0
 kernel/{ => coverage}/gcov/gcov.h     |  0
 kernel/{ => coverage}/kcov.c          |  0
 lib/Kconfig.debug                     | 59 +-----------------------
 tools/unittests/test_cmatch.py        |  2 +-
 17 files changed, 92 insertions(+), 79 deletions(-)
 create mode 100644 kernel/coverage/Kconfig
 create mode 100644 kernel/coverage/Makefile
 rename kernel/{ => coverage}/gcov/Kconfig (100%)
 rename kernel/{ => coverage}/gcov/Makefile (100%)
 rename kernel/{ => coverage}/gcov/base.c (100%)
 rename kernel/{ => coverage}/gcov/clang.c (99%)
 rename kernel/{ => coverage}/gcov/fs.c (100%)
 rename kernel/{ => coverage}/gcov/gcc_4_7.c (100%)
 rename kernel/{ => coverage}/gcov/gcc_base.c (100%)
 rename kernel/{ => coverage}/gcov/gcov.h (100%)
 rename kernel/{ => coverage}/kcov.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b80..06caae6d28cf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11172,7 +11172,9 @@ GCOV BASED KERNEL PROFILING
 M:	Peter Oberparleiter <oberpar@linux.ibm.com>
 S:	Maintained
 F:	Documentation/dev-tools/gcov.rst
-F:	kernel/gcov/
+F:	kernel/coverage/Kconfig
+F:	kernel/coverage/Makefile
+F:	kernel/coverage/gcov/
 F:	scripts/Makefile.gcov
 
 GDB KERNEL DEBUGGING HELPER SCRIPTS
@@ -14406,7 +14408,9 @@ B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%2
 F:	Documentation/dev-tools/kcov.rst
 F:	include/linux/kcov.h
 F:	include/uapi/linux/kcov.h
-F:	kernel/kcov.c
+F:	kernel/coverage/Kconfig
+F:	kernel/coverage/Makefile
+F:	kernel/coverage/kcov.c
 F:	scripts/Makefile.kcov
 
 KCSAN
diff --git a/arch/Kconfig b/arch/Kconfig
index 1163736de1f99..057ada4747387 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1769,8 +1769,6 @@ config ARCH_VMLINUX_NEEDS_RELOCS
 config HAVE_GENERIC_TIF_BITS
        bool
 
-source "kernel/gcov/Kconfig"
-
 source "scripts/gcc-plugins/Kconfig"
 
 config FUNCTION_ALIGNMENT_4B
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d78555..615e4c1bacd61 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1538,7 +1538,7 @@ struct task_struct {
 #endif /* CONFIG_TRACING */
 
 #ifdef CONFIG_KCOV
-	/* See kernel/kcov.c for more details. */
+	/* See kernel/coverage/kcov.c for more details. */
 
 	/* Coverage collection mode enabled for this task (0 if disabled): */
 	unsigned int			kcov_mode;
diff --git a/kernel/Makefile b/kernel/Makefile
index 4ff92e24680c5..50bf37a26bae3 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -35,18 +35,6 @@ KCSAN_SANITIZE_softirq.o = n
 # and produce insane amounts of uninteresting coverage.
 KCOV_INSTRUMENT_extable.o := n
 KCOV_INSTRUMENT_stacktrace.o := n
-# Don't self-instrument.
-KCOV_INSTRUMENT_kcov.o := n
-# If sanitizers detect any issues in kcov, it may lead to recursion
-# via printk, etc.
-KASAN_SANITIZE_kcov.o := n
-KCSAN_SANITIZE_kcov.o := n
-UBSAN_SANITIZE_kcov.o := n
-KMSAN_SANITIZE_kcov.o := n
-
-CONTEXT_ANALYSIS_kcov.o := y
-CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
-
 obj-y += sched/
 obj-y += locking/
 obj-y += power/
@@ -96,8 +84,7 @@ obj-$(CONFIG_IKHEADERS) += kheaders.o
 obj-$(CONFIG_SMP) += stop_machine.o
 obj-$(CONFIG_AUDIT) += audit.o auditfilter.o
 obj-$(CONFIG_AUDITSYSCALL) += auditsc.o audit_watch.o audit_fsnotify.o audit_tree.o
-obj-$(CONFIG_GCOV_KERNEL) += gcov/
-obj-$(CONFIG_KCOV) += kcov.o
+obj-y += coverage/
 obj-$(CONFIG_KPROBES) += kprobes.o
 obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
 obj-$(CONFIG_KGDB) += debug/
diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
new file mode 100644
index 0000000000000..dd90b6a61ae65
--- /dev/null
+++ b/kernel/coverage/Kconfig
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Code coverage"
+
+source "kernel/coverage/gcov/Kconfig"
+
+config ARCH_HAS_KCOV
+	bool
+	help
+	  An architecture should select this when it can successfully
+	  build and run with CONFIG_KCOV. This typically requires
+	  disabling instrumentation for some early boot code.
+
+config KCOV
+	bool "Code coverage for fuzzing"
+	depends on ARCH_HAS_KCOV
+	depends on !ARCH_WANTS_NO_INSTR || HAVE_NOINSTR_HACK || \
+		   GCC_VERSION >= 120000 || CC_IS_CLANG
+	select DEBUG_FS
+	select OBJTOOL if HAVE_NOINSTR_HACK
+	help
+	  KCOV exposes kernel code coverage information in a form suitable
+	  for coverage-guided fuzzing (randomized testing).
+
+	  For more details, see Documentation/dev-tools/kcov.rst.
+
+config KCOV_ENABLE_COMPARISONS
+	bool "Enable comparison operands collection by KCOV"
+	depends on KCOV
+	depends on $(cc-option,-fsanitize-coverage=trace-cmp)
+	help
+	  KCOV also exposes operands of every comparison in the instrumented
+	  code along with operand sizes and PCs of the comparison instructions.
+	  These operands can be used by fuzzing engines to improve the quality
+	  of fuzzing coverage.
+
+config KCOV_INSTRUMENT_ALL
+	bool "Instrument all code by default"
+	depends on KCOV
+	default y
+	help
+	  If you are doing generic system call fuzzing (like e.g. syzkaller),
+	  then you will want to instrument the whole kernel and you should
+	  say y here. If you are doing more targeted fuzzing (like e.g.
+	  filesystem fuzzing with AFL) then you will want to enable coverage
+	  for more specific subsets of files, and should say n here.
+
+config KCOV_IRQ_AREA_SIZE
+	hex "Size of interrupt coverage collection area in words"
+	depends on KCOV
+	range 0x80 0x1000000
+	default 0x40000
+	help
+	  KCOV uses preallocated areas to collect coverage from soft
+	  interrupts. This specifies the size of those areas in the
+	  number of unsigned long words.
+
+config KCOV_SELFTEST
+	bool "Perform short selftests on boot"
+	depends on KCOV
+	help
+	  Run short KCOV coverage collection selftests on boot.
+	  On test failure, causes the kernel to panic. Recommended to be
+	  enabled, ensuring critical functionality works as intended.
+
+endmenu
diff --git a/kernel/coverage/Makefile b/kernel/coverage/Makefile
new file mode 100644
index 0000000000000..a4cd8cc18d9bc
--- /dev/null
+++ b/kernel/coverage/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GCOV_KERNEL) += gcov/
+obj-$(CONFIG_KCOV) += kcov.o
+
+# Don't self-instrument.
+KCOV_INSTRUMENT_kcov.o := n
+# If sanitizers detect any issues in kcov, it may lead to recursion
+# via printk, etc.
+KASAN_SANITIZE_kcov.o := n
+KCSAN_SANITIZE_kcov.o := n
+UBSAN_SANITIZE_kcov.o := n
+KMSAN_SANITIZE_kcov.o := n
+
+CONTEXT_ANALYSIS_kcov.o := y
+CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
diff --git a/kernel/gcov/Kconfig b/kernel/coverage/gcov/Kconfig
similarity index 100%
rename from kernel/gcov/Kconfig
rename to kernel/coverage/gcov/Kconfig
diff --git a/kernel/gcov/Makefile b/kernel/coverage/gcov/Makefile
similarity index 100%
rename from kernel/gcov/Makefile
rename to kernel/coverage/gcov/Makefile
diff --git a/kernel/gcov/base.c b/kernel/coverage/gcov/base.c
similarity index 100%
rename from kernel/gcov/base.c
rename to kernel/coverage/gcov/base.c
diff --git a/kernel/gcov/clang.c b/kernel/coverage/gcov/clang.c
similarity index 99%
rename from kernel/gcov/clang.c
rename to kernel/coverage/gcov/clang.c
index fd98ced0e51d2..e979e8983dce8 100644
--- a/kernel/gcov/clang.c
+++ b/kernel/coverage/gcov/clang.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2019 Google, Inc.
- * modified from kernel/gcov/gcc_4_7.c
+ * modified from kernel/coverage/gcov/gcc_4_7.c
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
diff --git a/kernel/gcov/fs.c b/kernel/coverage/gcov/fs.c
similarity index 100%
rename from kernel/gcov/fs.c
rename to kernel/coverage/gcov/fs.c
diff --git a/kernel/gcov/gcc_4_7.c b/kernel/coverage/gcov/gcc_4_7.c
similarity index 100%
rename from kernel/gcov/gcc_4_7.c
rename to kernel/coverage/gcov/gcc_4_7.c
diff --git a/kernel/gcov/gcc_base.c b/kernel/coverage/gcov/gcc_base.c
similarity index 100%
rename from kernel/gcov/gcc_base.c
rename to kernel/coverage/gcov/gcc_base.c
diff --git a/kernel/gcov/gcov.h b/kernel/coverage/gcov/gcov.h
similarity index 100%
rename from kernel/gcov/gcov.h
rename to kernel/coverage/gcov/gcov.h
diff --git a/kernel/kcov.c b/kernel/coverage/kcov.c
similarity index 100%
rename from kernel/kcov.c
rename to kernel/coverage/kcov.c
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a6..bb939219f4cb4 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2192,64 +2192,7 @@ config FAULT_INJECTION_STACKTRACE_FILTER
 	help
 	  Provide stacktrace filter for fault-injection capabilities
 
-config ARCH_HAS_KCOV
-	bool
-	help
-	  An architecture should select this when it can successfully
-	  build and run with CONFIG_KCOV. This typically requires
-	  disabling instrumentation for some early boot code.
-
-config KCOV
-	bool "Code coverage for fuzzing"
-	depends on ARCH_HAS_KCOV
-	depends on !ARCH_WANTS_NO_INSTR || HAVE_NOINSTR_HACK || \
-		   GCC_VERSION >= 120000 || CC_IS_CLANG
-	select DEBUG_FS
-	select OBJTOOL if HAVE_NOINSTR_HACK
-	help
-	  KCOV exposes kernel code coverage information in a form suitable
-	  for coverage-guided fuzzing (randomized testing).
-
-	  For more details, see Documentation/dev-tools/kcov.rst.
-
-config KCOV_ENABLE_COMPARISONS
-	bool "Enable comparison operands collection by KCOV"
-	depends on KCOV
-	depends on $(cc-option,-fsanitize-coverage=trace-cmp)
-	help
-	  KCOV also exposes operands of every comparison in the instrumented
-	  code along with operand sizes and PCs of the comparison instructions.
-	  These operands can be used by fuzzing engines to improve the quality
-	  of fuzzing coverage.
-
-config KCOV_INSTRUMENT_ALL
-	bool "Instrument all code by default"
-	depends on KCOV
-	default y
-	help
-	  If you are doing generic system call fuzzing (like e.g. syzkaller),
-	  then you will want to instrument the whole kernel and you should
-	  say y here. If you are doing more targeted fuzzing (like e.g.
-	  filesystem fuzzing with AFL) then you will want to enable coverage
-	  for more specific subsets of files, and should say n here.
-
-config KCOV_IRQ_AREA_SIZE
-	hex "Size of interrupt coverage collection area in words"
-	depends on KCOV
-	range 0x80 0x1000000
-	default 0x40000
-	help
-	  KCOV uses preallocated areas to collect coverage from soft
-	  interrupts. This specifies the size of those areas in the
-	  number of unsigned long words.
-
-config KCOV_SELFTEST
-	bool "Perform short selftests on boot"
-	depends on KCOV
-	help
-	  Run short KCOV coverage collection selftests on boot.
-	  On test failure, causes the kernel to panic. Recommended to be
-	  enabled, ensuring critical functionality works as intended.
+source "kernel/coverage/Kconfig"
 
 menuconfig RUNTIME_TESTING_MENU
 	bool "Runtime Testing"
diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
index 109141cd2ab8d..06f9c61572e2e 100755
--- a/tools/unittests/test_cmatch.py
+++ b/tools/unittests/test_cmatch.py
@@ -706,7 +706,7 @@ class TestSubWithLocalXforms(TestCaseDiff):
 
     def test_struct_kcov(self):
         """
-        Test a struct from kernel/kcov.c.
+        Test a struct from kernel/coverage/kcov.c.
         """
         line = """
             struct kcov {
-- 
2.53.0

