Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF67C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:35 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id 18-20020a621512000000b0051b90b3a793so291884pfv.8
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NcjHS6Suh3OhItEG/2MZtt/0Xj5mN4IWKhqbfh52Rno=;
        b=B6yAU5GEe4pZv/48yh6WLaI6mEXb6q5ek/xHD3FNdQztYNNt1boCQdLPa1Eoj+bFb0
         IcRpSoqgwJeACNDoRbvXik97hjTOzyv6MAX9mnUDXEqkFElRkH/mbVQthzGmVv0VoW5V
         shtnOK+4rpBrCbU/1qxNlqiQ4avMTDXPZlIVe27ivwDSoSZ5/Z5JaL0bIVD4AVFn2s1p
         sZG06EBIRR6jFQ7sHdn7SkltPOKCP9uyEidLrsiFZ+405A0pylIsgI5jzXJ1cCfkTtq8
         CxkV/5qTOb+qnKBdhYYE1CE2cmC7lI7sRQut6bHug9ResZugpE1Kql3uyWJJqVhYd605
         sRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NcjHS6Suh3OhItEG/2MZtt/0Xj5mN4IWKhqbfh52Rno=;
        b=BjKCQhZA/lRanZNVg0O8HF6obE68gi/u07sZCcvN4dnemv9ZvBLYCm4fvVRaV1kOLc
         xkRhcmlnYIQNUNZxhJBDSDQVgViBHjB3J2Q30L0kV9LR0YZYIcJ7wWuaDJ9eMJ4sEuUN
         nHwCFahdX3RtmF3G8s4OQUA+Md6FbbmhuJPC+67A5AhcaxUArutr/q4XtlJiMZnRg/W8
         0OUaFhrCvlNxZQ9+qmkCy2Fq0n4aZ1tj3qDNDjoKjUZRCsMSqRXG6J93eSknHk+uEcBD
         KyMt4DQPBZL88x+NtlYbegiPw0i7wXCXm3VE7VZJbtPB0cS0RD+24RHPgeyE6ZPD1cBA
         TZFQ==
X-Gm-Message-State: AOAM531iYs8ucAUDIUaWpVuVj+NDoDP7V/w7Vie3zuEGSNh2e7Fhmgf3
	FBi9jfi0pG19XOvJ1la32fz7gfl0Dc+WX5KPz1Q=
X-Google-Smtp-Source: ABdhPJxw7oIAK8hGCeVcNE80HM7NhVBaTN+eR2hseQO0/X0b/4Yf1tGUnNUottQiVCVizuJeiQD04X+aq1KSVb7CZow=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:1a01:b0:51c:d4f:c2a7 with
 SMTP id g1-20020a056a001a0100b0051c0d4fc2a7mr31838209pfv.45.1654904134785;
 Fri, 10 Jun 2022 16:35:34 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:01 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3850; h=from:subject;
 bh=5ZgbGJz2ZEVaG6LF/2peYBgvNX5g5T9rQB8ZfRmBxaI=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9Ut3swgrYqngHqwtC1wp3RKCDV4QKgDfNVLYTiJ
 6dF63+OJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLQAKCRBMtfaEi7xW7qYDC/
 4uoZDVEdEW9ia3dPSZOELy1obJP3wjydRD7Jb2lRl1j9YRC2vDbdRegiY/dAhKBUZJIhMFxhi7Ucda
 KBRlntq1sn5muM0HQLQW+2VQgGVUy6eswi1cnBJhF5weOCA5Yq8JqmkzpXMwmDQ15lHhdhWygirOmo
 YoyTdzn+9slce2r9w2kr8H7tKHOPpmByY8iM3OzE+cVOW9MTkuNi95Nzrccd8sFj2MDWuqGOfStQVv
 Rucb8+Vw6DbdPiJsNzUi4iTPWKMGooEKDKoO40U7zAARl068qUIzJNawJ2xy4ljp+UtBszmuNETnQD
 T0ouk5BQa4iYf7b1d4cbdz19cbiD6tkWIB8qleILbqaLLwWo/Qy2osauXT85QiQLludzGxtOVgotdy
 WF/4UkWdBS756ZuBpa1lLxpYbC2IVBSAtVs0C8isRpIIUnIl6TuTi4N4f0HRZbiuuluaWnw9wFxsqA
 iUejEfd5Gi6gRpLlSxdqzBG0a1c1VsXlwbq5mZ1fkSado=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 08/20] arm64: Add types to indirect called assembly functions
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_CFI_CLANG, assembly functions indirectly called from C
code must be annotated with type identifiers to pass CFI checking. Use
SYM_TYPED_FUNC_START for the indirectly called functions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/crypto/ghash-ce-core.S | 5 +++--
 arch/arm64/crypto/sm3-ce-core.S   | 3 ++-
 arch/arm64/kernel/cpu-reset.S     | 5 +++--
 arch/arm64/mm/proc.S              | 5 +++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-core.S b/arch/arm64/crypto/ghash-ce-core.S
index 7868330dd54e..ebe5558929b7 100644
--- a/arch/arm64/crypto/ghash-ce-core.S
+++ b/arch/arm64/crypto/ghash-ce-core.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 
 	SHASH		.req	v0
@@ -350,11 +351,11 @@ CPU_LE(	rev64		T1.16b, T1.16b	)
 	 * void pmull_ghash_update(int blocks, u64 dg[], const char *src,
 	 *			   struct ghash_key const *k, const char *head)
 	 */
-SYM_FUNC_START(pmull_ghash_update_p64)
+SYM_TYPED_FUNC_START(pmull_ghash_update_p64)
 	__pmull_ghash	p64
 SYM_FUNC_END(pmull_ghash_update_p64)
 
-SYM_FUNC_START(pmull_ghash_update_p8)
+SYM_TYPED_FUNC_START(pmull_ghash_update_p8)
 	__pmull_ghash	p8
 SYM_FUNC_END(pmull_ghash_update_p8)
 
diff --git a/arch/arm64/crypto/sm3-ce-core.S b/arch/arm64/crypto/sm3-ce-core.S
index ef97d3187cb7..ca70cfacd0d0 100644
--- a/arch/arm64/crypto/sm3-ce-core.S
+++ b/arch/arm64/crypto/sm3-ce-core.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 
 	.irp		b, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
@@ -73,7 +74,7 @@
 	 *                       int blocks)
 	 */
 	.text
-SYM_FUNC_START(sm3_ce_transform)
+SYM_TYPED_FUNC_START(sm3_ce_transform)
 	/* load state */
 	ld1		{v8.4s-v9.4s}, [x0]
 	rev64		v8.4s, v8.4s
diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
index 48a8af97faa9..6b752fe89745 100644
--- a/arch/arm64/kernel/cpu-reset.S
+++ b/arch/arm64/kernel/cpu-reset.S
@@ -8,6 +8,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/sysreg.h>
 #include <asm/virt.h>
@@ -28,7 +29,7 @@
  * branch to what would be the reset vector. It must be executed with the
  * flat identity mapping.
  */
-SYM_CODE_START(cpu_soft_restart)
+SYM_TYPED_FUNC_START(cpu_soft_restart)
 	mov_q	x12, INIT_SCTLR_EL1_MMU_OFF
 	pre_disable_mmu_workaround
 	/*
@@ -47,6 +48,6 @@ SYM_CODE_START(cpu_soft_restart)
 	mov	x1, x3				// arg1
 	mov	x2, x4				// arg2
 	br	x8
-SYM_CODE_END(cpu_soft_restart)
+SYM_FUNC_END(cpu_soft_restart)
 
 .popsection
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 50bbed947bec..dfa715315551 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/pgtable.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/asm_pointer_auth.h>
@@ -184,7 +185,7 @@ SYM_FUNC_END(cpu_do_resume)
  * This is the low-level counterpart to cpu_replace_ttbr1, and should not be
  * called by anything else. It can only be executed from a TTBR0 mapping.
  */
-SYM_FUNC_START(idmap_cpu_replace_ttbr1)
+SYM_TYPED_FUNC_START(idmap_cpu_replace_ttbr1)
 	save_and_disable_daif flags=x2
 
 	__idmap_cpu_set_reserved_ttbr1 x1, x3
@@ -224,7 +225,7 @@ SYM_FUNC_END(idmap_cpu_replace_ttbr1)
  */
 __idmap_kpti_flag:
 	.long	1
-SYM_FUNC_START(idmap_kpti_install_ng_mappings)
+SYM_TYPED_FUNC_START(idmap_kpti_install_ng_mappings)
 	cpu		.req	w0
 	num_cpus	.req	w1
 	swapper_pa	.req	x2
-- 
2.36.1.476.g0c4daa206d-goog

