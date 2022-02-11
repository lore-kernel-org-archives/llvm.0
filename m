Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E0B2C9C
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 02:32:00 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 5FA6982251;
	Thu, 10 Feb 2022 21:31:52 -0500 (EST)
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
Subject: [PATCH kernel 3/3] powerpc/llvm/lto: Workaround conditional branches in FTR_SECTION_ELSE
Date: Fri, 11 Feb 2022 13:31:25 +1100
Message-Id: <20220211023125.1790960-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211023125.1790960-1-aik@ozlabs.ru>
References: <20220211023125.1790960-1-aik@ozlabs.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LTO invites ld/lld to optimize the output binary and this may affect
the FTP alternative section if alt branches use "bc" (Branch Conditional)
which only allows 16 bit offsets. This manifests in errors like:

ld.lld: error: InputSection too large for range extension thunk vmlinux.o:(__ftr_alt_97+0xF0)

This works around the problem by replacing "bc" and its alias(es) in
FTR_SECTION_ELSE with "b" which allows 26 bit offsets.

This catches the problem instructions in vmlinux.o before it LTO'ed:

$ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
  30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
  f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>

The change in copyuser_64.S is needed even when building default
configs, the other two changes are needed if the kernel config grows.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++++-
 arch/powerpc/lib/copyuser_64.S       | 3 ++-
 arch/powerpc/lib/memcpy_64.S         | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 55caeee37c08..b8d9a2f5f3a5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -476,9 +476,13 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 		.if IHSRR_IF_HVMODE
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
+		b	4f
 		FTR_SECTION_ELSE
-		bne	masked_interrupt
+		nop
+		nop
 		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+		bne	masked_interrupt
+4:
 		.elseif IHSRR
 		bne	masked_Hinterrupt
 		.else
diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
index db8719a14846..d07f95eebc65 100644
--- a/arch/powerpc/lib/copyuser_64.S
+++ b/arch/powerpc/lib/copyuser_64.S
@@ -75,10 +75,11 @@ _GLOBAL(__copy_tofrom_user_base)
  * set is Power6.
  */
 test_feature = (SELFTEST_CASE == 1)
+	beq	.Ldst_aligned
 BEGIN_FTR_SECTION
 	nop
 FTR_SECTION_ELSE
-	bne	.Ldst_unaligned
+	b	.Ldst_unaligned
 ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
 		    CPU_FTR_UNALIGNED_LD_STD)
 .Ldst_aligned:
diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
index 016c91e958d8..286c7e2d0883 100644
--- a/arch/powerpc/lib/memcpy_64.S
+++ b/arch/powerpc/lib/memcpy_64.S
@@ -50,10 +50,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
    At the time of writing the only CPU that has this combination of bits
    set is Power6. */
 test_feature = (SELFTEST_CASE == 1)
+	beq      .ldst_aligned
 BEGIN_FTR_SECTION
 	nop
 FTR_SECTION_ELSE
-	bne	.Ldst_unaligned
+	b	.Ldst_unaligned
 ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
                     CPU_FTR_UNALIGNED_LD_STD)
 .Ldst_aligned:
-- 
2.30.2

