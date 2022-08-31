Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673264A3D
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:44:18 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31f5960500bso209611587b3.14
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=MAguRqe6d5HTDJzfY/4c4ymnDwIQdY6ECkW7ZQgoLNw=;
        b=lLpdU5JClnKvEn/Gjr4GzD569CDxOzC9A2l7JJtmlIw0QmqkRleBGN7K/MkqlowrMc
         eB4kklda7dRbzl7OP5b3PBBDrFZg68Q9Art7RJscyj8EPXmL4NezkymgMjS4yzeCS0om
         aTwJU4zA4WWTPRYIHEOrwxQLBXewtnwrpQfXnXR/bGn8FCIvXLHQsuDgB+xqmD1uMUSg
         GJbMAq/lFD3+PA28c0PIyfaaHV46bv/0zDNF+K14nzXjdjiVq2KyUA2BkuAWkpgFJZ6r
         XreGAn31i0HAzl/FoHyUDd6NRg/Xz9hfEKHkEFRNW8R//VAOxa/sCfFqsAhTblQgMB7F
         WyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=MAguRqe6d5HTDJzfY/4c4ymnDwIQdY6ECkW7ZQgoLNw=;
        b=TTitAhLo4BL5xurcq38pIeSfjlGBg+9KjT6tXf3mzvhHoqFKX4DhPe/gfhpi9MtJYC
         0NEqtDhsuUIEo1j6gBCwr81WXXV/1ofzjE2DPbSj3mVC1Ud4b5hReTVRr+obIRyJygjQ
         KKCsiIGJS5u0DV/EHfwVL/QrGnXOkC2s0zbD/Gtf5AyGC+j+JLm+r6XGcqesDintadI/
         OXgSO9YauwKJKkwl7T13nQuVnHTSRROshS+kDswoinAjieFDpRVzNi3SeyUbSWXLguH+
         RzvELYKIJUnfKtjkQEvD0VltFxqcpNlfZ2sHkc3Nw7U+PkIknYCGgtnDw2NWKakn/YMO
         Y20Q==
X-Gm-Message-State: ACgBeo3t5fjLhUbXbU7u7zmstBxoNNZMyKryXHKhQreB7HkA6lz00tKW
	LykxYDHdoN7mUMmrs5sjH3seWo9qx83mRuMW4sA=
X-Google-Smtp-Source: AA6agR4p7Kp/AOktsa3PVwZf+E9KjpLFgWWbGnI9zwHlkeKlGhPyWPytRi9y6bP/8vCcBhJE3Gf55QU1RKXkrNnB+10=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a81:a905:0:b0:33c:1ec4:e704 with SMTP
 id g5-20020a81a905000000b0033c1ec4e704mr19390415ywh.275.1661971457428; Wed,
 31 Aug 2022 11:44:17 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:44:05 -0700
In-Reply-To: <20220831184408.2778264-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971448; l=1550;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=xn2eK78nuKFsrx144Xn+vmQ1XO0dKmn4QRoxa/IrOQQ=;
 b=FBM2n36UJ2NPU2dr4Ry0FWWemrN0IbAHk/nAkgqQ1k7F1XgiFnavYAEad6JcMZLiqrTNAxxwX3VS
 UiZHtT+CDff5XY04hUNq35dwQ8M78Khr4I1cSE5UqBOqwzh+MLiz
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-3-ndesaulniers@google.com>
Subject: [PATCH v2 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
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
Changes v1 -> v2:
* Split off changes to arch/x86/boot/compressed/Makefile into parent
  patch, as per Masahiro.

 scripts/Makefile.compiler | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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

