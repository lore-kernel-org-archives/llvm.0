Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207B3FCC
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 16:29:42 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id n1-20020a05622a11c100b002a749aace38so1203627qtk.4
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+vV3ucd+Bx0akx2LdRWzBXCnCYRKpCfCiCi/OQpYgC8=;
        b=qVuDYfUt9m1HYHDlRY7p7MEZDA5wQNDLbnTxlv2pGHWTig4cHoDD2dfpSjJH47vI88
         E3hrTrhLbDrxLVNDmlc5UulVM+RKznuc/3H4wHnNAXSz2SLg+Nw8leRt20tO5v/65XcB
         O3RE2bv/JEua8XSJR0JhJAqHlp4K7jNerFFkdyawCr8CvloO3deJbzXRLMgGnKG14oEd
         7E8j4ojUS3qK7i6rUczb8opu/0KbjWe79j7AwQRtNXj5OeFEqayd0D2LH3wAc+tYMBEj
         GS40HkLSeJ+l/1WdWfVxCXhU5wGj3jvko3q5Dxnl9rybnD5KOjQmQ0ytdHx250DqYInJ
         CYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+vV3ucd+Bx0akx2LdRWzBXCnCYRKpCfCiCi/OQpYgC8=;
        b=DxfnJuUKo0InzTruU5ncRvEh0fiF+BkzI5bL0//dZFz19ISumb5Sohge8XPtjkpNr1
         KO1QBUMQmipJXzlKx9r69XMQpxvcS2jR7hIaZHkypvp/+mjb1w4H4pqqAwiRyRIFp5Xe
         /6rZcZFfNap5uXXbRKtpFUh+N2A8b09AHxoN3hBIo2yqKgcwgz4gTOPAqzVfEgl4+J51
         aigVQFr4BGkWgj0AWfVgk8X4mfH7kYX2cL+60jNjnuw8p06blytKsp+GimreAjCwvP9z
         0InEUejN4faq6Xky0Dzf7tFVnwqUfRmDQw0r7j17Rl3e410CJch0X+UVH7YOTjCqcFhb
         +Deg==
X-Gm-Message-State: AOAM5333zg04ohdD6TlZP0XKUdpYQWxt2X98L8+Gv8b8l4VI7BRiFEud
	PxWVn0nVOxwJoyUxMkwb9bah8aXVo7ygXSQ1b5g=
X-Google-Smtp-Source: ABdhPJwh87utGAnjXgFD2YWwrzYiagURxcE463NsPCOi8s43yOm4oWkOt+2ZfkgJO8cvyocwR1IIGPhvrD35n/ffDag=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:618e:aa53:de64:4411])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:4664:: with SMTP id
 z4mr22837649qvv.16.1633364980909; Mon, 04 Oct 2021 09:29:40 -0700 (PDT)
Date: Mon,  4 Oct 2021 09:29:33 -0700
In-Reply-To: <202110020501.RKX4zca7-lkp@intel.com>
Message-Id: <20211004162936.21961-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202110020501.RKX4zca7-lkp@intel.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v6] kallsyms: strip LTO suffixes from static functions
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "KE . LI" <like1@oppo.com>, 
	Nathan Chancellor <nathan@kernel.org>, Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Fangrui Song <maskray@google.com>, 
	Jessica Yu <jeyu@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Joe Perches <joe@perches.com>, 
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
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
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
Suggested-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v5 -> v6:
* Replace __clang_major__ with CONFIG_CLANG_VERSION. The former is not
  defined for CC=gcc while the latter is.
* Reflow comment that wasn't wrapper properly. gq in vim behaves
  differently based on whether tabstop=8 was set.
* Pick up Sami's RB tag.

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

 kernel/kallsyms.c | 46 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 0ba87982d017..3011bc33a5ba 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -164,26 +164,46 @@ static unsigned long kallsyms_sym_address(int idx)
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
+	 * LLVM appends various suffixes for local functions and variables that
+	 * must be promoted to global scope as part of LTO.  This can break
+	 * hooking of static functions with kprobes. '.' is not a valid
+	 * character in an identifier in C. Suffixes observed:
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
+	if (!IS_ENABLED(CONFIG_CFI_CLANG) ||
+	    !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
+	    CONFIG_CLANG_VERSION >= 130000)
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

