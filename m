Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E17190
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 16:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304D0C433EF;
	Thu, 15 Dec 2022 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671121601;
	bh=NQhOvRDb47qHa+Q6SeiWEqOiMrLXdQJpkU+Bg3f6MZU=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=RC7RD4kKa4Ojq7CyadAqJYUontCem9zIv7i+DnS4OwIrFPNBr0YoYMVDMXvAkWbu5
	 yQx5ST5lwGpGblAH9Iy6Sev1pjJbtmjIy5+vhhb9Qt5KiLvt81/Z+k0CxeXehWPZUS
	 LmJW1Z6ENc7QW2Du2bQnIPIAG3mR0fRJwBauStVF4t0xobw92GIjOUOY/zGEnc7F47
	 z3rbk5a/s6I8nYEFQ/0cfUFdHgSkzj8WRnpFNx3U5kBm5OvwZr5X+oqsEHIDVaZB3n
	 pvtMXsSgosE3mbTXTOWBIImS8tqHo3kxL4KGpJFUQNPZrSVpEqDNtbA0XHrfqFm4Bu
	 fFpVaRJ/8Scpw==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tom Rix <trix@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ARM: disallow pre-ARMv5 builds with ld.lld
Date: Thu, 15 Dec 2022 17:26:20 +0100
Message-Id: <20221215162635.3750763-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

lld cannot build for ARMv4/v4T targets because it inserts 'blx' instructions
that are unsupported there:

  ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected

Add a Kconfig time dependency to prevent those targets from being
selected in randconfig builds.

Link: https://github.com/llvm/llvm-project/issues/50764
Link: https://github.com/ClangBuiltLinux/linux/issues/964
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4a8fff7f9be0..d995054ab602 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -344,12 +344,14 @@ comment "CPU Core family selection"
 config ARCH_MULTI_V4
 	bool "ARMv4 based platforms (FA526, StrongARM)"
 	depends on !ARCH_MULTI_V6_V7
+	depends on !LD_IS_LLD
 	select ARCH_MULTI_V4_V5
 	select CPU_FA526 if !(CPU_SA110 || CPU_SA1100)
 
 config ARCH_MULTI_V4T
 	bool "ARMv4T based platforms (ARM720T, ARM920T, ...)"
 	depends on !ARCH_MULTI_V6_V7
+	depends on !LD_IS_LLD
 	select ARCH_MULTI_V4_V5
 	select CPU_ARM920T if !(CPU_ARM7TDMI || CPU_ARM720T || \
 		CPU_ARM740T || CPU_ARM9TDMI || CPU_ARM922T || \
-- 
2.35.1

