Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3960426ECF;
	Tue, 16 Jun 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604903; cv=none; b=bg8snOnzdnzr5IcoKITXJT1nqBpEKo/IFW5OkcGdHKw71KwPwI1v+LEcJ/XS1KaZYW1Z8xX7BIFHoIWu95SbwNSgcPgiHP7QsXLQtXC6/lDa1yUsM+zZntWXbjZNrpnWfSY3gKs82X62z0G47SaAFVrEuLGY6FcgC8d7v7Loh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604903; c=relaxed/simple;
	bh=vohfUgaAavGzKwL2ZfLaCuyUOFA7VdBKdu/gx+KJRYg=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=KamLY8mjB2HLPEGzLRh15lXohhVo4olXy9BqLqkDQaTWqejgij4Jed1SODP0xsL+fRXozOBZhBbKm7TpQL1jIrlph20GMOn8CtFBAxtBHHR/5d68JIibbuLFSOTorgQXwzpI9c16fa3DUKCGHX5Fcy4pV5kbn2tH11nY5We06ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QcP295m+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QcP295m+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4071F00A3A;
	Tue, 16 Jun 2026 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781604901;
	bh=iHC/MrvUuJHahbtXQShqpsakBXps0UPMmItqZZx/2js=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=QcP295m+kqidmcmdgnfFW2IAEdO/Hd0DcFT4JPJ15nSuCJsfNUHGV2Ct90WxSDKxs
	 /YKEMeunnvoU9Ug4FgDD73b6BV/zsfRorDsnihZoy5RjJH2KnryxewbolfqMSDFQD0
	 pvxMJPYhIILKlNsYPBYpjN+Fv0NyBOb2FCQSTImI=
Subject: Patch "perf build: Disable fewer bison warnings" has been added to the 6.1-stable tree
To: acme@kernel.org,acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,andrii@kernel.org,bcm-kernel-feedback-list@broadcom.com,cuigaosheng1@huawei.com,eddyz87@gmail.com,florian.fainelli@broadcom.com,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,kan.liang@linux.intel.com,llvm@lists.linux.dev,mark.rutland@arm.com,mingo@redhat.com,namhyung@kernel.org,nathan@kernel.org,ndesaulniers@google.com,peterz@infradead.org,robh@kernel.org,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 15:43:44 +0530
In-Reply-To: <20260520163320.3073037-4-florian.fainelli@broadcom.com>
Message-ID: <2026061643-chase-muppet-0df4@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    perf build: Disable fewer bison warnings

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-build-disable-fewer-bison-warnings.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-250206-greg=kroah.com@vger.kernel.org Wed May 20 22:58:58 2026
From: Florian Fainelli <florian.fainelli@broadcom.com>
Date: Wed, 20 May 2026 09:33:18 -0700
Subject: perf build: Disable fewer bison warnings
To: stable@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Tom Rix <trix@redhat.com>, bpf@vger.kernel.org, llvm@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), linux-kernel@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), bcm-kernel-feedback-list@broadcom.com
Message-ID: <20260520163320.3073037-4-florian.fainelli@broadcom.com>

From: Ian Rogers <irogers@google.com>

commit ddc8e4c966923ad1137790817157c8a5f0301aec upstream

If bison is version 3.8.2, reduce the number of bison C warnings
disabled. Earlier bison versions have all C warnings disabled. Avoid
implicit declarations of yylex by adding the declaration in the C
file. A header can't be included as a circular dependency would occur
due to the lexer using the bison defined tokens.

Committer notes:

Some recent versions of gcc and clang (noticed on Alpine Linux 3.17,
edge, clearlinux, fedora 37, etc.

Signed-off-by: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Tom Rix <trix@redhat.com>
Cc: bpf@vger.kernel.org
Cc: llvm@lists.linux.dev
Link: https://lore.kernel.org/r/20230728064917.767761-6-irogers@google.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
[florian: Remove non-existent tools/perf/util/bpf-filter.y in 6.1.y]
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Change-Id: I62327ddbe816008197053a9234a92d9c253a2c5d
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/Build          |   12 ++++++++----
 tools/perf/util/expr.y         |    4 +++-
 tools/perf/util/parse-events.y |    1 +
 tools/perf/util/pmu.y          |    3 +++
 4 files changed, 15 insertions(+), 5 deletions(-)

--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -269,10 +269,14 @@ CFLAGS_parse-events-flex.o  += $(flex_fl
 CFLAGS_pmu-flex.o           += $(flex_flags)
 CFLAGS_expr-flex.o          += $(flex_flags)
 
-bison_flags := -DYYENABLE_NLS=0
-BISON_GE_35 := $(shell expr $(shell $(BISON) --version | grep bison | sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\)/\1\2/g') \>\= 35)
-ifeq ($(BISON_GE_35),1)
-  bison_flags += -Wno-unused-parameter -Wno-nested-externs -Wno-implicit-function-declaration -Wno-switch-enum -Wno-unused-but-set-variable -Wno-unknown-warning-option
+# Some newer clang and gcc version complain about this
+# util/parse-events-bison.c:1317:9: error: variable 'parse_events_nerrs' set but not used [-Werror,-Wunused-but-set-variable]
+#  int yynerrs = 0;
+
+bison_flags := -DYYENABLE_NLS=0 -Wno-unused-but-set-variable
+BISON_GE_382 := $(shell expr $(shell $(BISON) --version | grep bison | sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\).\([0-9]\+\)/\1\2\3/g') \>\= 382)
+ifeq ($(BISON_GE_382),1)
+  bison_flags += -Wno-switch-enum
 else
   bison_flags += -w
 endif
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
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -20,6 +20,7 @@
 #include "parse-events.h"
 #include "parse-events-bison.h"
 
+int parse_events_lex(YYSTYPE * yylval_param, YYLTYPE * yylloc_param , void *yyscanner);
 void parse_events_error(YYLTYPE *loc, void *parse_state, void *scanner, char const *msg);
 
 #define ABORT_ON(val) \
--- a/tools/perf/util/pmu.y
+++ b/tools/perf/util/pmu.y
@@ -9,6 +9,9 @@
 #include <linux/bitmap.h>
 #include <string.h>
 #include "pmu.h"
+#include "pmu-bison.h"
+
+int perf_pmu_lex(void);
 
 #define ABORT_ON(val) \
 do { \


Patches currently in stable-queue which might be from florian.fainelli@broadcom.com are

queue-6.1/perf-build-remove-wno-unused-but-set-variable-from-the-flex-flags-when-building-with-clang-13.0.0.patch
queue-6.1/perf-build-conditionally-define-ndebug.patch
queue-6.1/perf-parse-events-make-yydebug-dependent-on-doing-a-debug-build.patch
queue-6.1/perf-build-disable-fewer-bison-warnings.patch
queue-6.1/tools-build-add-3-component-logical-version-comparators.patch
