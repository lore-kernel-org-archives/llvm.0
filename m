Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5A6ADD
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCD4C341CB;
	Thu, 30 Jun 2022 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656603121;
	bh=Mc0Rtfv5Q6VgtfmxRqUTe/qbzvhY8R4J0R57YzDkjbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CopN/WnL2zNJPogT2MzmTl41y9stZmh1N49STSIztJhT3Hcx8CidlZMG7ilVfHwaR
	 t1E40XS8knn0RRz2WQOXPyNq3f9feDuFvhSgvjb2CnAIChp6nM+u0Q/OIBc+wuEDtr
	 mzaDgYbVqhg5co/wO3QE027rMoBO4MiWQvgXZIjK6YF5BnFUV733zej0XId4idyWbA
	 VfMonM5qG+Qs5ZK9L+BCD7Xw3fM7KXN/8l/hefOi1RcnSSF8pJ3m7/pvvjRpgkXwst
	 4NqC5Woe+AQ49aX9gxu3B9228elarMIIsPi+QyyexFvPwzbI45N7scKIHLiI3Nyz6C
	 n/cHpu3nBMwMQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	patches@lists.linudx.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/2] arm64: vdso32: Shuffle .ARM.exidx section above ELF_DETAILS
Date: Thu, 30 Jun 2022 08:31:20 -0700
Message-Id: <20220630153121.1317045-2-nathan@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630153121.1317045-1-nathan@kernel.org>
References: <20220630153121.1317045-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the 32-bit vDSO after commit 5c4fb60816ea ("arm64: vdso32:
add ARM.exidx* sections"), ld.lld 11 fails to link:

  ld.lld: error: could not allocate headers
  ld.lld: error: unable to place section .text at file offset [0x2A0, 0xBB1]; check your linker script for overflows
  ld.lld: error: unable to place section .comment at file offset [0xBB2, 0xC8A]; check your linker script for overflows
  ld.lld: error: unable to place section .symtab at file offset [0xC8C, 0xE0B]; check your linker script for overflows
  ld.lld: error: unable to place section .strtab at file offset [0xE0C, 0xF1C]; check your linker script for overflows
  ld.lld: error: unable to place section .shstrtab at file offset [0xF1D, 0xFAA]; check your linker script for overflows
  ld.lld: error: section .ARM.exidx file range overlaps with .hash
  >>> .ARM.exidx range is [0x90, 0xCF]
  >>> .hash range is [0xB4, 0xE3]

  ld.lld: error: section .hash file range overlaps with .ARM.attributes
  >>> .hash range is [0xB4, 0xE3]
  >>> .ARM.attributes range is [0xD0, 0x10B]

  ld.lld: error: section .ARM.attributes file range overlaps with .dynsym
  >>> .ARM.attributes range is [0xD0, 0x10B]
  >>> .dynsym range is [0xE4, 0x133]

  ld.lld: error: section .ARM.exidx virtual address range overlaps with .hash
  >>> .ARM.exidx range is [0x90, 0xCF]
  >>> .hash range is [0xB4, 0xE3]

  ld.lld: error: section .ARM.exidx load address range overlaps with .hash
  >>> .ARM.exidx range is [0x90, 0xCF]
  >>> .hash range is [0xB4, 0xE3]

This was fixed in ld.lld 12 with a change to match GNU ld's semantics of
placing non-SHF_ALLOC sections after SHF_ALLOC sections.

To workaround this issue, move the .ARM.exidx section before the
.comment, .symtab, .strtab, and .shstrtab sections (ELF_DETAILS) so that
those sections remain contiguous with the .ARM.attributes section.

Fixes: 5c4fb60816ea ("arm64: vdso32: add ARM.exidx* sections")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/kernel/vdso32/vdso.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index 6e67a6524d58..c25bed8e6df1 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -56,8 +56,8 @@ SECTIONS
 
 	.rel.dyn	: { *(.rel*) }
 
-	ELF_DETAILS
 	.ARM.exidx : { *(.ARM.exidx*) }
+	ELF_DETAILS
 	.ARM.attributes 0 : { *(.ARM.attributes) }
 
 	/DISCARD/	: {
-- 
2.37.0

