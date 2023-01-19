Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E32C9C
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 08:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CFFC433F0;
	Thu, 19 Jan 2023 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674116733;
	bh=ghjfgjQy0BKb/C6LfAEq6+fVqZmZeT2M4t0k/6l5bN4=;
	h=From:To:Cc:Subject:Date:From;
	b=iT/hmlqtrPaMfsfA5C6T3dPUpevSfxmWLR3aEIwMwTorEBT0YyWkjbBVySwBvnvjW
	 E0YtHhJMKphZa12C/JftqksZTccO+V48/yojtXFS1nsokX/Y/wcmSg3LeOENbnXJFv
	 USf0ejmaS47uyXnTzsHwTCIf8pgY3lAl+SiyrLpBXO36yWTvDJvBj2Aufe4+xesR7e
	 H/cuTX+6oB35Qm3kpnseCep2Qlho9iJiHm9t7T3nCbfGC8WFoGG3+P6eCWPtCmNiYC
	 wNP/GqaBikzvLYVOt+AED7JsSsRJuc+fCN/H4STyEo0AItUKHH+vb+tMytvbqXLNyQ
	 FxVvUPlvYymiw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev
Subject: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
Date: Thu, 19 Jan 2023 17:24:47 +0900
Message-Id: <20230119082447.152020-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

crtsavres.o is linked to modules, but as commit d0e628cd817f ("kbuild:
doc: clarify the difference between extra-y and always-y") explained,
'make modules' does not build extra-y.

The following command fails:

  $ make ARCH=powerpc LLVM=1 mrproper ps3_defconfig modules
    [snip]
    LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
  make[1]: *** [scripts/Makefile.modfinal:61: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
  make: *** [Makefile:1924: modules] Error 2

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c53618c34b70..aa34854bc9f5 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -43,7 +43,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
 ifndef CONFIG_LD_IS_BFD
-extra-$(CONFIG_PPC64)	+= crtsavres.o
+always-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
-- 
2.34.1

