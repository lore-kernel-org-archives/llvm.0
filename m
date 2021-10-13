Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DEA2C88
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:06 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id y18-20020a25a092000000b005bddb39f160so2591028ybh.10
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ddM0wjXjuVhiESwBHLGsB/XcUm7YnLsw3weEAwMgFME=;
        b=DzJe/FhyjAokjnnxFQ0rBkacgAGKjayT5VwKQxTR4XCFjeL0GT9oTPrs0S0kVuwWBb
         EO7HJtGj52OFfO1pEGUy+nmp8SjWRcDEmn5CmNnwDq8EP0m1QlH+erpfeOfI0b1CqLvU
         TXf3Jdi2OGDL5fLBmf2Jw850Lz6MPqfmrYUrzq5oVBy3sEMFRCBF5U7JErhv/QmtkoAK
         kVSfYtIgUoBjgLyYXqUqKuqr5rOL2l06G89950silNPDw71oeF3AcTAkcMLyKDpFvtBY
         6du/OpowoDdOn1uQ2jbcOXCVORj+xgh/p6M2hbzk+YYukSW3wp9PQco/TWuFC1IVQGv5
         bojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ddM0wjXjuVhiESwBHLGsB/XcUm7YnLsw3weEAwMgFME=;
        b=W7FUn54dI9ebZwlB1404HieB76hghznYccx6znGCWQvdpk4MvskqP3LtL/edB6eFno
         6U3cP7qxeVEJft/S7uVpVzX5KcW05FuYxL7HyG7HqCjOrVyW7ox4U5mjF/UgeBWmHs5f
         EM/99SUMdvwsJyibCCO7Cn4Lk/u5tXJRpAVBKcZnIlEtnKDvgxcRstBwFNnV2BcU10nk
         mGzGwiag2V1oR4eUwPA0hGorOdLJowEj1x7Lf9wXrhjwqNAT7gYAl7RTyAjWdHJuO5tS
         uDabuyz1Si+clUnHwej06LtjHJtGIlBvVtWujcqzke3IS6FK8r3zs4Wk/cHxHLfmUNxN
         5KuA==
X-Gm-Message-State: AOAM533m9NzyU/mQca94ZPvYIc1rRipQeFJaG8ap7eocel7NaRw92WjW
	AsUDZq8xnT3KvHnQOFppcmxi041QGGjbM1lbVeM=
X-Google-Smtp-Source: ABdhPJyfPiWvwvyeGuzv1LxIxNV3AorG5YJBB0JF63uKvJE7ax6+V2igiPMVtj2orDazolU/eFQ8Gjy3Rb43OAux4iY=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:a25:bd93:: with SMTP id
 f19mr1010727ybh.23.1634149026081; Wed, 13 Oct 2021 11:17:06 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:45 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; h=from:subject;
 bh=FbKx6kJYHXjri4vS3aVbZDzbVSEbthmZmW2N9ZzoevU=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKYaPNjTvTJEt/2zmgf+vF3zAIrGYZaw+pgnDSc
 seWZsv2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimAAKCRBMtfaEi7xW7l+SC/
 9Rs2vaJZcjKizF7OtJ+jkFalcGem/aEeWPBrHMuOC5YoULYYF6tC5JdtSl2YGGLykeqwyKJJyw6pvr
 ptAc0tl4opaiXPuJzVqq2EkVITGV2g3lezpp/5x7CrkTu+0uNxoLwbA3JjmR7dLN63j9MvCeozia0n
 aePKOv/AXfSjuNXMkT8mq/DWCJoxGIWRG+v8atmhLnHHxNdLYu0PqFXMbHUEsxr4shxsPQwh9qWJ+P
 PbXjZxmAWh+CLfZ6yYXkWely9sAyZ157NJuya9XsR7YhOdTEN6T5IgtWLY5Vcog91a7KYIFcKU/2nw
 HF6CZTRTscTOUrJhcvucGdZhKFPV+CdBDvPcb+Zat8XO6hBvczzBuhM5Mu453pnGkYW+KmmEF5CHsT
 pI3+S4s07v+ptfu0Imn35QbW6k+UbWdNaKZsaHjsbTIxb3aNWNmnLqda01fGR8bGSeVZT1afOQMvss
 sTI0VkSZj/3zvudtfkQ+0DzZ3gzQJ0fyKxW6ztSZI27Cs=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 02/15] objtool: Add ASM_STACK_FRAME_NON_STANDARD
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

To use the STACK_FRAME_NON_STANDARD macro for a static symbol
defined in inline assembly, we need a C declaration that implies
global visibility. This type mismatch confuses the compiler with
CONFIG_CFI_CLANG. This change adds an inline assembly version of
the macro to avoid the issue.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 include/linux/objtool.h       | 6 ++++++
 tools/include/linux/objtool.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 7e72d975cb76..080e95174536 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -66,6 +66,11 @@ struct unwind_hint {
 	static void __used __section(".discard.func_stack_frame_non_standard") \
 		*__func_stack_frame_non_standard_##func = func
 
+#define ASM_STACK_FRAME_NON_STANDARD(func)				\
+	".pushsection .discard.func_stack_frame_non_standard, \"aw\"\n"	\
+	".long " __stringify(func) " - .\n"				\
+	".popsection\n"
+
 #else /* __ASSEMBLY__ */
 
 /*
@@ -127,6 +132,7 @@ struct unwind_hint {
 #define UNWIND_HINT(sp_reg, sp_offset, type, end)	\
 	"\n\t"
 #define STACK_FRAME_NON_STANDARD(func)
+#define ASM_STACK_FRAME_NON_STANDARD(func)
 #else
 #define ANNOTATE_INTRA_FUNCTION_CALL
 .macro UNWIND_HINT sp_reg:req sp_offset=0 type:req end=0
diff --git a/tools/include/linux/objtool.h b/tools/include/linux/objtool.h
index 7e72d975cb76..080e95174536 100644
--- a/tools/include/linux/objtool.h
+++ b/tools/include/linux/objtool.h
@@ -66,6 +66,11 @@ struct unwind_hint {
 	static void __used __section(".discard.func_stack_frame_non_standard") \
 		*__func_stack_frame_non_standard_##func = func
 
+#define ASM_STACK_FRAME_NON_STANDARD(func)				\
+	".pushsection .discard.func_stack_frame_non_standard, \"aw\"\n"	\
+	".long " __stringify(func) " - .\n"				\
+	".popsection\n"
+
 #else /* __ASSEMBLY__ */
 
 /*
@@ -127,6 +132,7 @@ struct unwind_hint {
 #define UNWIND_HINT(sp_reg, sp_offset, type, end)	\
 	"\n\t"
 #define STACK_FRAME_NON_STANDARD(func)
+#define ASM_STACK_FRAME_NON_STANDARD(func)
 #else
 #define ANNOTATE_INTRA_FUNCTION_CALL
 .macro UNWIND_HINT sp_reg:req sp_offset=0 type:req end=0
-- 
2.33.0.1079.g6e70778dc9-goog

