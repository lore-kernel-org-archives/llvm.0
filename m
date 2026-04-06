Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377113A0E8F;
	Mon,  6 Apr 2026 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517959; cv=none; b=TjomZRCb8ksVwMLLWBIS/Cpvb+5XuCy5PAy5ppXxWWXnibv0MP/Et23qeZBTfBZMbHTrGd6l/2eOj89CknCIK+3s3RK8AKDX/EPjGs28ojschxkhrl41ZdHGn5ta+6dPG0sG7U+PO5w8PKhuc2/HQVpxoUNBdYuzrEa1pFBWEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517959; c=relaxed/simple;
	bh=8+bdlf8JFuMtYhnjy/F+fkhfKqlSWemei3QvSYQNKMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HsIDkJUu3uB32qv9fjasYS6feDzIaACbwJq1NrN6VdFFFjLS5oogk2xWMbRubq9241nv88CQAq0NZ8y7TRfa9niFo6lMBPY+FwBRTT5IQsSEfzJFrGhwEv73kvvzs80X1cIk8AFo9dp1kIAUc5V0VXCLyoJsawIRoL2EPq+Rn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWxsGTfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWxsGTfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01224C2BC9E;
	Mon,  6 Apr 2026 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775517958;
	bh=8+bdlf8JFuMtYhnjy/F+fkhfKqlSWemei3QvSYQNKMk=;
	h=From:Date:Subject:To:Cc:From;
	b=FWxsGTfZvLhTutwyA/JtloZPRQ8FnDXAVDemUBwHpvYl6aJ17UZMJy4miDQpEupq3
	 rjN6mVc1EVU5dbUFWPOPu5idPM9BM4JMUfSQz5wQNsUVugsEhj4rDCCdQ5G8MX98f7
	 MNR7xHapLA+aJkHJiAtfMZl9ytLuLQEgcN8AQYOldgS7zTINo3ldg/tiald2PwGZgC
	 PNtZj/GOAzDctDOciiNWDn2xBcON3dLgYegRuBSiwKrKNVonLtcqC1Jem9m3sDTkLf
	 bjZ7uSLsGucHbeiTmLUOuBVeGkxs0TPsfvZ3ixIc+3jcLy/M39+yyQji6M+KTvArAf
	 hdaJPO6cIKHTQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 06 Apr 2026 16:25:49 -0700
Subject: [PATCH] riscv: Define
 __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm0ylgkEr2IMGUsHaxDNFAiGc
 HdHXb6/+BuYJBWDU7FBkkVNn2PG8VAA38LYC2qXDeSoct5V+JBgc5KW3zyIIUfFGHTICTvywRE
 1tW9KyINXkqjrb36+/G3z9S48fY+w7x9GJWY5fgAAAA==
X-Change-ID: 20260406-measure_cycles-cfi-failure-d24a02297493
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8+bdlf8JFuMtYhnjy/F+fkhfKqlSWemei3QvSYQNKMk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlXHFmuCOm3/DmS8Md1ec/Ugq37xS+ZSp3dNVluLa9Bl
 YLOm9VGHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAifSkM//2evVBP0gqqXCF5
 nim95vnDENNlu+a9O7+z4W93+Sm+d8IM/xQfL1IqFgtf4byldfnvzP/SLc5vi9OV90wrMVh/oDj
 vNi8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
check_vector_unaligned_access()"), there are CFI failure when booting
kernels with CONFIG_CFI=y:

  CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_unaligned+0x0/0x50; expected type: ...)
  CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words_unaligned+0x0/0x24; expected type: ...)

The __riscv_copy_*_unaligned() functions are now called indirectly but
they are not defined with SYM_TYPED_FUNC_START, which is required for
assembly functions called indirectly from C to pass CFI checking. Switch
to SYM_TYPED_FUNC_START to clear up the CFI failures.

Fixes: 67bdd7b01387 ("riscv: Split out measure_cycles() for reuse")
Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unaligned_access()")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/kernel/copy-unaligned.S     | 5 +++--
 arch/riscv/kernel/vec-copy-unaligned.S | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/copy-unaligned.S b/arch/riscv/kernel/copy-unaligned.S
index 2b3d9398c113..90f3549621f7 100644
--- a/arch/riscv/kernel/copy-unaligned.S
+++ b/arch/riscv/kernel/copy-unaligned.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2023 Rivos Inc. */
 
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
@@ -9,7 +10,7 @@
 /* void __riscv_copy_words_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using word loads and stores. */
 /* Note: The size is truncated to a multiple of 8 * SZREG */
-SYM_FUNC_START(__riscv_copy_words_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_words_unaligned)
 	andi  a4, a2, ~((8*SZREG)-1)
 	beqz  a4, 2f
 	add   a3, a1, a4
@@ -41,7 +42,7 @@ SYM_FUNC_END(__riscv_copy_words_unaligned)
 /* void __riscv_copy_bytes_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using only byte accesses. */
 /* Note: The size is truncated to a multiple of 8 */
-SYM_FUNC_START(__riscv_copy_bytes_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_bytes_unaligned)
 	andi a4, a2, ~(8-1)
 	beqz a4, 2f
 	add  a3, a1, a4
diff --git a/arch/riscv/kernel/vec-copy-unaligned.S b/arch/riscv/kernel/vec-copy-unaligned.S
index 7ce4de6f6e69..361039f7b944 100644
--- a/arch/riscv/kernel/vec-copy-unaligned.S
+++ b/arch/riscv/kernel/vec-copy-unaligned.S
@@ -2,6 +2,7 @@
 /* Copyright (C) 2024 Rivos Inc. */
 
 #include <linux/args.h>
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
@@ -16,7 +17,7 @@
 /* void __riscv_copy_vec_words_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using word loads and stores. */
 /* Note: The size is truncated to a multiple of WORD_EEW */
-SYM_FUNC_START(__riscv_copy_vec_words_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_vec_words_unaligned)
 	andi  a4, a2, ~(WORD_EEW-1)
 	beqz  a4, 2f
 	add   a3, a1, a4
@@ -38,7 +39,7 @@ SYM_FUNC_END(__riscv_copy_vec_words_unaligned)
 /* void __riscv_copy_vec_bytes_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using only byte accesses. */
 /* Note: The size is truncated to a multiple of 8 */
-SYM_FUNC_START(__riscv_copy_vec_bytes_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_vec_bytes_unaligned)
 	andi a4, a2, ~(8-1)
 	beqz a4, 2f
 	add  a3, a1, a4

---
base-commit: 9b3a2be84803cf18c4b4d1efc695991f0daa153c
change-id: 20260406-measure_cycles-cfi-failure-d24a02297493

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

