Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D5572
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:05:40 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id q24-20020ac84118000000b002a6d14f21e9so12471607qtl.9
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yAjbLnc/4a+xG0iJA7167YzRctoMe7iQs3Th7exl8y0=;
        b=SvlcxRI3GX2nd8j9Q0bgxfBDF3ydh6ydlHg7K7EZljsvTET8asCVHOloFKQ7TRijza
         vN0HjN5JaVANlUkWbGRwoLqyCgaugjgFLtXJHICFTckU6s8u5Nw3D5IRqZLMoisvtJT2
         lwK7V/I2GkKyyR8M8zIipdubdj0hm5i89gRWQrdBh2hPr2MdTtfMRvAeGSHtTIvOdIhf
         ZgQHGgegg2kyvZYqJy9o/zJ24gjETr43HBOkQdJxZ72YKuNL5hp0p+5Nx8/E20tIzHQZ
         64R8fZAjx4IFoTPSPIENZysfkgVYoNGXhh3++DuTcKc8F+NymV7l7WKLPlMjk4zfml8u
         QopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yAjbLnc/4a+xG0iJA7167YzRctoMe7iQs3Th7exl8y0=;
        b=rQvdd/JkmeIMR+e6O/RvYGHhb2LXGiG+AErweEoJnlGqwN6lrasFKdacJGPT8A1uTx
         ygIR9O2Fke80OV2/LgWR9S7eFbi0+zfVta9kLmAPmvvLqO2pJs9NgDrNXL3t4parWtz7
         pNpMXQivCcOAt2wykmre48TOhtXy4JS+aTR44mSoPbHKsRZh/2FMTA5Vt+ux0jg2MMBb
         ed0FgFUEOjv8FcGgLkzbWiQBJjLhh/k6+Fj6xalvTX0dwCkGR4EjPyzCjULMRDEP1S9n
         m6ArKv8DRkbYIeb3u3b8WlUC4P3vSNL5T0Ibtd/SeVRYcGW9hHqvaR8ejC6piIyCcRM9
         EbjQ==
X-Gm-Message-State: AOAM530WvKw9Wiuc1/rRbqcJ07asYCNTb8o47ft1gYBuMqda6dJ7R8z5
	P2cFYNndL/evqe9OXbty6aJN7DUJZeIMm+Rwly8=
X-Google-Smtp-Source: ABdhPJzSSSnwMdWUnZcSCWxApNcxtPczjvh4ogkn8fqf5fL6TvlzIOJjfdSg+b9xxcs7cfAmBGB0tTMcLHwNPjr9GOk=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a0c:9d05:: with SMTP id
 m5mr5140529qvf.30.1633025139519; Thu, 30 Sep 2021 11:05:39 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:18 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 02/15] objtool: Add ASM_STACK_FRAME_NON_STANDARD
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

To use the STACK_FRAME_NON_STANDARD macro for a static symbol
defined in inline assembly, we need a C declaration that implies
global visibility. This type mismatch confuses the compiler with
CONFIG_CFI_CLANG. This change adds an inline assembly version of
the macro to avoid the issue.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
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
2.33.0.800.g4c38ced690-goog

