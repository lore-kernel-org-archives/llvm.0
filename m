Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B55CC6
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 19:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E0DC340E9;
	Fri, 11 Mar 2022 19:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647028632;
	bh=K/3BmQl+yVa1K2EX0K8gw5URhrVb2cfe6vu4OaCFOK8=;
	h=From:To:Cc:Subject:Date:From;
	b=rV6f1TwUIGZwmcr6Y5HkN1tBwPzvtU7wFLyxgmgSuGRi/i8IGByG0aHENT6ReWWv2
	 mXod3uImMVCGpfLNXQLg4MkgLRysLlri+jBd3DnqAaWi1ivVn9wyEd3Q6gCh7BKiuy
	 i/jazlJYYXsHker3KfD3V67ZkMW2rIodyB1Zexg/SwaOwNzcI8TETlKXbx254SqUiv
	 J4gTnunCG06jq+w0AHevNo07z9n6YdkuPbEErAtce7aVa14LXXEZmSPTbVwUTuW96C
	 BEgQ6joyvm4bmTw3EHxeeeqeHWt5hrj0ApB2PH6JWyKpzOs4m0FRwxtVhquvpHUPG7
	 bElweiqncqSTQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] x86/ibt: Fix CC_HAS_IBT check for clang
Date: Fri, 11 Mar 2022 12:56:42 -0700
Message-Id: <20220311195642.2033108-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 41c5ef31ad71 ("x86/ibt: Base IBT bits") added a check for a crash
in clang. However, this check does not work for two reasons.

The first reason is that '-pg' is missing from the check, which is
required for '-mfentry' to do anything.

The second reason is that cc-option only uses /dev/null as the input
file, which does not show a problem:

$ clang --version | head -1
Ubuntu clang version 12.0.1-8build1

$ clang -fcf-protection=branch -mfentry -pg -c -x c /dev/null -o /dev/null

$ echo $?
0

$ echo "void a(void) {}" | clang -fcf-protection=branch -mfentry -pg -c -x c - -o /dev/null
...

$ echo $?
139

Use this test instead so that the check works for older versions of
clang.

Fixes: 41c5ef31ad71 ("x86/ibt: Base IBT bits")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4ca7bfe927b3..870e0d10452d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1867,7 +1867,7 @@ config CC_HAS_IBT
 	# Clang/LLVM >= 14
 	# fentry check to work around https://reviews.llvm.org/D111108
 	def_bool ((CC_IS_GCC && $(cc-option, -fcf-protection=branch -mindirect-branch-register)) || \
-		  (CC_IS_CLANG && $(cc-option, -fcf-protection=branch -mfentry))) && \
+		  (CC_IS_CLANG && $(success,echo "void a(void) {}" | $(CC) -Werror $(CLANG_FLAGS) -fcf-protection=branch -mfentry -pg -x c - -c -o /dev/null))) && \
 		  $(as-instr,endbr64)
 
 config X86_KERNEL_IBT

base-commit: 9e1db76f44de4d9439e48c9ef61e5d457395202b
-- 
2.35.1

