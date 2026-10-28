Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188849;
	b=B3CTvdwA/V1zQ97KraRQA3Y1RmccrWMpV+I5rwCVSF4KHpEumu0FErEsAAANl/2bQHrJ
	 /ZznWVpGca80XZz1jNrVzMHBCTqndYTTP4FRHUJjwVmAA0sozAI7482Z/L2VTblf35YI3
	 HbOEmhC+eW/n2vYXbvFO7i03+Hr+70DEIVEy5d/ESXP8BybPy83un1IsY/CzaXoaZnyAP
	 bhR4trkAlrdBKHUWI3KnTwtEa0FU8dfGw6XngNilNvwi6xuvHhqS7AMye8tGRrvcwA2rt
	 Gbvfm7zMBYCZsPLxZSwcKDqBVAVYrzP/+GgiTX5I0STlXCGmTfcSWfQA2qPRK7o38Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188849;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=88s//TAVvqyZvP1NCckfa/wwJprxBDcziuEvaPK44XA=;
	b=agKc21CNlDjpjvZTnFHBKFj98vxMz+bg0l0SoxABF8V/Kd/kktZSk2734aj/OaIAqKCl
	 gHW6BePi3oO1iOgIlJ01H9G1JcyOIPPEZsz/DMu/E0lgQnrrgdwlgqdKAsKQqZ5j5V7bn
	 Esaxyx8mM/3+GN6L4VxErLjhfKVF5IGwC//bs4QLkOsh+MKrC9R6KIEuJnACiXQCHjsax
	 X8asatMGEvUvhXjBvpZTBr4vIbQDVSzcpK+Y10Em148GlG5zbcl7SYIgfZhS7dmJ9tUiD
	 DWCGe2Q9Yjp/99dy3oVemJqTPfNQoCB76trZbE8d6046TU4NVm7mJWqodJH2Pu25VfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TzVGrzL/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F30606A31A;
	Wed, 28 Oct 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzVGrzL/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1961F031E0;
	Wed, 28 Oct 2026 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188848;
	bh=88s//TAVvqyZvP1NCckfa/wwJprxBDcziuEvaPK44XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TzVGrzL/fz186iqzVZFxeHieNqFdW+t25cdS0SKqvkHgqpaVfQpygpj5mEkZiNx02
	 8CrFzYlidUULy7jciQ9+iBPAMwEt4UiRtVxrbOtsucS77tGJjbj5gBbDmq3vmgiRJz
	 GBEOeBOQln7NA6DdzgcqEmlme8uRzh3jDLjqav61B5Yfz74AzxnQUmM2zBbJDyBVLg
	 qkFrnHdWrXCkupG4Ll1+3oVbTNsGWx7VO2ALKQPMWSGZNAl4QH88XKcMH/NdMm1dcj
	 XpyJ+P6w+15cj3l13FUbnLf2wbcgldlIprOonLjS9n7TcbYdwI0Ok3jARuMU+1ZPiN
	 AfuXFMQUKT7FQ==
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
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	K Prateek Nayak <kprateek.nayak@amd.com>,
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
Subject: [RFC PATCH 01/20] coverage: move gcov and kcov under kernel/coverage/
Date: Wed, 28 Oct 2026 07:59:25 -0400
Message-ID: <20261028120034.871983-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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

No functional change: the Kconfig symbols and their dependencies are
unchanged, and so are the per-object compiler flags of kcov.o, which
move to kernel/coverage/Makefile.

Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index 1ed6d81ed2f6b..2e0a98ceed3e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11129,7 +11129,9 @@ GCOV BASED KERNEL PROFILING
 M:	Peter Oberparleiter <oberpar@linux.ibm.com>
 S:	Maintained
 F:	Documentation/dev-tools/gcov.rst
-F:	kernel/gcov/
+F:	kernel/coverage/Kconfig
+F:	kernel/coverage/Makefile
+F:	kernel/coverage/gcov/
 
 GDB KERNEL DEBUGGING HELPER SCRIPTS
 M:	Jan Kiszka <jan.kiszka@siemens.com>
@@ -14350,7 +14352,9 @@ B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%2
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
index 50601c0301e84..f4b24649f039c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1777,8 +1777,6 @@ config ARCH_VMLINUX_NEEDS_RELOCS
 config HAVE_GENERIC_TIF_BITS
        bool
 
-source "kernel/gcov/Kconfig"
-
 source "scripts/gcc-plugins/Kconfig"
 
 config FUNCTION_ALIGNMENT_4B
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da75226e3..aa71fe45a6ae1 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1536,7 +1536,7 @@ struct task_struct {
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
index 6759087154edd..41a5925e4568b 100644
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

