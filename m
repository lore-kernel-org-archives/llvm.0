Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265A7B
	for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 00:12:12 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id a5-20020a25af05000000b006e450a5e507so12504963ybh.22
        for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 16:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2OEVX8RYPyAcopuDfdaWLt0cg7xaISJPygwT0E0ouc=;
        b=c4MiccdF0m/dJ6gtmkt+leDsOcrSbyKkmprTSa4NTl6g3KAnmRAuF+gGso2easyZsV
         FnnkY2OmhIJN4f2BPS0ybe5jTSitq97A6wqCQKnrQFSfSYi2zSLGqRV1VY9kDsvqoP2R
         t7vrJ0f66IXcQXWLOe03yZNMU4fE8eO1zdHeOlGgNEGBe+TNLpWksnss3EZ6dw5crZh1
         gZplgnn9sPsj3eomSopOQzM21GLPpdCGWhE8wt8wWd30fGqgGk1Ez78i9ETM/bve4hbZ
         NYmLcH2qQd6Co5l6aHL5H7Qkns5w5OP9pjxxeoqiSG1Qbl0VgAM0kCgmBYat/D1EGHzn
         5h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2OEVX8RYPyAcopuDfdaWLt0cg7xaISJPygwT0E0ouc=;
        b=mB8Dun4iA7FM8MybQjr99NePxOv/iilZOO6mlEXstzTbw+wMaQOGNBcWvYvYnNWdUS
         P1ZDbo/kGdHQ+DBQASgOxnvxuHK1laxv2P5GcBr1zoha+NWPQ/7KzLkapUf9hvrdBqaI
         ClID/xHdsU6m0oyTF9wgOV+AcgXD0EJXRRYJsESDBo0ZHndAYwNXnr5L+ZKPwYAW/XXr
         TjKcUVKyLkNt8y1EQonXRSuZlDYFs9pyizgTzTY00DCt5Ynoqru5ubqDh1x1ZglQVH2d
         UjOzpm/b18lrvFo0dGo+r8SrpoOGxLxwNbOCW007OOe6PySW8tIum4fEKC4yJMJ2o5Ge
         fSeA==
X-Gm-Message-State: ANoB5pnVj4TCleUNF8RwAUwINRGHI/Z5NT5lJ6aunAInP2lee90h2UnU
	IKT5hC3PGPKfjD19XM9Do6u1Cj4bCZHq
X-Google-Smtp-Source: AA0mqf6ifB1D27FOoWwlyBAZ6UUO1Cn1HmiU7JlNMhn9b8OXE1+2jtqZr/Gg9ZLVkC4H4FmMym0nmtMkpMBk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:2107:a1f5:8582:5608])
 (user=irogers job=sendgmr) by 2002:a81:25d8:0:b0:373:4467:e0c6 with SMTP id
 l207-20020a8125d8000000b003734467e0c6mr1500249ywl.340.1669075931876; Mon, 21
 Nov 2022 16:12:11 -0800 (PST)
Date: Mon, 21 Nov 2022 16:11:25 -0800
In-Reply-To: <20221122001125.765003-1-irogers@google.com>
Message-Id: <20221122001125.765003-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v2 4/4] objtool: Alter how HOSTCC is forced
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
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
index 61a00b7acae9..e550a98e2dd9 100644
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
 		DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= subdir= \
+		$(HOST_OVERRIDES) \
 		$@ install_headers
 
 $(LIBSUBCMD)-clean:
-- 
2.38.1.584.g0f3c55d4c2-goog

