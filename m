Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802C3FDF
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 19:58:38 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id w10-20020ac87e8a000000b002a68361412bso15600120qtj.7
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 12:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jAuT2Ih3MFOePb85QCkMtLI141zk5gS6D05a628HxZY=;
        b=r0CihtWGn69tmcZFeSCcKUPbPscg8Kju+ik2iGSaKknPFwicL/q+zW6y8jRIZzsb+R
         oOTIJpRHvE3GWgAtPgp3NDvLWUryCfaAtHOIBwoSng+UFL7jOz/dONqVIog6AyRl9sgN
         Onu9y1UaXTdlYcHkLuf4uWyL5VdqQCaWNL07mw92SNmYfvurN/rUFQolH+gxPU90KG9I
         aqQobN0ap1r/xSllQkvAT3y5Qgkd4nnhsuh42ypNHDyzf/Uw/UCSO9wbMv2Zu0IPaE3S
         CQ4IIZZhrSQAa87g9Icjc72Hvo6D2Pze8tuspMulRG42sbiiXojrguCJa3scEfEhN2Fm
         ujQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jAuT2Ih3MFOePb85QCkMtLI141zk5gS6D05a628HxZY=;
        b=EB6Z5vpD7yLXm7Pi4rZGC3CpHV8fHrGEjqNue3T0p3gTMiIKRtYAh8LHCd0+a6khUf
         Q+taeatXZ1MLtqBeUrMcx03KWK+gvKijPIh92j3brTjUrjS5vxhej11lAi/qjj+fNYVm
         Ymk7i7J/EAaNql/k0zywTZFd2qccHnQGmBNyYl/PAGs6+7ub+sMNvBK5pfH0wxCImCK1
         0EkzIaHVRgLAnBCsL3SY+wEJ2D1dAclyGU11f576rKY43Vo8Bwi9NVO9UMyP0Ak6zKZd
         5xBQqz402uZ37fth84XyRufkx1VyiezSr6IRyDu/PqJ59ljBIXuDfn5gadX0BGfKryGs
         5hPw==
X-Gm-Message-State: AOAM532GcrCZaI6Vqwb7msuFMJ+SzeyaTDSDk2TgOJ2WlgIMGnAvlaFc
	qt93jT/aUTKmMcjar91+ARVNK9ubmJxzv66seQY=
X-Google-Smtp-Source: ABdhPJyiYvFeU2KcQlXH3qtdKxpV2Uk5f53K4zvyFxfeL4giQfZehQqsQuS621d0cjHXGQQTb4re4DkvbtAAPAxEQN0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:99e9:cd62:e5f3:763d])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:c293:: with SMTP id
 b19mr11016594qvi.22.1633118317541; Fri, 01 Oct 2021 12:58:37 -0700 (PDT)
Date: Fri,  1 Oct 2021 12:58:21 -0700
In-Reply-To: <CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com>
Message-Id: <20211001195823.581937-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v5] kallsyms: strip LTO suffixes from static functions
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "KE . LI" <like1@oppo.com>, 
	Fangrui Song <maskray@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Miroslav Benes <mbenes@suse.cz>, Jessica Yu <jeyu@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Similar to:
commit 8b8e6b5d3b01 ("kallsyms: strip ThinLTO hashes from static
functions")

It's very common for compilers to modify the symbol name for static
functions as part of optimizing transformations. That makes hooking
static functions (that weren't inlined or DCE'd) with kprobes difficult.

LLVM has yet another name mangling scheme used by thin LTO.

Combine handling of the various schemes by truncating after the first
'.'.  Strip off these suffixes so that we can continue to hook such
static functions.  Clang releases prior to clang-13 would use '$'
instead of '.'

Link: https://reviews.llvm.org/rGc6e5c4654bd5045fe22a1a52779e48e2038a404c
Reported-by: KE.LI(Lieke) <like1@oppo.com>
Suggested-by: Fangrui Song <maskray@google.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
Suggested-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v4 -> v5:
* Absorb Padmanabha Srinivasaiah's patch from
  https://lore.kernel.org/lkml/20210814124224.8551-1-treasure4paddy@gmail.com/.
* Add Padmanabha's Suggested-by tag.
* Rewrite the patch to truncate after first '.', as per Sami's comment
  from
  https://lore.kernel.org/lkml/CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com/.
* Add Sami's Suggested-by tag.
* Verify that the '$' delimiter only appears for
  thin LTO + CFI + clang <= 12, use __clang_minor__ to check.
* Update comments as per Nathan + Fangrui, add their Suggested-by tags.
* While Nathan + Fangrui did review v4, v5 is too different IMO to carry
  those tags forward.

Changes v3 -> v4:
* Convert this function to use IS_ENABLED rather than provide multiple
  definitions based on preprocessor checks.
* Add Nathan's suggested-by.

Changes v2 -> v3:
* Un-nest preprocessor checks, as per Nathan.

Changes v1 -> v2:
* Both mangling schemes can occur for thinLTO + CFI, this new scheme can
  also occur for thinLTO without CFI. Split cleanup_symbol_name() into
  two function calls.
* Drop KE.LI's tested by tag.
* Do not carry Fangrui's Reviewed by tag.
* Drop the inline keyword; it is meaningless.

 kernel/kallsyms.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 0ba87982d017..3e4766204b07 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -164,26 +164,45 @@ static unsigned long kallsyms_sym_address(int idx)
 	return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
 }
 
-#if defined(CONFIG_CFI_CLANG) && defined(CONFIG_LTO_CLANG_THIN)
-/*
- * LLVM appends a hash to static function names when ThinLTO and CFI are
- * both enabled, i.e. foo() becomes foo$707af9a22804d33c81801f27dcfe489b.
- * This causes confusion and potentially breaks user space tools, so we
- * strip the suffix from expanded symbol names.
- */
-static inline bool cleanup_symbol_name(char *s)
+static bool cleanup_symbol_name(char *s)
 {
 	char *res;
 
+	if (!IS_ENABLED(CONFIG_LTO_CLANG))
+		return false;
+
+	/*
+	 * LLVM appends various suffixes for local functions and variables that must
+	 * be promoted to global scope as part of LTO.  This can break hooking of
+	 * static functions with kprobes. '.' is not a valid character in an
+	 * identifier in C. Suffixes observed:
+	 * - foo.llvm.[0-9a-f]+
+	 * - foo.[0-9a-f]+
+	 * - foo.[0-9a-f]+.cfi_jt
+	 */
+	res = strchr(s, '.');
+	if (res) {
+		*res = '\0';
+		return true;
+	}
+
+	if (!IS_ENABLED(CONFIG_CFI_CLANG) || !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
+	    __clang_major__ >= 13)
+		return false;
+
+	/*
+	 * Prior to LLVM 13, the following suffixes were observed when thinLTO
+	 * and CFI are both enabled:
+	 * - foo$[0-9]+
+	 */
 	res = strrchr(s, '$');
-	if (res)
+	if (res) {
 		*res = '\0';
+		return true;
+	}
 
-	return res != NULL;
+	return false;
 }
-#else
-static inline bool cleanup_symbol_name(char *s) { return false; }
-#endif
 
 /* Lookup the address for this symbol. Returns 0 if not found. */
 unsigned long kallsyms_lookup_name(const char *name)

base-commit: 4de593fb965fc2bd11a0b767e0c65ff43540a6e4
-- 
2.33.0.800.g4c38ced690-goog

