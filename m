Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF3610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:55:52 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-345482ec6adso101075257b3.18
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 14:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=XmniUTEr3IsWekZR2qFDZKEfj9hJcfqgCneNiF7ztZE=;
        b=WCxXiMf9jt0TJXqJVxEGpO5FIe1m1i3ZGCw5CoV/rJ85nw+sR7A+6ka1r8pSYvcykj
         fdhPJfWapSH0tUHrJ7JwfesE8ueKIfcYHTxrBbgThkGTRj8VuUmZhwmCQ3RzlNEM2ecD
         z8ix+vkJAFymmihF+AY2LlKW9zCy2OxSuz73nD3s3LFpsgclOFOYtOtx3tG5ZwDIz+bP
         A+khvfFMbTOSY81mGX3NqvYc+QXhfp46q/BRrc+yAFDotGxiveN3rjh0XY2tB1HOxaXY
         FYx8Y77WPZ5fIYqlsyAut8OvfzqgiV3dRvDT5sKW7C/HCJM6xuapQF9Yzw/zFOz0vgK0
         uWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=XmniUTEr3IsWekZR2qFDZKEfj9hJcfqgCneNiF7ztZE=;
        b=IW1012RjPRpixnYiThhih9RhpMbf9LIC2tfc7cTgjQtdnNqzfWA1VXmNKdVGVyvaJp
         1hm4fD3t9VQfaOS4k9ocgVEUJ+1lOksIyX2fQZP15maleBxBIX2J3AKf+XMEDTYb8kk6
         QvkGt1Z42vp6sa4LSwSX2IiyjVnvM0IxrkKtKVBb/oP6xUTP8Pkv/mw2nWtFRJl18ZgH
         Hqh2jhGGbjpwnG38LlRLOpJDTP85zCdfSEGXESnSZQ8NZB7OhNtsRSDyEOykXqabE7hd
         YpAwXXCk3chw9SH+5P0KZbRVWIIYPk4BVA8+BxD78cJbw2DV9ggpc4Cyg1ASLf9XGmgM
         Pb7A==
X-Gm-Message-State: ACgBeo2QLfhKTHKW7oRpSGl6vbUtGyfGFPZUrXZ6zSk2woI0BqMdVE7a
	+FadufYkGf8ziiVT9tMMaYzi2hWK2lmkA8/15Sk=
X-Google-Smtp-Source: AA6agR6M76LG+TWjK8L+F7Pickv1R6NBQMbIyPbnehQFyZI7o5/G4d6MfhU8IvsMdeYW6PT4y2h9Gv6HjQVCTyH+TGA=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:a4e4:e6ec:9fdd:1bdd])
 (user=samitolvanen job=sendgmr) by 2002:a81:8a81:0:b0:33d:829f:644d with SMTP
 id a123-20020a818a81000000b0033d829f644dmr9392736ywg.439.1662674151325; Thu,
 08 Sep 2022 14:55:51 -0700 (PDT)
Date: Thu,  8 Sep 2022 14:54:59 -0700
In-Reply-To: <20220908215504.3686827-1-samitolvanen@google.com>
Message-Id: <20220908215504.3686827-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220908215504.3686827-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889; i=samitolvanen@google.com;
 h=from:subject; bh=NWDsac0IgzNSFTJgx7iH+qos7yriFkDjm7ciN3deLwc=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjGmS2QtXco+6cnttk3ziU1CPssT9FS0Gu8RLffJMX
 DuiPTDqJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYxpktgAKCRBMtfaEi7xW7laHC/
 kBCEQg3rEEpwp43GQ48GjqbCieliDghyyZPPBekjsBnBNrdnG8Vm9GOSBSH6jHBKRoAaPBYbHnmBxJ
 hbAnIoe8iH/1aMV4X2XS0DnwRarAgGvwIT41btmUEvxO+gDCKbg/1aKwS3k77DRva2rgu6fxSqbY2s
 OprIgnrE7+GivPv5e0Mmvr0Hm9YIpYVHRLl+3eLqWZGc9nzlWEmVmnZkVM+RbbwCUfzbxeQ1BY3ykL
 ZvfY5iLCkg0vVolw3s6qlVYn2LwCoGvB66ee8Z5DiX8ZyGfNaPypyV/1qr5xvpAfJroafshKOsowU5
 +v/x6ze8NdAuOZ+7YdikfQwEELuZ9XXt63bCQ+UD/J8pjGQ8KBUSaXQLOKPmBga5+06qVi4a+PEfeq
 M84OhWdJiTRngnFB9fEWgGdP8L+iNYPNVB/x/IwOzi7A2pgIj0eJgShn2uIHPaPynu8nokZaaRX8EM
 Lm6ye3lWt59SFbyI0JEQFniLfVDG47lRJQZrTQ4ptFSUs=
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Subject: [PATCH v5 17/22] objtool: Disable CFI warnings
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

The __cfi_ preambles contain a mov instruction that embeds the KCFI
type identifier in the following format:

  ; type preamble
  __cfi_function:
    mov <id>, %eax
  function:
    ...

While the preamble symbols are STT_FUNC and contain valid
instructions, they are never executed and always fall through. Skip
the warning for them.

.kcfi_traps sections point to CFI traps in text sections. Also skip
the warning about them referencing !ENDBR instructions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e55fdf952a3a..48e18737a2d1 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3316,6 +3316,10 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 		next_insn = next_insn_to_validate(file, insn);
 
 		if (func && insn->func && func != insn->func->pfunc) {
+			/* Ignore KCFI type preambles, which always fall through */
+			if (!strncmp(func->name, "__cfi_", 6))
+				return 0;
+
 			WARN("%s() falls through to next function %s()",
 			     func->name, insn->func->name);
 			return 1;
@@ -4113,7 +4117,8 @@ static int validate_ibt(struct objtool_file *file)
 		    !strcmp(sec->name, "__bug_table")			||
 		    !strcmp(sec->name, "__ex_table")			||
 		    !strcmp(sec->name, "__jump_table")			||
-		    !strcmp(sec->name, "__mcount_loc"))
+		    !strcmp(sec->name, "__mcount_loc")			||
+		    !strcmp(sec->name, ".kcfi_traps"))
 			continue;
 
 		list_for_each_entry(reloc, &sec->reloc->reloc_list, list)
-- 
2.37.2.789.g6183377224-goog

