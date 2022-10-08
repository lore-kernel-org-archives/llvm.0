Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1E41C33
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 15:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4FCC433C1;
	Sat,  8 Oct 2022 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665241452;
	bh=J+gfA2GKcuRxn0BEYcHVwUZ7oMqdte5iqfeI/xohk88=;
	h=From:To:Cc:Subject:Date:From;
	b=Jf2DOxvz9yFjX1VXkMwTAfJE15c8TB2RlK0FcletkolNdtbcf7zekJ4zE2BOmuXQp
	 QlMfgcuPHuPsqtcQxuTK7McBdDwBa03K0WTPjxfpWUyBD7TsKyuj1mmU336oKMOclJ
	 hD2N/j2/rXQwOoMfPqWdpBslW8A39vf4NNb4IpNx/nwYeMPpimtM8Ndt//ofpWWY6i
	 GIe5dStefpbt9BlLRqduIuFuRTXRIzBQMzFOIp7is/ULxf2rQpt47Cd3KM99t4uuYp
	 7DPaGl1uAlFPQ9WwzzrHbRJNo2T3cm8dFcYMZ5HYQ1ht1qrCD7K+AQfVURhKhcObU0
	 E6sm2v844bAEQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: jump_label: mark arguments as const to satisfy asm constraints
Date: Sat,  8 Oct 2022 22:54:37 +0800
Message-Id: <20221008145437.491-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samuel reported that the static branch usage in cpu_relax() breaks
building with CONFIG_CC_OPTIMIZE_FOR_SIZE:

In file included from <command-line>:
./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
probably does not match constraints
  285 | #define asm_volatile_goto(x...) asm goto(x)
      |                                 ^~~
./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
'asm_volatile_goto'
   41 |         asm_volatile_goto(
      |         ^~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:285:33: error: impossible constraint
in 'asm'
  285 | #define asm_volatile_goto(x...) asm goto(x)
      |                                 ^~~
./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
'asm_volatile_goto'
   41 |         asm_volatile_goto(
      |         ^~~~~~~~~~~~~~~~~
make[1]: *** [scripts/Makefile.build:249:
arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2

Maybe "-Os" prevents GCC from detecting that the key/branch arguments
can be treated as constants and used as immediate operands. Inspired
by x86's commit 864b435514b2("x86/jump_label: Mark arguments as const to
satisfy asm constraints"), and as pointed out by Steven: "The "i"
constraint needs to be a constant.", let's do similar modifications to
riscv.

Tested by CC_OPTIMIZE_FOR_SIZE + gcc and CC_OPTIMIZE_FOR_SIZE + clang.

Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
Fixes: 8eb060e10185 ("arch/riscv: add Zihintpause support")
Reported-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---

since v1:
 - add Reported-by, Reviewed-by, Fixes and Link tag

 arch/riscv/include/asm/jump_label.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 38af2ec7b9bf..6d58bbb5da46 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -14,8 +14,8 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
-static __always_inline bool arch_static_branch(struct static_key *key,
-					       bool branch)
+static __always_inline bool arch_static_branch(struct static_key * const key,
+					       const bool branch)
 {
 	asm_volatile_goto(
 		"	.option push				\n\t"
@@ -35,8 +35,8 @@ static __always_inline bool arch_static_branch(struct static_key *key,
 	return true;
 }
 
-static __always_inline bool arch_static_branch_jump(struct static_key *key,
-						    bool branch)
+static __always_inline bool arch_static_branch_jump(struct static_key * const key,
+						    const bool branch)
 {
 	asm_volatile_goto(
 		"	.option push				\n\t"
-- 
2.37.2

