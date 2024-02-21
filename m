Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798F73A8C9
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486937; cv=none; b=qd00O7kCPk/67zJUrXBAEN7PKkPP99sClTBYAIMw16uTifJctBkFoM0A3zlAfyJZ+ABzn87J6QKAoS6W/V/QXJlAKcWxA+1Vfg1t/KdUsM/Ay+FwWdliHI0c+2OgnQLQZz70sd6Kvd/B153fGAyMqO6MAcUFeUa1ij04REvDG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486937; c=relaxed/simple;
	bh=I+UE93RRTXaqRw/ye3XEqbtXPztsO4QkZJrrM8rzem4=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=Rp3lxFwEwfDnNAF18kkoQ1q1KGKS4AlslL3tm8NfpVwd53srPca6qqgZmXXdxcWIQaSdU4OQgO2aOYPVMQWrPkuGQCETrqm4oJzmpzj2G4xC1sIbLcA6J+KBihzS33FhUBMG4jiQBGaoUgGKouJ4BabbqA2qJgdyOux9rVJJOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZibCTVX; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZibCTVX"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607a628209eso111636237b3.3
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 19:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486934; x=1709091734; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDoXWFUllq5r9qvxHaqqdOtetQC7wmYhYSm0N03NFTM=;
        b=tZibCTVXO1JOwBzhQ1P+7GqpEr2LbRp79rtDLUQo+trwk53BcA+kJOPDoaHoGaH1KE
         buQnwCtBPI039pTA19IVBtqmibAeJ/yJB8YmGart9arRjamj/muAT2+cGdT8ir9ECF28
         tWhiqnFev/KD5wdLqWED4rp8MFTxldfWWsuR04se41V4oKlS5QvNfb/S12tLxb3e5tp9
         PBU6D+8E0sdGtzUDmfqOET8PWsNV/+7Kt+ItGVXs6Ls567Mp6MZNxGqAqMa2BkczEYRA
         Y+svdmuqeydRjmb0RpkVSxDBycMzkMMEmqmVRZ5k0lG7Mgypv2Vb9XLozj9Qc+a77urB
         H/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486934; x=1709091734;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDoXWFUllq5r9qvxHaqqdOtetQC7wmYhYSm0N03NFTM=;
        b=WSGlIG6cVESMnTl6lrLStO90U8v11D6LdK8ys43ZbNQmi4QGA1OdgH4tW+nDkew726
         MhzXKpwKed6ua9d4v3WatowXmzkweICWjaSgIyATDCPnfJoSV4nLMhfTaWD7icGREKas
         rN2AR6KU5HWFpDVsISSb5zdu8E9Qd+7cBV24qN2xiVvjg4pRjslOPiELxGvTOmXqPS/q
         ur0mDQhdjhMWVpiA2dLDx2MxGOHOg7iFO2OByuHI/WHYIK8sqjSLPRaCvi9DFa87J9WE
         k4KRwY29MEGlv/5dnJQMLqGQGBDxMFoPBeyFeUD4HQAynB1bTQA9afaU1oTnnI/mP2FK
         N6VA==
X-Forwarded-Encrypted: i=1; AJvYcCUfTpWzzJRjAX1NX7UiiUXyxI3npinn0LvHGlFddb6A+Kt5FMsV6ghTVnSM3/AMsYxXSf+OT7ojnbiL8HmChhUKwHviDw==
X-Gm-Message-State: AOJu0YyYHtAAWhjJ5aAVmnXkNC9+8ZPCJqyMMUt8ubeufYv3DJuSa8vi
	Iit4W8KcDzM5myf/oKlARlBBcBLOpYs5G4e+/TWUmmak3iA7AW8eXiJBUAgXH5eY+mAebFEQJHJ
	13F2BVA==
X-Google-Smtp-Source: AGHT+IEKcmdKTjHr2xWWJkj/LRomPZ1pY+pgf9xS7sna0/bb350+idRqAo6Uz+mbnsKjTAEDSZ8CywccCPNe
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3c02:f882:5876:b7ab])
 (user=irogers job=sendgmr) by 2002:a81:f008:0:b0:607:f6f0:bdca with SMTP id
 p8-20020a81f008000000b00607f6f0bdcamr3613089ywm.7.1708486934605; Tue, 20 Feb
 2024 19:42:14 -0800 (PST)
Date: Tue, 20 Feb 2024 19:41:52 -0800
In-Reply-To: <20240221034155.1500118-1-irogers@google.com>
Message-Id: <20240221034155.1500118-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221034155.1500118-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v6 5/8] perf test: Rename builtin-test-list and add missed
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

