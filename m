Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0B1869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:31 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2f83cc145edso84227497b3.11
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ShAlAeHdmcDUjAVONmV7zEdNMXGAfOF5Y1w7mJCNcoY=;
        b=i3IPOmea3WQBb5zC3FZWXpYYQId+mZZRQL3lpa+e0IqP+k+RlUySom3NcPlGi368fl
         O3Sw4HBQ2DylP5epqpA/chiMGxk5DUS4rvyqSxjhKls6hkGH6skN3An+dxcdkYBFBmth
         yDSstoYwlSgfxlwrga/Tm0/y2UL3woX4VTlWu56RePp7m1ACnPzYMV22om7VuUGz8pxo
         FhMWrXxJj2EDUekLAgjYEJZpwCDZnAQCzeKnN5q4nByQqFn4P1w82kU3U5fiw7G7iOA4
         iawuz2E7NZ2JuP+5hqRkQq4v0WK3iguutbpwR7oUJpRmbV4Ptv/VAltW148FcTItu+yw
         JnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ShAlAeHdmcDUjAVONmV7zEdNMXGAfOF5Y1w7mJCNcoY=;
        b=w9fFaMtU+lSq2bqhyRMt0+f8Y9lp/s0WDMJfNAf6lsQMoaDsZxycl0kB136gLPGXrk
         xmWcnHXxJTIS4HXfj75aTtDylgapqzHEbmNmpJH1s6Ce3Ar9+WiwaW8jcAbLH6joPv5v
         iN7B34nkPGJJ8Y+hauzQdcUjECTGUViRdysOUcrnSIgRHIGOCIc4R7XKurhwngVfu8dm
         GD+SKTyPQpn78XdYN6Ezy7MlixcLXza4NPxgxIWc4faQpwOCZ0mikb4M2UHlsbQqLSga
         WcksoOPPh2zFno/9oomg7gsuCNfPteN+WYIuUB3LqKkZs1zGZ22dlPk81Ddx3kRc8T9k
         hpMg==
X-Gm-Message-State: AOAM530yL4O0Zqujbx/k7n5wJN2tP1xaNhk2J5BVFaoMJEVEnOgbJAOb
	n29v4f9jp3Lb7WxnOWlh5uftm5O7KWY7OEy7hpA=
X-Google-Smtp-Source: ABdhPJxAr9lCOMAnD/lmiPhOn84jHYA3HAzVbUEJjeI/G0X2/Oveum1+LxesrBYCtgzRUSo51kSIlt+AudPlAEj5GCQ=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a25:9247:0:b0:645:ddd5:a182 with SMTP
 id e7-20020a259247000000b00645ddd5a182mr1253711ybo.289.1651264650733; Fri, 29
 Apr 2022 13:37:30 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:41 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-19-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; h=from:subject;
 bh=PAL7Ge7dn/aa7QflxoZtvwjqq1kRRtVutYQP/c/YmXk=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExY8khNJI68eCV8X0o9DTv4MoJXG1yRWIAhiPc5
 hxrwlLaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMWAAKCRBMtfaEi7xW7oJMDA
 Cad9W583bxOURyKHkEV/CrQ13N5e2U+VOfMEwQDpyD3aw0pv2KNd9nK5jBFqzgoUulkUx9GFEwJ9RO
 AqsO6pFZyjBI1JO8vhI5a2YISdcHJ8Ym9ofY0eFizdNEda58ZkKk/KFe45OQrsEKv2lndYZqb7ZUKk
 F8w9hlxttRolsjibEx8PbUiSc3Nvppr39PXvnTL7KgKUtwHzwtgo5qn6c8liuOJIRRElgdF1NgT1ba
 x+LDRxsJMtK1MuvCa0MBnCvtzKSrlUui5uyZS+xik3gLWoujt/IwH6CsENW8/t0NF4FwrDVEbHnq8v
 bMTp9LQZJW2SpZO/qg59L9d2cef0Mlb4y6jc8wpmjXfApBQhEW5EgjUS5gjLmZ3hDR4DGrO6BihZTr
 hRZZg6uJK9lNidsGYcqu228RH7pCKS/wGGvrCyQO66ceD+Yw2wUy12ZmQAIJoSUbU2C21CYSA1jAh/
 z6h8soAKo8UPCCyuQNoThrFMVewhwAVcuDKVqLmZp9RRc=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 18/21] x86: Add types to indirect called assembly functions
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

With CONFIG_CFI_CLANG, assembly functions indirectly called from C code
must be annotated with type identifiers to pass CFI checking.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/crypto/blowfish-x86_64-asm_64.S | 5 +++--
 arch/x86/lib/memcpy_64.S                 | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/crypto/blowfish-x86_64-asm_64.S b/arch/x86/crypto/blowfish-x86_64-asm_64.S
index 802d71582689..4a43e072d2d1 100644
--- a/arch/x86/crypto/blowfish-x86_64-asm_64.S
+++ b/arch/x86/crypto/blowfish-x86_64-asm_64.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 
 .file "blowfish-x86_64-asm.S"
 .text
@@ -141,7 +142,7 @@ SYM_FUNC_START(__blowfish_enc_blk)
 	RET;
 SYM_FUNC_END(__blowfish_enc_blk)
 
-SYM_FUNC_START(blowfish_dec_blk)
+SYM_TYPED_FUNC_START(blowfish_dec_blk)
 	/* input:
 	 *	%rdi: ctx
 	 *	%rsi: dst
@@ -332,7 +333,7 @@ SYM_FUNC_START(__blowfish_enc_blk_4way)
 	RET;
 SYM_FUNC_END(__blowfish_enc_blk_4way)
 
-SYM_FUNC_START(blowfish_dec_blk_4way)
+SYM_TYPED_FUNC_START(blowfish_dec_blk_4way)
 	/* input:
 	 *	%rdi: ctx
 	 *	%rsi: dst
diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index d0d7b9bc6cad..e5d9b299577f 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -2,6 +2,7 @@
 /* Copyright 2002 Andi Kleen */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/errno.h>
 #include <asm/cpufeatures.h>
 #include <asm/alternative.h>
@@ -27,7 +28,7 @@
  * Output:
  * rax original destination
  */
-SYM_FUNC_START(__memcpy)
+__SYM_TYPED_FUNC_START(__memcpy, memcpy)
 	ALTERNATIVE_2 "jmp memcpy_orig", "", X86_FEATURE_REP_GOOD, \
 		      "jmp memcpy_erms", X86_FEATURE_ERMS
 
-- 
2.36.0.464.gb9c8b46e94-goog

