Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D646ADD
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 15:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37AFC34115;
	Thu, 30 Jun 2022 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656603119;
	bh=qbZJbSa8lQwxYorl/dCGnDiEWfOBAhdj2CRrnnSbJfU=;
	h=From:To:Cc:Subject:Date:From;
	b=l2JhklebOUOdCVGA1lDmFYVa4jWZzEcGdGXEV2UDwZ8DOlzglNliJkVhZTCgzhxTu
	 g6E2RZkBzY7VLFK/c2ff6yxgsEd7EYTkraW+Q1leXffAEHM0hSSkiF5ZPKGz4Dlek5
	 3abaog3N64Wzmeon8GA+wu8s1aXoC9wTBAHWcyL/OrT/L9dUCoPCy4dXSnbiVujsXW
	 T6BXl4Hhc5ndvf3GfPd31Orzvz8rBF8pACgwgre9+Te27NwP33mE2ac9RlGstwF/0o
	 I7peIIRC1ATSNaL6AKGGGjOF7jkO4zIa/T/ban6zqOuDGR6axcEbl9nuuYu6SdpTmC
	 DK2euDXfiaVwQ==
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
Subject: [PATCH 0/2] arm64: vdso32: Small fixes for ld.lld 11 and CONFIG_DEBUG_INFO
Date: Thu, 30 Jun 2022 08:31:19 -0700
Message-Id: <20220630153121.1317045-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small series fixes two issues I noticed with the orphan section
warnings in the 32-bit vDSO. See the individual commits for the boring
details.

They are based on for-next/vdso. I compiled with LLVM 11, LLVM 15, and
GCC 12.1.0 + binutils 2.38 with no additional warnings/errors.

Nathan Chancellor (2):
  arm64: vdso32: Shuffle .ARM.exidx section above ELF_DETAILS
  arm64: vdso32: Add DWARF_DEBUG

 arch/arm64/kernel/vdso32/vdso.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: 4274929c7ee6f442c3f89c5da64d112a9de4a6ba
-- 
2.37.0

