Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693733FE4
	for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 18:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8B5C433D6;
	Sun, 25 Sep 2022 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664129004;
	bh=9FET3PaCzmyIcog+YS95QW0L9d7rytIwKw9jtfpwb4U=;
	h=From:To:Cc:Subject:Date:From;
	b=CEU7VzfkgrOaJ8jntLWEZhx3p7CfpfWBnyichsUQeZ+6Iyx44/MGdUnawm3X/oorS
	 HQIOuF2DqdwZl/keRDcd8uJXm+lc9qw26HhD6HJEWmRRvr76v1mjYkqrl4RKeBUNsT
	 vyE+pxJmPKazxajf8teshPpsT/N0QcHTrPbBIshdEGb+wTLYiTGEvIgTgXlL3tSeQ/
	 sLvRq7m1GvbFIGw18b7cKoaBJXnGTzOtges/EucnEbwWVpOzDnFonhM15A86u3+DOO
	 YxwQueNESlDvbKskYuEcDUGjleWf5TmqvojTF73KozxjxpWenhYZR27o5GL4X7UQ7Y
	 pOM1QlSEBe8bw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/4] riscv: entry: further clean up and VMAP_STACK fix
Date: Mon, 26 Sep 2022 01:53:52 +0800
Message-Id: <20220925175356.681-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I planed to do similar generic entry transaction as Guo Ren did[1], and
I have some commits in local. Since Guo has sent out the series, so I
dropped my version and just provide those in my local repo but missing
in Guo's series. However, this doesn't mean this series depends on
Guo's series, in fact except the first one, the remaining three patches
are independent on generic entry.

NOTE: patch4 can also clean up arch/riscv/kernel/mcount-dyn.S as well
but there's a trivial difference in the context saving, I dunno whether
is it better to clean up mcount-dyn.S too, any suggestions are welcome.

[1]https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/T/#t

Jisheng Zhang (4):
  riscv: remove extra level wrappers of trace_hardirqs_{on,off}
  riscv: consolidate ret_from_kernel_thread into ret_from_fork
  riscv: fix race when vmap stack overflow and remove shadow_stack
  riscv: entry: consolidate general regs saving into save_gp

 arch/riscv/include/asm/asm-prototypes.h |   1 -
 arch/riscv/include/asm/thread_info.h    |   4 +-
 arch/riscv/kernel/Makefile              |   2 -
 arch/riscv/kernel/asm-offsets.c         |   1 +
 arch/riscv/kernel/entry.S               | 150 +++++++-----------------
 arch/riscv/kernel/process.c             |   5 +-
 arch/riscv/kernel/trace_irq.c           |  27 -----
 arch/riscv/kernel/trace_irq.h           |  11 --
 arch/riscv/kernel/traps.c               |  15 +--
 9 files changed, 47 insertions(+), 169 deletions(-)
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

-- 
2.34.1

