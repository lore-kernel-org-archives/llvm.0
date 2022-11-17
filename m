Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23D88F69
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 22:03:56 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 204-20020a250fd5000000b006ccc0e91098so2792469ybp.13
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 14:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6w8X/FEX+k6lmFIXTs91E3JTRcJpHgBrrHWmdWICRc=;
        b=X56mfUl5VlxMRsxDJ+e6Lep8lObttWYXeSv/UmVLRoqcg/lv00Qobno67OYOrhLGUF
         xtW4JDNUG4OtFy55LevzS3U8QmO2uc4ypJfAJgWqIc3nRZ43rUUy9xdbLhvztkUdA13d
         4LZa2EjXLp6ANOFEKFLckDnWI4lAK8pbteZCX3hjj2YhUhxIp21xRo9oqeAqc7ws7PYS
         nh3MEupBip9D43sbicqnwuphQ6DAEo3rFR4FN0N+Wy7kBEkE7ow4gUOqS2O1GHm8zYFU
         btyQCAs/UVNymMnMAHPI7Imawr0j+AhJ+hcwC9yAQvXR/nYPp3Wx/V+LOEnss1gbgHTX
         zPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6w8X/FEX+k6lmFIXTs91E3JTRcJpHgBrrHWmdWICRc=;
        b=5/zVjJ9SQnPwuwcWwswZ03BVFiyIiCpY1wV2DfmFzAPk/xHFGE1MYoQ/sxMD46D2HC
         R/lWfY4o1VRavzrtY7Dzd+jDZ5MpMxWJecsjUs9zcBxPLm3ULh31EnmxePPxSZl/Is3F
         IhRQ3glAH77Ozd6MYE8jxWra7XIpq7VWGe5K2a+j0+Jd+atHPCPyFC9xDvf5fVV4sGNH
         ZZeaEQHX/O+5wEX/FGl780B6N2lZvOU6uz/0bDwSzHPOb/kJxOa8ZzulJvn11AbK2Rq4
         hIcTFmJq8Wl0mT0XYKY86C5rMq/kdJSD+wbOT1nhcCgLsH5oF+O4n5wrilHJsxRNP7Y5
         TOTw==
X-Gm-Message-State: ANoB5pm3r4tdes+W2Owbo+3Ekq9zuyjFx4SsnOkuj0V2KoNZJMND5lUP
	O10hnKbucgjrJUsaPNeRb/CBQBFy8n4V
X-Google-Smtp-Source: AA0mqf67V7IBHCqmtKbDPYtqagmDcQh81uq92hr427gBeUYQBRW5NO1fXnegFgjnnTEGt3OeyOh0+u+qrOOL
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:3f1e:c462:d6b8:fba8])
 (user=irogers job=sendgmr) by 2002:a25:bd52:0:b0:6e6:8497:ad31 with SMTP id
 p18-20020a25bd52000000b006e68497ad31mr4148339ybm.165.1668722635804; Thu, 17
 Nov 2022 14:03:55 -0800 (PST)
Date: Thu, 17 Nov 2022 14:03:37 -0800
In-Reply-To: <20221117220339.341290-1-irogers@google.com>
Message-Id: <20221117220339.341290-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221117220339.341290-1-irogers@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v1 1/3] objtool: Install libsubcmd in build
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Including from tools/lib can create inadvertent dependencies. Install
libsubcmd in the objtool build and then include the headers from
there.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/Build    |  2 --
 tools/objtool/Makefile | 33 +++++++++++++++++++++++++--------
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/Build b/tools/objtool/Build
index 33f2ee5a46d3..a3cdf8af6635 100644
--- a/tools/objtool/Build
+++ b/tools/objtool/Build
@@ -16,8 +16,6 @@ objtool-y += libctype.o
 objtool-y += str_error_r.o
 objtool-y += librbtree.o
 
-CFLAGS += -I$(srctree)/tools/lib
-
 $(OUTPUT)libstring.o: ../lib/string.c FORCE
 	$(call rule_mkdir)
 	$(call if_changed_dep,cc_o_c)
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index a3a9cc24e0e3..a3b55c807a51 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -12,9 +12,15 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
-SUBCMD_SRCDIR		= $(srctree)/tools/lib/subcmd/
-LIBSUBCMD_OUTPUT	= $(or $(OUTPUT),$(CURDIR)/)
-LIBSUBCMD		= $(LIBSUBCMD_OUTPUT)libsubcmd.a
+LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
+ifneq ($(OUTPUT),)
+  LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
+else
+  LIBSUBCMD_OUTPUT = $(CURDIR)/libsubcmd
+endif
+LIBSUBCMD_DESTDIR = $(LIBSUBCMD_OUTPUT)
+LIBSUBCMD = $(LIBSUBCMD_OUTPUT)/libsubcmd.a
+CFLAGS += -I$(LIBSUBCMD_OUTPUT)/include
 
 OBJTOOL    := $(OUTPUT)objtool
 OBJTOOL_IN := $(OBJTOOL)-in.o
@@ -28,7 +34,8 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
 	    -I$(srctree)/tools/arch/$(SRCARCH)/include	\
 	    -I$(srctree)/tools/objtool/include \
-	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include
+	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
+	    -I$(LIBSUBCMD_OUTPUT)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
 CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
 LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
@@ -38,6 +45,7 @@ elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E -
 CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
 
 AWK = awk
+MKDIR = mkdir
 
 BUILD_ORC := n
 
@@ -57,13 +65,22 @@ $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
 	$(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
 
 
-$(LIBSUBCMD): fixdep FORCE
-	$(Q)$(MAKE) -C $(SUBCMD_SRCDIR) OUTPUT=$(LIBSUBCMD_OUTPUT)
+$(LIBSUBCMD_OUTPUT):
+	@$(MKDIR) -p $@
+
+$(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
+	@$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
+		DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= \
+		$@ install_headers
+
+$(LIBSUBCMD)-clean:
+	$(call QUIET_CLEAN, libsubcmd)
+	$(Q)$(RM) -r -- $(LIBSUBCMD_OUTPUT)
 
-clean:
+clean: $(LIBSUBCMD)-clean
 	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
 	$(Q)find $(OUTPUT) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
-	$(Q)$(RM) $(OUTPUT)arch/x86/lib/inat-tables.c $(OUTPUT)fixdep $(LIBSUBCMD)
+	$(Q)$(RM) $(OUTPUT)arch/x86/lib/inat-tables.c $(OUTPUT)fixdep
 
 FORCE:
 
-- 
2.38.1.584.g0f3c55d4c2-goog

