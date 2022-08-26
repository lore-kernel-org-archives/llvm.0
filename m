Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648BA4401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 18:10:51 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-340ae84fb7dso4745877b3.17
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=+rojwMFSR1ktivBcLatbShichab85h559FFhXLBJsbQ=;
        b=d4+SAZcB49L1Pz5691krlFA1DIyOTvq2Luh257EaP1K/PH0dmddhrS56CK7oNvjTCq
         JYW3is9kyarysYwRgAyND3s3bxVw/jubRHzTepqU8ADf1ANplMvsHHy3sUZbgip1TrYi
         VQMolp4u+aOxwOmOth5Tljke2JmC0du+AIf40liTCnqtb1TQYByhptbt3UfS9P2/7Pn7
         V5D0Be+0FdKEK5I/9qKIW+ZDCqEWhahEwZ+F4wuKJ1GglG/LNWUg3D3IskGzoZvboVlp
         hoMcfu+1N82G+jY1PxSMeTMZaBdq+6+I+UxN62ZsTG3R3DeZx5dd48VB8uYWHkru790q
         LStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=+rojwMFSR1ktivBcLatbShichab85h559FFhXLBJsbQ=;
        b=yXcl7eP5CXBNGe6fasqmvVvDnFLW8WtQyGGROITbxj69bTr46ThrzmgiAUTAYAVAUv
         jVIZa8MSWdtH9N0nzqPhqvYx/+JXvT/W5qyHwDniaubpyCDj7fg+I6mKseDGCLWzaqfe
         60gqRZlYYcBSZCCPRGeMQxfWuR7SJqc9ESm5ollhJwx1lr8C1qG+t2YH6k+PgmFwLx/q
         Ip3G507S3w6rRW/WA4JTBL0Z6bhTjbXB+q+TqKB5rj8mgq3bMqiO0T0jx35slbuNrDFo
         HpQgn77T/N21Y6ThRs/BT8ZdS/1mg5sjblZkx5k3X5htq/OHTJHI/blGoE5i/NJYNhK3
         31rw==
X-Gm-Message-State: ACgBeo0xYkuHPT69I3lKq2g0HOhOuSBpOQEh8tT4Dswzhwid9ErP4bi4
	g7ftzzoRXPMAtswvQ74iq0ifpjBEP9GxYJHm780=
X-Google-Smtp-Source: AA6agR4ULUmbr1GFgEraiIaT8AxK9RcdvEUmCKesyk2DxFW/lUdbvm5cGag9CLzJsNLFrG4g/doYTURXjga8oVLFUHU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:8d7b:b933:5438:2a88])
 (user=ndesaulniers job=sendgmr) by 2002:a25:e90e:0:b0:695:64cf:5d2 with SMTP
 id n14-20020a25e90e000000b0069564cf05d2mr832499ybd.541.1661537450473; Fri, 26
 Aug 2022 11:10:50 -0700 (PDT)
Date: Fri, 26 Aug 2022 11:10:33 -0700
In-Reply-To: <20220826181035.859042-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661537434; l=2534;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=+Ce697Gvc792vtSqpkgUmOwOXeS8MsAAIdR8EYSt4bI=;
 b=D9av99GhEUVuJgb7imYpdihlXqaXba/P8TNNQf7iB27ysvI+vgrjTW1hi6ko1PmKeztnZYwKFkzD
 +kwn7lP+BBx5GbbPxnX3QOnvS+vc5/jOX7d4q9Aev4g8z14GlfxF
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826181035.859042-2-ndesaulniers@google.com>
Subject: [PATCH 1/3] Makefile.compiler: s/KBUILD_CFLAGS/KBUILD_AFLAGS/ for as-option
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
cause as-option to fail unexpectedly because clang will emit
-Werror,-Wunused-command-line-argument for various -m and -f flags for
assembler sources.

Callers of as-option (and as-instr) likely want to be adding flags to
KBUILD_AFLAGS/aflags-y, not KBUILD_CFLAGS/cflags-y.

Link: https://github.com/ClangBuiltLinux/linux/issues/1699
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/boot/compressed/Makefile | 5 +++--
 scripts/Makefile.compiler         | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 35ce1a64068b..fb3db714a028 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -48,8 +48,6 @@ KBUILD_CFLAGS += -Wno-pointer-sign
 KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
-# Disable relocation relaxation in case the link is not PIE.
-KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 
 # sev.c indirectly inludes inat-table.h which is generated during
@@ -58,6 +56,9 @@ KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 CFLAGS_sev.o += -I$(objtree)/arch/x86/lib/
 
 KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
+# Disable relocation relaxation in case the link is not PIE.
+KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
+
 GCOV_PROFILE := n
 UBSAN_SANITIZE :=n
 
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 94d0d40cddb3..d1739f0d3ce3 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -29,13 +29,13 @@ try-run = $(shell set -e;		\
 	fi)
 
 # as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(KBUILD_AFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+# Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
 	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
-- 
2.37.2.672.g94769d06f0-goog

