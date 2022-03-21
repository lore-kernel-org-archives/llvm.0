Received: from zg8tmtyylji0my4xnjqunzqa.icoremail.net (zg8tmtyylji0my4xnjqunzqa.icoremail.net [162.243.164.74])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 5FB9336F
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 02:54:53 +0000 (UTC)
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-1 (Coremail) with SMTP id AQAAfwDHA3mp6DdiHqZ7Ag--.6346S2;
	Mon, 21 Mar 2022 10:53:29 +0800 (CST)
Received: from centos7.localdomain (unknown [202.43.158.76])
	by mail (Coremail) with SMTP id AQAAfwDnyqPt6DdiYiUAAA--.1485S3;
	Mon, 21 Mar 2022 10:54:38 +0800 (CST)
From: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Zhiyuan Dai <daizhiyuan@phytium.com.cn>
Subject: [PATCH] arm64: assembler: Fine-tune code to improve code readability
Date: Mon, 21 Mar 2022 10:54:34 +0800
Message-Id: <1647831274-3555-1-git-send-email-daizhiyuan@phytium.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID:AQAAfwDnyqPt6DdiYiUAAA--.1485S3
X-CM-SenderInfo: hgdl6xpl1xt0o6sk53xlxphulrpou0/
Authentication-Results: hzbj-icmmx-1; spf=neutral smtp.mail=daizhiyuan
	@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7Gr17XFWkCF17KF1xZr45trb_yoWDAFbEkw
	1Sqw48GrWfJrZIqry8tF1FyFy0kw4kZFZxu3Wjkrn7Jr9Fv3W5Gws7JF9Y9r47WF15Ca1x
	ua4kJFWfJw1jqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
	Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
	UUUU=
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

This patch tweaks the code to improve readability.

Defined values are:
 PMUVer == 0b0000 : Performance Monitors Extension not implemented.

Signed-off-by: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
---
 arch/arm64/include/asm/assembler.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 6ebdc0f..efd43a1 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -489,11 +489,10 @@
  */
 	.macro	reset_pmuserenr_el0, tmpreg
 	mrs	\tmpreg, id_aa64dfr0_el1
-	sbfx	\tmpreg, \tmpreg, #ID_AA64DFR0_PMUVER_SHIFT, #4
-	cmp	\tmpreg, #1			// Skip if no PMU present
-	b.lt	9000f
-	msr	pmuserenr_el0, xzr		// Disable PMU access from EL0
-9000:
+	ubfx	\tmpreg, \tmpreg, #ID_AA64DFR0_PMUVER_SHIFT, #4
+	cbz	\tmpreg, .Lskip_pmu_\@		// Skip if no PMU present
+	msr_s   SYS_PMUSERENR_EL0, xzr	// Disable PMU access from EL0
+.Lskip_pmu_\@:
 	.endm
 
 /*
-- 
1.8.3.1

