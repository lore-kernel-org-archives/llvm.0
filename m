Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535A4A3E
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:44:23 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-33dce8cae71so209595517b3.8
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=wE732wZm675iVXKD6yeBsDTR2gqwSJrBRBhO3wQb7iQ=;
        b=eShEMrNUlFCTE9aYVbAg0DgI0iTQu9WfmERbirOoR6oYYyP7ijLwfq/E0+J6ooYtcE
         hxeV/9DeC6BXMbXwjkhtDyt8TSgZSaPG4uWNHh1vS/Lm4jxju9dnHS4OACxqtaYPTOO1
         XV4aI25xVG9jdotAUGyN/q4M+4pIaTJ7EBgTNYEDPvwKJUKn+I04yZSNYaXo7PgWY8uU
         Neq26b8Ccc3YvSqH4Xn3np4CbJbmZ4dbr1gCWD29mDhWNarK2JjGE5RKGT+5YA2QY+MG
         aZKL8/MPstyqcl9bPEfhUfgACivj0gAhLIQlUXFH6yDEiSnetjzQWcAS4UebJrDqCNL5
         uhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=wE732wZm675iVXKD6yeBsDTR2gqwSJrBRBhO3wQb7iQ=;
        b=TGbKmOx6b6oYizwyNgcVUcX/Kn6F4gaydAUy/1rmyQ+ybeETlrTD6Qy+VWV0Vlmvz8
         Hu7YEvy3ZZlzV93Gp+1HzZ7JtlVzJTQz8/VykfdsdOpFOhbXOl2ATAIyEabhY6qSwGhq
         hJ2iNu+C4YSgaRVzaOdVR+OiUtEObhii3y8J+OEl1MUr4Bwdh1xFIpuZinWgYDFzvuP2
         otoVKwa/RWUwKtjacfpdeM3uU392ISUSMr9IBuRd514Zx8XVPZyQtAxX90qLC9+Wg+S1
         Jw9xpK4TszvQR5Gx1KR+97+RKYcy7rcG8tO49T6NKoLd8gOYeGb5yGOAbjyraRnb4BZ2
         bkJg==
X-Gm-Message-State: ACgBeo2xZ+jfpnwSi9irF1Db6jCTLxkXNyl8AWJhCjDUUGfzn2UFnbKM
	OFaK5InKibtUKaFXhjycYxKna2h1tW1F0eefilM=
X-Google-Smtp-Source: AA6agR4+Ebu40vcHAmRMaudQ83J0/q9XXte3H1wM0GkT9zrEW8Y29d4ev5N+HjYyH+Ir/SWkm0uyd9uQ2tSYFkmGf4o=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:d5c2:0:b0:337:5d95:8bcb with SMTP
 id x185-20020a0dd5c2000000b003375d958bcbmr19167887ywd.359.1661971462704; Wed,
 31 Aug 2022 11:44:22 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:44:07 -0700
In-Reply-To: <20220831184408.2778264-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971448; l=3120;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=NliQXprEuvO3t8z2w/GlA1aYI6D3EzX025tg2ksOCjQ=;
 b=u4wE/I7MNagG4I/nE2e5f0OfGZvDcBSQ12AuaA53Y2L7ge5X1x5R2F9kOpMQ2NHWcLdZ20mpNrM4
 +wycsrFcDvMkzcCjDBQ7pjAFIsqooWQNXvQdegA5VPqWXge0u9Kh
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-5-ndesaulniers@google.com>
Subject: [PATCH v2 4/5] Makefile.debug: re-enable debug info for .S files
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Alexey reported that the fraction of unknown filename instances in
kallsyms grew from ~0.3% to ~10% recently; Bill and Greg tracked it down
to assembler defined symbols, which regressed as a result of:

commit b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")

In that commit, I allude to restoring debug info for assembler defined
symbols in a follow up patch, but it seems I forgot to do so in

commit a66049e2cf0e ("Kbuild: make DWARF version a choice")

This patch does a few things:
1. Add -g to KBUILD_AFLAGS. This will instruct the compiler to instruct
   the assembler to emit debug info. But this can cause an issue for
   folks using a newer compiler but older assembler, because the
   implicit default DWARF version changed from v4 to v5 in gcc-11 and
   clang-14.
2. If the user is using CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT, use a
   version check to explicitly set -Wa,-gdwarf-<version> for the
   assembler. There's another problem with this; GAS only gained support
   for explicit DWARF versions 3-5 in the 2.36 GNU binutils release.
3. Wrap -Wa,-gdwarf-<version> in as-option call to test whether the
   assembler supports that explicit DWARF version.

Link: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
Fixes: b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
Reported-by: Alexey Alexandrov <aalexand@google.com>
Reported-by: Bill Wendling <morbo@google.com>
Reported-by: Greg Thelen <gthelen@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Use newly added compiler-specific macros, as per Bill.

 scripts/Makefile.debug | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..46e88f0ca998 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -4,18 +4,32 @@ ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
 else
 DEBUG_CFLAGS	+= -g
+KBUILD_AFLAGS	+= -g
 endif
 
-ifndef CONFIG_AS_IS_LLVM
-KBUILD_AFLAGS	+= -Wa,-gdwarf-2
+ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
+# gcc-11+, clang-14+
+ifeq ($(call cc-min-version, 110000, 140000),y)
+dwarf-version-y := 5
+else
+dwarf-version-y := 4
 endif
-
-ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
+else # !CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
 DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
 endif
 
+# Binutils 2.35+ (or clang) required for -gdwarf-{4|5}.
+# https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
+ifneq ($(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y)),)
+KBUILD_AFLAGS	+= -Wa,-gdwarf-$(dwarf-version-y)
+else
+ifndef CONFIG_AS_IS_LLVM
+KBUILD_AFLAGS	+= -Wa,-gdwarf-2
+endif
+endif
+
 ifdef CONFIG_DEBUG_INFO_REDUCED
 DEBUG_CFLAGS	+= -fno-var-tracking
 ifdef CONFIG_CC_IS_GCC
-- 
2.37.2.672.g94769d06f0-goog

