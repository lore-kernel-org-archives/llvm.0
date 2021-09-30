Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B472
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:06:04 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id ez4-20020ad45904000000b0038277ac82beso11489803qvb.4
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6Sx35dcc+ZTMADfJZWhUXml0PH3ooMBccB8Q+X9WArY=;
        b=pk5WOqOatQc/RJ42WoGinJC4/twjfgeWj1OXnhRiKHOSyA+pezAiWCoNBnz9Fj+AjS
         aOIDIpm1iy+TcjZpq5DTIf5dzaYDjtKWxePGXlKJa1s8UPeIkYjw0jRVH3Fo7J0/v0qa
         Y2+1NlkQ7MA9G1a8IAApp1+pO7VRGdMokUvCl+6ZqMyyCl/dV0LjnCsymGj+FNDQdi2n
         3daBKXh9Aoyuacg/VlU0MSjADI1JKmnKQdrM641Bl1X+yQD52QCGprXK4zzCdYcdsyEE
         oGzZH6nn/kGwgiv5PC/yBBtgiJkSbK5MH/dRMdPRgoeoO/0StI8Cr8IDhLNSg1Y1Z3L3
         Bzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6Sx35dcc+ZTMADfJZWhUXml0PH3ooMBccB8Q+X9WArY=;
        b=moji5KgDzZJCJWFF461RR4apjZaEgni5QEP5rmf6RblnsUkR/H4hyLJ18d2F+6foeg
         OqayT3wXmp5kOt2iAOrby59CJndIsv1FEjE7KRgjLQFF8meNyCraXm0nJ6QEpXVkXdYw
         KmKDpDaKr+aTsloyjGyF1DYBD7+NYQBiI3OxiQPdFNOMBts2bo6lsJRQ3kl6ina96HRu
         C9hP6NKIj5bBOfTAJxQdCIcOAW3nFmfgf76h8/4/SFk0d7nJcl2JrUGDjHQBSkQwekOP
         laZeZM7cnPoD6RNcYTM3b6iVp7prp0G630FYcFkNs/PkvB/p6vbxf82Z64fE+G1Lml3A
         2cew==
X-Gm-Message-State: AOAM530IsdjFm6wKCQDkRu3WGmGzjGGRc0Y+5jUDMoEoAfje4gCgUiTB
	JfMZuNnMjY2Wc1JJ9kJkEDbPVE8Ng6N5j0b4Vzk=
X-Google-Smtp-Source: ABdhPJw0mNH+hlrHNL741Ke8vSbHmQVJvJ7uLoZQ3qKxdZHJuHeykLu/G/qfGGTqGEDZGgeR0jdbNGhA10M2iltx9l4=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:ad4:408f:: with SMTP id
 l15mr4167941qvp.60.1633025163728; Thu, 30 Sep 2021 11:06:03 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:28 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 12/15] x86, module: Ignore __typeid__ relocations
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Ignore the __typeid__ relocations generated with CONFIG_CFI_CLANG
when loading modules.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
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
2.33.0.800.g4c38ced690-goog

