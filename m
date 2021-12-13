Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745672C80
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 22:49:47 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: list@opendingux.net,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] MIPS: boot/compressed: Build without LTO
Date: Mon, 13 Dec 2021 22:49:13 +0000
Message-Id: <20211213224914.1501303-3-paul@crapouillou.net>
In-Reply-To: <20211213224914.1501303-1-paul@crapouillou.net>
References: <20211213224914.1501303-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need a valid ELF object for dummy.o, so that objcopy can insert the
vmlinuz payload.

Therefore, we must build the decompresser program without LTO, otherwise
dummy.o will be LLVM bytecode instead of a ELF object file.

Building the decompresser with LTO wouldn't make much sense anyway,
unlike building the vmlinuz itself with LTO.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 4c9ecfbb0ef4..2d01c50fb0b1 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -27,6 +27,9 @@ ifdef CONFIG_CPU_LOONGSON64
 KBUILD_CFLAGS := $(filter-out -march=loongson3a, $(KBUILD_CFLAGS)) -march=mips64r2
 endif
 
+# Disable LTO
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
+
 KBUILD_CFLAGS := $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__ -D__DISABLE_EXPORTS \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
 
-- 
2.33.0

