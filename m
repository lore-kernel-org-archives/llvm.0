Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B26A3E
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 19:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CF1C340EB;
	Mon, 14 Feb 2022 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644866937;
	bh=zRzXMCM9AhF3WBIJ4GuTK+ukLtut1AMLJ1G7ORC9iMo=;
	h=From:To:Cc:Subject:Date:From;
	b=b+KNMhMmSRyY30RB495UofKiq8RCAoxZ29bKm99qeU5cyjakjYbzzcr74HtjwzIwr
	 cOurBuPKU/EahWT87CKDYhUaP0vAThxFcXXQN0i1qoFSAS+kofwPd2BIMA61cNJ9s5
	 aTTuDcblueQaenPKeRXnNbduZxc8vDKFXMtn2jBHsd0e90iktNhU0o+NblIF+KWrGo
	 PKL3ZV3PpwTq9euozbw7iLvsG/c0uxGER+GXMeGqOwh9LFUdOCPJ/ds1lwHHLJ9H0b
	 6FHu4YkEKEiBEgUy+gGS7/gxb8o68h17PuQVsqbZwjMZ2XiI8J7yK93/CXvIz5jiZV
	 B6c/tEaw3NlvQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ftrace: Remove unused ftrace_startup_enable() stub
Date: Mon, 14 Feb 2022 12:28:47 -0700
Message-Id: <20220214192847.488166-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with clang + CONFIG_DYNAMIC_FTRACE=n + W=1, there is a
warning:

  kernel/trace/ftrace.c:7194:20: error: unused function 'ftrace_startup_enable' [-Werror,-Wunused-function]
  static inline void ftrace_startup_enable(int command) { }
                     ^
  1 error generated.

Clang warns on instances of static inline functions in .c files with W=1
after commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

The ftrace_startup_enable() stub has been unused since
commit e1effa0144a1 ("ftrace: Annotate the ops operation on update"),
where its use outside of the CONFIG_DYNAMIC_TRACE section was replaced
by ftrace_startup_all().  Remove it to resolve the warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 kernel/trace/ftrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index f9feb197b2da..a4b462b6f944 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7191,7 +7191,6 @@ static int __init ftrace_nodyn_init(void)
 core_initcall(ftrace_nodyn_init);
 
 static inline int ftrace_init_dyn_tracefs(struct dentry *d_tracer) { return 0; }
-static inline void ftrace_startup_enable(int command) { }
 static inline void ftrace_startup_all(int command) { }
 
 # define ftrace_startup_sysctl()	do { } while (0)

base-commit: 754e0b0e35608ed5206d6a67a791563c631cec07
-- 
2.35.1

