Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C846A8
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E79C433D6;
	Wed, 28 Sep 2022 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664382576;
	bh=tpBUC9hhQD7B15KOfDZ4rr1SiSXoskPPTUl47ZCo5oQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YKLHSpjDBxMn1yfsb6+ScMCaS0LAJ9dXL7WH3Zuw5FjBjJ5Ws79gFGu0767j0B4ks
	 9G5r6U1rVBA3X9cuUInPSPXATzbOLbhdQixCbyk9L/1QR5uDc8dmTOjBJAxFJVeorQ
	 6vhZGQzho9mCJkajRqTy8gGtNz1lPIsJ+SII3t98TJ+pT3Aa1C2bFST7frXEMRC9Er
	 /qlOg9AxTSjev3BHq1aVBXMc+JNB4Kp4PtoXbvmCVwyGS0ZUG6bFz89r1h3n8aEihh
	 Lwe0qipt6ZSen/TJ1w+QQa9+UvemHCXb1ekf/V/uF7gk2kI4NNlbFQOpR1wfR0HRGk
	 lsUT80DL0V5Aw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/4] riscv: entry: further clean up and VMAP_STACK fix
Date: Thu, 29 Sep 2022 00:20:03 +0800
Message-Id: <20220928162007.3791-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I planed to do similar generic entry transaction as Guo Ren did[1], and
I had some commits in local. Since Guo has sent out the series, I
dropped my version and just provide those in my local repo but missing
in Guo's series. However, this doesn't mean this series depends on
Guo's series, in fact except the first one, the remaining three patches
are independent on generic entry.

[1]https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/T/#t

Since v1:
  - consolidate gp saving/restoring in mcount-dyn.S as well
  - avoid non-trival memory waste if NR_CPUs is large
  - collect Reviewed-by tag.

Hi Guo,

I only added your reviewed-by tag to patch1, but dropped tag for patch3
and patch4 because the patch changed a bit.

Thanks

Jisheng Zhang (4):
  riscv: remove extra level wrappers of trace_hardirqs_{on,off}
  riscv: consolidate ret_from_kernel_thread into ret_from_fork
  riscv: fix race when vmap stack overflow and remove shadow_stack
  riscv: entry: consolidate general regs saving into save_gp

 arch/riscv/include/asm/asm-prototypes.h |   1 -
 arch/riscv/include/asm/asm.h            |  65 ++++++++++
 arch/riscv/include/asm/thread_info.h    |   4 +-
 arch/riscv/kernel/Makefile              |   2 -
 arch/riscv/kernel/asm-offsets.c         |   1 +
 arch/riscv/kernel/entry.S               | 154 +++---------------------
 arch/riscv/kernel/mcount-dyn.S          |  58 +--------
 arch/riscv/kernel/process.c             |   5 +-
 arch/riscv/kernel/trace_irq.c           |  27 -----
 arch/riscv/kernel/trace_irq.h           |  11 --
 arch/riscv/kernel/traps.c               |  31 +++--
 11 files changed, 104 insertions(+), 255 deletions(-)
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

-- 
2.34.1

