Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D772
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:30 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id x16-20020a25b910000000b005b6b7f2f91cso4157472ybj.1
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FUM1v4YB6XOXHq0iVVCQLmH4e/+1fH3L4oj9Aiz71+c=;
        b=cJ1RW4v4aCr+KHTpjNE9nFrgs4HfHet0ukJeIU7uGGP5p9ejwQrOEsliCMYF9FKBIs
         RciOUaBAZ9CtvoGSa2YuBuvl0bfAbmM0uLrYQVCivLHH1SzaoWyVsNGXEIiHk6hkogY1
         nXctVqDcoegt4qKvEegPTWrk28NhZ+lq2OskyVVPMK/ftAMV5VwkzrbIWFt+iQjEgyTe
         WvbZO+asrN6dpO49mQaalvWHsCWOmuTkYbcTbDmKaPlOltFN5SSfkIeQFrZDe5MazJc8
         32dULY5NTK5IykULt4XohX/ptg+q+LZ+8IRtXytJLex7ZVaGGinB9W6CbsD9sANzVpwN
         NOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FUM1v4YB6XOXHq0iVVCQLmH4e/+1fH3L4oj9Aiz71+c=;
        b=tUbIvgQ/UP7E0H/Bdmn6nWmsbRE7EUdia8EAOB6w1s/nO7TzX4v52JmiwNcHl0fOez
         ARi9WzfO27bz3eSi7vxRH8HB5w0G+QVprVRTl2ILTOuQq7bAZMR3yGGmAqawHlwJznKZ
         rYBSqE1afzVflRgfI1jULyfVIErxt8qps/qZ1PtwKiBgC/LUJppRCKK6YcB3QFsIbuYs
         SYZLgdMLX2cvsfooIBY1ePOB9rDHgETC4fR8mTYlA0xTj5hu9IKbaCEtk3zPDKl7BD0w
         qANHL4xetrWKaBwJ1NMytPDnA7B/vbd0ElkX9/85LjHTsIEqHIuTOXpbS5dUAjjZ/8kT
         elRQ==
X-Gm-Message-State: AOAM530TuFHfyEuaW8eCVCBVQICT3vwkMKlzWs6DYJBJ/jZ66QQ+rp7r
	5q+KL8wuHZBIeVA2NL/pUHx5YJMAd+Mry3U4TWk=
X-Google-Smtp-Source: ABdhPJzEaDja0J/kqrarjfqGPyMXP2WPI/KPS/LGkqwt9jFxz8/AAqr2O4bu1tJnuUjHgs+PlSzdMs9xiMmwlcVbC4Q=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:a25:5044:: with SMTP id
 e65mr914919ybb.57.1634149049705; Wed, 13 Oct 2021 11:17:29 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:55 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; h=from:subject;
 bh=dUwvm3Vd/5iEIjZYz+BmaUIzxp/ot2yfAHfQNEA+kUM=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKaIwdgCVuE1IB6wwvqmWNbh+vVqAlev/QJV73m
 c6jvmMGJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimgAKCRBMtfaEi7xW7msKC/
 9Bl6p6NCMyrV45qX2+L/0+XGMXCRfdOX68muhe1EoKDv1+fByHvxCtLgerfyCudZ7URTfLBME/ZnTD
 zl6u0n+N8gANWaDZleltiMEz1hQHPk0VlMZA+dmD+e8q9NFj8yTOX+gdEcDw0UiNmw8CNL6HUUSyG5
 b2gREsgfpxcD1AELTfurUXi96HkTeXXvl/eyWXucGMh87gHRkDMOkAz9QN823Gg6kfR0wGjDckyss8
 dXQrVqJ6XJuwRgr26EXZbLQBe7HJWHq+gXME4PqET7xqp02joqE0j96xPZq6wVHJxQDsHEMRF8RBBz
 /HQ0r3SEHdSxYW51OoKzO19aswKqAb2Pz9op1ZdSY+u/PFOTIK1fYcMtHT+EQoI6GIuZ9Q1ZK76KTc
 rebN6zRrpGYSyU0vcA8+SSkVOZBD3K33QrHj1tGQUhaHAuO4Y+YS8rwQuXyrXKTaq2uUCasy/JeuVM
 htEWYPcnOHQ00htlg7Rfdn9f4tQ1OQiJOevLNaVwDokLA=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 12/15] x86, module: Ignore __typeid__ relocations
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The R_X86_64_8 __typeid__* relocations are for constants the compiler
generates for indirect call type checking with CONFIG_CFI_CLANG. Ignore
them when loading modules.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 arch/x86/kernel/module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 5e9a34b5bd74..c4aeba237eef 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -197,6 +197,10 @@ static int __apply_relocate_add(Elf64_Shdr *sechdrs,
 			val -= (u64)loc;
 			write(loc, &val, 8);
 			break;
+		case R_X86_64_8:
+			if (!strncmp(strtab + sym->st_name, "__typeid__", 10))
+				break;
+			fallthrough;
 		default:
 			pr_err("%s: Unknown rela relocation: %llu\n",
 			       me->name, ELF64_R_TYPE(rel[i].r_info));
-- 
2.33.0.1079.g6e70778dc9-goog

