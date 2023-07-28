Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827CC2D5
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:49:54 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-573cacf4804so18929627b3.1
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690526994; x=1691131794;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kv5zMq7Gf+E/mq3KI9mmBvkyfhWn6r0mf6FnCBupmRU=;
        b=l4MYYbki/hukDreSiqPgSSi7kqT1I0MQAIIMZIRxKVi/gAKLP++vvsd3ohOTx5Peii
         fqJRbuy+r7VsxO2l6XzHudVyls1bul7gFWrwlg4Rytz7DH8HyH9gSFhKJaR9boqxH5vf
         tQfuU5hcGl/o9sWuVE9WVfiAGOTqTKTExEQBqUE387gTXbEcKWPa8knk8egaau1z8RJ5
         vo6VhoZfucWIvZZld14uFMpRpXPex78nOuYY+HlH6yuU4IhsIMPIUUG5/GjQBsL95wLy
         W8JKCHqR1HtA8ERSKiqVL7z9rAR1bnYFcooC/jmcbIeA1w6HhuY7zkKABT+erQaA7juD
         1jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526994; x=1691131794;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv5zMq7Gf+E/mq3KI9mmBvkyfhWn6r0mf6FnCBupmRU=;
        b=aV9O9N7TLJbOAboCjmmUbATrBCqYbCqgdzrjL6zMqfpSYbowdTmcd1RCdlXB09yo5Z
         /elDiE4a3cVlWrKOrnPjIAltX7CPy7nb0w8V7ysPyIe8stlwxgpnQ3VSWy1MYw/dDN6X
         XHUxbRDMH7NJSl+GL9o4bK7u3s1s4Bsvc/XVvx/conh4WfpA8PTBjQthtfOFeu7kWi+J
         7YT9u/qpgC7/GHya+GUlBSk5QpXpyyVv0FTADvth+SwTyJwyJvEB3mzPZrmY/wLoQoL6
         G65F2O5hx2jo+4u4BB4LxtscpPT+vbTTovwyYxOGAdzKnnjjiCw5J5HMngBLp8siDWN6
         6Lbg==
X-Gm-Message-State: ABy/qLbeDgHvxsa4/T7np7PdAe601XB2lVM1wZpFyLYJ00OpqloF1Pcy
	FDrdEMKilAW57m0cN5mcwQDGzXl00ZQE
X-Google-Smtp-Source: APBJJlHSjc/IT1qlh3DupBROZRiA34CttLjbZ/ikQplvXR7TLxlgSKa9DNC7fbAHgw/FKUsK9regMJwIlwEM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3d03:ff18:af30:2dad])
 (user=irogers job=sendgmr) by 2002:a25:d613:0:b0:d12:d6e4:a08d with SMTP id
 n19-20020a25d613000000b00d12d6e4a08dmr4686ybg.7.1690526993885; Thu, 27 Jul
 2023 23:49:53 -0700 (PDT)
Date: Thu, 27 Jul 2023 23:49:16 -0700
In-Reply-To: <20230728064917.767761-1-irogers@google.com>
Message-Id: <20230728064917.767761-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230728064917.767761-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 5/6] perf build: Disable fewer bison warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Rob Herring <robh@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

If bison is version 3.8.2, reduce the number of bison C warnings
disabled. Earlier bison versions have all C warnings disabled. Avoid
implicit declarations of yylex by adding the declaration in the C
file. A header can't be included as a circular dependency would occur
due to the lexer using the bison defined tokens.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build          | 6 +++---
 tools/perf/util/bpf-filter.y   | 2 ++
 tools/perf/util/expr.y         | 4 +++-
 tools/perf/util/parse-events.y | 1 +
 tools/perf/util/pmu.y          | 3 +++
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 32239c4b0393..20aa8545b127 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -291,9 +291,9 @@ CFLAGS_expr-flex.o          += $(flex_flags)
 CFLAGS_bpf-filter-flex.o    += $(flex_flags)
 
 bison_flags := -DYYENABLE_NLS=0
-BISON_GE_35 := $(shell expr $(shell $(BISON) --version | grep bison | sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\)/\1\2/g') \>\= 35)
-ifeq ($(BISON_GE_35),1)
-  bison_flags += -Wno-unused-parameter -Wno-nested-externs -Wno-implicit-function-declaration -Wno-switch-enum -Wno-unused-but-set-variable -Wno-unknown-warning-option
+BISON_GE_382 := $(shell expr $(shell $(BISON) --version | grep bison | sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\).\([0-9]\+\)/\1\2\3/g') \>\= 382)
+ifeq ($(BISON_GE_382),1)
+  bison_flags += -Wno-switch-enum
 else
   bison_flags += -w
 endif
diff --git a/tools/perf/util/bpf-filter.y b/tools/perf/util/bpf-filter.y
index 07d6c7926c13..5dfa948fc986 100644
--- a/tools/perf/util/bpf-filter.y
+++ b/tools/perf/util/bpf-filter.y
@@ -9,6 +9,8 @@
 #include <linux/list.h>
 #include "bpf-filter.h"
 
+int perf_bpf_filter_lex(void);
+
 static void perf_bpf_filter_error(struct list_head *expr __maybe_unused,
 				  char const *msg)
 {
diff --git a/tools/perf/util/expr.y b/tools/perf/util/expr.y
index dd504afd8f36..65d54a6f29ad 100644
--- a/tools/perf/util/expr.y
+++ b/tools/perf/util/expr.y
@@ -7,6 +7,8 @@
 #include "util/debug.h"
 #define IN_EXPR_Y 1
 #include "expr.h"
+#include "expr-bison.h"
+int expr_lex(YYSTYPE * yylval_param , void *yyscanner);
 %}
 
 %define api.pure full
@@ -56,7 +58,7 @@
 static void expr_error(double *final_val __maybe_unused,
 		       struct expr_parse_ctx *ctx __maybe_unused,
 		       bool compute_ids __maybe_unused,
-		       void *scanner,
+		       void *scanner __maybe_unused,
 		       const char *s)
 {
 	pr_debug("%s\n", s);
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index 454577f7aff6..251b7d2fde32 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -20,6 +20,7 @@
 #include "parse-events.h"
 #include "parse-events-bison.h"
 
+int parse_events_lex(YYSTYPE * yylval_param, YYLTYPE * yylloc_param , void *yyscanner);
 void parse_events_error(YYLTYPE *loc, void *parse_state, void *scanner, char const *msg);
 
 #define PE_ABORT(val) \
diff --git a/tools/perf/util/pmu.y b/tools/perf/util/pmu.y
index dff4e892ac4d..3d46cca3bb94 100644
--- a/tools/perf/util/pmu.y
+++ b/tools/perf/util/pmu.y
@@ -11,6 +11,9 @@
 #include <linux/bitmap.h>
 #include <string.h>
 #include "pmu.h"
+#include "pmu-bison.h"
+
+int perf_pmu_lex(YYSTYPE * yylval_param , void *yyscanner);
 
 #define ABORT_ON(val) \
 do { \
-- 
2.41.0.487.g6d72f3e995-goog

