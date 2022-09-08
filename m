Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B80610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:55:48 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3328a211611so154253637b3.5
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=usXbLw1pM2KvyZoDBuKyHSuX2iW4zvZIVdDHW6Ts0ZY=;
        b=AE4JUukv8f9Zob1CSZjp3nG8WCaj3ktDo/dMYs0duivx37HcX6QQwPd62gAfqdbaOp
         ptanisTDbgqESxDW0iDctlddt1gBINtCfgVxMm3AorZg6MHImPBAGieJc7i1uOt7Ic5u
         e2EnKCy0bJiG/q+SSXxzDIswsm+9j3fTQhgLDvainjBzLtGVH7pqzyDI0rCIir4aTOlL
         JL7f8C8gUvah7VB+5UzO6n5ibwm2KLG8F9D2rMwm84+DU46EsQ4CHToWmPNIYB8qnjfA
         S7aP3kqsWt0J/j/dl6au199648A6c81VVr0lt1CkqxXM+61lSRu/wnEGVe/8d4zJGZMe
         2+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=usXbLw1pM2KvyZoDBuKyHSuX2iW4zvZIVdDHW6Ts0ZY=;
        b=73WMfxdneItyeunyoRiaTkBIVro40TJaKUbEABN0b7HzIq6BcYLI/0uGmPLVkDFubU
         4kpJ/q+OQqlANWek/v9x4EFG+jN3RmA6pObu8D8dKavI0aazEhU87fB1OBpIODFuRzoh
         fhHdnLxhEQa60ISzxHfH2sF9vJFVzPsdwgwJKWkocnUWFAWSIZOi2wsRvzthjEdstoss
         gd8RdnNd/npNaZOhtUwtBGpOOG/eh8WzlBrLcIC3zead/v7/4FZwm/0NkVKN4+3LbBPO
         eV/1pZG/yIQRHtAf4xDkfenLsFeS4pT39j/HKm58/MAsyrYGlAM0MOXuLEEO+kViveAL
         PSCw==
X-Gm-Message-State: ACgBeo3QS3NuhFRwHKyWBX58a5QeIsSUC2+Ta4BMIXiRYliI1SFE3DTD
	Gu/ccjJQq+GqXpw47ZQzakIWHkcwiSXbk+Ds/QE=
X-Google-Smtp-Source: AA6agR5WT7zakLIVotfkCP+Ltu8T016sdQ/qMO5CU/j3xR9ORhLtwu6lkBY4eBv6Q8pR6ikFX1Dtzbh+lC7Opjk3qVA=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:a4e4:e6ec:9fdd:1bdd])
 (user=samitolvanen job=sendgmr) by 2002:a81:6f43:0:b0:335:9e7e:ad25 with SMTP
 id k64-20020a816f43000000b003359e7ead25mr9472870ywc.518.1662674148732; Thu,
 08 Sep 2022 14:55:48 -0700 (PDT)
Date: Thu,  8 Sep 2022 14:54:58 -0700
In-Reply-To: <20220908215504.3686827-1-samitolvanen@google.com>
Message-Id: <20220908215504.3686827-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220908215504.3686827-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445; i=samitolvanen@google.com;
 h=from:subject; bh=OojUc6gvhYO7/nvSgMu6gZvuX/wXQ7p5p2ix4YG74Ww=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjGmS18ATy8CgQuYAQJpe1UeWUw98XLd/V3+KW2F/u
 4Z+6kC2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYxpktQAKCRBMtfaEi7xW7lSuC/
 4sfH5L4f5/2SJ64jvWTm+1lc49S13k5MpSk0eZ/UEsUKzTgzzu4i3s7Q9UqdkRmWmqhbZylhnZgFbP
 GNleTbZK4sC/NyBAMN9DqIujnWeWRIghfmZSMzF1NWoHIa8Si19YuRXRTnnVfB/KWCwcAi5MDKfWQE
 eqwZCJKcO9hjR3Pnxe25vrAj54m6F3Q0bk1QY0bfYbfyMhC3XAW6WEGUJaI73A08owc1LxwtpRVj1N
 MYDySP7kr7EF6/9u1H8SjmdLJlLCins4r3I/1dbOPQ5eAMqCW4LV/SbIdF+yDRhRMOfV2VjFyfAbxr
 mdleL7w8DTTDlCbr+Klc/IenrmmnOOwDQDZwysQbJ7Ovt0tbfNphd/tAdItunYuMjg3U+GiGuWEG2j
 5M0n4Vyh7DU44YcziEwli2nYR/R/UUgv+RJpgz2QqW3Ld05ic5w8yjfU65prGhAypzJzeqx9BnOZg6
 hZR3WFUEeET3Wqby5DqrJb95y73h3aP44Ssz5htKs3W8Q=
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Subject: [PATCH v5 16/22] objtool: Preserve special st_shndx indexes in elf_update_symbol
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

elf_update_symbol fails to preserve the special st_shndx values
between [SHN_LORESERVE, SHN_HIRESERVE], which results in it
converting SHN_ABS entries into SHN_UNDEF, for example. Explicitly
check for the special indexes and ensure these symbols are not
marked undefined.

Fixes: ead165fa1042 ("objtool: Fix symbol creation")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/objtool/elf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index c25e957c1e52..7e24b09b1163 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -619,6 +619,11 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 	Elf64_Xword entsize = symtab->sh.sh_entsize;
 	int max_idx, idx = sym->idx;
 	Elf_Scn *s, *t = NULL;
+	bool is_special_shndx = sym->sym.st_shndx >= SHN_LORESERVE &&
+				sym->sym.st_shndx != SHN_XINDEX;
+
+	if (is_special_shndx)
+		shndx = sym->sym.st_shndx;
 
 	s = elf_getscn(elf->elf, symtab->idx);
 	if (!s) {
@@ -704,7 +709,7 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 	}
 
 	/* setup extended section index magic and write the symbol */
-	if (shndx >= SHN_UNDEF && shndx < SHN_LORESERVE) {
+	if ((shndx >= SHN_UNDEF && shndx < SHN_LORESERVE) || is_special_shndx) {
 		sym->sym.st_shndx = shndx;
 		if (!shndx_data)
 			shndx = 0;
-- 
2.37.2.789.g6183377224-goog

