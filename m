Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF114401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 18:10:53 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-32a115757b6so37097287b3.13
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=y85OHCHx+Vi/sO7g73ubX7Iq+I1fFfBENt1UsLJJtEY=;
        b=Wj6HCEjnqrM+ctPXZ7KiGzIXUgQPn1aBBzqlXzJXgi4UZbJJxcgs2UwkHjll+zpoDb
         QeMdKfqcbQOVp17Y0+gesDEiIBE2NtsbSzBeish3QzVjv+ccDr8N9iBPhNlnJ+YXJgXc
         TvKwx7H5srQaXdmnL0HXDThn+fsOePUCjTuCn0aigqKEnJMlv7h1Xp+qfv8qoTynWxqI
         4txto8tzY+q23E3IEn+vhGNU4fNuv5wFW3EC0z2YsZ+kLvCz3/6YommEVb33Y4oEwDD3
         0L4yDniY0aGOCZ6n2IM+1XskuCSVe+ByexHFTTMple1/llBbEl7kTK+daJJISfnFHL6d
         TeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=y85OHCHx+Vi/sO7g73ubX7Iq+I1fFfBENt1UsLJJtEY=;
        b=g2fV5btaZ7Yz+hjCo5AafJiBiuUjmiPUCfqvDh5OwLHffx8GURz4AxVXbKj87StQjG
         TKJO8hjHQIAPL4jZcSxReyGIsIcCJMkOE/WZ0SXSjsuz3Omh/I6O58sl//Nx6NYO0y4o
         A442VOrvlpQY4hP0y25sBlhYhujfEdfwjMenKgnS3Iwk1C51e0J1kMfHe4efKRcoR4sW
         GbdlbAZAbEMqWSYV9uJPIOCm9JQnHuzb10iys+xBclrmtulkMQL8IJE6trR6+iCSlepE
         zp/Ov8bghuv4QQH8mrCaiel23k7CHXoZvjm3ysbP7mwdCi6TDYVHR2ejgsoVSrlTPH56
         gDRw==
X-Gm-Message-State: ACgBeo0Q4+xJCMXDkakmgKpqjWRgy1Ni+/RQwOBt2TSNPIJs0Xs9aJMJ
	MI08ui/9J9ODMDsdaTp89o0FA8OtTfe9wixDiIM=
X-Google-Smtp-Source: AA6agR5OzcKIoYCg9NU/S1Bt4QZM/GluQ1lilTqv2NoDx2SVtJGQ0ZZoyYauXUteYnrMqBae+wpkPcsEDZ5Oc9etZfQ=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:8d7b:b933:5438:2a88])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:124f:b0:66e:e3da:487e with
 SMTP id t15-20020a056902124f00b0066ee3da487emr973177ybu.310.1661537452858;
 Fri, 26 Aug 2022 11:10:52 -0700 (PDT)
Date: Fri, 26 Aug 2022 11:10:34 -0700
In-Reply-To: <20220826181035.859042-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661537435; l=3096;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=WJicEEw1ygkDh8L4szHogyorYbivCBDQ7W9ZrvdhNOc=;
 b=ZWuPxn7dhLiVcgTrvuHdUAPAmyqC6WoqmU5iSPWfVYPAWJqjwzpjYxl1614lFrA0/+q4/P3onXk1
 O00OgL5BCi40Z6C06mizSDk06M74HD6otU8B3ZzdiYDlMTNMCJLe
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826181035.859042-3-ndesaulniers@google.com>
Subject: [PATCH 2/3] Makefile.debug: re-enable debug info for .S files
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
 scripts/Makefile.debug | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..a7a6da7f6e7d 100644
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
+ifeq ($(shell [ $(CONFIG_GCC_VERSION) -ge 110000 -o $(CONFIG_CLANG_VERSION) -ge 140000 ] && echo y),y)
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

