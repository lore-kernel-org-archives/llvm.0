Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DEB8F69
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 22:04:04 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id f8-20020a25bd88000000b006dda2c86272so2786859ybh.5
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 14:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zN9iF3uBflZ8Xy8LWXsRFnlUwRcK8nR9vFeAViyEg3w=;
        b=FUio/DfydfYdb4IgGKrax+IOOSEJyZUeqqiG6wojZ5ImpN1x/0VdJkeNBd0UKi596I
         lkJTMztN1RVInRqP5wrWWgeK/HJdpL5UyMv54TW2UbAO9JUuFddGEcr0dYLZzyEs6OYo
         NdCDjTvRAGryqn4n2RWdHtzGQxjNVNbNs08ihglztICussWb4blWNiHbQLTUdqax+CkF
         2hjboqb+JJd696ClfAYJ+S+6hqUkI6cn4+8ggjVeusxMPKO4b/XD06eXYLlJJRFouYAe
         flys8fyoIfzXW+Y+2YkfbkN5zhuMZ7Gd8ogck0qqWcL19iRBN1pWq58MFO7fNrwTia85
         9XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN9iF3uBflZ8Xy8LWXsRFnlUwRcK8nR9vFeAViyEg3w=;
        b=Fu2vM2hDtPYduZ7XTkKKx1by7tKglXqgu7LBgSfJ/Neuteq9CfUwpuV5z31lNvZywq
         xk1bMR8puYdCYmzztzVlv9oTXUp0osmMOvHfMVtMP4eh9rVhCLE+WfT9uWMORhz8NNCY
         Ib52L7h27/qJCGTr1HfE40jUA6SmhX7ukqvTBPh3FUSZmjEM/wXwe8q+jzhKz0oFNwWT
         jk/rX44FixkAt1bl26HglV8vsdUq9sKPOMSOKlZYowPBWZBhauXJuqSN3atxhogZ3YPO
         gy+1qQVfSIIu+ip4o68qzVt6TDETFd7T+kFpuE+gHhxPdu7WB/XtgF5uSeEmkU8R+9wW
         AH/w==
X-Gm-Message-State: ACrzQf3wp/7BNC2/eNxzyKHaNjKc05pPUqvsrNCsGqnq9JDylzRNQATb
	/DDv8MDeJmYYqAAuBUhP+4ssmmbF8Lh4
X-Google-Smtp-Source: AMsMyM5CTKueFGy9Qd/m53JJOFRV1XwPwIJNhVGOlS0rwF/YYeBx81ISVfmgEwv0sD0U4ytnYS9X481jA3WO
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:3f1e:c462:d6b8:fba8])
 (user=irogers job=sendgmr) by 2002:a81:79cc:0:b0:367:6127:ad8a with SMTP id
 u195-20020a8179cc000000b003676127ad8amr64703162ywc.60.1668722643602; Thu, 17
 Nov 2022 14:04:03 -0800 (PST)
Date: Thu, 17 Nov 2022 14:03:38 -0800
In-Reply-To: <20221117220339.341290-1-irogers@google.com>
Message-Id: <20221117220339.341290-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221117220339.341290-1-irogers@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v1 2/3] objtool: Properly support make V=1
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The Q variable was being used but never correctly set up. Add the
setting up and use in place of @.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/Makefile | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index a3b55c807a51..6b6c20ba5160 100644
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
 		DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= \
 		$@ install_headers
 
-- 
2.38.1.584.g0f3c55d4c2-goog

