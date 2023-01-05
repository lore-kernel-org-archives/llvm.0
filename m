Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09382A38
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 09:02:23 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-46a518991cfso341697207b3.18
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 01:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3C6oUUNqAe6SouB7tmV8ak/X52sdVelkHDk9iVtEts=;
        b=WPFw1OLNMuFxaskhsLx3FPzw7/x0/K4eifGQNNWYSlsuL1S+86v33juk06zYg+uPoE
         G1GVeLQbT0/duDibET5al+ECKeQ/qi6++s2naUGTlzTYW4fUZLBCq7/Lbrj4mxLMPkr2
         cSl9uxxC9lnB7Vd18Wy98iI828Y3CeQTbpqa7JIgkjjRPv6sCn1Q59jnbsDYhC0wjXPh
         kHaZ2YxCpQt2q5rBpv8mSEQtDFoD08ulvxKb8NWz3gzWgw1hOJKkYHpi2604Yip70ewj
         DWE3sFX19lDfNmlqw0+n+c8UZzqKAXu+glEoKxTw5dxFTx27Hmrx8b4SFPVLpgO4jK9z
         M1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3C6oUUNqAe6SouB7tmV8ak/X52sdVelkHDk9iVtEts=;
        b=k2rBDviYGc7lDJw5bKKm6WPIRlOOfHCfs/wAUj21FDGnY/n0cch1joZu7LZiPT3Uxp
         pniVwg+vfvrSfd90fn6qMJ4fvqtXQ2KhDrZwfNMNFfNC8VOY5yTvV+Y22FUTVoZVB1Dq
         ArqeFVwqi61bs7tHCCbBMzxRB7fY5Z/eyQ9AEn9oI773MExKIH7SGT5CC/UE+zMS5NfU
         43GlOeTpNWO5oy/7aMj1GEqTvzboQ1qP30Fjaivqw43BTsdSIl1joQeVG8/hO8pkMbLn
         o2d/idqrnvrsGyfVwmSIJMVHW97w9bk6lqkmsJm4AsmS783CkzDqMeAK6oAPyQ+UoIUx
         3wpg==
X-Gm-Message-State: AFqh2krQIud7zKlDXaiHQEJuKSljIQTb1pOwfCaBU5SR6Wo237EGwGlt
	jZRWnTK9Zoa+h4bbdteFH5x8mRCmFpzY
X-Google-Smtp-Source: AMrXdXtQ3oct9AuOg8tpYlHoVap9HA92AlqYosjKfxvMi1WZB5Yyg9L7G7FvwJCR6zISwzpntqalJV+Av0kk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:8775:c864:37e:2f9b])
 (user=irogers job=sendgmr) by 2002:a25:c03:0:b0:716:deb3:141b with SMTP id
 3-20020a250c03000000b00716deb3141bmr5110692ybm.508.1672909343036; Thu, 05 Jan
 2023 01:02:23 -0800 (PST)
Date: Thu,  5 Jan 2023 01:01:54 -0800
In-Reply-To: <20230105090155.357604-1-irogers@google.com>
Message-Id: <20230105090155.357604-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230105090155.357604-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v3 2/3] objtool: Properly support make V=1
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The Q variable was being used but never correctly set up. Add the
setting up and use in place of @.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
---
 tools/objtool/Makefile | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index fd9b3e3113c6..61a00b7acae9 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -47,6 +47,12 @@ CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
 AWK = awk
 MKDIR = mkdir
 
+ifeq ($(V),1)
+  Q =
+else
+  Q = @
+endif
+
 BUILD_ORC := n
 
 ifeq ($(SRCARCH),x86)
@@ -58,18 +64,18 @@ export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
 
 $(OBJTOOL_IN): fixdep FORCE
-	@$(CONFIG_SHELL) ./sync-check.sh
-	@$(MAKE) $(build)=objtool
+	$(Q)$(CONFIG_SHELL) ./sync-check.sh
+	$(Q)$(MAKE) $(build)=objtool
 
 $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
 	$(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
 
 
 $(LIBSUBCMD_OUTPUT):
-	@$(MKDIR) -p $@
+	$(Q)$(MKDIR) -p $@
 
 $(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
-	@$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
+	$(Q)$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
 		DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= subdir= \
 		$@ install_headers
 
-- 
2.39.0.314.g84b9a713c41-goog

