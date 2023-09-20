Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AF193
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 00:17:32 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59bf252a83aso65131487b3.3
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 17:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695169052; x=1695773852; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tT8RTtiIvMH0jr3h5GfFxiVuJzDdiA1NvVC8sxpn06Q=;
        b=cJJf747a6IYPELX2aW2N7cUmd/hdnYOp+DYYS+Y9WeNw364YEZW1fGXPwHwAc79MnV
         ggyuQYUJT47VNdyxoXNbrRmWUaemOr9KN6TM00VZQ48OxKDPBBMxo3ZdFbZUltGsZmmB
         ziYBWQb1SGpsAEskLfx0Op4+KoxQfH835YkV9UbKFmDvxhvX9W51Ha9jATg/Hhw7jGrn
         FSiiUXwxlpNqkWQ+TfMk7sqkNCItFfqXtmNgBCfCTJPnMi4r17ktdjzuh3EsD5xRQXbZ
         STp3uHJTD4IJqaKA9U3z3g0aV57ZdRuihYodq7XUdicLpetNRqeJtDFVLF+uoRvFU5wl
         rrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695169052; x=1695773852;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT8RTtiIvMH0jr3h5GfFxiVuJzDdiA1NvVC8sxpn06Q=;
        b=wH0JeGUVD3qBeOEpn6VhybaObN/FXN8n0XQy5ns4xxpAFXy5AqDScUZWnhZpSi7aBl
         TQG+fa3nWnWProprgxbf1AMNGSBtC6NxnjMa2virzQimlUqf3BiyZfU2lRRXVKJJPWXP
         vnY5C1Jb0+8erJ7WfKbFxsBUqcGYV19wd5WUf8L+0tCVbwDZ/FBGFUhOL1AqfY++K7Ag
         BexGwv5vafg3BPGkTHlOEqWZZAKFjJWjJlda18SenHiNGnZVFK3/LkTv02JwUI0oqfVn
         9rLXTwD98Jz0B0pzCTPHX5go8ojS2Cxajl4og04SD4vomXasXkh5nXCpuiyvdYpETSRV
         0dJA==
X-Gm-Message-State: AOJu0YxrP7fRBmOQ2q7S7dZDWl0Wo6Y7Y8neGeAjAhpGA64WhLrHfTZp
	zQOSwjSf2IQKDnuRBDq3Z1q6oTnVJBJK
X-Google-Smtp-Source: AGHT+IHXYkvHxsnm+XtyucMHmTP6WHJAmizuj0WQQpgTjADkwA/bJi/QLtEi5t/MKjFM1E/F7Det8is3uPc/
X-Received: from maskray.svl.corp.google.com ([2620:15c:2d3:205:57db:b73a:fd87:4f18])
 (user=maskray job=sendgmr) by 2002:a81:b1c8:0:b0:58c:7cb1:10f with SMTP id
 p191-20020a81b1c8000000b0058c7cb1010fmr15525ywh.9.1695169051817; Tue, 19 Sep
 2023 17:17:31 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:17:28 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <20230920001728.1439947-1-maskray@google.com>
Subject: [PATCH] x86/speculation, objtool: Use absolute relocations for annotations
From: Fangrui Song <maskray@google.com>
To: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

.discard.retpoline_safe sections do not have the SHF_ALLOC flag.  These
sections referencing text sections' STT_SECTION symbols with PC-relative
relocations like R_386_PC32 [0] is conceptually not suitable.  Newer
LLD will report warnings for REL relocations even for relocatable links
[1].

    ld.lld: warning: vmlinux.a(drivers/i2c/busses/i2c-i801.o):(.discard.retpoline_safe+0x120): has non-ABS relocation R_386_PC32 against symbol ''

Switch to absolute relocations instead, which indicate link-time
addresses.  In a relocatable link, these addresses are also output
section offsets, used by checks in tools/objtool/check.c.  When linking
vmlinux, these .discard.* sections will be discarded, therefore it is
not a problem that R_X86_64_32 cannot represent a kernel address.

Alternatively, we could set the SHF_ALLOC flag for .discard.* sections,
but I think non-SHF_ALLOC for sections to be discarded makes more sense.

Note: if we decide to never support REL architectures (e.g. arm, i386),
we can utilize R_*_NONE relocations (.reloc ., BFD_RELOC_NONE, sym),
making .discard.* sections zero-sized.  That said, the section content
waste is 4 bytes per entry, much smaller than sizeof(Elf{32,64}_Rel).

[0] commit 1c0c1faf5692 ("objtool: Use relative pointers for annotations")

Link: https://github.com/ClangBuiltLinux/linux/issues/1937 [1]
Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/x86/include/asm/alternative.h   |  4 ++--
 arch/x86/include/asm/nospec-branch.h |  4 ++--
 include/linux/objtool.h              | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 9c4da699e11a..65f79092c9d9 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -58,7 +58,7 @@
 #define ANNOTATE_IGNORE_ALTERNATIVE				\
 	"999:\n\t"						\
 	".pushsection .discard.ignore_alts\n\t"			\
-	".long 999b - .\n\t"					\
+	".long 999b\n\t"					\
 	".popsection\n\t"
 
 /*
@@ -352,7 +352,7 @@ static inline int alternatives_text_reserved(void *start, void *end)
 .macro ANNOTATE_IGNORE_ALTERNATIVE
 	.Lannotate_\@:
 	.pushsection .discard.ignore_alts
-	.long .Lannotate_\@ - .
+	.long .Lannotate_\@
 	.popsection
 .endm
 
diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
index c55cc243592e..4952b73d944e 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -196,7 +196,7 @@
 .macro ANNOTATE_RETPOLINE_SAFE
 .Lhere_\@:
 	.pushsection .discard.retpoline_safe
-	.long .Lhere_\@ - .
+	.long .Lhere_\@
 	.popsection
 .endm
 
@@ -334,7 +334,7 @@
 #define ANNOTATE_RETPOLINE_SAFE					\
 	"999:\n\t"						\
 	".pushsection .discard.retpoline_safe\n\t"		\
-	".long 999b - .\n\t"					\
+	".long 999b\n\t"					\
 	".popsection\n\t"
 
 typedef u8 retpoline_thunk_t[RETPOLINE_THUNK_SIZE];
diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 03f82c2c2ebf..6f6da95fe7f9 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -48,13 +48,13 @@
 #define ANNOTATE_NOENDBR					\
 	"986: \n\t"						\
 	".pushsection .discard.noendbr\n\t"			\
-	".long 986b - .\n\t"					\
+	".long 986b\n\t"					\
 	".popsection\n\t"
 
 #define ASM_REACHABLE							\
 	"998:\n\t"							\
 	".pushsection .discard.reachable\n\t"				\
-	".long 998b - .\n\t"						\
+	".long 998b\n\t"						\
 	".popsection\n\t"
 
 #else /* __ASSEMBLY__ */
@@ -66,7 +66,7 @@
 #define ANNOTATE_INTRA_FUNCTION_CALL				\
 	999:							\
 	.pushsection .discard.intra_function_calls;		\
-	.long 999b - .;						\
+	.long 999b;						\
 	.popsection;
 
 /*
@@ -118,7 +118,7 @@
 .macro ANNOTATE_NOENDBR
 .Lhere_\@:
 	.pushsection .discard.noendbr
-	.long	.Lhere_\@ - .
+	.long	.Lhere_\@
 	.popsection
 .endm
 
@@ -141,7 +141,7 @@
 .macro REACHABLE
 .Lhere_\@:
 	.pushsection .discard.reachable
-	.long	.Lhere_\@ - .
+	.long	.Lhere_\@
 	.popsection
 .endm
 
-- 
2.42.0.459.ge4e396fd5e-goog

