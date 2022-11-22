Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD037B
	for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 00:12:04 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id o15-20020a17090aac0f00b00212e93524c0so12885170pjq.2
        for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 16:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAoGw6w4KlL7DQVt7ZsS6OCEJRbgq50upBPjFJ4o4ig=;
        b=BrggVwj0H1omWRQ69YMIUK21XBMjpa7HVYTK62MFY+Cb1CVXGLi4683S8vfkF0PlDM
         iakDSbG0hQ1GrjLKiYu+30WQWoGLlKWLb0p65JCmlI1aDPoMI0jiuCnzgxOflZSLS4Mo
         +D88Umt4pSij+Ntjtuvcwcw5DTxcYIBsaZnO5JLYqwEig0u1hFvA6h1s2vePSQZbhaMn
         2tPAC9dLJguoQRb9z1bn/v20WbWjqhZzy1ZSqHvEYvPvmcxzrjqilM83hKRKhTVKkAYk
         eAqcLKxHBZKEubi4UsMMBTlys38TZYdzQ1RoNwRZ7qYQqamyn6pG9gfN725/Qq4ewSwD
         AL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAoGw6w4KlL7DQVt7ZsS6OCEJRbgq50upBPjFJ4o4ig=;
        b=uyOApFT2A5XvtkQ4aq6fYILirzdiidZk0NN3422v2e0T6Btz+FOPkrJsOitbvMbyXS
         T0mTCz7LrD9kbaX282FMqk3yaxaIgp8Eh8ne++wj8HzcHm3qGLDpsoWAy0QUE1oHmu8a
         rkTuMwaDm8vr5nPz6oX8wQyjwu8fJpzZjjsWpSqWIZtkSEQLsjCwYg4VhAXFkZp5skXP
         HhEX6ZjhMcYV4IiscIaMu9biwVCsjcAfpWZfG/PG9yEX3UV9eOXB7CMtDsLPy4CF5cLn
         1VxLjAaRM2QXOmGTMmo09YOvNK3ZKvJA5div+dXNGi6t01Cs9yhnRUoPIgmXVZpz190Q
         eD7A==
X-Gm-Message-State: ANoB5pmXesPJEZWR83l/oRAXzkSjN4edUpD9DOXcNgAp1q9zmuICz44V
	Lm/2bkHvl1vgGJhXNXBT+leUA5inA1wV
X-Google-Smtp-Source: AA0mqf5Kgc3bsP9gBxnvcDjksJSsFLESy8wL+H9dz7KepClvv259CCM7hhm9K/74CsCQx0djpkoaoVYlMXAm
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:2107:a1f5:8582:5608])
 (user=irogers job=sendgmr) by 2002:a63:f4b:0:b0:46f:98cf:3bb6 with SMTP id
 11-20020a630f4b000000b0046f98cf3bb6mr1125125pgp.332.1669075924133; Mon, 21
 Nov 2022 16:12:04 -0800 (PST)
Date: Mon, 21 Nov 2022 16:11:24 -0800
In-Reply-To: <20221122001125.765003-1-irogers@google.com>
Message-Id: <20221122001125.765003-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v2 3/4] objtool: Properly support make V=1
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
2.38.1.584.g0f3c55d4c2-goog

