Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA67C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 10-20020a250d0a000000b0065ca0e7be90so533188ybn.17
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Y96fv5Twtvzm6CyIpXWKw8Jd94PeG6V8wybz0+yAnX8=;
        b=IOPZc5JV3nT2LYllhUNSqQYadg1pAF7x0nJHGRfuoOldyA3IF4MfcUfi28kwW9bjK3
         ZkOn4EyemcOKcBZ4lvbRoM88zdr4pP/X6pNrmQS+Trrh16VsFWzR/ivvrnkgTFcOEBeq
         zh4c1XSjaFca/mNv67WEZZRQg6ZyEcv2WeJgQKjPKDJ+6inRCnLsR02LvK76lq7rrygX
         kc4b07GD1ORl1Vkg+OCQkeYlNtADbEXYf/V4ORhUII4xOAh9HLKlgJsAnnSOy3K+JaGt
         GLg2Vk1h8xnuWJsYbO4m9Twpc05icIIuVq5OYgfBIvRgF9MT/sXYCcHdZ4chr4Z9vQ5Q
         kXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Y96fv5Twtvzm6CyIpXWKw8Jd94PeG6V8wybz0+yAnX8=;
        b=C7GKL6S52coSia5H4b0lTiIbD07iykZZ4obLxBAGEuqBEKZHqSRet6UV1xE9pglSot
         TzH33/T/e1mmXk7fTkz/N7CBkKOe7eYLQtEVv9fepvuxBnsWQT+6kSW003IoWMtBooXW
         Ky1um8r9m1+SCyevUqSPhQgX44m5XrauM3SlbvCAQqqSrrhOPomCep5QyY/jd8e+SIcP
         WzcOF+L1RHX9wmI8aOCoycfOA5yqOSpzunKSAN4SbyvPqPrNt8qQZ46stJBAtzlAMtrf
         s+ux68LFG3dWtGeUlDcWj+SuVsbnx7HORNvqZk0/TNdZ3wl0p1CObWVzbPwPRR2LxWvm
         DuBw==
X-Gm-Message-State: AOAM531SqsxVKaRJ926mnC+e7ro7MNEHdVVCs/ZQc7z6jaP+zMq/CQzg
	KKvvuJ/pMwpK7AT7KkFi65pS44WNQes+jRRmPfA=
X-Google-Smtp-Source: ABdhPJy9bfekC1t933fOPbzFYENcQN+eqW+7EGnrnrzBGcNrDj6mBwpdrX+ZIvaajj0sxXWUKj9zyhS/v8ScejPId0A=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a25:7901:0:b0:64a:a1d9:43dd with SMTP
 id u1-20020a257901000000b0064aa1d943ddmr45895436ybc.271.1654904151760; Fri,
 10 Jun 2022 16:35:51 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:35:08 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; h=from:subject;
 bh=BzYyCCjIKMVIFOaxytMd//v1RLhPm9T7iP3/4Zx5xVM=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9Uusl/O2s6wYiJP/kbTa1chVv26D4F+cGeoouVP
 CLXe2fiJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLgAKCRBMtfaEi7xW7p5VC/
 9Ik3mkvkfwpcvMaILAG8ecfZFaAeyupedPFpv7JfK5CDJfRdYJy6I8IwkF6zyaPwEpszbFtzIngJp1
 9VLVbi4oBQefo3DpNAVs92FiUcWdUCTKkV7FZtf1KHmTbcXiDaSei1A+sMXqlbWgwS5aukcZ5H+NRj
 ez76Hc3KoZRoN4iKlxLcKRNHKXpC6fe9Zie7IPO1sMkA1OXATSdGQfVw+6gv4q0+ae1ZMD/7994o7H
 svydE+m5htCfP8PK65SJBa8zHBM6ew01HQ1rYygo/X2Sc5yi/4w8Z/ysL3lacG7Jweqr21P7GnS2fR
 EkYD/xUbl9UA4W+IlBSY9HuJiSpiS1MbhICEI2OvNo0BakVlcF8T6rhqcGPF8IKLB7N5SjJnFWHOtd
 5iRHPAaDebe6mi//sYNB0DF52K4EuYa7vPMeX54NUVHcDgamHQlZhqAna7cOgDvpSiS34oTlsond2r
 LOwD6icdz2QqTZkK/eZRy2JwR3ZYdCMaJ91x+ll6SUcLM=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 15/20] objtool: Disable CFI warnings
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

The __cfi_ preambles contain int3 padding and a mov instruction that
embeds the KCFI type identifier in the following format:

  ; type preamble
  __cfi_function:
    int3
    int3
    mov <id>, %eax
    int3
    int3
  function:
    ...

While the preamble symbols are STT_FUNC and contain valid
instructions, they are never executed and always fall through. Skip
the warning for them.

.kcfi_traps sections point to CFI traps in text sections. Also skip
the warning about them referencing !ENDBR instructions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/objtool/check.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 864bb9dd3584..337b92c3b755 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3207,6 +3207,10 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 		next_insn = next_insn_to_validate(file, insn);
 
 		if (func && insn->func && func != insn->func->pfunc) {
+			/* Ignore KCFI type preambles, which always fall through */
+			if (!strncmp(func->name, "__cfi_", 6))
+				return 0;
+
 			WARN("%s() falls through to next function %s()",
 			     func->name, insn->func->name);
 			return 1;
@@ -3827,7 +3831,8 @@ static int validate_ibt(struct objtool_file *file)
 		    !strcmp(sec->name, "__ex_table")			||
 		    !strcmp(sec->name, "__jump_table")			||
 		    !strcmp(sec->name, "__mcount_loc")			||
-		    !strcmp(sec->name, "__tracepoints"))
+		    !strcmp(sec->name, "__tracepoints")			||
+		    !strcmp(sec->name, ".kcfi_traps"))
 			continue;
 
 		list_for_each_entry(reloc, &sec->reloc->reloc_list, list)
-- 
2.36.1.476.g0c4daa206d-goog

