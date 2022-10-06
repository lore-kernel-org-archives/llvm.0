Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660414681
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 17:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DEAC433D7;
	Thu,  6 Oct 2022 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665077774;
	bh=GUqme/r7hbePZuQzyMvKMjER/L3r6OTCMSjziwbypbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hB1YD1QsXMXEUG8+CI+yIvHJLLXcoRa28R6F7dyiEAtLgiMQIBASVBkqwjlyfuzFG
	 yT5j8D33eqwtp7xui9Cyz5HD0nCV6rKGbLVQNYJTgvw1wefN48tWSRovPei/2phycr
	 ZblITCOSvP9eI0XVai8y2ELGvw4JrEneHcXfH1LKorrfcF8hBUefacu4SotJT8FhEs
	 fkGDkn3xaWUirMVvO5InMxKZO6pdBCzfOKl8gsnqzdarcIXE+MKtv6hyl4OMAufsUt
	 7V5vOGUl+l4KpzMmo7g+bdOTPsWHohrw6oUqkQT5AKrWkhvJuG02GNoOJp6NClyhCL
	 Biktb2YOhAeIg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] riscv: fix detection of toolchain Zicbom support
Date: Thu,  6 Oct 2022 18:35:20 +0100
Message-Id: <20221006173520.1785507-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>
References: <20221006173520.1785507-1-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

It is not sufficient to check if a toolchain supports a particular
extension without checking if the linker supports that extension too.
For example, Clang 15 supports Zicbom but GNU bintutils 2.35.2 does
not, leading build errors like so:

riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicbom1p0_zihintpause2p0: Invalid or unknown z ISA extension: 'zicbom'

Convert CC_HAS_ZICBOM to TOOLCHAIN_HAS_ZICBOM & check if the linker
also supports Zicbom.

Reported-by: Kevin Hilman <khilman@baylibre.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1714
Link: https://storage.kernelci.org/next/master/next-20220920/riscv/defconfig+CONFIG_EFI=n/clang-16/logs/kernel.log
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig  | 10 ++++++----
 arch/riscv/Makefile |  3 +--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d557cc50295d..6da36553158b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -401,14 +401,16 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
-config CC_HAS_ZICBOM
+config TOOLCHAIN_HAS_ZICBOM
 	bool
-	default y if 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
-	default y if 32BIT && $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
-	depends on CC_HAS_ZICBOM
+	depends on TOOLCHAIN_HAS_ZICBOM
 	depends on !XIP_KERNEL && MMU
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_ALTERNATIVE
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..3607d38edb4f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,8 +57,7 @@ toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zi
 riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 
 # Check if the toolchain supports Zicbom extension
-toolchain-supports-zicbom := $(call cc-option-yn, -march=$(riscv-march-y)_zicbom)
-riscv-march-$(toolchain-supports-zicbom) := $(riscv-march-y)_zicbom
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
 
 # Check if the toolchain supports Zihintpause extension
 toolchain-supports-zihintpause := $(call cc-option-yn, -march=$(riscv-march-y)_zihintpause)
-- 
2.37.3

