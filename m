Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4196A29CA
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 01:49:46 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id A561F804B3;
	Thu, 10 Feb 2022 20:43:17 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: llvm@lists.linux.dev
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [RFC PATCH kernel] trace: Make FTRACE_MCOUNT_USE_RECORDMCOUNT configurable
Date: Fri, 11 Feb 2022 12:43:13 +1100
Message-Id: <20220211014313.1790140-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For whatever reason LLVM does not allow LTO (Link Time Optimization) if
FTRACE_MCOUNT_USE_RECORDMCOUNT is enabled.

This allows disabling just this option instead of disabling all FTRACE
options.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Or disabling FTRACE is the right thing to do if HAS_LTO_CLANG=y?

Came from arch/Kconfig:

config HAS_LTO_CLANG
        def_bool y
        depends on CC_IS_CLANG && LD_IS_LLD && AS_IS_LLVM
        depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
        depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
        depends on ARCH_SUPPORTS_LTO_CLANG
        depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT  <======
        depends on !KASAN || KASAN_HW_TAGS
        depends on !GCOV_KERNEL


---
 kernel/trace/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a5eb5e7fd624..87d82d2b0b0b 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -704,7 +704,8 @@ config FTRACE_MCOUNT_USE_OBJTOOL
 	depends on FTRACE_MCOUNT_RECORD
 
 config FTRACE_MCOUNT_USE_RECORDMCOUNT
-	def_bool y
+	bool "Enable FTRACE_MCOUNT_USE_RECORDMCOUNT"
+	default y
 	depends on !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
 	depends on !FTRACE_MCOUNT_USE_CC
 	depends on !FTRACE_MCOUNT_USE_OBJTOOL
-- 
2.30.2

