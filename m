Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C8320A
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:44:15 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-33dd097f993so212224927b3.10
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=6le8oKuVgvil+VEktUjcgmMbP4uznetVRcbKqcwmc9g=;
        b=hOSBJ0dhMM/gcYrV4pHQaaLJizqGUf7PQqU9HmaLDYXQMBvqqV8eJtVT2xij1ey8fW
         xA18V4atnIwDoGam9xmx8sC/ETkDGJyKaYMZYOodeaXCVISFSeBXTag+sHDiVL5IEtjN
         baY8Wv7c3EYa3B1s2Dvd/wKmwFB2IXABSbOJcq3vBKYB+6EGYHPZ61tcveP91ULX47vj
         BOiD3cYEKzcI1t+aKx9dC3cDkyFy09WVOhFbOjdDg/QdShRYru0Ht0/nBSb6vmySyqon
         9QQvFO4hj1Bn976gID72FEHd78xT5FiynWo8dKXnH7T4P78M/PiMV0dAHUF4wQ34ndCY
         HzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=6le8oKuVgvil+VEktUjcgmMbP4uznetVRcbKqcwmc9g=;
        b=iMqDUwNITqcprXw820DzO70DFO4G9ux7XL6eNdwnlzni8iPKxj8RZOWwrUgubDJuqn
         wLxO0V0Ry6cNMG99HRuJTVMcRlNb/OSfYFvT9icQ+H/jRrFV5w4Oye13TJ366jroAvD0
         u8/x/W3VjAZLecFwksiqc6CF5AcIgQO97uN88iouwTM0BG4WaVEGvoH1Viag/Xd9PG50
         InlEOI4FiRsEros/o/T8uI+uucse1xx7EgTS/K2/0D1tAyyb5e4OC5gDmEDJQ+oSX/1Z
         PqwfeMVgXNlSDx4NFSKfmBLPAjVYRo4WzxWEfotbbHk8QSlzIyA+dw/ZCPHk9T4cn8Ua
         B4kQ==
X-Gm-Message-State: ACgBeo0qKuZJEynFDJt0/xOhCesR4jM0MbD9Z5+wcxtCd3U2CzEhMhgc
	4yAsKey/gn8zThlHxj8kNl31CqihyXWbeTmQEuY=
X-Google-Smtp-Source: AA6agR45wDOUkCh/L2HDnf9K1endI406O6j9IzYUDsAfQICWpUAgKXoC+Rp0ECqLGm7Um6L/2tphQDrnjlqrAKim+p0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:f045:0:b0:324:55ec:6595 with SMTP
 id z66-20020a0df045000000b0032455ec6595mr19520284ywe.255.1661971454809; Wed,
 31 Aug 2022 11:44:14 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:44:04 -0700
In-Reply-To: <20220831184408.2778264-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971448; l=1613;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=SUQQIb6Y+sTgOkn8ylHM+uEVIsOT1dvilITBQ2Hta9o=;
 b=nLKSJd3L/Tgv6SsitOrCoIehfWuY3K87K27T3Hn17A3aSaePVrNvQiC6Dlex7MqpilBpzEIeUbf9
 F8/QrNuIA98h1PJISpPwZ7+m08r3OLYFGMEeVu5PDfeUL7B2Kwdb
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-2-ndesaulniers@google.com>
Subject: [PATCH v2 1/5] x86/boot/compressed: prefer cc-option for CFLAGS additions
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"

We have an issue where as-option is testing new options with accumulated
CFLAGS. This makes it so that we can't use as-option to update AFLAGS
since many CFLAGS aren't valid AFLAGS. This is being fixed in a follow
up patch. Before doing so, move the assembler test for
-Wa,-mrelax-relocations=no from using as-option to cc-option.

Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: x86@kernel.org
Link: https://lore.kernel.org/llvm/CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com/
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Split off of v1 [1/3].
* Use cc-option to update CFLAGS, as per Masahiro.
* Add Masahiro's Suggested-by, Cc Arvind.

 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 35ce1a64068b..85934204d905 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -49,7 +49,7 @@ KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.
-KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
+KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 
 # sev.c indirectly inludes inat-table.h which is generated during
-- 
2.37.2.672.g94769d06f0-goog

