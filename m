Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33FBA47
	for <llvm@lists.linux.dev>; Thu, 31 Jul 2025 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753920899; cv=none; b=jZmaqHgZpOzYHDU8KkN0z8rEC1L4mjnljmH/ag4GD1kwNqD6sUeWrH2kDP/0TK2bp881Blo0cYajy3FaLrFZn3r38/Pxh+WP+GaUotKNZhhLoJ3cvL/JZ8SX2Y7dZUURWCTuN72Kloda2vrzXD5WqjZvuwTTx0XciLA0l/gSCds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753920899; c=relaxed/simple;
	bh=VlRrNG7JeSrQnVVaNysYnVwEXZ5+JhjyihYHwXHl990=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cqc5QCgR06zxF10n89lwaAP0m4adKdGhdcfxD5oKb0AtWZ7jCWRRqTHIX0mz92QH3EHkaQrmUha73UIrPplWsCd9MseisICodJ+ibwsLCCvDEJjD+tr57qY/KUCiZM9daaGStL3VVZaApzk9SntTlW/cil1Z0ojk9+9HU4XP4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzeR2kR2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzeR2kR2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23aeac7d77aso3839115ad.3
        for <llvm@lists.linux.dev>; Wed, 30 Jul 2025 17:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753920896; x=1754525696; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gath6oWsKA+RqQ9IiFhnn5HHOotElDVzgzomkwYkk0=;
        b=KzeR2kR2DJdvA7Zk/N4tzUpNVEwQ3ecAw5pe5X4BAMsnuc9QZPPPDMuk8h3BcxxXmK
         GcJFSdgdlgumVcO9pXuac17e7Mj5EDVeA0AyaGlDQjiFYTdwgBlBgQZgO3otDKwSeJjt
         tp3iLcqIv9+fm/RzBlKRViKLAPMP9u2kYUpRV3j/y65sJVwiZW3mfERsnf9Jc/2Ufcfi
         mrYg8+IJa9mne5iWU5pr0fxVC+wg0QNVIv8nl+y7b74slBffJl3nSiTl0lx5mSt8Z9v/
         JQBzt9AcsvzhbWXlRv03YKsYBV3eNkmYbokarYfyhjp8pUgNsiD0wbj30YZsDYnA8i0X
         I4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753920896; x=1754525696;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gath6oWsKA+RqQ9IiFhnn5HHOotElDVzgzomkwYkk0=;
        b=if8bPFYhq0QTUKfVVdKnSRhhOv/msUbC71gfHpi03BygEFBEKEVuUX6PEVGOuHBiLz
         S0+6i01VRkPALratoX6nf0PjHxwJhaUJ96xZzYo5fG+chYqhWxbFmNFrGorSGBAIHkLQ
         V/pMW50WyjoxEUBS8ItsY66MWU7M9LwePm4oCDsmirU2OtvNwbDu0oHPMsJ4HA6RItzy
         JwzI8VrvD8MECcVbXakZ0FJC/bbi+SIQQctOtGREh4T36RjItRdk0D5dyrYhU6t0Me1u
         CR4Fkhp7NLq38I3iljBhgbE3ZMD5kTllenHxbPbICaV4rwwGXzZiTxyP0+72kzos85WK
         8U/A==
X-Forwarded-Encrypted: i=1; AJvYcCXdsSRgnXfthCLyVJitHNgZ/UrvOddCNVAI/NXxY77sdDKSBrh+Nue0UIU2ho3qvoUS85EX@lists.linux.dev
X-Gm-Message-State: AOJu0Yye1I7CMtfN1c8PNDqLfBLHK1X9ewgVn3w1kbqDF+Kk+aGh5xo1
	IUA1vnTVKkILbvOUQjn49SLBdTd00FAP0ciZphZF/RhAC6uNcGm/vNtr
X-Gm-Gg: ASbGncsoyK78oSUeiP8e///9NoAZhu+mlQNVRvffl+PT7U1NdFHtol7C0zYKoSJvokE
	tUafqr2GMcovYBy97lhEh7Wy/838S+88AZmGhAXRjpKa6R/TJeKFb/Kjq9uuVBBlt1xFz/3mx8L
	ZfFGN5XKDCyE6yMmw+rUoYLc1JsfQ9kO3NqCMl9I8FTcJCoFfwKLI9GKhU/074Ig54Rz66Z3VUQ
	O0111faN9YLA+wO/E+GXg7ENY396w6e9Ko/UK+DGuDbuaF2QezaQa1MsuWHuU0uKDQqJFw08HoT
	va0Y4cc/tbn4zuPFqlBdzp+0AAiClKyR6VJEQMxpfFFxlaowHE+oUK0yXsB1x/mW50NyYsZBypr
	nJav5T8roWPmEFOM+CxNQ
X-Google-Smtp-Source: AGHT+IHr2yj0cMS5E1aU34vqgm0L0Xtl8deq0dsKeWbfU0Ej6to5aOA2315/SbNKiD26QHc7SF15NQ==
X-Received: by 2002:a17:903:11d0:b0:234:8ef1:aa7b with SMTP id d9443c01a7336-24096a6fefdmr60963385ad.20.1753920895601;
        Wed, 30 Jul 2025 17:14:55 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e812sm2519125ad.52.2025.07.30.17.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 17:14:54 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Wed, 30 Jul 2025 18:14:43 -0600
Subject: [PATCH v3] selftests/tty: add TIOCSTI test suite
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-toicsti-bug-v3-1-dd2dac97f27a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHK1imgC/2WNwQ6CMBAFf4X0bE27BVs8+R/GQ1sW2ESooUg0h
 H8XMEaJx3nJzBtZxI4wsmMysg4HihTaGdQuYb62bYWcipkZCMjEQRreB/KxJ+7uFdcGwBnMU6u
 Azcatw5Iea+18mbmm2IfuucYHuayfTr7pDJILjgK8VjbLnC9OVWPpuvehWbJvB+DfKZVOlVZOp
 A5+nOV7gO+flmrrApfcSaO00YgW8l93mqYXfxOccxYBAAA=
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 llvm@lists.linux.dev, Abhinav Saxena <xandfury@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753920894; l=23342;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=VlRrNG7JeSrQnVVaNysYnVwEXZ5+JhjyihYHwXHl990=;
 b=ApjpfA3zbXrGutnh1jGyk8RkPuXghWtsqc8VaaA56TZdlTZsP9YRFJ/Z4rliJSV+8QBRgMF60
 Pm586HDe8vQDViNn6gijy0L9I5g67jVqJ7lXXQZfHY1fSXQ95bPTyzm
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

TIOCSTI is a TTY ioctl command that allows inserting characters into
the terminal input queue, making it appear as if the user typed those
characters. This functionality has behavior that varies based on system
configuration and process credentials.

The dev.tty.legacy_tiocsti sysctl introduced in commit 83efeeeb3d04
("tty: Allow TIOCSTI to be disabled") controls TIOCSTI usage. When
disabled, TIOCSTI requires CAP_SYS_ADMIN capability.

The current implementation checks the current process's credentials via
capable(CAP_SYS_ADMIN), but does not validate against the file opener's
credentials stored in file->f_cred. This creates different behavior when
file descriptors are passed between processes via SCM_RIGHTS.

Add a test suite with 16 test variants using fixture variants to verify
TIOCSTI behavior when dev.tty.legacy_tiocsti is enabled/disabled:

- Basic TIOCSTI tests (8 variants): Direct testing with different
  capability and controlling terminal combinations
- FD passing tests (8 variants): Test behavior when file descriptors
  are passed between processes with different capabilities

The FD passing tests document this behavior - some tests show different
results than expected based on file opener credentials, demonstrating
that TIOCSTI uses current process credentials rather than file opener
credentials.

The tests validate proper enforcement of the legacy_tiocsti sysctl. Test
implementation uses openpty(3) with TIOCSCTTY for isolated PTY
environments. See tty_ioctl(4) for details on TIOCSTI behavior and
security requirements.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
To run all tests:
$ sudo ./tools/testing/selftests/tty/tty_tiocsti_test

Test Results:
- PASSED: 13/16 tests
- Different behavior: 3/16 tests (documenting credential checking behavior)

All tests validated using:
- scripts/checkpatch.pl --strict (clean output)
- Functional testing on kernel v6.16-rc2

Changes in v3:
- Replaced all printf() calls with TH_LOG() for proper test logging (Kees Cook)
- Added struct __test_metadata parameter to helper functions
- Moved common legacy_tiocsti availability check to FIXTURE_SETUP()
- Implemented sysctl modification/restoration in FIXTURE_SETUP/TEARDOWN
- Used openpty() with TIOCSCTTY for reliable PTY testing environment
- Fixed child/parent synchronization in FD passing tests
- Replaced manual _exit(1) handling with proper ASSERT statements
- Switched // comments to /* */ format throughout
- Expanded to 16 test variants using fixture variants
- Enhanced error handling and test reliability
- Link to v2: https://lore.kernel.org/r/20250713-toicsti-bug-v2-1-b183787eea29@gmail.com
- Link to v1: https://lore.kernel.org/r/20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com

References:
- tty_ioctl(4) - documents TIOCSTI ioctl and capability requirements
- openpty(3) - pseudo-terminal creation and management
- commit 83efeeeb3d04 ("tty: Allow TIOCSTI to be disabled")
- Documentation/security/credentials.rst
- https://github.com/KSPP/linux/issues/156
- https://lore.kernel.org/linux-hardening/Y0m9l52AKmw6Yxi1@hostpad/
- drivers/tty/Kconfig
- Documentation/driver-api/tty/
---
 tools/testing/selftests/tty/Makefile           |   6 +-
 tools/testing/selftests/tty/config             |   1 +
 tools/testing/selftests/tty/tty_tiocsti_test.c | 650 +++++++++++++++++++++++++
 3 files changed, 656 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tty/Makefile b/tools/testing/selftests/tty/Makefile
index 50d7027b2ae3..7f6fbe5a0cd5 100644
--- a/tools/testing/selftests/tty/Makefile
+++ b/tools/testing/selftests/tty/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS = -O2 -Wall
-TEST_GEN_PROGS := tty_tstamp_update
+TEST_GEN_PROGS := tty_tstamp_update tty_tiocsti_test
+LDLIBS += -lcap
 
 include ../lib.mk
+
+# Add libcap for TIOCSTI test
+$(OUTPUT)/tty_tiocsti_test: LDLIBS += -lcap
diff --git a/tools/testing/selftests/tty/config b/tools/testing/selftests/tty/config
new file mode 100644
index 000000000000..c6373aba6636
--- /dev/null
+++ b/tools/testing/selftests/tty/config
@@ -0,0 +1 @@
+CONFIG_LEGACY_TIOCSTI=y
diff --git a/tools/testing/selftests/tty/tty_tiocsti_test.c b/tools/testing/selftests/tty/tty_tiocsti_test.c
new file mode 100644
index 000000000000..1eafef6e36fa
--- /dev/null
+++ b/tools/testing/selftests/tty/tty_tiocsti_test.c
@@ -0,0 +1,650 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TTY Tests - TIOCSTI
+ *
+ * Copyright © 2025 Abhinav Saxena <xandfury@gmail.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/wait.h>
+#include <pwd.h>
+#include <termios.h>
+#include <grp.h>
+#include <sys/capability.h>
+#include <sys/prctl.h>
+#include <pty.h>
+#include <utmp.h>
+
+#include "../kselftest_harness.h"
+
+enum test_type {
+	TEST_PTY_TIOCSTI_BASIC,
+	TEST_PTY_TIOCSTI_FD_PASSING,
+	/* other tests cases such as serial may be added. */
+};
+
+/*
+ * Test Strategy:
+ * - Basic tests: Use PTY with/without TIOCSCTTY (controlling terminal for
+ *   current process)
+ * - FD passing tests: Child creates PTY, parent receives FD (demonstrates
+ *   security issue)
+ *
+ * SECURITY VULNERABILITY DEMONSTRATION:
+ * FD passing tests show that TIOCSTI uses CURRENT process credentials, not
+ * opener credentials. This means privileged processes can be given FDs from
+ * unprivileged processes and successfully perform TIOCSTI operations that the
+ * unprivileged process couldn't do directly.
+ *
+ * Attack scenario:
+ * 1. Unprivileged process opens TTY (direct TIOCSTI fails due to lack of
+ *    privileges)
+ * 2. Unprivileged process passes FD to privileged process via SCM_RIGHTS
+ * 3. Privileged process can use TIOCSTI on the FD (succeeds due to its
+ *    privileges)
+ * 4. Result: Effective privilege escalation via file descriptor passing
+ *
+ * This matches the kernel logic in tiocsti():
+ * 1. if (!tty_legacy_tiocsti && !capable(CAP_SYS_ADMIN)) return -EIO;
+ * 2. if ((current->signal->tty != tty) && !capable(CAP_SYS_ADMIN))
+ *        return -EPERM;
+ * Note: Both checks use capable() on CURRENT process, not FD opener!
+ *
+ * If the file credentials were also checked along with the capable() checks
+ * then the results for FD pass tests would be consistent with the basic tests.
+ */
+
+FIXTURE(tiocsti)
+{
+	int pty_master_fd; /* PTY - for basic tests */
+	int pty_slave_fd;
+	bool has_pty;
+	bool initial_cap_sys_admin;
+	int original_legacy_tiocsti_setting;
+	bool can_modify_sysctl;
+};
+
+FIXTURE_VARIANT(tiocsti)
+{
+	const enum test_type test_type;
+	const bool controlling_tty; /* true=current->signal->tty == tty */
+	const int legacy_tiocsti; /* 0=restricted, 1=permissive */
+	const bool requires_cap; /* true=with CAP_SYS_ADMIN, false=without */
+	const int expected_success; /* 0=success, -EIO/-EPERM=specific error */
+};
+
+/*
+ * Tests Controlling Terminal Variants (current->signal->tty == tty)
+ *
+ * TIOCSTI Test Matrix:
+ *
+ * | legacy_tiocsti | CAP_SYS_ADMIN | Expected Result | Error |
+ * |----------------|---------------|-----------------|-------|
+ * | 1 (permissive) | true          | SUCCESS         | -     |
+ * | 1 (permissive) | false         | SUCCESS         | -     |
+ * | 0 (restricted) | true          | SUCCESS         | -     |
+ * | 0 (restricted) | false         | FAILURE         | -EIO  |
+ */
+
+/* clang-format off */
+FIXTURE_VARIANT_ADD(tiocsti, basic_pty_permissive_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = true,
+	.legacy_tiocsti = 1,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, basic_pty_permissive_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = true,
+	.legacy_tiocsti = 1,
+	.requires_cap = false,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, basic_pty_restricted_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = true,
+	.legacy_tiocsti = 0,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, basic_pty_restricted_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = true,
+	.legacy_tiocsti = 0,
+	.requires_cap = false,
+	.expected_success = -EIO, /* FAILURE: legacy restriction */
+}; /* clang-format on */
+
+/*
+ * Note for FD Passing Test Variants
+ * Since we're testing the scenario where an unprivileged process pass an FD
+ * to a privileged one, .requires_cap here means the caps of the child process.
+ * Not the parent; parent would always be privileged.
+ */
+
+/* clang-format off */
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_pty_permissive_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = true,
+	.legacy_tiocsti = 1,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_pty_permissive_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = true,
+	.legacy_tiocsti = 1,
+	.requires_cap = false,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_pty_restricted_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = true,
+	.legacy_tiocsti = 0,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_pty_restricted_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = true,
+	.legacy_tiocsti = 0,
+	.requires_cap = false,
+	.expected_success = -EIO,
+}; /* clang-format on */
+
+/*
+ * Non-Controlling Terminal Variants (current->signal->tty != tty)
+ *
+ * TIOCSTI Test Matrix:
+ *
+ * | legacy_tiocsti | CAP_SYS_ADMIN | Expected Result | Error |
+ * |----------------|---------------|-----------------|-------|
+ * | 1 (permissive) | true          | SUCCESS         | -     |
+ * | 1 (permissive) | false         | FAILURE         | -EPERM|
+ * | 0 (restricted) | true          | SUCCESS         | -     |
+ * | 0 (restricted) | false         | FAILURE         | -EIO  |
+ */
+
+/* clang-format off */
+FIXTURE_VARIANT_ADD(tiocsti, basic_nopty_permissive_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = false,
+	.legacy_tiocsti = 1,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, basic_nopty_permissive_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = false,
+	.legacy_tiocsti = 1,
+	.requires_cap = false,
+	.expected_success = -EPERM,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, basic_nopty_restricted_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = false,
+	.legacy_tiocsti = 0,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, basic_nopty_restricted_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_BASIC,
+	.controlling_tty = false,
+	.legacy_tiocsti = 0,
+	.requires_cap = false,
+	.expected_success = -EIO,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_nopty_permissive_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = false,
+	.legacy_tiocsti = 1,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_nopty_permissive_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = false,
+	.legacy_tiocsti = 1,
+	.requires_cap = false,
+	.expected_success = -EPERM,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_nopty_restricted_withcap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = false,
+	.legacy_tiocsti = 0,
+	.requires_cap = true,
+	.expected_success = 0,
+};
+
+FIXTURE_VARIANT_ADD(tiocsti, fdpass_nopty_restricted_nocap) {
+	.test_type = TEST_PTY_TIOCSTI_FD_PASSING,
+	.controlling_tty = false,
+	.legacy_tiocsti = 0,
+	.requires_cap = false,
+	.expected_success = -EIO,
+}; /* clang-format on */
+
+/* Helper function to send FD via SCM_RIGHTS */
+static int send_fd_via_socket(int socket_fd, int fd_to_send)
+{
+	struct msghdr msg = { 0 };
+	struct cmsghdr *cmsg;
+	char cmsg_buf[CMSG_SPACE(sizeof(int))];
+	char dummy_data = 'F';
+	struct iovec iov = { .iov_base = &dummy_data, .iov_len = 1 };
+
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+	msg.msg_control = cmsg_buf;
+	msg.msg_controllen = sizeof(cmsg_buf);
+
+	cmsg = CMSG_FIRSTHDR(&msg);
+	cmsg->cmsg_level = SOL_SOCKET;
+	cmsg->cmsg_type = SCM_RIGHTS;
+	cmsg->cmsg_len = CMSG_LEN(sizeof(int));
+
+	memcpy(CMSG_DATA(cmsg), &fd_to_send, sizeof(int));
+
+	return sendmsg(socket_fd, &msg, 0) < 0 ? -1 : 0;
+}
+
+/* Helper function to receive FD via SCM_RIGHTS */
+static int recv_fd_via_socket(int socket_fd)
+{
+	struct msghdr msg = { 0 };
+	struct cmsghdr *cmsg;
+	char cmsg_buf[CMSG_SPACE(sizeof(int))];
+	char dummy_data;
+	struct iovec iov = { .iov_base = &dummy_data, .iov_len = 1 };
+	int received_fd = -1;
+
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+	msg.msg_control = cmsg_buf;
+	msg.msg_controllen = sizeof(cmsg_buf);
+
+	if (recvmsg(socket_fd, &msg, 0) < 0)
+		return -1;
+
+	for (cmsg = CMSG_FIRSTHDR(&msg); cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
+		if (cmsg->cmsg_level == SOL_SOCKET &&
+		    cmsg->cmsg_type == SCM_RIGHTS) {
+			memcpy(&received_fd, CMSG_DATA(cmsg), sizeof(int));
+			break;
+		}
+	}
+
+	return received_fd;
+}
+
+static inline bool has_cap_sys_admin(void)
+{
+	cap_t caps = cap_get_proc();
+
+	if (!caps)
+		return false;
+
+	cap_flag_value_t cap_val;
+	bool has_cap = (cap_get_flag(caps, CAP_SYS_ADMIN, CAP_EFFECTIVE,
+				     &cap_val) == 0) &&
+		       (cap_val == CAP_SET);
+
+	cap_free(caps);
+	return has_cap;
+}
+
+/*
+ * Drop to nobody user (uid/gid 65534) to lose all capabilities
+ */
+static inline bool drop_to_nobody(struct __test_metadata *_metadata)
+{
+	ASSERT_EQ(setgroups(0, NULL), 0);
+	ASSERT_EQ(setgid(65534), 0);
+	ASSERT_EQ(setuid(65534), 0);
+
+	ASSERT_FALSE(has_cap_sys_admin());
+	return true;
+}
+
+static inline int get_legacy_tiocsti_setting(struct __test_metadata *_metadata)
+{
+	FILE *fp;
+	int value = -1;
+
+	fp = fopen("/proc/sys/dev/tty/legacy_tiocsti", "r");
+	if (!fp) {
+		/* legacy_tiocsti sysctl not available (kernel < 6.2) */
+		return -1;
+	}
+
+	if (fscanf(fp, "%d", &value) == 1) {
+		if (value < 0 || value > 1)
+			value = -1; /* Invalid value */
+	} else {
+		value = -1; /* Failed to parse */
+	}
+
+	fclose(fp);
+	return value;
+}
+
+static inline bool set_legacy_tiocsti_setting(struct __test_metadata *_metadata,
+					      int value)
+{
+	FILE *fp;
+	bool success = false;
+
+	/* Sanity-check the value */
+	ASSERT_GE(value, 0);
+	ASSERT_LE(value, 1);
+
+	/*
+	 * Try to open for writing; if we lack permission, return false so
+	 * the test harness will skip variants that need to change it
+	 */
+	fp = fopen("/proc/sys/dev/tty/legacy_tiocsti", "w");
+	if (!fp)
+		return false;
+
+	/* Write the new setting */
+	if (fprintf(fp, "%d\n", value) > 0)
+		success = true;
+	else
+		TH_LOG("Failed to write legacy_tiocsti: %s", strerror(errno));
+
+	fclose(fp);
+	return success;
+}
+
+/*
+ * TIOCSTI injection test function
+ * @tty_fd: TTY slave file descriptor to test TIOCSTI on
+ * Returns: 0 on success, -errno on failure
+ */
+static inline int test_tiocsti_injection(struct __test_metadata *_metadata,
+					 int tty_fd)
+{
+	int ret;
+	char inject_char = 'V';
+
+	errno = 0;
+	ret = ioctl(tty_fd, TIOCSTI, &inject_char);
+	return ret == 0 ? 0 : -errno;
+}
+
+FIXTURE_SETUP(tiocsti)
+{
+	/* Create PTY pair for basic tests */
+	self->has_pty = (openpty(&self->pty_master_fd, &self->pty_slave_fd,
+				 NULL, NULL, NULL) == 0);
+	if (!self->has_pty) {
+		self->pty_master_fd = -1;
+		self->pty_slave_fd = -1;
+	}
+
+	self->initial_cap_sys_admin = has_cap_sys_admin();
+	self->original_legacy_tiocsti_setting =
+		get_legacy_tiocsti_setting(_metadata);
+
+	if (self->original_legacy_tiocsti_setting < 0)
+		SKIP(return, "legacy_tiocsti sysctl not available (kernel < 6.2)");
+
+	/* Test if we can modify the sysctl (requires appropriate privileges) */
+	self->can_modify_sysctl = set_legacy_tiocsti_setting(_metadata,
+							     self->original_legacy_tiocsti_setting);
+	if (!self->can_modify_sysctl)
+		TH_LOG("Warning: Cannot modify legacy_tiocsti sysctl - will skip mismatched variants");
+}
+
+FIXTURE_TEARDOWN(tiocsti)
+{
+	/*
+	 * Backup restoration -
+	 * each test should restore its own sysctl changes
+	 */
+	if (self->can_modify_sysctl &&
+	    self->original_legacy_tiocsti_setting >= 0) {
+		int current_value = get_legacy_tiocsti_setting(_metadata);
+
+		if (current_value != self->original_legacy_tiocsti_setting) {
+			TH_LOG("Backup: Restoring legacy_tiocsti from %d to %d",
+			       current_value,
+			       self->original_legacy_tiocsti_setting);
+			set_legacy_tiocsti_setting(_metadata,
+				self->original_legacy_tiocsti_setting);
+		}
+	}
+
+	if (self->has_pty) {
+		if (self->pty_master_fd >= 0)
+			close(self->pty_master_fd);
+		if (self->pty_slave_fd >= 0)
+			close(self->pty_slave_fd);
+	}
+}
+
+TEST_F(tiocsti, test)
+{
+	int saved_legacy_tiocsti = get_legacy_tiocsti_setting(_metadata);
+	bool need_restore = false;
+	int status;
+	pid_t child_pid;
+
+	/* Set legacy_tiocsti sysctl to match variant requirement */
+	if (self->can_modify_sysctl) {
+		if (saved_legacy_tiocsti != variant->legacy_tiocsti) {
+			if (!set_legacy_tiocsti_setting(_metadata,
+					variant->legacy_tiocsti)) {
+				SKIP(return,
+				     "Failed to set legacy_tiocsti sysctl");
+			}
+			need_restore = true;
+		}
+	} else {
+		/*
+		 * Can't modify sysctl
+		 * - check if current value matches variant
+		 */
+		if (self->original_legacy_tiocsti_setting !=
+		    variant->legacy_tiocsti) {
+			SKIP(return,
+			    "legacy_tiocsti setting mismatch and cannot modify sysctl");
+		}
+	}
+
+	/* Common skip conditions */
+	if (variant->test_type == TEST_PTY_TIOCSTI_BASIC && !self->has_pty) {
+		SKIP(goto restore_sysctl,
+		     "PTY not available for controlling terminal test");
+	}
+
+	if (variant->test_type == TEST_PTY_TIOCSTI_FD_PASSING &&
+	    !self->initial_cap_sys_admin) {
+		SKIP(goto restore_sysctl,
+		     "FD Pass tests require CAP_SYS_ADMIN");
+	}
+
+	if (variant->requires_cap && !self->initial_cap_sys_admin) {
+		SKIP(goto restore_sysctl,
+		     "Test requires initial CAP_SYS_ADMIN");
+	}
+
+	if (variant->test_type == TEST_PTY_TIOCSTI_BASIC) {
+		/* ===== BASIC TIOCSTI TEST ===== */
+		child_pid = fork();
+		ASSERT_GE(child_pid, 0);
+
+		if (child_pid == 0) {
+			/* Child process - perform the actual test */
+
+			/* Handle capability requirements */
+			if (self->initial_cap_sys_admin &&
+			    !variant->requires_cap)
+				ASSERT_TRUE(drop_to_nobody(_metadata));
+
+			if (variant->controlling_tty) {
+				/*
+				 * Create new session and set PTY as
+				 * controlling terminal
+				 */
+				pid_t sid = setsid();
+
+				ASSERT_GE(sid, 0);
+				ASSERT_EQ(ioctl(self->pty_slave_fd, TIOCSCTTY,
+						0),
+					  0);
+			}
+
+			/*
+			 * Validate test environment setup and verify final
+			 * capability state matches expectation
+			 * after potential drop.
+			 *
+			 */
+			ASSERT_TRUE(self->has_pty);
+			ASSERT_EQ(has_cap_sys_admin(), variant->requires_cap);
+
+			/* Test TIOCSTI and validate result */
+			int result = test_tiocsti_injection(_metadata,
+							    self->pty_slave_fd);
+
+			/* Check against expected result from variant */
+			EXPECT_EQ(result, variant->expected_success);
+			_exit(0);
+		}
+
+	} else {
+		/* ===== FD PASSING SECURITY TEST ===== */
+		int sockpair[2];
+
+		ASSERT_EQ(socketpair(AF_UNIX, SOCK_STREAM, 0, sockpair), 0);
+
+		child_pid = fork();
+		ASSERT_GE(child_pid, 0);
+
+		if (child_pid == 0) {
+			/* Child process - create PTY and send FD */
+			close(sockpair[0]);
+			signal(SIGHUP, SIG_IGN);
+
+			/* Handle privilege dropping */
+			if (!variant->requires_cap && has_cap_sys_admin())
+				ASSERT_TRUE(drop_to_nobody(_metadata));
+
+			/* Create child's PTY */
+			int child_master_fd, child_slave_fd;
+
+			ASSERT_EQ(openpty(&child_master_fd, &child_slave_fd,
+					  NULL, NULL, NULL),
+				  0);
+
+			if (variant->controlling_tty) {
+				pid_t sid = setsid();
+
+				ASSERT_GE(sid, 0);
+				ASSERT_EQ(ioctl(child_slave_fd, TIOCSCTTY, 0),
+					  0);
+			}
+
+			/* Test child's direct TIOCSTI for reference */
+			int direct_result = test_tiocsti_injection(_metadata,
+								   child_slave_fd);
+			EXPECT_EQ(direct_result, variant->expected_success);
+
+			/* Send FD to parent */
+			ASSERT_EQ(send_fd_via_socket(sockpair[1],
+						     child_slave_fd),
+				  0);
+
+			/* Wait for parent completion signal */
+			char sync_byte;
+			ssize_t bytes_read = read(sockpair[1], &sync_byte, 1);
+
+			ASSERT_EQ(bytes_read, 1);
+
+			close(child_master_fd);
+			close(child_slave_fd);
+			close(sockpair[1]);
+			_exit(0);
+		}
+
+		/* Parent process - receive FD and test TIOCSTI */
+		close(sockpair[1]);
+
+		int received_fd = recv_fd_via_socket(sockpair[0]);
+
+		ASSERT_GE(received_fd, 0);
+
+		bool parent_has_cap = self->initial_cap_sys_admin;
+
+		TH_LOG("=== TIOCSTI FD Passing Test Context ===");
+		TH_LOG("legacy_tiocsti: %d, Parent CAP_SYS_ADMIN: %s, Child: %s",
+		       variant->legacy_tiocsti, parent_has_cap ? "yes" : "no",
+		       variant->requires_cap ? "kept" : "dropped");
+
+		/* SECURITY TEST: Try TIOCSTI with FD opened by child */
+		int result = test_tiocsti_injection(_metadata, received_fd);
+
+		/* Log security concern if demonstrated */
+		if (result == 0 && !variant->requires_cap) {
+			TH_LOG("*** SECURITY CONCERN DEMONSTRATED ***");
+			TH_LOG("Privileged parent can use TIOCSTI on FD from unprivileged child");
+			TH_LOG("This shows current process credentials are used, not opener credentials");
+		}
+
+		EXPECT_EQ(result, variant->expected_success)
+		{
+			TH_LOG("FD passing: expected error %d, got %d",
+			       variant->expected_success, result);
+		}
+
+		/* Signal child completion */
+		char sync_byte = 'D';
+		ssize_t bytes_written = write(sockpair[0], &sync_byte, 1);
+
+		ASSERT_EQ(bytes_written, 1);
+
+		close(received_fd);
+		close(sockpair[0]);
+	}
+
+	/* Common child process cleanup for both test types */
+	ASSERT_EQ(waitpid(child_pid, &status, 0), child_pid);
+
+	if (WIFSIGNALED(status)) {
+		TH_LOG("Child terminated by signal %d", WTERMSIG(status));
+		ASSERT_FALSE(WIFSIGNALED(status))
+		{
+			TH_LOG("Child process failed assertion");
+		}
+	} else {
+		EXPECT_EQ(WEXITSTATUS(status), 0);
+	}
+
+restore_sysctl:
+	if (need_restore)
+		set_legacy_tiocsti_setting(_metadata, saved_legacy_tiocsti);
+}
+
+TEST_HARNESS_MAIN

---
base-commit: 283564a43383d6f26a55546fe9ae345b5fa95e66
change-id: 20250618-toicsti-bug-7822b8e94a32

Best regards,
-- 
Abhinav Saxena <xandfury@gmail.com>

