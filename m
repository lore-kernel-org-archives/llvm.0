Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0272
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:06:02 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id y25-20020ac87059000000b002a71d24c242so1505996qtm.0
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=36JGoOQwhp84OMbqBWPfqbJksyq4Ee1GRSA1czJSFhs=;
        b=cB77Vb/CwICfRwD2mkh0raoM//6noNAFP5BtwePcoVGM1nyAlCfVJtKF35wL1pMwev
         D2GqltNZ1bhq+hRH8UnFSweflcXsS95Ir8dZ3rY6OVAjnMt/R0W1UR6ctQPtg/gcIBa9
         y8KQaYC2G05aBR5jrnIWIZ3huUYLx77QQT5hlGs/UVeG0GqNpK2l8DTtd4cNHYI81Vw3
         zwyXCy6a/HqwSqBa9p+Vi89JXE5Vy18KuamIGkTDlZ/7kQWptK+0iRY5d9Fkqgkci/3a
         srPd+GRRzz57/fZCNOzWknSmGYqJ1fzF0HmWIqUaS3MZQa3RmMT3xGN54NzMRyKTJiRj
         eUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=36JGoOQwhp84OMbqBWPfqbJksyq4Ee1GRSA1czJSFhs=;
        b=TftNLF+cTBvH11Ia9go+/p1lwZIRsWtulTDfg4ZY3oZ2jmdoDmk7U9POKUyABtvXSy
         7/RuropkSXxRKzz0miPIFUyTOVJLK2DGtxaAJmpXfb1W6e0qSmOWLmT6QFaeBC7lMHtJ
         54TP3LW3vCEm4I5inzGjXXMAG0ikwEOEz2/X8Fz9Rk+gmuSwzpZxnthS8/y2M4PB1HMO
         DAIHxS22YoKM7kP5W8hnU9U/vUwcfEfA1igBxNrNfdXM8Nrf9dUF7kXDbZhhUawmISqH
         3GZk6novcrh/VmAMPmBVwZoMLAlI6Vj8kbh2J4tZn5rA7L8gvN2+zpqezpdYoRXEYfOI
         uSwA==
X-Gm-Message-State: AOAM533+h2QhLTC16v+BGYP/E3rz1jJT9iV70p6Q2EwEYEOY45EEgRyN
	PN/L+R54clAC1cpbTY9r/ZVc5pJ5UtUrZO9fqFY=
X-Google-Smtp-Source: ABdhPJzH+nWTE6A+qxvqzNs/xyKJE6Qfj8m4/ETPnnzMgQrPSxiF3nkVfaZaM0P8d+oy0XInEzgoA4qs0F4Eos30P9A=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:1022:: with SMTP id
 k2mr5344731qvr.53.1633025161554; Thu, 30 Sep 2021 11:06:01 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:27 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-12-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 11/15] x86, relocs: Ignore __typeid__ relocations
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Kees Cook <keescook@chromium.org>

The __typeid__* symbols aren't actually relocations, so they can be
ignored during relocation generation.

Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/tools/relocs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 27c82207d387..5304a6037924 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -51,6 +51,7 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
 	"VDSO|"
+	"__typeid__|"
 	"__crc_)",
 
 /*
@@ -811,6 +812,12 @@ static int do_reloc64(struct section *sec, Elf_Rel *rel, ElfW(Sym) *sym,
 			    symname);
 		break;
 
+	case R_X86_64_8:
+		if (!shn_abs || !is_reloc(S_ABS, symname))
+			die("Non-whitelisted %s relocation: %s\n",
+				rel_type(r_type), symname);
+		break;
+
 	case R_X86_64_32:
 	case R_X86_64_32S:
 	case R_X86_64_64:
-- 
2.33.0.800.g4c38ced690-goog

