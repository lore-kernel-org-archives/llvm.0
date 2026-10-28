Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188897;
	b=uNQlahCMXChVOHpH88TeIDLWCddFEeiQbrMed3PS7c+fNkoVbYdCadOfUlXfb3g0UmB3
	 ga/QYBMl873nZTB3pp6xw6OSAXaOVFb0E9ZuDcwNOtlSuubx0FocwLqmoA7hu40Ha5bqZ
	 uOnSoljt9RyOrfCt1UkMUSTKlIcjFgxLqTjHxTFFFPo8RQY116wNUc9/yo/sogv0FGSh2
	 ZNlVfdQ7o7xj0YXQCbXuSverkr9EK6JITZHfvxQB7LnhaAQq1jVEoqvOOq0tWPo0v7Vha
	 1LrQk58vSG68g7UM7inIyrb/qMfiAyH+Pi4+F70t2cYLQB0L5GdcuX2+Lz4lLZ9vfYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188897;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KSAfAdmkLzgs7oG/P0lPnMVbpcKomfX4CP2cVdP4kI8=;
	b=MMrRYhimmVzs/FJq8qodYeWLUDrnfhvq8rEOPTtwVQyKR/3GlioZoRd9cdOMG8W6Q2SA
	 ujQ12Ep1g18Mqsu0zBoiv4xW6nR97g+t5yjpjeQOfOLxcMLb/nT6VoTs0j/rdBBVVpGDm
	 AEYtUzk266mRVvniGfjtUT9+p3rmLLdqyLBDsROCFNDYAsrQrwtuL0aNRfCmffwH+UJv9
	 n2dTBFNFph5w0mlSkcgiEt56J9jBJIIP6rAISE6Ns43qR1eIPDYbifJjc9/PoFK4XO1LC
	 j/jvdCeZ+vw9kfYlHTiPPzhiv6eVmoUx0k9ZJlBnlLiLRwv4utxS+4qc//qUgIGd9qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHVHJunT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56B60A2618;
	Wed, 28 Oct 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHVHJunT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC9C1F01828;
	Wed, 28 Oct 2026 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188896;
	bh=KSAfAdmkLzgs7oG/P0lPnMVbpcKomfX4CP2cVdP4kI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EHVHJunTm8Nv+lnKG6uLDqasPxtmijWw4ksHgJ+5YvhykX5BgEuvWrM29x7Kiulyd
	 aWQPYOeJpW43gt3k5a3HeXSh8eqGsksK/9WLEOm21ShuJjO5+dQSGsbVKd5Gh/CW2G
	 uQ09EOFUrt33u1z6HeINlkYmIQ02bLlR1n0fraHaTz8a+QfSpcwz3LbABvRm9ClRTQ
	 3WprqdvmO5vADnePnsEjB4HLUzn0zqP3mfPlACvEWQeiUFH3SwbV6EqDtCVcWy9K1q
	 L5g26l2DrI+YxGBSwVpO/hAjccICmuT85zoYrHXBanoqshyScCo80qYqFhi7DvY0PM
	 WOzimJDWvssIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
Subject: [RFC PATCH 20/20] Documentation: dev-tools: document the common code coverage interface
Date: Wed, 28 Oct 2026 07:59:44 -0400
Message-ID: <20261028120034.871983-21-sashal@kernel.org>
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

Describe the code coverage implementations and what they share: the
Kconfig options, the COVERAGE_PROFILE annotations, the
/sys/kernel/debug/coverage/ interface, MC/DC measurement, and how they
deal with noinstr code. Point to it from the gcov and KCOV
documentation, and document gcov's MC/DC support.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/coverage.rst | 158 +++++++++++++++++++++++++++
 Documentation/dev-tools/gcov.rst     |  28 +++++
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kcov.rst     |   3 +
 MAINTAINERS                          |   1 +
 5 files changed, 191 insertions(+)
 create mode 100644 Documentation/dev-tools/coverage.rst

diff --git a/Documentation/dev-tools/coverage.rst b/Documentation/dev-tools/coverage.rst
new file mode 100644
index 0000000000000..547863b2afd6d
--- /dev/null
+++ b/Documentation/dev-tools/coverage.rst
@@ -0,0 +1,158 @@
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
+	``mcdc`` when MC/DC is measured.
+
+``reset``
+	Writing to this file resets all coverage data of the selected
+	implementation. It does not affect KCOV.
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
+The compiler warns about every decision it doesn't instrument.
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
+The code coverage measurement implementations insert their instrumentation
+before functions get inlined, which would carry the instrumentation of an
+``__always_inline`` function into the ``noinstr`` code it is inlined into. To
+avoid that, ``__always_inline`` functions are not instrumented when one of them
+is enabled, and as a consequence they don't show up in the coverage data.
+
+With ``CONFIG_NOINSTR_VALIDATION``, objtool reports coverage counters that get
+updated by ``noinstr`` code outside of such sections.
+
+KCOV instruments the code after inlining and honours ``noinstr`` through the
+``no_sanitize_coverage`` attribute with Clang and GCC 12 or later; with older
+GCC, objtool removes its calls from ``noinstr`` code.
diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
index b6910c3fc00dd..d2950070f3ca4 100644
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
+Expressions exceeding this limit cannot be instrumented and will produce
+a compiler warning. This does not affect the correctness of the kernel;
+those expressions simply will not have MC/DC coverage data.
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
index 506f25cfc3e85..ff9b355c2fc0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6592,6 +6592,7 @@ F:	drivers/media/platform/chips-media/coda
 CODE COVERAGE
 M:	Sasha Levin <sashal@kernel.org>
 S:	Maintained
+F:	Documentation/dev-tools/coverage.rst
 F:	kernel/coverage/Kconfig
 F:	kernel/coverage/Makefile
 F:	kernel/coverage/core.c
-- 
2.53.0

