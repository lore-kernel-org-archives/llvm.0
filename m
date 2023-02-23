Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E6AD26
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 22:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00ECC4339E;
	Thu, 23 Feb 2023 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677189953;
	bh=uoP7If85xrhFUVwIMAutLKfgxp8azS5/GvV/xcdBy84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkbMlcelSh8xlrM8WSUQkq6ijUNiQ9DkXjGlEtqI/IGwl0Kg3gxR4UPXrW2tjqvLh
	 jXBMUp3psD0TjGEAmTU90mQsGT6pDPrX2Lryo3CzwmY+CGA2RuLUdNveS6qlygsOD6
	 8P7BlQVKP+vUM/xAjOdI22n5Lqgfp5DgfsSs2iw8/wGnt+IdeNsMLjBWB3GtDimkab
	 UKZfWQJxaf0iOI46NGFV9rW/1xHrav8yB5xTtIG+aO76D0mGn6d9v6xTK0NQRaaegn
	 lG0ub7oFQPzidfKAT53IFAla80XSR/E4GJpf2F2n1EnMvpcIApt4TH0wKtB3HNjr6O
	 izRJCKlLNiAWQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	nathan@kernel.org,
	naresh.kamboju@linaro.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to Kconfig
Date: Thu, 23 Feb 2023 22:05:45 +0000
Message-Id: <20230223220546.52879-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223220546.52879-1-conor@kernel.org>
References: <20230223220546.52879-1-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=conor.dooley@microchip.com; h=from:subject; bh=SBOF4i24Cru2GMP/wwEijRPSm1WbmbnoGBuNbjlDPv4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnfH5u+l+ib03zkY3dL+uq9q/ZmVsa11+3fIeiWu3nhYxud MzEnOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRhTmMDJv6n949czWkNFUze1+Dpk rJCm/FbuW5T64L18+pvVx2SZeR4UuOu4qY38W8TMnPL2aVN/MbCTtNvrX8vIN6crL7hN2TuAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Checking whether binutils defaults to using a version of the spec
requiring zicsr/zifencei being done in our Makefile is functionally
sufficient at present, but makes it harder to tell after the fact
which extensions are enabled.
By moving it to Kconfig, it's easy to tell from standard build artifacts
what has been done & the road is paved for dealing with this differently
for both binutils and LLVM.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig  | 10 ++++++++++
 arch/riscv/Makefile |  5 +----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cebf0c5f8824..4eb0ef8314b3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -288,6 +288,16 @@ config ARCH_RV64I
 
 endchoice
 
+config TOOLCHAIN_NEEDS_SPEC_20191213
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
+	help
+	  Newer binutils versions default to ISA spec version 20191213 which
+	  moves some instructions from the I extension to the Zicsr and Zifencei
+	  extensions.
+
 # We must be able to map all physical memory into the kernel, but the compiler
 # is still a bit more efficient when generating code if it's setup in a manner
 # such that it can only map 2GiB of memory.
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 12d91b0a73d8..7e1267b0e73f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -53,10 +53,7 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 
-# Newer binutils versions default to ISA spec version 20191213 which moves some
-# instructions from the I extension to the Zicsr and Zifencei extensions.
-toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
-riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
+riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_SPEC_20191213) := $(riscv-march-y)_zicsr_zifencei
 
 # Check if the toolchain supports Zicbom extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
-- 
2.39.1

