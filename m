Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA374610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:55:31 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-34577a9799dso84595317b3.6
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=kd7nRdxqflfjkfBCCsD2lZrnoq302piOWQSyjQDRjtM=;
        b=rCh4lr1ufkzl4yS8kF+nfMcpwrlAzOVRSRecjzWmLGhjmCv9VTxM06OUyO8ZyYsMuv
         iE7KV9UdwWWI1W7jhW4fA3vXVwkgh+S5HxsyLNXQ6sQJO9KnXJhew6G0ucbCHk+1UzJp
         KmEHPLdMXhsbCOP8FapKLPiMxGMriLHn4RIb7/bVitT/Onx8woP45mW6I6E3qnvyjpvU
         IVHo6anrbJEBbjhNSckgwkMhLCuLf34ij48QwW8Lm/UkCUCAv15Euq1bKDi/95ss8kqt
         vwpJYHxrsLgV3A4xMpTiEOr9bs4MocSIMUWHRaYCUZ43Kyj8m08y1c7GmluFkLfFq7HR
         PT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=kd7nRdxqflfjkfBCCsD2lZrnoq302piOWQSyjQDRjtM=;
        b=IKYx6Bks2UMJ+7bLmIn9N7pr4Es4VBYDCdywsXlTKW+gxPYUKl7xpMx4IvK4h01XN0
         UpkN+dwqjCzPi7HlDGPw2ebILstI20R0vvdsktrHStOIXtLRBgGv5ucktye+U9JO+4u1
         TEOsN06sRfN170mN9p4PlIxSDmXC9T5J4GrWOUo1c35gt+/fmlSy4XLoMSWvhM+YMqzU
         bAE0rV+9t+KIg4V4IKYqTrpYj/+TE8+Ov1huNiPNjbdH1ENQIWJgU0Ggy/YeHRkIQ6dl
         fIziWpysPPUAGmwdtGoKHI9CvT1+bpxHMXShWfFHHklKODak1A3Ngiz9yTzrFeC0DACU
         oKvw==
X-Gm-Message-State: ACgBeo0FawkvYLsfcNMnt5Xfwn8MvUQn98Xy6wuBAIB6i92Lh3r31Jnd
	DVbiRkRahMxGtIWyK6LrRzv5DGIuC9D0fCk+0ZE=
X-Google-Smtp-Source: AA6agR4KPWa5oXR9Ayg51w4kgTXhrwlsnnIwkIfkpKq1aF2MmA18JoPmR1m2Vj4mtaD5P058LPjkenrWxG9bUpOnOPo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:a4e4:e6ec:9fdd:1bdd])
 (user=samitolvanen job=sendgmr) by 2002:a0d:d5d1:0:b0:345:31d1:89af with SMTP
 id x200-20020a0dd5d1000000b0034531d189afmr9736636ywd.456.1662674130884; Thu,
 08 Sep 2022 14:55:30 -0700 (PDT)
Date: Thu,  8 Sep 2022 14:54:51 -0700
In-Reply-To: <20220908215504.3686827-1-samitolvanen@google.com>
Message-Id: <20220908215504.3686827-10-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220908215504.3686827-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4469; i=samitolvanen@google.com;
 h=from:subject; bh=ZXDeWwVnHEvuHIlmhqXxiwu6hNYWmJItX6GE8bo4AiE=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjGmS0ngozdPycUs52NDlFvKM6/yfKrCRvnRnqh9tm
 VzwT4tmJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYxpktAAKCRBMtfaEi7xW7iBmC/
 44MOwJkkMAY9jfQS3hg2NgxpRx1Cqnq56fPQZCNbTFhgw+X9TuavRXXudgD2TNdcMlgmfj5R8pFL20
 WO22k4Q0+dowr7xau/bDAlqC21Dt5VFqbhkQEk9dayxnkebGEIU2Oon993gW9+qTPEIuoQm2PWE4Cz
 F8Xqt3AsD2NbJE2pQlVht2stSPGDVMWli7P1u2w9JF+3zDT5oKHeNXoHGIKEEq3uuX/BH5zC6KDsgA
 a3k/RB3By7mzhF/2LDQkZ0hStWDPelx8WL0QMToeU9oqWlhTSggEwFHv96NCAA9wRPNoEYeb+SRuN2
 HjRrQWMXpHFYEnGNn/O/i8b5IZF+NzzpheLKi0f7v//WUMJSroCGFrim7FxAY6GHw+OrfRiAcQXUtB
 3Kv9nRuXNj4thhhE+FOYai/D+ghfrC/yTsqLZy5wb0Z4vWDAUft5cJ66Hla7IjCYVQkrtbUjxhjIiR
 Yd0k9DwonyvbgyuK4wjcYpQKxK20YJWvITEf9mTCfYm3w=
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Subject: [PATCH v5 09/22] arm64: Add types to indirect called assembly functions
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
SYM_TYPED_FUNC_START for the indirectly called functions, and ensure
we emit `bti c` also with SYM_TYPED_FUNC_START.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/crypto/ghash-ce-core.S | 5 +++--
 arch/arm64/crypto/sm3-ce-core.S   | 3 ++-
 arch/arm64/include/asm/linkage.h  | 4 ++++
 arch/arm64/kernel/cpu-reset.S     | 5 +++--
 arch/arm64/mm/proc.S              | 5 +++--
 5 files changed, 15 insertions(+), 7 deletions(-)

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
diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 43f8c25b3fda..1436fa1cde24 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -39,4 +39,8 @@
 	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
 	bti c ;
 
+#define SYM_TYPED_FUNC_START(name)				\
+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	bti c ;
+
 #endif
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
index 7837a69524c5..8b9f419fcad9 100644
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
@@ -185,7 +186,7 @@ SYM_FUNC_END(cpu_do_resume)
  * This is the low-level counterpart to cpu_replace_ttbr1, and should not be
  * called by anything else. It can only be executed from a TTBR0 mapping.
  */
-SYM_FUNC_START(idmap_cpu_replace_ttbr1)
+SYM_TYPED_FUNC_START(idmap_cpu_replace_ttbr1)
 	save_and_disable_daif flags=x2
 
 	__idmap_cpu_set_reserved_ttbr1 x1, x3
@@ -253,7 +254,7 @@ SYM_FUNC_END(idmap_cpu_replace_ttbr1)
 SYM_DATA(__idmap_kpti_flag, .long 1)
 	.popsection
 
-SYM_FUNC_START(idmap_kpti_install_ng_mappings)
+SYM_TYPED_FUNC_START(idmap_kpti_install_ng_mappings)
 	cpu		.req	w0
 	temp_pte	.req	x0
 	num_cpus	.req	w1
-- 
2.37.2.789.g6183377224-goog

