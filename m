Received: from ozlabs.ru (unknown [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832C5173
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 06:04:37 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 165B0804D0;
	Tue, 21 Dec 2021 00:59:07 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Axtens <dja@axtens.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alan Modra <amodra@au1.ibm.com>,
	llvm@lists.linux.dev,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH kernel 0/6] powerpc: Build with LLVM_IAS=1
Date: Tue, 21 Dec 2021 16:58:58 +1100
Message-Id: <20211221055904.555763-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows compiling the upstream Linux with the upstream llvm with one fix on top;
https://reviews.llvm.org/D115419

This is based on sha1
798527287598 Michael Ellerman "Automatic merge of 'next' into merge (2021-12-14 00:12)".

Please comment. Thanks.



Alan Modra (1):
  powerpc/toc: PowerPC64 future proof kernel toc, revised for lld

Alexey Kardashevskiy (3):
  powerpc/64/asm: Inline BRANCH_TO_C000
  powerpc/mm: Switch obsolete dssall to .long
  powerpc/mm/book3s64/hash: Switch pre 2.06 tlbiel to .long

Daniel Axtens (2):
  powerpc: check for support for -Wa,-m{power4,any}
  powerpc/64/asm: Do not reassign labels

 arch/powerpc/Makefile                   |  9 +++--
 arch/powerpc/include/asm/head-64.h      | 12 +++----
 arch/powerpc/include/asm/ppc-opcode.h   |  4 +++
 arch/powerpc/include/asm/sections.h     | 14 ++++----
 arch/powerpc/kernel/idle.c              |  2 +-
 arch/powerpc/mm/book3s64/hash_native.c  |  4 +--
 arch/powerpc/mm/mmu_context.c           |  2 +-
 arch/powerpc/boot/crt0.S                |  2 +-
 arch/powerpc/boot/zImage.lds.S          |  7 ++--
 arch/powerpc/kernel/exceptions-64s.S    | 47 ++++++++++---------------
 arch/powerpc/kernel/head_64.S           | 20 +++++------
 arch/powerpc/kernel/idle_6xx.S          |  2 +-
 arch/powerpc/kernel/interrupt_64.S      |  2 +-
 arch/powerpc/kernel/l2cr_6xx.S          |  6 ++--
 arch/powerpc/kernel/swsusp_32.S         |  2 +-
 arch/powerpc/kernel/swsusp_asm64.S      |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S       |  8 ++---
 arch/powerpc/platforms/powermac/cache.S |  4 +--
 18 files changed, 69 insertions(+), 80 deletions(-)

-- 
2.30.2

