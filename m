Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4A1FBA
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 03:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3242C433D2;
	Fri,  9 Jun 2023 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686282429;
	bh=dcV7Up3dX/0Q6e4I77beL4sZLmsZvEFx4770r6J9KUU=;
	h=From:To:Cc:Subject:Date:From;
	b=PObKMaXAZoJwykEDSZBjQbZ/5BCacQ425AuvusabUPgLPKEkIprk96+NisnK9mMPC
	 Ff8pG83QF33pKHWihIoqUe+oWjnLhibSgg+y9sLLStI4KPKRHl/8xIFxEp3zdBuhqD
	 SFwGMCaSt/diOS/4GJqlJ8uEt+vsluVSTLy9EsEtNuE6LH+24MrFWtc7j00o8esIUB
	 KgGVwA/wgGedge64ouZM0ZIZxoPl5nrgPaarceZfgbzzmexJe8dzjKX+q7iu64oe/c
	 +yqpKjiobcWY3pdE16RhxfSXAZc4b0Xa2iZEdhiE3byz8fhHd1KVrH+DYQaINli8ez
	 fkiSV/QdFZmIw==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/ftrace: Disable ftrace on ppc32 if using clang
Date: Fri,  9 Jun 2023 09:15:01 +0530
Message-Id: <20230609034501.407971-1-naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ftrace on ppc32 expects a three instruction sequence at the beginning of
each function when specifying -pg:
	mflr	r0
	stw	r0,4(r1)
	bl	_mcount

This is the case with all supported versions of gcc. Clang however emits
a branch to _mcount after the function prologue, similar to the pre
-mprofile-kernel ABI on ppc64. This is not supported.

Disable ftrace on ppc32 if using clang for now. This can be re-enabled
later if clang picks up support for -fpatchable-function-entry on ppc32.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda14..d85e3cf4016d90 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -236,7 +236,7 @@ config PPC
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER
+	select HAVE_FUNCTION_TRACER		if PPC64 || (PPC32 && CC_IS_GCC)
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
 	select HAVE_GENERIC_VDSO
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP

base-commit: bd517a8442b6c6646a136421cd4c1b95bf4ce32b
-- 
2.40.1

