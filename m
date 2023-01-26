Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BB44C92
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 19:07:22 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-506368dc06dso30074127b3.9
        for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 11:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qJcEY+ZX+KD+dakVj5PWdl1/U84NI1vMkfserB11IU=;
        b=VBuKku8BGWTkhWFizWHyyhUjws2wNvltFz3NGcXto9JQYc64mPSLQpHRQmInfxQdrH
         /iK978K8qVY2ui7retQHnfBzrH+rwZ+XmdnBZJmd2iEEazJPCaze9LWAlMqR2++yJLUO
         bz5PujbGBMPAklGyFoIr73HThaY118yfD3kcQkFHL1Rcrs9feLoyXDaQLGokfVRXcwN6
         dxrAZIcpPuFgzX05bfzbZ4xXomN7k1XtTSICMep8lQ132PPjbZVv+6cxC7BsEAZ3B0nx
         7GAENPXEyyOirEF0yLNNsewj/5geTHVosmTTISsuLGCYokw5E+jmI/PGOcXm8/ebM1BB
         Pz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qJcEY+ZX+KD+dakVj5PWdl1/U84NI1vMkfserB11IU=;
        b=2jeRCw/1y29C7ox2x6p+e1dsXyRTHaMN2RE+XKsMYucRBFAGmO4grZ4fsjhGwNBhI5
         11/LjmKMpRsB4oFBWiHKDi+wzU1KsE9mCDDISnxSOCjUP58BStHli9QIroLeAZw+Bjbh
         fhXVD4F02hjZReqMaqWtSdVT3NbEHzAdZ0EAwx7WNaJcE2Pu4YU5B/FwslzyP4WYXvjy
         AM2PEVzb1D0DwJk4b+DlkKJD+cf/KssUoydNAkXM8u8Bbbsow6y84Y47FEfOnu7uNPtZ
         3yz1cIu3H0nX3+XgN4zVLHHEC3Gt8ct8cF/wFtxMF5VxOZSllENKMbM6jcP54R8v4V0G
         u4pg==
X-Gm-Message-State: AFqh2krYkRolLZ72JYv2I682XarPHhX9Yr4udzbiwEcfwO3slixBfv5d
	f+3cDO/7W23l9D8BeFYMmfpbMzq/v0jv
X-Google-Smtp-Source: AMrXdXv8TJ3rPCwa3wVZ7YApAJ0g0saNF9wIGtAze1pHV7rFkK09vJ616P0Gbuqe3EVoKsGLKVVOIs3kXdA8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a0d:eec6:0:b0:4d6:5735:dbfd with SMTP id
 x189-20020a0deec6000000b004d65735dbfdmr4440830ywe.157.1674760041142; Thu, 26
 Jan 2023 11:07:21 -0800 (PST)
Date: Thu, 26 Jan 2023 11:06:05 -0800
In-Reply-To: <20230126190606.40739-1-irogers@google.com>
Message-Id: <20230126190606.40739-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230126190606.40739-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 2/3] objtool: Properly support make V=1
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
index 0bfdb9da8729..f0651eac06e6 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -45,6 +45,12 @@ CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
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
@@ -56,18 +62,18 @@ export srctree OUTPUT CFLAGS SRCARCH AWK
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
 		DESTDIR=$(LIBSUBCMD_OUTPUT) prefix= subdir= \
 		$@ install_headers
 
-- 
2.39.1.456.gfc5497dd1b-goog

