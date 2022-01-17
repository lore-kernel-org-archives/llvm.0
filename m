Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7572C80
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 16:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F58C36AE3;
	Mon, 17 Jan 2022 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642438798;
	bh=9aUcXT3IAkm0wq9zoAJHhvROrGWTCBthzqq60iNgH8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XKB4OrJl5rJRzPA1HRdr3TSIn+BnR5MAs6bbxrQT209qNFwTNNhH8G5qK0IKB5qHq
	 YgDXnKG2wE9iL98L8Co1I6FqqXKKJxlT+2gDA0uLW782M4fBAwJMiRYJJF9jd5X4P2
	 elcKAAN+2pZQ1IweuxuoX3Pnc0P057Eew7Z2lW1JyqSltSKxID6S78dc8uiT1dyR/d
	 StHg2x3IGYTgzQOPxEc4rIxe6Xg1BXdL5TCZH4Y2kImgxwpifnDi5q4T+PW3ePASmB
	 NabV8x4C8SdL722hYN2vIVW7klannKkwmNqqAJNGXB6uYVdNdnXecj9rRj6SIyE0OF
	 Z8izLEWXaWy0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	ndesaulniers@google.com,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.16 26/52] MIPS: Loongson64: Use three arguments for slti
Date: Mon, 17 Jan 2022 11:58:27 -0500
Message-Id: <20220117165853.1470420-26-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit f2c6c22fa83ab2577619009057b3ebcb5305bb03 ]

LLVM's integrated assembler does not support 'slti <reg>, <imm>':

<instantiation>:16:12: error: invalid operand for instruction
 slti $12, (0x6300 | 0x0008)
           ^
arch/mips/kernel/head.S:86:2: note: while in macro instantiation
 kernel_entry_setup # cpu specific setup
 ^
<instantiation>:16:12: error: invalid operand for instruction
 slti $12, (0x6300 | 0x0008)
           ^
arch/mips/kernel/head.S:150:2: note: while in macro instantiation
 smp_slave_setup
 ^

To increase compatibility with LLVM's integrated assembler, use the full
form of 'slti <reg>, <reg>, <imm>', which matches the rest of
arch/mips/. This does not result in any change for GNU as.

Link: https://github.com/ClangBuiltLinux/linux/issues/1526
Reported-by: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index 13373c5144f89..efb41b3519747 100644
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
@@ -32,7 +32,7 @@
 	nop
 	/* Loongson-3A R2/R3 */
 	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
+	slti	t0, t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
 	bnez	t0, 2f
 	nop
 1:
@@ -63,7 +63,7 @@
 	nop
 	/* Loongson-3A R2/R3 */
 	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
+	slti	t0, t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
 	bnez	t0, 2f
 	nop
 1:
-- 
2.34.1

