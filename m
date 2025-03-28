Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE9D1531C5
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169953; cv=none; b=d/DJwHMITuo8KAfY+3IOdJUflbp4MOlnwT96wHOn0fxCdvbYwmIppkPNN9gDTl5Mnr+T35XMKB5m7k9KD0Ns95c6LsoNJetWuoIRPQAPTE2aM9nad/BfY//4ITo/jVr2Ayc/jKrJ31gD5B8NSJtFpbgSqdLL6q3xhRxVkDi3EPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169953; c=relaxed/simple;
	bh=+yjkcF4b2dcbI70nQ0EilJ8oLkBOd7kK7kf6pKkeuFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o/WRT+sOtI+5KLxHFUfUThexV0VJRCRyxujm4ZI/hTGNhX7xTCOPY5fD+tufMJHgCcdyqliqJDJKV8MM0W7aisXoAg/w272iPSaDs0VHguMdAe6PyMnBPQvNAN0Fu1sl7LstoXDw6A8eebNiIpPYYmYUNKww/LgAOBD6nOzzpjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D1481691;
	Fri, 28 Mar 2025 06:52:35 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 81EE83F58B;
	Fri, 28 Mar 2025 06:52:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] tools build: Use -fzero-init-padding-bits=all
Date: Fri, 28 Mar 2025 13:52:21 +0000
Message-Id: <20250328135221.10274-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC-15 release claims [1]:

  {0} initializer in C or C++ for unions no longer guarantees clearing
  of the whole union (except for static storage duration initialization),
  it just initializes the first union member to zero. If initialization
  of the whole union including padding bits is desirable, use {} (valid
  in C23 or C++) or use -fzero-init-padding-bits=unions option to
  restore old GCC behavior.

As a result, this new behaviour might cause unexpected data when we
initialize a union with using the '{ 0 }' initializer.

Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
in unions and structures.  This commit applies the same option for tools
building.

The option is not supported neither by any version older than GCC 15 and
is also not supported by LLVM, this patch adds the cc-option function to
dynamically detect the compiler option.

[1] https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Leo Yan <leo.yan@arm.com>
---

This patch was originally from [1]. After consideration, the top level
of the tools directory is a better place to accommodate this option
rather than perf folder.

[1] https://lore.kernel.org/linux-perf-users/20250320105235.3498106-1-leo.yan@arm.com/

 tools/scripts/Makefile.include | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0aa4005017c7..e912a10afd89 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -40,6 +40,19 @@ EXTRA_WARNINGS += -Wwrite-strings
 EXTRA_WARNINGS += -Wformat
 EXTRA_WARNINGS += -Wno-type-limits
 
+try-run = $(shell set -e;		\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+__cc-option = $(call try-run,\
+	$(1) -Werror $(2) -c -x c /dev/null -o /dev/null,$(2),)
+cc-option = $(call __cc-option, $(CC),$(1))
+
+# Explicitly clear padding bits with the initializer '{ 0 }'
+CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
+
 # Makefiles suck: This macro sets a default value of $(2) for the
 # variable named by $(1), unless the variable has been set by
 # environment or command line. This is necessary for CC and AR
-- 
2.34.1

