Received: from ozlabs.ru (unknown [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27EC2CAC
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 05:59:59 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 6563481FD1;
	Tue, 21 Dec 2021 00:59:52 -0500 (EST)
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
Subject: [PATCH llvm 6/6] powerpc/mm/book3s64/hash: Switch pre 2.06 tlbiel to .long
Date: Tue, 21 Dec 2021 16:59:04 +1100
Message-Id: <20211221055904.555763-7-aik@ozlabs.ru>
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

The llvm integrated assembler does not recognise the ISA 2.05 tlbiel
version. Work around it by switching to .long when an old arch level
detected.

Signed-off-by: Daniel Axtens <dja@axtens.net>
[aik: did "Eventually do this more smartly"]
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/ppc-opcode.h  | 2 ++
 arch/powerpc/mm/book3s64/hash_native.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 9fe3223e7820..efad07081cc0 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -394,6 +394,7 @@
 	(0x7c000264 | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
 #define PPC_RAW_TLBIEL(rb, rs, ric, prs, r) \
 	(0x7c000224 | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
+#define PPC_RAW_TLBIEL_v205(rb, l)	(0x7c000224 | ___PPC_RB(rb) | (l << 21))
 #define PPC_RAW_TLBSRX_DOT(a, b)	(0x7c0006a5 | __PPC_RA0(a) | __PPC_RB(b))
 #define PPC_RAW_TLBIVAX(a, b)		(0x7c000624 | __PPC_RA0(a) | __PPC_RB(b))
 #define PPC_RAW_ERATWE(s, a, w)		(0x7c0001a6 | __PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
@@ -606,6 +607,7 @@
 				stringify_in_c(.long PPC_RAW_TLBIE_5(rb, rs, ric, prs, r))
 #define	PPC_TLBIEL(rb,rs,ric,prs,r) \
 				stringify_in_c(.long PPC_RAW_TLBIEL(rb, rs, ric, prs, r))
+#define PPC_TLBIEL_v205(rb, l)	stringify_in_c(.long PPC_RAW_TLBIEL_v205(rb, l))
 #define PPC_TLBSRX_DOT(a, b)	stringify_in_c(.long PPC_RAW_TLBSRX_DOT(a, b))
 #define PPC_TLBIVAX(a, b)	stringify_in_c(.long PPC_RAW_TLBIVAX(a, b))
 
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index d2a320828c0b..623a7b7ab38b 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -163,7 +163,7 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 		va |= ssize << 8;
 		sllp = get_sllp_encoding(apsize);
 		va |= sllp << 5;
-		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,0", %1)
+		asm volatile(ASM_FTR_IFSET("tlbiel %0", PPC_TLBIEL_v205(%0, 0), %1)
 			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
 			     : "memory");
 		break;
@@ -182,7 +182,7 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 		 */
 		va |= (vpn & 0xfe);
 		va |= 1; /* L */
-		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,1", %1)
+		asm volatile(ASM_FTR_IFSET("tlbiel %0", PPC_TLBIEL_v205(%0, 1), %1)
 			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
 			     : "memory");
 		break;
-- 
2.30.2

