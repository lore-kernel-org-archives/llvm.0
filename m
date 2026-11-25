Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572418;
	b=rFhN+iWXuh2zHeQ6fy9aWpoEnQJ/kF03DkzO0C2zhKwEp+AmLEo1u7ed38yhWjbpD2cU
	 HVgGKdjYLuy21eM+vKAXF3HBcpV71+WWakiONnrjpe6Wl+RnGFssU3Ulgigj7ZqEKfkXX
	 grm69pV13tKYl1ht6xTiXzBb1XlaNlbaI7mIeo66JXrMuT9tNlq/+I9pqxte0kzgHCvd4
	 nwBwmnzZHu4vMzOTo1PYieOfbPFH5dl41QELF8XWobHcKIsUZpnQ+yGZaweNlkypqxZHw
	 ERSr5CIW1K+Ya0ynJGfhtVO0y3MxOE1Nl3G4lwsssWl1KBs4h2k3OM78qb62krPOMlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572418;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LObbUE4SlW6IGQlyQRo5/awQw3nZ90YOcL/yKK/xkvQ=;
	b=cs92ASDdP+jKeuZR6QxOlniB60y4c83An294OxEy1b9JYWsUYDQBzM7Ocu227EiU9Pvk
	 /KL3eSrJoB1xPHAbbIwAGnqGRxPtV1ope+eZ7e4JSKhJe5gLWWdIgtFti+5JxEBdtvBK4
	 t6DnTI9G9OuH2iOGEAj7l8+hoKtCDlfU/jEK01/ghn6D2a4o33cDDgJJVzTg0Wa4a02VW
	 VsTSeLB3m3SNuwvZz8ycljCrjlq/aGftwh9+0Ob6P85Ux5G4Uf5da7/cz7ZAS+tr/38Sv
	 79RdjVx96Q9+GUUDk1Zd+A6G5YYcC+TGM9ju9zm6mRERMOpANfQnQOM2F4cdja/FSug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JopSRnYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD39606A327;
	Wed, 25 Nov 2026 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JopSRnYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED8E1F000C6;
	Wed, 25 Nov 2026 02:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572418;
	bh=LObbUE4SlW6IGQlyQRo5/awQw3nZ90YOcL/yKK/xkvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JopSRnYLQwm+YfIu0nM3zDyaqrzbSe7k9/RYsF+aX81IfT9QsrNB6rzWamYNV+U+u
	 6OTY5JFwZWOsN+HVXW5jBgTa0Mvw+RAm0IkFQuJ3Wvb9FvaGjoLEcw8YPtxhTmUcYr
	 cXyW0i9MWZHV5JNaYYjtH/IELmlFPOsTSLLWnTai8t2j6Q3wxp7/5j1Y8xdDTViIPX
	 /L04gP39ICEV0e6tY7I7xIbtIeE0U+Th8jMaahwm0ZFOPyVLxuZ88RCkA72DZGysia
	 IoOemjBiS7+PA7gA3KfFV27fEbNDPkeGTuvy5LVmEvXD5Hk+M9rfqdX9wIZC5K0do5
	 SIU41lL3t8iNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	workflows@vger.kernel.org
Subject: [PATCH v3 19/19] Documentation: dev-tools: document the common code coverage interface
Date: Tue, 24 Nov 2026 21:06:03 -0500
Message-ID: <20261125020603.3934222-20-sashal@kernel.org>
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

Describe the code coverage implementations and what they share: the
Kconfig options, the COVERAGE_PROFILE annotations, the
/sys/kernel/debug/coverage/ interface, MC/DC measurement, and how they
deal with noinstr code. Point to it from the gcov and KCOV
documentation, and document gcov's MC/DC support.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/coverage.rst | 173 +++++++++++++++++++++++++++
 Documentation/dev-tools/gcov.rst     |  28 +++++
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kcov.rst     |   3 +
 MAINTAINERS                          |   1 +
 5 files changed, 206 insertions(+)
 create mode 100644 Documentation/dev-tools/coverage.rst

diff --git a/Documentation/dev-tools/coverage.rst b/Documentation/dev-tools/coverage.rst
new file mode 100644
index 0000000000000..3634f01a9444d
--- /dev/null
+++ b/Documentation/dev-tools/coverage.rst
@@ -0,0 +1,173 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+Code coverage
+=============
+
+The kernel can be instrumented to find out which parts of it get executed.
+This serves two different purposes:
+
+* Measuring code coverage, e.g. to assess and improve a test suite, or to
+  show the structural coverage required by safety standards. This is done by
+  one of the code coverage measurement implementations described below.
+
+* Guiding fuzzers. This is done by KCOV, which collects coverage per task;
+  see Documentation/dev-tools/kcov.rst.
+
+All of them are configured in the "Kernel hacking -> Kernel Testing and
+Coverage -> Code coverage" menu, live in ``kernel/coverage/``, and share the
+``/sys/kernel/debug/coverage/`` debugfs directory.
+
+
+Code coverage measurement
+=========================
+
+The implementation is selected by the "Code coverage measurement" choice:
+
+============================  ==============  ================================
+Option                        Compilers       Data
+============================  ==============  ================================
+``CONFIG_GCOV_KERNEL``        GCC, Clang      gcov ``.gcda`` files, see
+                                              Documentation/dev-tools/gcov.rst
+``CONFIG_LLVM_COV_KERNEL``    Clang 19 and    LLVM raw profile of the kernel
+                              later           image (``.profraw``)
+============================  ==============  ================================
+
+The instrumentation and the format of the data are defined by the toolchain,
+so only one implementation can be used at a time. Both only instrument C
+code.
+
+Clang's source-based code coverage (``CONFIG_LLVM_COV_KERNEL``) instruments
+the code in the compiler front end. Its data therefore maps back to the source
+code exactly, regardless of the optimizations applied, and it can show the
+coverage of every condition of a decision. It only instruments code built into
+the kernel image. gcov also supports modules.
+
+
+Selecting the code to instrument
+--------------------------------
+
+``CONFIG_COVERAGE_PROFILE_ALL`` instruments the entire kernel. On architectures
+that don't support it, or to instrument only parts of the kernel, add a line
+like the following to the respective Makefile.
+
+For a single file (e.g. main.o)::
+
+	COVERAGE_PROFILE_main.o := y
+
+For all files in one directory::
+
+	COVERAGE_PROFILE := y
+
+To exclude files from being instrumented even when
+``CONFIG_COVERAGE_PROFILE_ALL`` is enabled, use::
+
+	COVERAGE_PROFILE_main.o := n
+
+and::
+
+	COVERAGE_PROFILE := n
+
+The per-file setting takes precedence over the per-directory one, which takes
+precedence over ``CONFIG_COVERAGE_PROFILE_ALL``.
+
+Code that is built as a module is only instrumented by an implementation that
+supports modules, whatever these settings say.
+
+Only exclude code that can't work when instrumented, for example because it
+runs before the kernel is relocated or is copied elsewhere. Code that must not
+be instrumented for correctness reasons, such as the entry code, is annotated
+``noinstr`` instead; see `noinstr`_.
+
+
+Interface
+---------
+
+``/sys/kernel/debug/coverage/`` contains:
+
+``backend``
+	The name of the selected implementation, ``gcov`` or ``llvm``, followed by
+	``mcdc`` when MC/DC is measured. The implementation keeps its files in the
+	directory of that name.
+
+``<name>/reset``
+	Writing to this file resets all coverage data of the implementation. It
+	does not affect KCOV.
+
+``gcov``
+	A symlink to ``/sys/kernel/debug/gcov``, where gcov keeps its data (see
+	Documentation/dev-tools/gcov.rst).
+
+``llvm/profraw``
+	The raw profile of the kernel image, for Clang's source-based code
+	coverage.
+
+``kcov``
+	A symlink to ``/sys/kernel/debug/kcov`` (see
+	Documentation/dev-tools/kcov.rst).
+
+The instrumented code updates the coverage data without synchronizing with
+readers, so reading the data while other CPUs execute instrumented code
+doesn't give an atomic snapshot, and the same applies to a reset.
+
+With Clang's source-based code coverage, convert the raw profile and create a
+report with the ``llvm-profdata`` and ``llvm-cov`` tools of the LLVM version
+that built the kernel, since the raw profile format changes between releases::
+
+	# cp /sys/kernel/debug/coverage/llvm/profraw vmlinux.profraw
+	$ llvm-profdata merge vmlinux.profraw -o vmlinux.profdata
+	$ llvm-cov report -instr-profile=vmlinux.profdata vmlinux
+	$ llvm-cov show -instr-profile=vmlinux.profdata vmlinux kernel/fork.c
+
+
+MC/DC
+-----
+
+Modified condition/decision coverage (MC/DC) verifies that each condition of a
+boolean decision has been shown to independently affect the outcome of the
+decision. It is required by safety standards such as DO-178C (avionics) and
+ISO 26262 (automotive). Enable it with ``CONFIG_COVERAGE_MCDC``:
+
+* With Clang's source-based code coverage, decisions with more than
+  ``CONFIG_LLVM_COV_MCDC_MAX_CONDITIONS`` conditions are not measured. Show
+  the results with ``llvm-cov show -show-mcdc`` and
+  ``llvm-cov report -show-mcdc-summary``.
+
+* With gcov, GCC 14 or later is required, and decisions with more than 64
+  conditions are not measured. Show the results with ``gcov --conditions``.
+
+Decisions that aren't measured still get branch coverage. To list them, build
+with ``KCFLAGS=-Wpgo-coverage`` (Clang) or
+``KCFLAGS=-Wcoverage-too-many-conditions`` (GCC). Clang only warns about them
+by default before version 22, as it can't disable these warnings.
+
+
+noinstr
+=======
+
+Code annotated ``noinstr`` must not be instrumented; this includes the code
+running on kernel entry and exit, and in NMI context. Outside of
+``instrumentation_begin()``/``instrumentation_end()`` sections, ``noinstr``
+functions may only call other ``noinstr`` functions and ``__always_inline``
+functions.
+
+``noinstr`` functions are not instrumented themselves. The compilers insert
+the code coverage instrumentation before functions get inlined though, which
+carries the counter updates of a function into the ``noinstr`` code it is
+inlined into.
+
+On x86-64, objtool takes them out of ``noinstr`` functions, including their
+``instrumentation_begin()``/``instrumentation_end()`` sections. It replaces
+the counter updates with NOPs. Clang also accesses the coverage data in ways
+that can't simply be removed, such as the load that an MC/DC bitmap update
+starts with: those instructions stay and are pointed at a piece of memory
+that nothing else uses. With Clang's gcov, a counter that gets updated
+through its address in a register is not recognized and keeps being updated.
+
+A function that is only ever inlined into ``noinstr`` code is therefore
+reported as not executed, and one that has other callers as well only counts
+the executions from those. On other architectures the counter updates stay.
+
+KCOV instruments the code after inlining and honours ``noinstr`` through the
+``no_sanitize_coverage`` attribute with Clang and GCC 12 or later; with older
+GCC, objtool removes its calls from ``noinstr`` code on x86-64.
diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
index b6910c3fc00dd..b4add0af2da2f 100644
--- a/Documentation/dev-tools/gcov.rst
+++ b/Documentation/dev-tools/gcov.rst
@@ -22,6 +22,9 @@ Possible uses:
 * minimizing kernel configurations (do I need this option if the
   associated code is never run?)
 
+See Documentation/dev-tools/coverage.rst for the options and interfaces shared
+with the other code coverage implementations.
+
 .. _gcov: https://gcc.gnu.org/onlinedocs/gcc/Gcov.html
 .. _lcov: https://github.com/linux-test-project/lcov
 
@@ -180,6 +183,31 @@ b) gcov is run on the BUILD machine
       [user@build] gcov -o /tmp/coverage/tmp/out/init main.c
 
 
+MC/DC Coverage
+--------------
+
+When using GCC 14 or later with ``CONFIG_COVERAGE_MCDC=y``, Modified
+Condition/Decision Coverage (MC/DC) data is collected alongside standard
+branch coverage. MC/DC verifies that each condition in a decision
+independently affects the decision's outcome.
+
+To view MC/DC data, use::
+
+    gcov --conditions -o /sys/kernel/debug/gcov/path/to/dir file.c
+
+MC/DC coverage is required by safety standards such as DO-178C
+(avionics) and ISO 26262 (automotive).
+
+GCC's condition coverage implementation has a limit of 64 conditions per
+boolean expression, due to the use of 64-bit bitmasks internally.
+Expressions exceeding this limit cannot be instrumented. This does not
+affect the correctness of the kernel; those expressions simply will not
+have MC/DC coverage data.
+
+Note that MC/DC instrumentation increases binary size and execution
+overhead compared to standard gcov profiling.
+
+
 Note on compilers
 -----------------
 
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 59cbb77b33ff4..d670c1398e495 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -23,6 +23,7 @@ Documentation/process/debugging/index.rst
    coccinelle
    context-analysis
    sparse
+   coverage
    kcov
    gcov
    kasan
diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 1a739290c8ecc..98a30a1a3f88a 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -12,6 +12,9 @@ To achieve this goal, it does not collect coverage in soft/hard interrupts
 (unless remove coverage collection is enabled, see below) and from some
 inherently non-deterministic parts of the kernel (e.g. scheduler, locking).
 
+KCOV is configured next to the other code coverage implementations, see
+Documentation/dev-tools/coverage.rst.
+
 Besides collecting code coverage, KCOV can also collect comparison operands.
 See the "Comparison operands collection" section for details.
 
diff --git a/MAINTAINERS b/MAINTAINERS
index d7910586005a1..460d4e5f1b029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6636,6 +6636,7 @@ F:	drivers/media/platform/chips-media/coda
 CODE COVERAGE
 M:	Sasha Levin <sashal@kernel.org>
 S:	Maintained
+F:	Documentation/dev-tools/coverage.rst
 F:	kernel/coverage/Kconfig
 F:	kernel/coverage/Makefile
 F:	kernel/coverage/core.c
-- 
2.53.0

