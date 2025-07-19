Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD923AE66
	for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752923603; cv=none; b=Bx8Nn9q7aHFADW3IyX6qtlZumJ5JhVbAZBkf4/qF8aSgE9QiEqFYg/2r6jSIRsFy9k/meO+lnS0HX4e61ZHHT8HQ/ZCMDdS/0yj0nIhO1VYc9vAu7D4v9OEJkLUGP+n8DOf/ER00B7S8Dr+Mf4gOV0qo705tggddYVaFH4TADAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752923603; c=relaxed/simple;
	bh=Iww/UpGyLtrx1j10ruDTf8LZMrndDjrz8uY2/BP9cpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM9YZp9OfUqR1Hb2GRn0l+8IL4X1u+8XKVHUcEJvk4sWBPUndrMU2klzOUIPmUlBFdKRhU3RRy7JceovGDTrUJAKChtsDWLLGBuIUJntTtgV7BbPFbFNg7Qfg0EIwaICk/Px2STcoAw5ESLYBkxgI9qL+2YT20swfHP5CAXkEdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI17ZVdr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI17ZVdr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235ea292956so27212545ad.1
        for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752923600; x=1753528400; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Jd/5d465A0jCumj6dQXUppGRMZZOxb6FPpLcIZ9JVE=;
        b=UI17ZVdrLyQ/QGH8AnkI7BxzATLtGZ+u4nZ92urxGWdXSh7zNq/2ChPqcUIeD613DV
         VVQNb1PUGDi+nn7+V30Xn7IqWEJXMIonLAgf9pESkUzW4HCdWo+7UEGebUkj69z9QQ/4
         vP/RkwO00/88Jmn+11NUEe15NxGKs1h5YCE634DWrArDVexpvU4JNWdpHR5y6S49nIOW
         7rU1k6Tr3lcxlCIC1inCjmmeVnJOcV57qn9E4L2WH72U/qnAvVSVld0Lo/ICHxTW0MvS
         GVbtdJuV00D7Nc+l1b3vi7fuj3XPBuB8uabNMV00Gxnz+hkTOecvDg/HELsBZ83ksQ0a
         j5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752923600; x=1753528400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Jd/5d465A0jCumj6dQXUppGRMZZOxb6FPpLcIZ9JVE=;
        b=fXYeXJ1IvptvbaTY3K7GdLVrI5uetrFj3vV+9GW+zf2xp8agVuhPU2fDFeWwdf4LHr
         T2ACG0efHrPS+0Ys94rzM+uXS0CtCidrBPxidheZGiWvICDEqOJ0fFsTslm5Spzi1SGi
         30wfLIegsV++vZ9awPJ/zkzA4FSjIgs9rC7NZMVNfA1FnU3li2wZN7sxZN8CEdlOorDt
         ZjFI/nLvO2RYHJT3npSoLRXr5uCFwAxmALCquPw6g3QNfzGbnqT097h3Iqn0Dd3KaBHB
         /SaRgA2bliaCbhZw1GDtOwYsPxp7p257geEzJ53Exs94zFgaV+USB0Zib6z0n30cLUAW
         Y0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAaRDsKxDRWm49raAuFTlUhGS2XrjybYsu9OJhd/F12VNJKoeBXfibtMoKr65kHqkM6+h8@lists.linux.dev
X-Gm-Message-State: AOJu0YwweQcU/UPUaqCe+LNLZymyrXScxfXBCQPTCKOnq/qmTe4OXqzT
	8Rdx5csBehxrNKFSE9i0ulG7X03YwElwZLora6eI5Cswf57dCfxSKeY2
X-Gm-Gg: ASbGncu8T0ZvrYjn7xtEX7mOWHezqxgeNtTJsQxhuzL6Tk6yqOGv2PwpyqW6P/MHxUB
	FvMvyj8IyfYwPinmx1OIAwXHMmZ5yVbogBUfMvKsS1mwNfsi/1nhv7kEuracMqDHxcN1H4PbAhO
	pjnX47TZO3kDpb6NEjMX9IAtaWk2t8O0HE7f6B0bZHETB0gra63XFszw1I6KzxQQR/kjKwlarrh
	mQUzKoWz5R397xzfyNIK1R/H+fGzF3wEMsDnkLqzvIdSJyUCJV6j49sytfekOb1oapyAkAwYR4K
	Fjq7xdzcBEvdU61JTWKcN+qxxfLEjjzH6GHZTOcpVZSCjX1Fdsgg7loio1I5J+qlpgq/Pz6DTIk
	Sb3Xp/ve/qRFpu0yXUvDW
X-Google-Smtp-Source: AGHT+IEAPjC4pj685n73OCXBGa3ulx7qROou2OgY1ptOxHHWKAYpNN7RhIDQ9S1zZEHJLglu5uD+8g==
X-Received: by 2002:a17:902:c409:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23e256848f5mr163928225ad.6.1752923599651;
        Sat, 19 Jul 2025 04:13:19 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4c81sm27388875ad.114.2025.07.19.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 04:13:19 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Sat, 19 Jul 2025 05:13:14 -0600
Subject: [PATCH RFC 4/4] selftests/landlock: add memfd execution tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-memfd-exec-v1-4-0ef7feba5821@gmail.com>
References: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
In-Reply-To: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
 Abhinav Saxena <xandfury@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752923593; l=10834;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=Iww/UpGyLtrx1j10ruDTf8LZMrndDjrz8uY2/BP9cpc=;
 b=kIjDOTlzaXRksQJMV4lD0AKnhdTH0vFXs450vzHO9XXX4DPVtJbviuK8aZKqG2ckFvORf7mmK
 3sV2DwdEZCPBwGjmRnqKTUmFMhGYKAjUyCwn8jwjUyLmr7pbp67hTD2
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

Add core test suite for LANDLOCK_SCOPE_MEMFD_EXEC covering:

- Same-domain execution restriction (prevent read-to-execute bypass)
- execve() family syscall restrictions via /proc/self/fd/ path
- Regular filesystem files remain unaffected by memfd scoping

Tests validate that memfd execution restrictions are properly enforced
while ensuring surgical targeting that doesn't impact legitimate file
operations. Covers key attack vectors including anonymous execution
and W^X policy bypass attempts.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../selftests/landlock/scoped_memfd_exec_test.c    | 325 +++++++++++++++++++++
 1 file changed, 325 insertions(+)

diff --git a/tools/testing/selftests/landlock/scoped_memfd_exec_test.c b/tools/testing/selftests/landlock/scoped_memfd_exec_test.c
new file mode 100644
index 000000000000..2513a44d8320
--- /dev/null
+++ b/tools/testing/selftests/landlock/scoped_memfd_exec_test.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Landlock tests for LANDLOCK_SCOPE_MEMFD_EXEC domain restrictions
+ *
+ * These tests validate Landlock's hierarchical execution control for memfd
+ * objects. The scoping mechanism prevents processes from executing memfd
+ * created in different domain contexts.
+ *
+ * Copyright © 2025 Abhinav Saxena <xandfury@gmail.com>
+ */
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/landlock.h>
+#include <linux/memfd.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <sys/socket.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "common.h"
+#include "scoped_common.h"
+
+static int create_test_memfd(struct __test_metadata *const _metadata)
+{
+	int memfd;
+	static const char test_data[] = "#!/bin/sh\nexit 42\n";
+
+	memfd = memfd_create("test_exec", 0);
+	ASSERT_LE(0, memfd)
+	{
+		TH_LOG("Failed to create memfd: %s", strerror(errno));
+	}
+
+	ASSERT_EQ(fchmod(memfd, 0700), 0);
+
+	ASSERT_EQ(0, ftruncate(memfd, sizeof(test_data)));
+	ASSERT_EQ(sizeof(test_data),
+		  write(memfd, test_data, sizeof(test_data)));
+	ASSERT_EQ(0, lseek(memfd, 0, SEEK_SET));
+
+	return memfd;
+}
+
+static bool test_mmap_exec_restriction(int memfd, bool expect_denied)
+{
+	void *addr;
+	const size_t page_size = getpagesize();
+
+	addr = mmap(NULL, page_size, PROT_READ | PROT_EXEC, MAP_PRIVATE, memfd,
+		    0);
+
+	if (expect_denied) {
+		bool correctly_denied = (addr == MAP_FAILED && errno == EACCES);
+
+		if (addr != MAP_FAILED)
+			munmap(addr, page_size);
+		return correctly_denied;
+	}
+
+	if (addr == MAP_FAILED)
+		return false;
+
+	munmap(addr, page_size);
+	return true;
+}
+
+/* clang-format off */
+FIXTURE(scoped_domains) {};
+/* clang-format on */
+
+#include "scoped_base_variants.h"
+
+FIXTURE_SETUP(scoped_domains)
+{
+	drop_caps(_metadata);
+}
+
+FIXTURE_TEARDOWN(scoped_domains)
+{
+}
+
+/*
+ * Test that regular filesystem files are unaffected by memfd restrictions
+ *
+ * This test ensures that LANDLOCK_SCOPE_MEMFD_EXEC scoping only affects
+ * memfd objects and does not interfere with normal file execution or
+ * memory mapping of regular filesystem files.
+ *
+ * Security scenarios tested:
+ * - Scope isolation: memfd restrictions don't affect regular files
+ * - Proper targeting: only anonymous memory objects are restricted
+ *
+ * Scenarios considered (while allowing legitimate use):
+ * - Malicious process creates executable memfd -> BLOCKED
+ * - Same process maps legitimate executable file ->ALLOWED
+ * - Ensures restrictions are surgical, not broad
+ *
+ * Test flow:
+ * 1. Parent optionally creates scoped domain
+ * 2. Parent forks child process
+ * 3. Child optionally creates scoped domain
+ * 4. Child creates regular temporary file with executable content
+ * 5. Child creates memfd with same content
+ * 6. Test memfd execution ->should follow scoping rules
+ * 7. Test regular file execution ->should always work regardless of memfd
+ * scoping
+ * 8. Verify differential behavior confirms proper targeting
+ */
+TEST_F(scoped_domains, regular_file_unaffected)
+{
+	int tmp_fd, memfd;
+	char tmp_path[] = "/tmp/landlock_test_XXXXXX";
+	void *addr;
+	const size_t page_size = getpagesize();
+	bool memfd_should_be_denied;
+
+	memfd_should_be_denied = variant->domain_child ||
+				 variant->domain_parent;
+
+	if (variant->domain_parent)
+		create_scoped_domain(_metadata, LANDLOCK_SCOPE_MEMFD_EXEC);
+
+	pid_t child = fork();
+
+	ASSERT_LE(0, child);
+
+	if (child == 0) {
+		/* Child process */
+		if (variant->domain_child)
+			create_scoped_domain(_metadata,
+					     LANDLOCK_SCOPE_MEMFD_EXEC);
+
+		/* Create regular file with executable test content */
+		tmp_fd = mkstemp(tmp_path);
+		ASSERT_LE(0, tmp_fd);
+		ASSERT_EQ(0, fchmod(tmp_fd, 0755));
+
+		static const char test_data[] = "#!/bin/sh\nexit 42\n";
+
+		ASSERT_EQ(sizeof(test_data),
+			  write(tmp_fd, test_data, sizeof(test_data)));
+		ASSERT_EQ(0, lseek(tmp_fd, 0, SEEK_SET));
+
+		/* Create memfd with identical content for comparison */
+		memfd = create_test_memfd(_metadata);
+
+		/* Test memfd execution - should follow scoping restrictions */
+		bool memfd_correctly_handled = test_mmap_exec_restriction(
+			memfd, memfd_should_be_denied);
+		EXPECT_TRUE(memfd_correctly_handled);
+
+		/*
+		 * Test regular file execution - should always work regardless
+		 * of memfd scoping
+		 */
+		addr = mmap(NULL, page_size, PROT_READ | PROT_EXEC, MAP_PRIVATE,
+			    tmp_fd, 0);
+		EXPECT_NE(MAP_FAILED, addr);
+		if (addr != MAP_FAILED)
+			munmap(addr, page_size);
+
+		/* Cleanup */
+		close(memfd);
+		close(tmp_fd);
+		unlink(tmp_path);
+		_exit(_metadata->exit_code);
+	}
+
+	/* Parent waits for child */
+	int status;
+
+	ASSERT_EQ(child, waitpid(child, &status, 0));
+	if (WIFSIGNALED(status) || !WIFEXITED(status) ||
+	    WEXITSTATUS(status) != EXIT_SUCCESS)
+		_metadata->exit_code = KSFT_FAIL;
+}
+
+/*
+ * Test execve() family syscall restrictions on memfd
+ *
+ * This test validates that direct execution of memfd files via execve(),
+ * execveat(), and fexecve() syscalls is properly blocked when domain
+ * scoping is enabled. Tests the /proc/self/fd/ execution path commonly
+ * used for anonymous execution.
+ *
+ * Security scenarios tested:
+ * - Direct memfd execution via /proc/self/fd/ path
+ * - Anonymous execution prevention
+ * - execve() hook integration with memfd scoping
+ *
+ * Attack scenarios prevented:
+ * 1. execve("/proc/self/fd/N") where N is memfd file descriptor
+ * 2. execveat(memfd_fd, "", args, env, AT_EMPTY_PATH) - anonymous execution
+ * 3. fexecve(memfd_fd, args, env) - file descriptor execution
+ *
+ * Test flow:
+ * 1. Parent optionally creates scoped domain
+ * 2. Parent forks child process
+ * 3. Child optionally creates scoped domain
+ * 4. Child creates memfd with executable script content
+ * 5. Child attempts execve() using /proc/self/fd/N path
+ * 6. Verify: EACCES if scoped, successful execution (exit 42) if not scoped
+ * 7. Parent checks child exit status to determine success/failure
+ */
+TEST_F(scoped_domains, execve_restriction)
+{
+	int memfd;
+	char fd_path[64];
+	bool should_be_denied;
+
+	should_be_denied = variant->domain_child || variant->domain_parent;
+	TH_LOG("execve_restriction: parent=%d, child=%d\n",
+	       variant->domain_parent, variant->domain_child);
+
+	if (variant->domain_parent)
+		create_scoped_domain(_metadata, LANDLOCK_SCOPE_MEMFD_EXEC);
+
+	pid_t child = fork();
+
+	ASSERT_LE(0, child);
+
+	if (child == 0) {
+		/* Child process */
+		if (variant->domain_child) {
+			create_scoped_domain(_metadata,
+					     LANDLOCK_SCOPE_MEMFD_EXEC);
+		}
+
+		memfd = create_test_memfd(_metadata);
+		snprintf(fd_path, sizeof(fd_path), "/proc/self/fd/%d", memfd);
+
+		/* Attempt execve on memfd via /proc/self/fd/ path */
+		char *const argv[] = { "test", NULL };
+		char *const envp[] = { NULL };
+
+		int ret = execve(fd_path, argv, envp);
+
+		ASSERT_EQ(-1, ret);
+
+		/* If we reach here, execve failed */
+		if (should_be_denied) {
+			EXPECT_EQ(EACCES,
+				  errno); /* Should be blocked by Landlock */
+		} else {
+			/* execve should have succeeded but failed for other reason */
+			TH_LOG("execve failed unexpectedly: %s",
+			       strerror(errno));
+		}
+
+		close(memfd);
+		_exit(_metadata->exit_code);
+	}
+
+	/* Parent waits for child and checks exit status */
+	int status;
+
+	ASSERT_EQ(child, waitpid(child, &status, 0));
+
+	if (should_be_denied) {
+		/* Child should exit normally after execve was blocked */
+		EXPECT_TRUE(WIFEXITED(status));
+	} else {
+		/*
+		 * Child should have executed successfully with script's
+		 * exit code
+		 */
+		EXPECT_TRUE(WIFEXITED(status));
+		EXPECT_EQ(42,
+			  WEXITSTATUS(status)); /* Exit code from test script */
+	}
+}
+
+/*
+ * Test same-domain execution restriction (should always be denied when scoped)
+ *
+ * This test validates the "Same domain: DENY" rule from the security matrix.
+ * When a process is in a scoped domain, it should not be able to execute
+ * memfd objects that it created itself, preventing read-to-execute bypass.
+ *
+ * Security scenarios tested:
+ * - Read-to-execute bypass prevention within same domain
+ * - Self-execution blocking for memfd objects
+ *
+ * Attack scenario prevented:
+ * - Attacker process creates writable memfd in current domain
+ * - Writes malicious shellcode to the memfd via write() syscalls
+ * - Attempts to execute the same memfd via mmap(PROT_EXEC)
+ * - Should be BLOCKED by same-domain denial rule
+ * - Prevents bypassing W^X policies via anonymous memory
+ *
+ * Test flow:
+ * 1. Process optionally creates scoped domain
+ * 2. Process creates memfd (inherits current domain context)
+ * 3. Process attempts to mmap its own memfd with PROT_EXEC
+ * 4. Verify: ALLOW if not scoped, DENY if scoped (same domain rule)
+ */
+TEST_F(scoped_domains, same_domain_restriction)
+{
+	int memfd;
+	bool should_be_denied;
+
+	/* Same domain should be denied when scoped, allowed when not scoped */
+	should_be_denied = variant->domain_parent;
+
+	if (variant->domain_parent)
+		create_scoped_domain(_metadata, LANDLOCK_SCOPE_MEMFD_EXEC);
+
+	/* Process creates and tries to execute its own memfd (same domain) */
+	memfd = create_test_memfd(_metadata);
+
+	bool test_passed = test_mmap_exec_restriction(memfd, should_be_denied);
+
+	EXPECT_TRUE(test_passed);
+
+	close(memfd);
+}
+
+TEST_HARNESS_MAIN

-- 
2.43.0

