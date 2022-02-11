Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD80D2F24
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 02:31:36 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 5C773804B3;
	Thu, 10 Feb 2022 21:31:28 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: llvm@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Daniel Axtens <dja@axtens.net>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH kernel 0/3] powerpc/llvm/lto: Enable CONFIG_LTO_CLANG_THIN=y
Date: Fri, 11 Feb 2022 13:31:22 +1100
Message-Id: <20220211023125.1790960-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This is based on sha1
1b43a74f255c Michael Ellerman "Automatic merge of 'master' into merge (2022-02-01 10:41)".

Please comment. Thanks.



Alexey Kardashevskiy (3):
  powerpc/64: Allow LLVM LTO builds
  powerpc/llvm: Sample config for LLVM LTO
  powerpc/llvm/lto: Workaround conditional branches in FTR_SECTION_ELSE

 arch/powerpc/Makefile                    |   4 +
 arch/powerpc/Kconfig                     |   2 +
 arch/powerpc/configs/ppc64_lto_defconfig | 381 +++++++++++++++++++++++
 arch/powerpc/kernel/exceptions-64s.S     |   6 +-
 arch/powerpc/lib/copyuser_64.S           |   3 +-
 arch/powerpc/lib/memcpy_64.S             |   3 +-
 6 files changed, 396 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/configs/ppc64_lto_defconfig

-- 
2.30.2

