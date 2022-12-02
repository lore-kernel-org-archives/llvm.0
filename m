Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC07B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 04:58:15 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 80-20020a250b53000000b006eacc13c38eso3309409ybl.0
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 20:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5iWxq/u3wHgDjVSNkc7auJpnDIRbf8fSfDG5v5JG7J0=;
        b=p5G2cwctgiaHhOcKEGfHNn3gkiZX+7RGSihGS9CjLhPobraLLQn/xF4fLzjZFXt/66
         0W7AeLNNPkWL3AjPRBR7m5+YjiguiI3aRQLD7By6QccvylAS8F+Ppio/3BN+HMetCk7s
         d9tU9f7dFgGC03PLjmZ4wUm6/NrAe29aVLu9qabVlcNXZBWSE3GDYGYqdOuldZt2oe5e
         cPABFaPehhIn3cYz98skSYGWVGrLW5jk3HR9jFJwR3icauA41Qa+LwrJBHdARW1atu38
         KB3kw9ZyAPwPxE+oHsfjXMJfWj16JeX+7UepBi42JfVxnvOLeFgTTpzqg+V07F20tfZg
         LYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5iWxq/u3wHgDjVSNkc7auJpnDIRbf8fSfDG5v5JG7J0=;
        b=ncaF54kYeSFBcQcIOnD9emtdGdnBb9/aQJ3Pw6LMh6TtYXpwr96p7a0KW+4lXwvyKW
         tpie1DJe/pVa193RchAQ1rOrLO0bKty/0WlmvU8t5P7cWWvPPVBrOCW3osddtWWeaKI5
         jFGnoLUVqAIB69Hzo/EmofCVfvgKofyaCnqFZFK+mT6Uo6LhTiJsvXFCaSMNGThyLVu0
         8oxND71g7AgRMd6fjUz/gRfODXIR5xssdw/8OBH9eDmedXxPIgj8si+igTtyoOx12PeA
         9C8ZLuDhw8Wjrj+MG2P+dMTFbJjVIFRFggCbai+g64CgWyktZYEgysAcCFXH0ovEAwiz
         kNSQ==
X-Gm-Message-State: ANoB5plilil7Bfi4ELtLjfU/AN91DNNAPNZYKaESMgdm5XjV9nOD+hKK
	47Shtwz5VPlXkptDlK0i7BGlHORVIOKx
X-Google-Smtp-Source: AA0mqf6Txc45owdcurSb9SkQpULmrEIO3kNLEV9vM2kVhF6t85yIOOogSM+LeckRANUQOiP9fRxokITuZ0eS
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:e3b0:e3d1:6040:add2])
 (user=irogers job=sendgmr) by 2002:a25:7042:0:b0:6f1:8895:e769 with SMTP id
 l63-20020a257042000000b006f18895e769mr37756823ybc.390.1669957094634; Thu, 01
 Dec 2022 20:58:14 -0800 (PST)
Date: Thu,  1 Dec 2022 20:57:40 -0800
In-Reply-To: <20221202045743.2639466-1-irogers@google.com>
Message-Id: <20221202045743.2639466-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221202045743.2639466-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Subject: [PATCH 2/5] tools lib perf: Add dependency test to install_headers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Compute the headers to be installed from their source headers and make
each have its own build target to install it. Using dependencies
avoids headers being reinstalled and getting a new timestamp which
then causes files that depend on the header to be rebuilt.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/perf/Makefile | 43 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/tools/lib/perf/Makefile b/tools/lib/perf/Makefile
index a90fb8c6bed4..30b7f91e7147 100644
--- a/tools/lib/perf/Makefile
+++ b/tools/lib/perf/Makefile
@@ -176,10 +176,10 @@ define do_install_mkdir
 endef
 
 define do_install
-	if [ ! -d '$(DESTDIR_SQ)$2' ]; then             \
-		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$2'; \
-	fi;                                             \
-	$(INSTALL) $1 $(if $3,-m $3,) '$(DESTDIR_SQ)$2'
+	if [ ! -d '$2' ]; then             \
+		$(INSTALL) -d -m 755 '$2'; \
+	fi;                                \
+	$(INSTALL) $1 $(if $3,-m $3,) '$2'
 endef
 
 install_lib: libs
@@ -187,23 +187,24 @@ install_lib: libs
 		$(call do_install_mkdir,$(libdir_SQ)); \
 		cp -fpR $(LIBPERF_ALL) $(DESTDIR)$(libdir_SQ)
 
-install_headers:
-	$(call QUIET_INSTALL, libperf_headers) \
-		$(call do_install,include/perf/bpf_perf.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/core.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/cpumap.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/threadmap.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/evlist.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/evsel.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/event.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/perf/mmap.h,$(prefix)/include/perf,644); \
-		$(call do_install,include/internal/cpumap.h,$(prefix)/include/internal,644); \
-		$(call do_install,include/internal/evlist.h,$(prefix)/include/internal,644); \
-		$(call do_install,include/internal/evsel.h,$(prefix)/include/internal,644); \
-		$(call do_install,include/internal/lib.h,$(prefix)/include/internal,644); \
-		$(call do_install,include/internal/mmap.h,$(prefix)/include/internal,644); \
-		$(call do_install,include/internal/threadmap.h,$(prefix)/include/internal,644); \
-		$(call do_install,include/internal/xyarray.h,$(prefix)/include/internal,644);
+HDRS := bpf_perf.h core.h cpumap.h threadmap.h evlist.h evsel.h event.h mmap.h
+INTERNAL_HDRS := cpumap.h evlist.h evsel.h lib.h mmap.h threadmap.h xyarray.h
+
+INSTALL_HDRS_PFX := $(DESTDIR)$(prefix)/include/perf
+INSTALL_HDRS := $(addprefix $(INSTALL_HDRS_PFX)/, $(HDRS))
+INSTALL_INTERNAL_HDRS_PFX := $(DESTDIR)$(prefix)/include/internal
+INSTALL_INTERNAL_HDRS := $(addprefix $(INSTALL_INTERNAL_HDRS_PFX)/, $(INTERNAL_HDRS))
+
+$(INSTALL_HDRS): $(INSTALL_HDRS_PFX)/%.h: include/perf/%.h
+	$(call QUIET_INSTALL, $@) \
+		$(call do_install,$<,$(INSTALL_HDRS_PFX)/,644)
+
+$(INSTALL_INTERNAL_HDRS): $(INSTALL_INTERNAL_HDRS_PFX)/%.h: include/internal/%.h
+	$(call QUIET_INSTALL, $@) \
+		$(call do_install,$<,$(INSTALL_INTERNAL_HDRS_PFX)/,644)
+
+install_headers: $(INSTALL_HDRS) $(INSTALL_INTERNAL_HDRS)
+	$(call QUIET_INSTALL, libperf_headers)
 
 install_pkgconfig: $(LIBPERF_PC)
 	$(call QUIET_INSTALL, $(LIBPERF_PC)) \
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

