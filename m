Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDF7B
	for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 00:11:58 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id v189-20020a252fc6000000b006e7396ee2c3so12069906ybv.9
        for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 16:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GoR0XfyfLKOGrF4aZi9U/Y5nI4Wyasyd+UL78gHDN8Q=;
        b=lNTU/PzLJsqM2jLMTKBPrA4eAqGQHrDPAkxlfcHQm+r1wj/z9o8rIwqKYDLjoNXHkb
         YgSSO/lwGMoBnf+CYYg0UW5j5tawIogVOlSJfAAH5Ltv3ED+3MiK5Nq+bjSctz/TRcz8
         +3A2cr1oQR77bin4jeqYK33MIxQD/Aamnq8P62owl5JUyRW38kLK8Am6EETziPSZIGhV
         Xx89fZ76t9YtTJKjTev19Th4JzJ93Q1Ht35I2ESNs3JlEH59PZCxLnrycIA7MjxG6P8X
         Vpg4uh86bV4ncCmkEPeRQlmid6Jv9G/nGNDqdeGbH9wCt1LUeifTLuFKBwFnlwowNOxl
         CboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoR0XfyfLKOGrF4aZi9U/Y5nI4Wyasyd+UL78gHDN8Q=;
        b=ANHXdMHT4Aq/sWZ1oxZfyj1uKgXKqfwh9QCucjUpMEoo0a/e/lTXxst2M/FMV2Ntui
         UfXb+Wwb9TXib2YCQSnCCNDeQf28Ik5c0f2boBcR+vRbGAbNl3t2CUj6kob93+DkYPWl
         LhjtMRzStSkiAM7MOyNIWAPRrcxxnQcoa8y3AH0rLBO760maTHuWPsBbQrouPd0fHYWN
         r+rhNG7/zYcHU9pby9ttbkbsKGQJSPB/ehKsZEkqZRYhtuVmHehPKS023OXIGQfqQPc9
         VYvgFKejG2bqiS8m4yxYW6iSd/BuWgrYiivd+HhdLHPKG101nma2Nikw22ZlRY2rMQFH
         GMBQ==
X-Gm-Message-State: ANoB5pkp7oAETdrgdgQSAe7pQjc84tQJzpuWvC5bTw/h7FigpTwXsUyg
	smfjd6lJWk8T0ewI+o9IJ1kVLgqUrA9t
X-Google-Smtp-Source: AA0mqf4SrzMXmVST+smv+524H2udDqJCIC5//wnDbOgTZY3XPJzTN9VR4nBD5LfsvRKqjWiK5iJg9wJjpnMk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:2107:a1f5:8582:5608])
 (user=irogers job=sendgmr) by 2002:a25:2e0e:0:b0:6cc:35b9:8525 with SMTP id
 u14-20020a252e0e000000b006cc35b98525mr5139616ybu.104.1669075917318; Mon, 21
 Nov 2022 16:11:57 -0800 (PST)
Date: Mon, 21 Nov 2022 16:11:23 -0800
In-Reply-To: <20221122001125.765003-1-irogers@google.com>
Message-Id: <20221122001125.765003-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v2 2/4] objtool: Install libsubcmd in build
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
index a3a9cc24e0e3..fd9b3e3113c6 100644
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
+		DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= subdir= \
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

