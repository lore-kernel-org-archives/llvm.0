Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD38F69
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 22:04:12 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-36bf9c132f9so31484047b3.8
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 14:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/8tcV65NVEwS5qyaLKJ1YnmWVyteYUi8du6gRZPUlk=;
        b=Kgx6EoNMCudu+OzIdeTfFZaqIVftUAqRW1zo0L+decJ8pEy4/MJC04RnVF7B3KaSZ0
         9DK6SxFeAkYNS2w805K2pZXeMVzoTc9+n6i2fomVEFwYh2ahmKGbpB2ptalb+xwgnM+v
         1ylGsq+GKD4GqKY+1TF2ywPbbApmanEIDMq5tcF3WNAgugTiNNfif10EuJfPJgvXpQ6G
         7DeyxMVQCZjmmpaJM90lNPVsHLhy/uLYINj6B+GbWvdd6u1xI+83ksDlrJ5xrJCL4O8O
         iQDbVQKNrBr/EN9pK3y4nLsiMZ4yZ/q7eFSymuqkuEkcNrP8HCciHbuAMrDf+BvQnlM4
         /3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/8tcV65NVEwS5qyaLKJ1YnmWVyteYUi8du6gRZPUlk=;
        b=Um/Vt4iaXor5iCEGGLn48FN6WgbLKK7ye7uek72XRKUv0qNMZNM7A32UKFOn1y1pAG
         C2ljx8oVu7nEwcJZri7SA4go+Ll5ST2pppXwIBxonBPKGCS1i6MllWFJ0ZoDp2lPw/kI
         hWkqX7mB8Dimw+R8peCVpMONwaX009V3cmXZhhGkFTTf7l7ApmcdoqyQB0AxqjSWk7he
         Aeh/CnkWeWw1xdNAcrVGSWXWQ2TilMX/g46hbdiCFNgWXxMyX1S7MVPf3Lc7c5oKw+4u
         l7ot3pcKo+76o2a8R6CAOY0gzURmQ6nrNar6WyHbLYftF+a2ZUC9VydvGcP6km8X8fop
         dQpw==
X-Gm-Message-State: ANoB5pmRJWJ83AWOc4A/lY81eakc9yFUoSSvo4CMeqRtZ2thXxipnMDV
	tKHvhC4c9fOJqVVAH8t80zBeKI+fJTnx
X-Google-Smtp-Source: AA0mqf7f9uYuv+sECCaA6Z/0/AsoZl7kJghOPmb+2nYwt/3QoCFFtTtSJNqhE82ndbER0iOxyM86EmFaLBS8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:3f1e:c462:d6b8:fba8])
 (user=irogers job=sendgmr) by 2002:a81:5d5:0:b0:36a:d4df:c6b6 with SMTP id
 204-20020a8105d5000000b0036ad4dfc6b6mr3879537ywf.18.1668722651796; Thu, 17
 Nov 2022 14:04:11 -0800 (PST)
Date: Thu, 17 Nov 2022 14:03:39 -0800
In-Reply-To: <20221117220339.341290-1-irogers@google.com>
Message-Id: <20221117220339.341290-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221117220339.341290-1-irogers@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v1 3/3] objtool: Alter how HOSTCC is forced
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

HOSTCC is always wanted when building objtool. Setting CC to HOSTCC
happens after tools/scripts/Makefile.include is included, meaning
flags are set assuming say CC is gcc, but then it can be later set to
HOSTCC which may be clang. tools/scripts/Makefile.include is needed
for host set up and common macros in objtool's Makefile. Rather than
override CC to HOSTCC, just pass CC as HOSTCC to Makefile.build, the
libsubcmd builds and the linkage step. This means the Makefiles don't
see things like CC changing and tool flag determination, and similar,
work properly. To avoid mixing CFLAGS from different compilers just
the objtool CFLAGS are determined. HOSTCFLAGS is added to these so
that command line flags can add to the CFLAGS.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/Makefile | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 6b6c20ba5160..c9992d73617f 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -2,16 +2,12 @@
 include ../scripts/Makefile.include
 include ../scripts/Makefile.arch
 
-# always use the host compiler
-AR	 = $(HOSTAR)
-CC	 = $(HOSTCC)
-LD	 = $(HOSTLD)
-
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
+MAKE = make -S
 LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
 ifneq ($(OUTPUT),)
   LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
@@ -36,13 +32,20 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/objtool/include \
 	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
 	    -I$(LIBSUBCMD_OUTPUT)/include
-WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
-CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
-LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
+WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
+OBJTOOL_CFLAGS := -Werror $(WARNINGS) -g $(INCLUDES) $(LIBELF_FLAGS) $(HOSTCFLAGS)
+OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
+OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
+
+# Always want host compilation.
+HOST_OVERRIDES := CC="$(HOSTCC)" EXTRA_CFLAGS="$(OBJTOOL_CFLAGS)" \
+		  LD="$(HOSTLD)" AR="$(HOSTAR)"
+BUILD_HOST_OVERRIDES := CC="$(HOSTCC)" CFLAGS="$(OBJTOOL_CFLAGS)" \
+			LD="$(HOSTLD)" LDFLAGS="$(OBJTOOL_LDFLAGS)" \
+			AR="$(HOSTAR)"
 
 AWK = awk
 MKDIR = mkdir
@@ -65,10 +68,11 @@ include $(srctree)/tools/build/Makefile.include
 
 $(OBJTOOL_IN): fixdep FORCE
 	$(Q)$(CONFIG_SHELL) ./sync-check.sh
-	$(Q)$(MAKE) $(build)=objtool
+	$(Q)$(MAKE) $(build)=objtool $(BUILD_HOST_OVERRIDES)
+
 
 $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
-	$(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
+	$(QUIET_LINK)$(HOSTCC) $(OBJTOOL_IN) $(KBUILD_HOSTLDFLAGS) $(OBJTOOL_LDFLAGS) -o $@
 
 
 $(LIBSUBCMD_OUTPUT):
@@ -77,6 +81,7 @@ $(LIBSUBCMD_OUTPUT):
 $(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
 	$(Q)$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
 		DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= \
+		$(HOST_OVERRIDES) \
 		$@ install_headers
 
 $(LIBSUBCMD)-clean:
-- 
2.38.1.584.g0f3c55d4c2-goog

