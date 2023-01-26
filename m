Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C314C92
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 19:07:29 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id n194-20020a2540cb000000b008038647d9ebso2863694yba.5
        for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 11:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2pcP69LZTMAGIqNu0kBA1pDv1CbJMJ6T2ufALbnNrU=;
        b=pXe/uQ1qDwqsEkXeC8cn2A3Ig5yiMlN2CYSEtYX66/pwv/plFMLJJ+/g5ihcr0bNNg
         l3NUR0pa1SPKeTLGI5HEs5SOD6k7dIH+H62DdoJShBp1QdJDzXFbgNfhjygVhQcVfLro
         OYc2ok/D5SlYyhkWCP3gaOI12wN5sXvoIZJwR1oY03stXoOJk3d5nru1KuoNFxlBbb9o
         KrHER9mbu8XcfF7erXoH8hgx/0vt1r2Bo6iMFFzYWrAnvqz9A7Tl1vnlpxEow3QXbNUY
         3K8Z3t6XNvFZ3ZeixA8FtLKUKF9qxT7jwZB6tbHbZDPigop7U/YPuS6APny/iAe5s93y
         SkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2pcP69LZTMAGIqNu0kBA1pDv1CbJMJ6T2ufALbnNrU=;
        b=Rn/nany33teK7VY3RERPx3DEEdjT/YmCwdIFbDFvJilyRDzi4w/wPxf7aKzGfIt2FI
         IoIyAHjBPcpxbyI+fQyus8gIZVA59YlvGkiqX32DRMnIlNnqmYxML4O3fdB1+OZghWGM
         s3mjfKxaSpSpaR9N5byA7RCcXY+FXJhYyHXo+5+2k1xYgASQVQtMtspsvAaxdH7mMmoZ
         PFVCMRxrMQqke/0bBShwwM/OoX7LF8AKo4s1sPhEOw50Y6nKMZqSA7WkrwXzuW+TxTyk
         s5yMzY7qo/3rjF0T3HRDujqGhVh3ccEzJ6RXqRcxqw6H7hpRSQkzBU2HBkLQBe+cNsaJ
         uQyQ==
X-Gm-Message-State: AFqh2koHU8mRAt11erk3Laxj5XaEOVwJWYt1hydQt6MQRR8HKfS92BCh
	/mZc8SJdi/3QNuDezbSRo8hY36iGs5g4
X-Google-Smtp-Source: AMrXdXvSzGwKZ8nnO2G1/GyZ8RLzPyBqRL0rlrAoXXb/Xt4w3MTDSafE+fiH/pRHfQ4J+/s9TSQUoOhPqYPk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a81:ee03:0:b0:4ec:8f55:59f7 with SMTP id
 l3-20020a81ee03000000b004ec8f5559f7mr4315545ywm.317.1674760049111; Thu, 26
 Jan 2023 11:07:29 -0800 (PST)
Date: Thu, 26 Jan 2023 11:06:06 -0800
In-Reply-To: <20230126190606.40739-1-irogers@google.com>
Message-Id: <20230126190606.40739-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230126190606.40739-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 3/3] objtool: Alter how HOSTCC is forced
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
flags (like CFLAGS) are set assuming say CC is gcc, but then it can be
later set to HOSTCC which may be clang. tools/scripts/Makefile.include
is needed for host set up and common macros in objtool's
Makefile. Rather than override the CC variable to HOSTCC, just pass CC
as HOSTCC to the sub-makes of Makefile.build, the libsubcmd builds and
also to the linkage step.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/Makefile | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index f0651eac06e6..bbf8ec440430 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -2,11 +2,6 @@
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
@@ -34,13 +29,18 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/objtool/include \
 	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
 	    -I$(LIBSUBCMD_OUTPUT)/include
+# Note, EXTRA_WARNINGS here was determined for CC and not HOSTCC, it
+# is passed here to match a legacy behavior.
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
-CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
-LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
+OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
+OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
+OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
+
+# Always want host compilation.
+HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
 
 AWK = awk
 MKDIR = mkdir
@@ -63,10 +63,12 @@ include $(srctree)/tools/build/Makefile.include
 
 $(OBJTOOL_IN): fixdep FORCE
 	$(Q)$(CONFIG_SHELL) ./sync-check.sh
-	$(Q)$(MAKE) $(build)=objtool
+	$(Q)$(MAKE) $(build)=objtool $(HOST_OVERRIDES) CFLAGS="$(OBJTOOL_CFLAGS)" \
+		LDFLAGS="$(OBJTOOL_LDFLAGS)"
+
 
 $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
-	$(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
+	$(QUIET_LINK)$(HOSTCC) $(OBJTOOL_IN) $(OBJTOOL_LDFLAGS) -o $@
 
 
 $(LIBSUBCMD_OUTPUT):
@@ -75,6 +77,7 @@ $(LIBSUBCMD_OUTPUT):
 $(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
 	$(Q)$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
 		DESTDIR=$(LIBSUBCMD_OUTPUT) prefix= subdir= \
+		$(HOST_OVERRIDES) EXTRA_CFLAGS="$(OBJTOOL_CFLAGS)" \
 		$@ install_headers
 
 $(LIBSUBCMD)-clean:
-- 
2.39.1.456.gfc5497dd1b-goog

