Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC02CB2
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 16:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2966CC00446;
	Wed,  8 Dec 2021 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638982648;
	bh=U3tTSsg5YkUND5CGysUHv+zvBNyCz4YDGgl5Nz/9Vdo=;
	h=From:To:Cc:Subject:Date:From;
	b=EFxOZtfpBBnu7JPqFL8tL891rBwl464/oqoKWp9UOL45PwwtACEYKTVE8kDmgPs8u
	 R22DOet+/qo/bQPlxRb0PWQoZOqxSdN87wCrIWAW/iKhSBPS3+gCya6GzcPQ04K12T
	 Uk+8XvxMtGbJZZL15EzBYWXDX7OUNBeN1/ueAyZDQdFzwCfLZiuPMstKTUboTHxn/z
	 v1W520QCov0EWrzAj6u7DIu3FJue0oB2cLo7thZQrKdezLQlzrE0N/bdNr4p85lHBa
	 oZzYZKZPNhpqPu/ZVIjHETkAuA1GC4ZyoJDD8M98Q0Zkdx9HDN8jvdqtSn6ql3QS6g
	 1BvTlwwGvuvig==
From: Nathan Chancellor <nathan@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Subject: [PATCH v2] MIPS: Loongson64: Use three arguments for slti
Date: Wed,  8 Dec 2021 09:56:17 -0700
Message-Id: <20211208165616.1746108-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---

v1 -> v2: https://lore.kernel.org/r/20211207170129.578089-1-nathan@kernel.org/

* Fix typos in commit message ("stli" -> "slti") [Sergey]

 arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index 13373c5144f8..efb41b351974 100644
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

base-commit: 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
-- 
2.34.1

