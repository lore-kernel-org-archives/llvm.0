Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A82EB840;
	Tue,  3 Feb 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770103861; cv=none; b=l9kah4PY52G2qdOQxl/RYh5cXolxAI/Mb9qNXKaBE6ltBEQ8jdP9RtR+Cupgelo8Ir4ulBobLX7P7vCdvWSG3l7aH81UzQrthoVglMvOsOv+MleNZ3uyeK42/8RFe0kLdcwQqC/zMaU8P/UYpsB319GMdG/o1D/H3eQkdd2CbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770103861; c=relaxed/simple;
	bh=nE9mcDppRscPQOO6KIoG4m/kW+C5a6C2tfa4wTdCQQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jn4TxOS/USLPrUjco2fXi13/eLaFi3NEGUvCXva4nlKPJSvBzTnLwg6bF3Xm+0E4Y8BqtD4Ga2bCCKY0yVS9CxJA7u0w76Adzj5PGBdQhA1bi1+q+5dt7R2npCzcQbMPT0nNUh3G1j37oE1oKPNQhphv1o4pjsOnZfyuKvRl+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqCn2a/o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqCn2a/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62F3C116D0;
	Tue,  3 Feb 2026 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770103861;
	bh=nE9mcDppRscPQOO6KIoG4m/kW+C5a6C2tfa4wTdCQQw=;
	h=From:To:Cc:Subject:Date:From;
	b=jqCn2a/oFvLY0qBIMGvOPX8KpWbxrDT2iIu74XMZ5VZ6mFCCVH5go6PhCwGAqQNmo
	 HRB/a+PZt7U+JNHXILRDT+pvQJp/z/NlxRZKvpoVCx/KI5iHlvKZHKBWeA/AV70AHN
	 5Z/kL/b84B1bZUwCYgBl6UbxFX8hVoPT0ts2YXXYqrh+gSgA2VMO50sKmqGeM0Wwcz
	 dPHv9TLmx2iR1dgi7jvppPb/07KPMiB3xEMC3uVtr+ow0mFSOW47v/dCk/O94Mnbnv
	 emBFMZL3A+Q0041OUpfMSjWiB1T5yexyWpeHixVnv4s6jdNtGLrb0+RSJClmZJscFN
	 Ivz0hSuqgB3ug==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Segher Boessenkool <segher@kernel.crashing.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on PPC32
Date: Tue,  3 Feb 2026 08:30:41 +0100
Message-ID: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3467; i=chleroy@kernel.org; h=from:subject:message-id; bh=nE9mcDppRscPQOO6KIoG4m/kW+C5a6C2tfa4wTdCQQw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQ2LlGaGO7z8dTVvlOWvh2u7el5FXG8Z/fM4uvcNnVVi sSH9Ym1HaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAi5ZWMDDvWW3vUeBnse7if SWFif2f33yexO6alhfQs+auiXbmYk53hf81fkaAJfvIPZBbl67xqbNtZHGno/eyPwK38dPYTYZU rWAE=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit

Test robot reports the following error with clang-16.0.6:

   In file included from kernel/rseq.c:75:
   include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
                   unsafe_get_user(offset, &ucs->post_commit_offset, efault);
                   ^
   include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
           arch_unsafe_get_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
           __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
           ^
   arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
           __get_user_size_allowed(x, ptr, size, __gus_retval);    \
           ^
   arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
           case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
                   ^
   arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
                   "       li %1+1,0\n"                    \
                    ^
   <inline asm>:7:5: note: instantiated into assembly here
           li 31+1,0
              ^
   1 error generated.

On PPC32, for 64 bits vars a pair of registers is used. Usually the
lower register in the pair is the high part and the higher register is
the low part. GCC uses r3/r4 ... r11/r12 ... r14/r15 ... r30/r31

In older kernel code inline assembly was using %1 and %1+1 to represent
64 bits values. However here it looks like clang uses r31 as high part,
allthough r32 doesn't exist hence the error.

Allthoug %1+1 should work, most places now use %L1 instead of %1+1, so
let's do the same here.

With that change, the build doesn't fail anymore and a disassembly shows
clang uses r17/r18 and r31/r14 pair when GCC would have used r16/r17 and
r30/r31:

	Disassembly of section .fixup:

	00000000 <.fixup>:
	   0:	38 a0 ff f2 	li      r5,-14
	   4:	3a 20 00 00 	li      r17,0
	   8:	3a 40 00 00 	li      r18,0
	   c:	48 00 00 00 	b       c <.fixup+0xc>
				c: R_PPC_REL24	.text+0xbc
	  10:	38 a0 ff f2 	li      r5,-14
	  14:	3b e0 00 00 	li      r31,0
	  18:	39 c0 00 00 	li      r14,0
	  1c:	48 00 00 00 	b       1c <.fixup+0x1c>
				1c: R_PPC_REL24	.text+0x144

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602021825.otcItxGi-lkp@intel.com/
Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
I set Fixes: tag to the commit that recently replaced %1+1 by %L1 in the main part of the macro as the fix would be uncomplete otherwise but the problem has been there since commit 2df5e8bcca53 ("powerpc: merge uaccess.h")
---
 arch/powerpc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index ba1d878c3f404..570b3d91e2e40 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -255,7 +255,7 @@ __gus_failed:								\
 		".section .fixup,\"ax\"\n"		\
 		"4:	li %0,%3\n"			\
 		"	li %1,0\n"			\
-		"	li %1+1,0\n"			\
+		"	li %L1,0\n"			\
 		"	b 3b\n"				\
 		".previous\n"				\
 		EX_TABLE(1b, 4b)			\
-- 
2.49.0

