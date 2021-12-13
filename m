Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102772C80
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 22:55:44 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: list@opendingux.net,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/3] MIPS: Add support for LTO
Date: Mon, 13 Dec 2021 22:49:11 +0000
Message-Id: <20211213224914.1501303-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

With this set of patches, it becomes possible to build a LTO'd kernel
with LLVM/Clang on MIPS.

This was tested on a Ingenic JZ4770 based system. It requires the
linking step of the vmlinuz.bin to be done with binutils' LD instead of
LLVM's ld.lld [1], but the vmlinuz ELF itself can be completely built
with LLVM.

Strangely, the LTO'd kernel is bigger in size (3.6 MiB vs. 3.1 MiB
without LTO), which might be completely normal and I just have wrong
expectations.

Cheers,
-Paul

[1]: https://github.com/ClangBuiltLinux/linux/issues/1333

Paul Cercueil (3):
  MIPS: boot/compressed: Disable abicalls
  MIPS: boot/compressed: Build without LTO
  MIPS: Add support for LTO

 arch/mips/Kconfig                  | 1 +
 arch/mips/boot/compressed/Makefile | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.33.0

