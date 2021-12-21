Received: from ozlabs.ru (unknown [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70662CAC
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 05:59:29 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 4A7C781FD1;
	Tue, 21 Dec 2021 00:59:22 -0500 (EST)
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
Subject: [PATCH llvm 2/6] powerpc: check for support for -Wa,-m{power4,any}
Date: Tue, 21 Dec 2021 16:59:00 +1100
Message-Id: <20211221055904.555763-3-aik@ozlabs.ru>
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

From: Daniel Axtens <dja@axtens.net>

LLVM's integrated assembler does not like either -Wa,-mpower4
or -Wa,-many. So just don't pass them if they're not supported.

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index e9aa4e8b07dd..5f16ac1583c5 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -245,7 +245,9 @@ cpu-as-$(CONFIG_E500)		+= -Wa,-me500
 # When using '-many -mpower4' gas will first try and find a matching power4
 # mnemonic and failing that it will allow any valid mnemonic that GAS knows
 # about. GCC will pass -many to GAS when assembling, clang does not.
-cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= -Wa,-mpower4 -Wa,-many
+# LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
+# but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
+cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-mpower4) $(call as-option,-Wa$(comma)-many)
 cpu-as-$(CONFIG_PPC_E500MC)	+= $(call as-option,-Wa$(comma)-me500mc)
 
 KBUILD_AFLAGS += $(cpu-as-y)
-- 
2.30.2

