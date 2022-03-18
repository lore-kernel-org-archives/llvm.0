Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DAB5394
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 23:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7958DC340E8;
	Fri, 18 Mar 2022 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647644936;
	bh=+Gr67379WVWBWHw2ybHUFLROVBWIzwE3VSkuwwrlIuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxU5nerOYn+YVqvuq87g+2P5UNUhrvDTJf0l/G6D6cq/fOie6DZIaCKcFhmvvN53t
	 TgDwejuZeS8YL0DWUVGPjaYHpbUU7cSyNc/4haUxLkAG8KVj3Y6ONK0NumuHM+uvxG
	 WgCtrs2DGbm5inrsqXO6v/kJlLtXnPNY0Ob1+XDQzbBRI78s3Ua7dLrzjwZ2Jcal8u
	 y/oUJ1GxZx5MJ6ibMfUwLQh2w+zoKDP1pbOVdfYUsLCh8NS1ly/1a8PcBmjo6CLLPa
	 WfndH/8lLVUi24s0HkVUzHt1KVGRLzQaxc6qI5lUaM42wWW9N0rz1KL8SgMGfhVtR/
	 7Ivpdow0zR3mA==
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/2] x86/Kconfig: Only enable CONFIG_CC_HAS_IBT for clang >= 14.0.0
Date: Fri, 18 Mar 2022 16:07:46 -0700
Message-Id: <20220318230747.3900772-2-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318230747.3900772-1-nathan@kernel.org>
References: <20220318230747.3900772-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 156ff4a544ae ("x86/ibt: Base IBT bits") added a check for a crash
with 'clang -fcf-protection=branch -mfentry -pg', which intended to
exclude Clang versions older than 14.0.0 from selecting
CONFIG_X86_KERNEL_IBT.

clang-11 does not have the issue that the check is testing for, so
CONFIG_X86_KERNEL_IBT is selectable. Unfortunately, there is a different
crash in clang-11 that was fixed in clang-12. To make matters worse,
that crash does not appear to be entirely deterministic, as the same
input to the compiler will sometimes crash and other times not, which
makes dynamically checking for the crash like the '-pg' one unreliable.

To make everything work properly for all common versions of clang, use a
hard version check of 14.0.0, as that will be the first release upstream
that has both bugs properly fixed.

Link: https://github.com/llvm/llvm-project/commit/e0b89df2e0f0130881bf6c39bf31d7f6aac00e0f
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0f0672d2c816..921e4ebda564 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1865,9 +1865,10 @@ config CC_HAS_IBT
 	# GCC >= 9 and binutils >= 2.29
 	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
 	# Clang/LLVM >= 14
-	# fentry check to work around https://reviews.llvm.org/D111108
+	# https://github.com/llvm/llvm-project/commit/e0b89df2e0f0130881bf6c39bf31d7f6aac00e0f
+	# https://github.com/llvm/llvm-project/commit/dfcf69770bc522b9e411c66454934a37c1f35332
 	def_bool ((CC_IS_GCC && $(cc-option, -fcf-protection=branch -mindirect-branch-register)) || \
-		  (CC_IS_CLANG && $(success,echo "void a(void) {}" | $(CC) -Werror $(CLANG_FLAGS) -fcf-protection=branch -mfentry -pg -x c - -c -o /dev/null))) && \
+		  (CC_IS_CLANG && CLANG_VERSION >= 140000)) && \
 		  $(as-instr,endbr64)
 
 config X86_KERNEL_IBT
-- 
2.35.1

