Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA822C9C
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 02:31:44 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 53FAE81640;
	Thu, 10 Feb 2022 21:31:36 -0500 (EST)
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
Subject: [PATCH kernel 1/3] powerpc/64: Allow LLVM LTO builds
Date: Fri, 11 Feb 2022 13:31:23 +1100
Message-Id: <20220211023125.1790960-2-aik@ozlabs.ru>
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

The upstream LLVM supports now LTO on PPC, enable it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..91c122224f83 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -153,6 +153,8 @@ config PPC
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WEAK_RELEASE_ACQUIRE
+	select ARCH_SUPPORTS_LTO_CLANG		if PPC64
+	select ARCH_SUPPORTS_LTO_CLANG_THIN	if PPC64
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
-- 
2.30.2

