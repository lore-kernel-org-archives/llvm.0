Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6AE153508
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 23:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708127726; cv=none; b=Q5b6HOuUQquLtMX7VuDt5vmrU8hKnObTMm1rq5+oTCr14s3bxTI0LmB3pmHJx8rgTGe84MgAKTScnuVU4fj8FIRGkVeSxDOiNzFJ4G5oN6T6CDg6JTTU+Apyozbaz4St0rXT7Q3Jk+/2TOj2Xy+WCtc5rtVAaUyiASx37bdBkmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708127726; c=relaxed/simple;
	bh=I+UE93RRTXaqRw/ye3XEqbtXPztsO4QkZJrrM8rzem4=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=FzQU/fAkskI+R8Hm4HA+Zq0G4tXtCofqqy9DufhrTIaLavwtRqdyVWWdaeGoePFfX186NpRqaumj8iiREeMHamJuNX1Ke3e9K6G//V5QV6YVxuaLLrarNw2vD38Z3FzE0dbChfuQJ8FAui4W7wlMGX2TQogi63vtRbkNulhIa8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OvAce+yx; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OvAce+yx"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-607efc8e173so18861307b3.3
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 15:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708127724; x=1708732524; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDoXWFUllq5r9qvxHaqqdOtetQC7wmYhYSm0N03NFTM=;
        b=OvAce+yxM+XwZDLh6+XLO+Oh2u6sbBZuYStu1/qixqMrUwoyMX0w2eHBhymzsXlVIe
         7gM7JSU2qHdcRv/jDKFUW1xo93fhlmaKoDcS5+6xSQPzFzLfJSE4ZGhSfTVVpFlJK1hp
         OamlkrtwmF/XVmujl73RYiEij0YDmF+Zvrt/i22nZHGaAR1cgSlmuJrCFqZgr+h5MFKu
         uiez6LXaDapSCvFkVgiwR/LA3Tu+IuZK5Y9gBO18zkWWXCLqLMKSn3kJcRkMMgKKUKvV
         MUYR/idvxtzrBet1dU8N9p3TTHu/erWr5A5M3O8FgSu//uqAjYawtfPOpKX1xWNiHBJG
         WZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708127724; x=1708732524;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDoXWFUllq5r9qvxHaqqdOtetQC7wmYhYSm0N03NFTM=;
        b=Ece7LaRLXug9Ve5n5/Viyrq9e2YQzZabNUKV3XPZDuZB+V3gugOXEtAcrFoeSpZjAv
         +2Mx/ThWY6pK6X5S8IIDDPynKYeySV6l3XIj4/y1EFdlh1Dfhw1YKZmG/FdaYrX3bLnF
         ETBQTmdlqNzHs4EIwLqewbX2Xwh7H0tF4vS2LKppGVArNIvY6ZSF03KkDgd7olp4sYJh
         dVGGtgrNBD4c1m27ukQufbh2ASgPex/ozavFos39uIIGbcijTa+nkwa3dlTze2ME6nvx
         TXovjbm/6v/P61GTKGooqJ3PYTlyNlLKfIHvdNlDhEUgs4ZJiqNwdZ1cPXssbe76tAxd
         MliQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGSgUzdhEhDbFOsf+CI+fRNkuXxhf0M4GI3uMKA61sTpZvyoRl3AviVseQWKOsxgE9zPwbvfpIxfOLnWRtBkxKrds5UQ==
X-Gm-Message-State: AOJu0YxtC3wx+4xF/PsMwycHcwkNQCVutZup7g4me/qBLHro42zJwCnl
	MXq7NBopG0EY21xZupZOPGKR0PWt+Nh/g0gFim+dz+FdaBJd7PN8Y6m3iDll1Sly+6CNFPprIki
	9YpdoJA==
X-Google-Smtp-Source: AGHT+IHjzJawXDO2AXJXaejQYAiOMaUrWyEtn27ViDkJQiFti66UFA6r7CcCoH/bmb67Eb7eiXG+oRMQM2AD
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4b5c:352:4272:e34e])
 (user=irogers job=sendgmr) by 2002:a0d:db4b:0:b0:607:81e1:8b83 with SMTP id
 d72-20020a0ddb4b000000b0060781e18b83mr1157396ywe.8.1708127724036; Fri, 16 Feb
 2024 15:55:24 -0800 (PST)
Date: Fri, 16 Feb 2024 15:51:59 -0800
In-Reply-To: <20240216235203.229256-1-irogers@google.com>
Message-Id: <20240216235203.229256-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240216235203.229256-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v5 5/8] perf test: Rename builtin-test-list and add missed
 header guard
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

builtin-test-list is primarily concerned with shell script
tests. Rename the file to better reflect this and add a missed header
guard.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/Build                                    | 2 +-
 tools/perf/tests/builtin-test.c                           | 2 +-
 tools/perf/tests/{builtin-test-list.c => tests-scripts.c} | 2 +-
 tools/perf/tests/{builtin-test-list.h => tests-scripts.h} | 4 ++++
 4 files changed, 7 insertions(+), 3 deletions(-)
 rename tools/perf/tests/{builtin-test-list.c => tests-scripts.c} (99%)
 rename tools/perf/tests/{builtin-test-list.h => tests-scripts.h} (79%)

diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 53ba9c3e20e0..c7f9d9676095 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 perf-y += builtin-test.o
-perf-y += builtin-test-list.o
+perf-y += tests-scripts.o
 perf-y += parse-events.o
 perf-y += dso-data.o
 perf-y += attr.o
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 4a5973f9bb9b..eff3c62e9b47 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -29,7 +29,7 @@
 #include <subcmd/exec-cmd.h>
 #include <linux/zalloc.h>
 
-#include "builtin-test-list.h"
+#include "tests-scripts.h"
 
 static bool dont_fork;
 const char *dso_to_test;
diff --git a/tools/perf/tests/builtin-test-list.c b/tools/perf/tests/tests-scripts.c
similarity index 99%
rename from tools/perf/tests/builtin-test-list.c
rename to tools/perf/tests/tests-scripts.c
index a65b9e547d82..4ebd841da05b 100644
--- a/tools/perf/tests/builtin-test-list.c
+++ b/tools/perf/tests/tests-scripts.c
@@ -15,7 +15,7 @@
 #include <sys/wait.h>
 #include <sys/stat.h>
 #include "builtin.h"
-#include "builtin-test-list.h"
+#include "tests-scripts.h"
 #include "color.h"
 #include "debug.h"
 #include "hist.h"
diff --git a/tools/perf/tests/builtin-test-list.h b/tools/perf/tests/tests-scripts.h
similarity index 79%
rename from tools/perf/tests/builtin-test-list.h
rename to tools/perf/tests/tests-scripts.h
index eb81f3aa6683..3a3ec6191848 100644
--- a/tools/perf/tests/builtin-test-list.h
+++ b/tools/perf/tests/tests-scripts.h
@@ -1,4 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef TESTS_SCRIPTS_H
+#define TESTS_SCRIPTS_H
 
 struct script_file {
 	char *dir;
@@ -10,3 +12,5 @@ struct script_file {
 const struct script_file *list_script_files(void);
 /* Get maximum width of description string */
 int list_script_max_width(void);
+
+#endif /* TESTS_SCRIPTS_H */
-- 
2.44.0.rc0.258.g7320e95886-goog

