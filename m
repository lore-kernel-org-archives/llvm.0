Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32C4C92
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 19:07:14 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id n203-20020a2572d4000000b0078f09db9888so2837272ybc.18
        for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 11:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+gYGtqL2SRpdZUrbarcTj/VyrfCH7sXhTEO9COsfhA=;
        b=NVYUr+Uqf3LXuiY2vufck3b8NGaYASFbpX9cUq+Y3vSlnWt2MQrtxr5AawvrcLWisL
         NstcVu8PTp8LcmDng0BrP/LHuuIwpysNYOYw1GRCCHVvYufydYd8QofUm29SVFVAFWgr
         8J3H2YNlpa9sS+ddOaMGmYaTYrLRczvAJbJ9F3ZviiVLhwgoEmlUhDmaBNdIQEqg1lTd
         tOblDzgIFRdaf/3Htpzx5Hu1OtX0PvHLv4ZTHFeMJhMbvQIbi8V+A1m/LSix1DRgMgcT
         sC16ewzP7A6tErnLqVq+FpwJu3cxJkuKZzrSQnQLUbY7iUI7+sROPYGXWqPSqTshBlhY
         tM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+gYGtqL2SRpdZUrbarcTj/VyrfCH7sXhTEO9COsfhA=;
        b=o78m6/wzTBhuyAsQpzlB2+QM5mTTkO4fmxvU2usO5LSfKd2XI4AR9vRbNOOSyURoIh
         z9klxgB9Pxvt3CUaVuhFvyLv23dbV1iIv6kGFXK624qu6+1H6JsnW5gHdDOq20b0ollH
         hypYc5Nis096XXzSD+VpdZAJiQhlJj/hua+NqmxukuBimLiyKVQUZCWsYg4lwSxl7sYG
         iZL2WagPMZqNc7cmwdBxiUv8pu+dJgbbSA3a8eViVYBmoPWs+6SzFvcDS51Y31E+knq1
         jdXP/aYicqZ8ynelKMODBZuWqpb6X4YNrsCwrJIh2L6ZHAHTCaTgyur29XIQj0NfXqje
         7UYA==
X-Gm-Message-State: AFqh2ko3TIPXHTldtryrtyym3BDt8KeCBXwqf8AVMGlGT0hBePgNqJAE
	1Aq4Xf3QlmBswGa3Iu1mRxtWnxdSlj3h
X-Google-Smtp-Source: AMrXdXtudaBVFWg4qUncYz8rcrZjJtg9DTzzyU9zA2GA1yz0akWAMZBB/rWGPj2/alDYiJ3Vlbum5DqAAJ8n
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a81:78cc:0:b0:364:2f5d:5eb6 with SMTP id
 t195-20020a8178cc000000b003642f5d5eb6mr6102751ywc.215.1674760033313; Thu, 26
 Jan 2023 11:07:13 -0800 (PST)
Date: Thu, 26 Jan 2023 11:06:04 -0800
In-Reply-To: <20230126190606.40739-1-irogers@google.com>
Message-Id: <20230126190606.40739-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230126190606.40739-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 1/3] objtool: Install libsubcmd in build
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Including from tools/lib can create inadvertent dependencies. Install
libsubcmd in the objtool build and then include the headers from
there.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/.gitignore |  1 +
 tools/objtool/Build      |  2 --
 tools/objtool/Makefile   | 31 +++++++++++++++++++++++--------
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/.gitignore b/tools/objtool/.gitignore
index 14236db3677f..4faa4dd72f35 100644
--- a/tools/objtool/.gitignore
+++ b/tools/objtool/.gitignore
@@ -2,3 +2,4 @@
 arch/x86/lib/inat-tables.c
 /objtool
 fixdep
+libsubcmd/
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
index a3a9cc24e0e3..0bfdb9da8729 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -12,9 +12,13 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
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
+LIBSUBCMD = $(LIBSUBCMD_OUTPUT)/libsubcmd.a
 
 OBJTOOL    := $(OUTPUT)objtool
 OBJTOOL_IN := $(OBJTOOL)-in.o
@@ -28,7 +32,8 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
 	    -I$(srctree)/tools/arch/$(SRCARCH)/include	\
 	    -I$(srctree)/tools/objtool/include \
-	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include
+	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
+	    -I$(LIBSUBCMD_OUTPUT)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
 CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
 LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
@@ -38,6 +43,7 @@ elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E -
 CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
 
 AWK = awk
+MKDIR = mkdir
 
 BUILD_ORC := n
 
@@ -57,13 +63,22 @@ $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
 	$(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
 
 
-$(LIBSUBCMD): fixdep FORCE
-	$(Q)$(MAKE) -C $(SUBCMD_SRCDIR) OUTPUT=$(LIBSUBCMD_OUTPUT)
+$(LIBSUBCMD_OUTPUT):
+	@$(MKDIR) -p $@
+
+$(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
+	@$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
+		DESTDIR=$(LIBSUBCMD_OUTPUT) prefix= subdir= \
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
2.39.1.456.gfc5497dd1b-goog

