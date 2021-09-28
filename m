Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300772
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:41:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B3A4611BD;
	Tue, 28 Sep 2021 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632843718;
	bh=OOaUDN3IYQomRDI38ejAY3UJhkJFv+G816sARhuV5io=;
	h=From:To:Cc:Subject:Date:From;
	b=hHEa4h3hvaMgUUWGn6bjeD2E7lNSkqccP2AtPQeUUsQxZHVextOGyWjz/yAZvgw3X
	 yW1823+1Bt+lSRf6jikFjxnQBhC5p/KMCCF4bxirdyk0OTWPBsIj309fHir8acZWJr
	 oEQgS14qrBtKflFbkyyuA+YhDEB0LoVRnqOBKyl3A3YtaZO6ozvzrBzlfZcp3hrnCF
	 qmEHtnUyRqIwCKaTaO9Ua2QTqcO7DFk/NE0L1ZimkbaEMOx8c1o5e/gz/kEouZ88Ts
	 6sfMcbdZsmPvORedtlL3x89IOjSCssp9t4oRPkmXwthN91zg8ibDR1VXqIfu47aCCI
	 hTFS9ZxBYnNeQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH 00/14] ARM: randconfig build fixes
Date: Tue, 28 Sep 2021 17:41:29 +0200
Message-Id: <20210928154143.2106903-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Hi Russell,

This is a set of patches that address various problems building random
configurations. Most of these are older and have been sitting in my
collection of random fixes that I need to get back to. After the -Werror
changes for v5.15, I did that and collected all the patches that fix
something I actually run into. These are the arm32 specific ones that
I think we could merge right away, either for v5.15 as a bugfix or
for v5.16.

Let me know if you have any objections. As the patches are mostly
trivial, I would otherwise send them to your patch tracker once you've
had time to take a look.

There are a few more patches that I'm currently using, but those
are the ones that that are not ready to be merged, either because
they have been rejected before or because they are known to break
something.

      Arnd

Arnd Bergmann (13):
  ARM: RiscPC needs older gcc version
  ARM: patch: fix BE32 compilation
  ARM: remove duplicate memcpy() definition
  ARM: kprobes: address gcc -Wempty-body warning
  ARM: ARMv7-M uses BE-8, not BE-32
  ARM: disallow CONFIG_THUMB with ARMv4
  ARM: fix link warning with XIP + frame-pointer
  ARM: kprobes: fix arch_init_kprobes() prototype
  ARM: allow compile-testing without machine record
  ARM: only warn about XIP address when not compile testing
  ARM: kasan: work around LPAE build warning
  ARM: add CONFIG_PHYS_OFFSET default values
  [RFC] ARM: forbid ftrace with clang and thumb2_kernel

Nick Desaulniers (1):
  ARM: use .arch directives instead of assembler command line flags

 arch/arm/Kconfig                      | 12 +++++++-----
 arch/arm/boot/compressed/Makefile     |  2 --
 arch/arm/boot/compressed/decompress.c |  2 ++
 arch/arm/common/Makefile              |  2 --
 arch/arm/common/mcpm_head.S           |  2 ++
 arch/arm/common/vlock.S               |  2 ++
 arch/arm/include/asm/opcodes.h        |  9 +++++++--
 arch/arm/kernel/Makefile              |  2 --
 arch/arm/kernel/hyp-stub.S            |  2 ++
 arch/arm/kernel/swp_emulate.c         |  1 +
 arch/arm/kernel/vmlinux-xip.lds.S     |  8 +++++++-
 arch/arm/kernel/vmlinux.lds.S         |  2 ++
 arch/arm/lib/Makefile                 |  4 ----
 arch/arm/lib/delay-loop.S             |  4 ++++
 arch/arm/mach-at91/Makefile           |  3 ---
 arch/arm/mach-at91/pm_suspend.S       |  4 ++++
 arch/arm/mach-imx/Makefile            |  3 ---
 arch/arm/mach-imx/headsmp.S           |  2 ++
 arch/arm/mach-imx/resume-imx6.S       |  2 ++
 arch/arm/mach-imx/suspend-imx6.S      |  2 ++
 arch/arm/mach-mvebu/Makefile          |  3 ---
 arch/arm/mach-mvebu/coherency_ll.S    |  1 +
 arch/arm/mach-mvebu/pmsu.c            |  1 +
 arch/arm/mach-npcm/Makefile           |  2 --
 arch/arm/mach-npcm/headsmp.S          |  2 ++
 arch/arm/mm/Kconfig                   |  4 ++--
 arch/arm/mm/Makefile                  | 15 ---------------
 arch/arm/mm/abort-ev6.S               |  1 +
 arch/arm/mm/abort-ev7.S               |  1 +
 arch/arm/mm/cache-v6.S                |  2 ++
 arch/arm/mm/cache-v7.S                |  2 ++
 arch/arm/mm/cache-v7m.S               |  2 ++
 arch/arm/mm/copypage-feroceon.c       |  1 +
 arch/arm/mm/kasan_init.c              |  2 +-
 arch/arm/mm/proc-v6.S                 |  2 ++
 arch/arm/mm/proc-v7-2level.S          |  2 ++
 arch/arm/mm/proc-v7.S                 |  2 ++
 arch/arm/mm/tlb-v6.S                  |  2 ++
 arch/arm/mm/tlb-v7.S                  |  2 ++
 arch/arm/probes/kprobes/core.c        |  2 +-
 arch/arm/probes/kprobes/test-core.h   |  2 +-
 drivers/memory/Makefile               |  2 --
 drivers/memory/ti-emif-sram-pm.S      |  1 +
 43 files changed, 75 insertions(+), 51 deletions(-)

-- 
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
2.29.2

