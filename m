Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF5610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:55:54 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id g63-20020a636b42000000b004305794e112so9880284pgc.20
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 14:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=vm5veKXR+O2rRgDax5LpSkLTaTy6Og98Noar0uvmDBg=;
        b=ZH4pBF7GcHnWh2rdS1M78dhaZ11K8L+Sgzed6KJoRLi3j8jXB817lSxBYasnKxh35l
         ZgnZlL9KZKdVv/EEmU4Tr+fZQkPdIzGmxpc5X5xhaFXzDlmMeZThq26jacwbWTgmbIt+
         mEOWKEGQf60wrEwM3JZDw9Jzp39hksE1mVbxmtBIAb5U04hNo0rDQzSQy3qp0ANVY3Nx
         mKwCjtrn4M5SR6N3Ntr0p4SQUb7v7l9CLXjBfW3uSHAXgNiORV7YYLQU3pmYbuhWBylE
         YBOxayLfIlv8bl+W/GJkrVOltIx+Nqz+DUXVpTpgY3U82wYjYp/kQseaYZQPRushhMm5
         TAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=vm5veKXR+O2rRgDax5LpSkLTaTy6Og98Noar0uvmDBg=;
        b=jSsLWL5oHES3CHs/o1A4Ut4fpMyg2wTkfE9c3NnhDwFfdkb6rFn2SQ6f2FRvN6FhbM
         8nPSZj+vJGLGKcLWwD7nPgDhZzR7nxGo2534lXNMPyKaikY2ld6OZbnxvtiHIr+KW/H+
         7gZQHAUkXvZZ7diJfrsGhuqf9qg/yKfxz8EbUkDtul+ClG8d92rSfWj906d+DQ0YECog
         9BmFUFFlkMnjJMf3zI+lLsjgGs+2jKAOQRHGH1F+9aZ7b8IPdeqhL/xvSZ6zjVdo8gr8
         cgh/RWO+g+xiSeF2EYcnu/Xq1hxAwXrHOb+L00QDjacKNCcxZb+TJ3ZTIBtUvADNCtGP
         5f+Q==
X-Gm-Message-State: ACgBeo08CqLrI6qzfFq6SgCTYT3i80WJTC0GnxOO/nzt0cXIV3Hw6fHb
	vuj7U3Yr2uCIM2qpK17X+74rcCm6Kj3o/2a0aSY=
X-Google-Smtp-Source: AA6agR5WnOKxTdr/25i3BNZh8IUmQ/bEKkkDvPQH35RzmIpWPpUdr+e8HDfZfjjiwD8/thKx3eVCYIJ3WfNg33P35jo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:a4e4:e6ec:9fdd:1bdd])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:1390:b0:540:b6b6:e978 with
 SMTP id t16-20020a056a00139000b00540b6b6e978mr3321390pfg.8.1662674154442;
 Thu, 08 Sep 2022 14:55:54 -0700 (PDT)
Date: Thu,  8 Sep 2022 14:55:00 -0700
In-Reply-To: <20220908215504.3686827-1-samitolvanen@google.com>
Message-Id: <20220908215504.3686827-19-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220908215504.3686827-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418; i=samitolvanen@google.com;
 h=from:subject; bh=9OoxBGSeValXYdhbTF14Jfw3MpaGMV549rycOq8LEaw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjGmS2qkSmjV+l0koJEkW3Ra86NWCQbdAoQUKsCsKu
 US5kAIeJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYxpktgAKCRBMtfaEi7xW7pPDDA
 Cn2pbnV5bcnzoGc8JddgQnV8D4DQRGk/vp6Uu/MGcpttE+hmRYXGnxPteqSuac3HNTSxdxiMaQbfi4
 tBYcvtA6mZVp5tIWr3/aPPuCXplinZdK/00vI41ck/OgxL6dJAJOalxRJzlbGGoQcXuHN2qEF0xHTr
 /m3yfieyINfDIDo4hlAU5NQcvyjTWGcpk1tkvYoRl3NFUC5Tcu91qUajnAkFemmoRTlvav6BDdgLve
 6I7D1tpAsuiRpM7MiIB9WdPztgJcnq3wGcE5+hlQyM3NNPYVKNJRkBwUyTGRzbOQ5MNHbAUE/uYTuZ
 UXkp9zyheMNGsyjM8WiRweAG84GbTPpJfv2qdX2QzOuq8OeMyHCx3/gNnAHfS3cz+ZwsyKBUTB95XM
 /xIO9SBobBIFVshdiOGryKwpvtyHrmgoTm36g2d0vRyq+zF59jNJhd4zf6kaJcYjXsGyh4SAyVxQtH
 4CwhKkIc22A/byAV/q1kus+z4aFPKT0NFo0RM2dCxr0y4=
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Subject: [PATCH v5 18/22] kallsyms: Drop CONFIG_CFI_CLANG workarounds
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

With -fsanitize=kcfi, the compiler no longer renames static
functions with CONFIG_CFI_CLANG + ThinLTO. Drop the code that cleans
up the ThinLTO hash from the function names.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 kernel/kallsyms.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 3e7e2c2ad2f7..b27e6ea31f8b 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -159,7 +159,6 @@ static bool cleanup_symbol_name(char *s)
 	 * character in an identifier in C. Suffixes observed:
 	 * - foo.llvm.[0-9a-f]+
 	 * - foo.[0-9a-f]+
-	 * - foo.[0-9a-f]+.cfi_jt
 	 */
 	res = strchr(s, '.');
 	if (res) {
@@ -167,22 +166,6 @@ static bool cleanup_symbol_name(char *s)
 		return true;
 	}
 
-	if (!IS_ENABLED(CONFIG_CFI_CLANG) ||
-	    !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
-	    CONFIG_CLANG_VERSION >= 130000)
-		return false;
-
-	/*
-	 * Prior to LLVM 13, the following suffixes were observed when thinLTO
-	 * and CFI are both enabled:
-	 * - foo$[0-9]+
-	 */
-	res = strrchr(s, '$');
-	if (res) {
-		*res = '\0';
-		return true;
-	}
-
 	return false;
 }
 
-- 
2.37.2.789.g6183377224-goog

