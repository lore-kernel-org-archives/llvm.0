Received: from ozlabs.ru (unknown [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370912CAC
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 05:59:37 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id B781B80B64;
	Tue, 21 Dec 2021 00:59:30 -0500 (EST)
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
Subject: [PATCH llvm 3/6] powerpc/64/asm: Inline BRANCH_TO_C000
Date: Tue, 21 Dec 2021 16:59:01 +1100
Message-Id: <20211221055904.555763-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is used just once and does not really help with readability, remove it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/exceptions-64s.S | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a30f563bc7a8..83d37678f7cf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -89,19 +89,6 @@ name:
 	ori	reg,reg,(ABS_ADDR(label))@l;				\
 	addis	reg,reg,(ABS_ADDR(label))@h
 
-/*
- * Branch to label using its 0xC000 address. This results in instruction
- * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
- * on using mtmsr rather than rfid.
- *
- * This could set the 0xc bits for !RELOCATABLE as an immediate, rather than
- * load KBASE for a slight optimisation.
- */
-#define BRANCH_TO_C000(reg, label)					\
-	__LOAD_FAR_HANDLER(reg, label);					\
-	mtctr	reg;							\
-	bctr
-
 /*
  * Interrupt code generation macros
  */
@@ -962,7 +949,9 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
 	/* We are waking up from idle, so may clobber any volatile register */
 	cmpwi	cr1,r5,2
 	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
-	BRANCH_TO_C000(r12, DOTSYM(idle_return_gpr_loss))
+	__LOAD_FAR_HANDLER(r12, DOTSYM(idle_return_gpr_loss))
+	mtctr	r12
+	bctr
 #endif
 
 #ifdef CONFIG_PPC_PSERIES
-- 
2.30.2

