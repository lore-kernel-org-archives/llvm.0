Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA38E72
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:42:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF3796124B;
	Tue, 28 Sep 2021 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632843731;
	bh=ZBngGf1dNCnDo4MEWi+qXj5S4gy442NSnDPEpj1qxIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gvEvIEbKxhG1/nqcMJ2acjMJg+VTozcsnAQpEzJIRIye7Z3mjWSRbUej+JcyUFFbi
	 sOw7qa4lQnYLWrNeZuMup7kd8GTc2WKFo+NyM3cBKA4qz0c0mG3Ra8sGDhzPU67SyJ
	 eBcOsFPcXwha1NrbirPjSEmo2lUUYgWIZh2hu0nWmEeLFjKw3XVnlNws4yzkyTqmy2
	 CBrj/tEofya0JEY6YvYFjDwROrP+i58o/lNFWA7TloLj1ovnIDsJLMW2Lo3JOBajCi
	 AJI2ojLvJxO7e9CVdiZd40PZbRyKTIxS2KRHEJPiPuBKPM3AfXb8bcVEVoH7zRSSKl
	 0wOowTnG5DbJA==
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
Subject: [PATCH 06/14] ARM: disallow CONFIG_THUMB with ARMv4
Date: Tue, 28 Sep 2021 17:41:35 +0200
Message-Id: <20210928154143.2106903-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210928154143.2106903-1-arnd@kernel.org>
References: <20210928154143.2106903-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

We can currently build a multi-cpu enabled kernel that allows both ARMv4
and ARMv5 CPUs, and also supports THUMB mode in user space.

However, returning to user space in this configuration with the usr_ret
macro requires the use of the 'bx' instruction, which is refused by
the assembler:

arch/arm/kernel/entry-armv.S: Assembler messages:
arch/arm/kernel/entry-armv.S:937: Error: selected processor does not support `bx lr' in ARM mode
arch/arm/kernel/entry-armv.S:960: Error: selected processor does not support `bx lr' in ARM mode
arch/arm/kernel/entry-armv.S:1003: Error: selected processor does not support `bx lr' in ARM mode
<instantiation>:2:2: note: instruction requires: armv4t
 bx lr

While it would be possible to handle this correctly in principle, doing so
seems to not be worth it, if we can simply avoid the problem by enforcing
that a kernel supporting both ARMv4 and a later CPU architecture cannot
run THUMB binaries.

This turned up while build-testing with clang; for some reason,
gcc never triggered the problem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 82aa990c4180..58afba346729 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -675,7 +675,7 @@ config ARM_PV_FIXUP
 
 config ARM_THUMB
 	bool "Support Thumb user binaries" if !CPU_THUMBONLY && EXPERT
-	depends on CPU_THUMB_CAPABLE
+	depends on CPU_THUMB_CAPABLE && !CPU_32v4
 	default y
 	help
 	  Say Y if you want to include kernel support for running user space
-- 
2.29.2

