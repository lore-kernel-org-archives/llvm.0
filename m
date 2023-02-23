Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0EAD26
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 22:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5003C433EF;
	Thu, 23 Feb 2023 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677189951;
	bh=fYz5rIrd5JU5+RovoJams1gjh8QJtQxDO8e8HQED13k=;
	h=From:To:Cc:Subject:Date:From;
	b=OXLt9k56FMBL7+Tx8DTJWjJgrkrgqlfkF2NBR4wGb6BQwNS9Ou1n3faswnIWMwj9a
	 DtdnqEUKUT//A3gIWah7Xyt8pGUgDCh97cZvPqcM+GLhOcpEV10AYvcS3KBN0XIUCi
	 H3FztziA8S81HC3zpEyRcZZj1KOZyvmhSKV8uX2iDfCiYJ0uWM6D6kGrZhPQQ0F/i2
	 Ah7oBhXHC6EIKAC6z2LQ6KTJFzBSUC9chnM0bXCyLVToSky9LpwQrJvTuMK7gt35FA
	 N5+HjlQdL26X1PP9CFKLww8yewJm9uhlniN0YDepHYXlHQAp0ennwj9d26mCNvxQC1
	 yZC+GnXYKAXhA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	nathan@kernel.org,
	naresh.kamboju@linaro.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v1 0/2] RISC-V: avoid build issues for clang/llvm-17 with binutils 2.35
Date: Thu, 23 Feb 2023 22:05:44 +0000
Message-Id: <20230223220546.52879-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=conor.dooley@microchip.com; h=from:subject; bh=Tu5ucbEE25sTwVSc9Il+0h6BckMJ3n6JBbt+V1iSKoQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnfH5uyHbolse9Tyuu5B3+1f5mqnB8QHDF3zde0gPyule+1 OFMMOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRHdaMDJcCCkVYg+9ySHOLsMS9lX ngPIHl2cZTV6OCzl0/vCg9i4vhvy9j9JSLZzjO78+rkXTdsVePdW1tqv2R8uaWcjHxwxFvWAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey,
Here's an attempted (interim?) fix for issues on v5.10 due to the
presence of zifencei & zicsr in object files. I'm seeing another issue
that only appears with ld from binutils-2.35 & not with ld from
binutils-2.37 on riscv/for-next:
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: .init.data has both ordered [`__patchable_function_entries' in init/main.o] and unordered [`.meminit.data' in mm/sparse.o] sections
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: final link failed: bad value
But that's far far further on in the build than we were getting before
these patches.

Even if we end up dealing with the emitted strings a different way [1],
I think the first patch here has some value in moving the check to
Kconfig so that it's far easier to tell if the toolchain does need/use
these extensions from someone's build artifacts.

Cheers,
Conor.

1 - https://lore.kernel.org/linux-riscv/20230223195112.10489-1-palmer@rivosinc.com/

cc: nathan@kernel.org
cc: palmer@dabbelt.com
cc: naresh.kamboju@linaro.org
cc: linux-riscv@lists.infradead.org
cc: llvm@lists.linux.dev

Conor Dooley (2):
  RISC-V: move zicsr/zifencei spec version check to Kconfig
  RISC-V: make TOOLCHAIN_NEEDS_SPEC_20191213 gas only

 arch/riscv/Kconfig  | 9 +++++++++
 arch/riscv/Makefile | 5 +----
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.39.1

