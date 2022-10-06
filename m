Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34F4681
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 17:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C33AC433C1;
	Thu,  6 Oct 2022 17:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665077771;
	bh=p7WWSAL6ZEAp08YxCy84XfVzYJ+eRQtdUq8MkjpUoHk=;
	h=From:To:Cc:Subject:Date:From;
	b=b9c5Uydrjv8pk3uGlZE3vwB+UQf/6haH4DdHHdZca9dUT+SlykCR9/SgHAz6IeIKR
	 Jqsk1o65vApJ1L7m/tMWyMaTQ6ndEUWTsyVlSnx4r5nGK9q3NU/FtV4V2BniQZVCja
	 AHyZP562lYHjcSGlL4QsLvDnCUS/ooxqeZsT9IVjGLvplhn3fyQjhdGCB7W1b4tXxj
	 bbci+Ym9N7TtS52f4Yyl36wJ3Q2wEku6l4RLumK9YHBFMnbChNGGIliZ+AqpdCxfuL
	 jmppVEh2hNQCZIqIePcNESF8DMwUs9YMtCw946iWeYq1GnYIJX6DHdA4u3Vkwa/VNs
	 xrIwV9v4kyT1A==
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
	llvm@lists.linux.dev
Subject: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support detection
Date: Thu,  6 Oct 2022 18:35:19 +0100
Message-Id: <20221006173520.1785507-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey,
This came up due to a report from Kevin @ kernel-ci, who had been
running a mixed configuration of GNU binutils and clang. Their compiler
was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.

Our current checks for extension support only cover the compiler, but it
appears to me that we need to check both the compiler & linker support
in case of "pot-luck" configurations that mix different versions of
LD,AS,CC etc.

Linker support does not seem possible to actually check, since the ISA
string is emitted into the object files - so I put in version checks for
that. The checks have gotten a bit ugly since 32 & 64 bit support need
to be checked independently but ahh well.

As I was going, I fell into the trap of there being duplicated checks
for CC support in both the Makefile and Kconfig, so as part of renaming
the Kconfig symbol to TOOLCHAIN_HAS_FOO, I dropped the extra checks in
the Makefile. This has the added advantage of the TOOLCHAIN_HAS_FOO
symbol for Zihintpause appearing in .config.

I pushed out a version of this that specificly checked for assember
support for LKP to test & it looked /okay/ - but I did some more testing
today and realised that this is redudant & have since dropped the as
check.

I tested locally with a fair few different combinations, to try and
cover each of AS, LD, CC missing support for the extension.

The one that I am left wondering about is Zicsr/Zifencei. Our Makefile
has:

> # Newer binutils versions default to ISA spec version 20191213 which moves some
> # instructions from the I extension to the Zicsr and Zifencei extensions.
> toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei

I'd like to also move that one to Kconfig rather than the Makefile so
that, again, it shows up in .config etc. But as Zicsr/Zifencei do not
appear to be emitted into the object files it's not a fix and can be a
follow-on patch if my approach here is not entirely off-the-wall.

I am not 100% on the LD/LLD versions that I picked, I went off of a
`git branch -a --contains` of the first commits I found that with
mention of the extension. Please scream if I got it wrong, I'm not
overly familar with where to find this sort of info for the toolchains.

Thanks,
Conor.

Conor Dooley (2):
  riscv: fix detection of toolchain Zicbom support
  riscv: fix detection of toolchain Zihintpause support

 arch/riscv/Kconfig                      | 17 +++++++++++++----
 arch/riscv/Makefile                     |  6 ++----
 arch/riscv/include/asm/vdso/processor.h |  2 +-
 3 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.37.3

