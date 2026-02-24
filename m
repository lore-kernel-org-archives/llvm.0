Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3F2BEC30;
	Tue, 24 Feb 2026 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771974998; cv=none; b=HDaG9dkotEwOVkchfrEfoRIsbjCt7luXDHnvXBOFTy57wWXHbCzLYQ5pvJ9jLNcsaUaN2T4pcu6VSbpopZpnfPlUXRNIz+c4xlr/mrObeOfFqq0pIP2UanIBMz9cpLrGDJuYD/ZFer3Ml/GEhvdn5QydyHQK9jyxhV4HiSMPsKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771974998; c=relaxed/simple;
	bh=h1/RdGPH+cF1e7M7kk/9JcID3DC0F3FUhDY9BQ8DJ5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M8JJDfAooxYS6e2+JOzVO04u+L6xRjJkLMFAyQint70uerchS12WTU8HrkLPnqoOj3pAdyhoUZibEGS0YuTvW4YJTji3xJxL6l6h127CbSoHHSscCL2GhGaozUoeTMPFHd8wgnrAsSHJR6I2D9kP5G2sCEC2D9vzx5GuyUQNckQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1tqL8sI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1tqL8sI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B33DC19423;
	Tue, 24 Feb 2026 23:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771974997;
	bh=h1/RdGPH+cF1e7M7kk/9JcID3DC0F3FUhDY9BQ8DJ5w=;
	h=From:Date:Subject:To:Cc:From;
	b=i1tqL8sIKhKiQ43Hh8E60XUdiOaqMl7ndYERGhbryKzkWgs5rlQTF5IwHat1t5MRb
	 M4UaRlQ1ijtAZjyZyD9AJhJ9hE28Ov2KgmLcGKEbRjSbOOW5qprAHz3glPHiNcjo1f
	 Qiawxw+rBPoavF6haJLW15egtym5lBAdil6rnJgLE9mL5a9ywD+uH99Be9msB5HDA/
	 51BhsI+3Idi+1V9r2sqiCJHEj/XtYox4754ebWKJnkzcFEQU+Cnx1RF3fJjdicUr4i
	 bQrpZTq+x8DV+cBs5lDgxYVVUnD2pFuQUOnaHJuVCJFK0WxVLxyGi3+UzOGHUnfzVc
	 8Ht7D/n4DYMvg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 24 Feb 2026 16:16:30 -0700
Subject: [PATCH] lib/Kconfig.debug: Require a release version of LLVM 22
 for context analysis
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN2wrCMBCE4Vcpe+1CXOoBX0W8SNKprtS0ZNtSK
 X13o15+DPyzkiErjC7VShmzmvapYL+rKD58uoO1KSZxcnQiNYfpNXDsysQzMsc+jVhG9sl3b1P
 jULcHyKkRdwaVypDR6vJ7uN7+tik8EcdvlrbtA2QpQDWDAAAA
X-Change-ID: 20260224-bump-clang-ver-context-analysis-b4f5e27d208e
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2236; i=nathan@kernel.org;
 h=from:subject:message-id; bh=h1/RdGPH+cF1e7M7kk/9JcID3DC0F3FUhDY9BQ8DJ5w=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnzDIPLRZKMDy5U77R55zQtrPRn6bO/rr8X8fm9NYstu
 M0/V2peRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjITiaG//HNVpnzpVM/3bf2
 n+T5U97lwTQPyX8O8z/f3R82OyU3VIbhnylnjr37Zn/NXt7di7bq7q9YlGTtG3neQ//lMoMfKak
 9rAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Using a prerelease version as a minimum supported version for
CONFIG_WARN_CONTEXT_ANALYSIS was reasonable to do while LLVM 22 was the
development version so that people could immediately build from main and
start testing and validating this in their own code. However, it can be
problematic when using prerelease versions of LLVM 22, such as Android
clang 22.0.1 (the current android mainline compiler) or when bisecting
LLVM between llvmorg-22-init and llvmorg-23-init, to build the kernel,
as all compiler fixes for the context analysis may not be present,
potentially resulting in warnings that can easily turn into errors.

Now that LLVM 22 is released as 22.1.0, upgrade the check to require at
least this version to ensure that a user's toolchain actually has all
the changes needed for a smooth experience with context analysis.

Fixes: 3269701cb256 ("compiler-context-analysis: Add infrastructure for Context Analysis with Clang")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Peter, could you take this for a 7.0-rc?
---
 lib/Kconfig.debug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4e2dfbbd3d78..8e2b858078e6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
 
 config WARN_CONTEXT_ANALYSIS
 	bool "Compiler context-analysis warnings"
-	depends on CC_IS_CLANG && CLANG_VERSION >= 220000
+	depends on CC_IS_CLANG && CLANG_VERSION >= 220100
 	# Branch profiling re-defines "if", which messes with the compiler's
 	# ability to analyze __cond_acquires(..), resulting in false positives.
 	depends on !TRACE_BRANCH_PROFILING
@@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
 	  and releasing user-definable "context locks".
 
 	  Clang's name of the feature is "Thread Safety Analysis". Requires
-	  Clang 22 or later.
+	  Clang 22.1.0 or later.
 
 	  Produces warnings by default. Select CONFIG_WERROR if you wish to
 	  turn these warnings into errors.

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-bump-clang-ver-context-analysis-b4f5e27d208e

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

