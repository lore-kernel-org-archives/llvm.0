Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE32C80
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 22:49:39 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: list@opendingux.net,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] MIPS: boot/compressed: Disable abicalls
Date: Mon, 13 Dec 2021 22:49:12 +0000
Message-Id: <20211213224914.1501303-2-paul@crapouillou.net>
In-Reply-To: <20211213224914.1501303-1-paul@crapouillou.net>
References: <20211213224914.1501303-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid complaints from Clang/LLVM by building the decompress program with
-mno-abicalls.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/compressed/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index f27cf31b4140..4c9ecfbb0ef4 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -27,10 +27,10 @@ ifdef CONFIG_CPU_LOONGSON64
 KBUILD_CFLAGS := $(filter-out -march=loongson3a, $(KBUILD_CFLAGS)) -march=mips64r2
 endif
 
-KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
+KBUILD_CFLAGS := $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__ -D__DISABLE_EXPORTS \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
 
-KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
+KBUILD_AFLAGS := $(KBUILD_AFLAGS) -mno-abicalls -D__ASSEMBLY__ \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
 	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
 
-- 
2.33.0

