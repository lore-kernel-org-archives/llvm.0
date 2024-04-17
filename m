Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE7D147C72
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713370075; cv=none; b=VENRzVi9FgdCOjMvgOj35Wp6G45NlEs2NjCsCJB6QDTugAHfil4Xdv3hn8zMASBEDc/ow6eqKxg/43EQ0HlqYiDvVRXP9estspgiO8JEwK6EO/9MZHduCfcYoHH5XZKM6IcI051EG25j80/EcQaY8yiAtG0oY32K6huLcIUVwn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713370075; c=relaxed/simple;
	bh=CQbouKF6TmFvPaEviWNdSnywfj9tnXssXppxPfpOkUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JbSgfv8E5owV8ucJhvKK77AiHZwTvggpe7B+Dff5PELzfmpugmcs1KzxLZXB3Z9o5SWhCg0rwCLnymujxiK0Ld6MMuWKEefxSIDh/RhVCzDFw0EFA5/Fq0FLzcdXnweADeHHLjIHW0dlHUiks/R7NOc6f3G645m8ZDJ2vTKART8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B002339;
	Wed, 17 Apr 2024 09:08:21 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B64F3F792;
	Wed, 17 Apr 2024 09:07:52 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel test robot <yujie.liu@intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] selftests: Fix asan linkage to work with clang
Date: Wed, 17 Apr 2024 17:07:40 +0100
Message-Id: <20240417160740.2019530-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both fchmodat2 and openat2 statically link against libasan (for
explanation of why, look at the fixes commit). This is done using
`-static-libasan`. However, it turns out that clang uses a different
option, `-static-libsan`. This caused clang to fail to compile the
tests.

Fix this by using cc-option to figure out which variant to use.

While we are at it, stop passing helpers.h as a compilation unit. This
was causing another clang error due to name conflict with helpers.c's
object file. This header shouldn't be directly compiled anyway.

Fixes: c652df8a4a9d ("selftests: link libasan statically for tests with -fsanitize=address")
Reported-by: kernel test robot <yujie.liu@intel.com>
Closes: https://lore.kernel.org/r/202404141807.LgsqXPY5-lkp@intel.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Applies on v6.9-rc4.

Thanks,
Ryan

 tools/testing/selftests/fchmodat2/Makefile | 5 ++++-
 tools/testing/selftests/openat2/Makefile   | 7 +++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/fchmodat2/Makefile b/tools/testing/selftests/fchmodat2/Makefile
index 71ec34bf1501..a68bb5a00797 100644
--- a/tools/testing/selftests/fchmodat2/Makefile
+++ b/tools/testing/selftests/fchmodat2/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
+# We need this for the "cc-option" macro.
+include ../../../build/Build.include

-CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined -static-libasan $(KHDR_INCLUDES)
+CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined $(KHDR_INCLUDES)
+CFLAGS += $(call cc-option, -static-libasan) $(call cc-option, -static-libsan)
 TEST_GEN_PROGS := fchmodat2_test

 include ../lib.mk
diff --git a/tools/testing/selftests/openat2/Makefile b/tools/testing/selftests/openat2/Makefile
index 254d676a2689..02af9b6ca5eb 100644
--- a/tools/testing/selftests/openat2/Makefile
+++ b/tools/testing/selftests/openat2/Makefile
@@ -1,8 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
+# We need this for the "cc-option" macro.
+include ../../../build/Build.include

-CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined -static-libasan
+CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined
+CFLAGS += $(call cc-option, -static-libasan) $(call cc-option, -static-libsan)
 TEST_GEN_PROGS := openat2_test resolve_test rename_attack_test

 include ../lib.mk

-$(TEST_GEN_PROGS): helpers.c helpers.h
+$(TEST_GEN_PROGS): helpers.c
--
2.25.1

