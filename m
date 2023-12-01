Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314E4E60B
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 23:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cge8iXvx"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-db49589f622so1414917276.3
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 15:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474649; x=1702079449; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5bEZDUZx9SC+UNDGd8Tkd4xhf8pPfCYFDzGqkpX+gI=;
        b=Cge8iXvxW1tZGkP7U2rJ5wu+soBzSNGnuewO4/4cRJMTF7J3s7UsMmEFqTrEfzBNDX
         Wvc6Ph913x96TbHafBMaZcmoua0rcj3rvp/QK6gikngYov5WVE48QRJ//7TWppWCaw37
         6gwnfXKjESPNGYXXPUFqyDBptdJ6gxlLAuRtJYcj/lwbbmRSZB0v5UUkqCyDAkkX0c6R
         L9InGTC9Tr5ymw9DErtfH6XRIPxr7PX1WW8OxLQvVgtstr9dSlx8WMokFMBry7ME9grZ
         8FJw28RTRorzMUWvmoMODA2oOW5ZMQh3PhlUObTKrE0YavtctXi0nuDpyOgNd95d4cSS
         ZRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474649; x=1702079449;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5bEZDUZx9SC+UNDGd8Tkd4xhf8pPfCYFDzGqkpX+gI=;
        b=C6hjQNOXai370jfIynXDJL2gcxRB4P49HWcc21Gg2M61I/w4L7FzvM/u6sR1hgS0lD
         utVQlHmc8kC+Pw2dxzfmaoNjIUtH6C/Bg+FvbtvYgvOjSclO4Sdmg+SZHelWU0/Vr/3N
         wpUnO8a4U0evowxrftDadAJB7gZvh0XpnAMfoFoTm9sY6i2Qu1gnHbk+W+o667jLpEqj
         9B3jL4tqOkd/mDD0Rn6Ldnkrz8Vi+9BDBIf1SOnn7rUp63ittgxPxdv9jVpTi7MpzsJH
         /DqJGJGSizwFob12gCFO/iqhceMySt+DNb8Bagu46CU6xPAmqFujN6Eo5yv9P+9awNC0
         g+jw==
X-Gm-Message-State: AOJu0YwtjBiuO9DMAMr8XOwZJ7n0id2NpgbGG0So2WKvcKlKNIw97We4
	1jtNKZgJ7VQvRzgnjmSs28dG8WcaBHv9
X-Google-Smtp-Source: AGHT+IGxVifoKKxnrgQ64N0R0ThCAE1eb5F+Ng+jSAIgm5nvdPD7/C+4gmOXBYz95YL9nzm94UBSTaUFTzGq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:df3:224b:7b7f:efc5])
 (user=irogers job=sendgmr) by 2002:a25:a3e6:0:b0:db4:5d34:fa5 with SMTP id
 e93-20020a25a3e6000000b00db45d340fa5mr857933ybi.0.1701474649200; Fri, 01 Dec
 2023 15:50:49 -0800 (PST)
Date: Fri,  1 Dec 2023 15:50:27 -0800
In-Reply-To: <20231201235031.475293-1-irogers@google.com>
Message-Id: <20231201235031.475293-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231201235031.475293-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Subject: [PATCH v1 5/9] perf test: Rename builtin-test-list and add missed
 header guard
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
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
index 2b45ffa462a6..5cc814af8e37 100644
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
index b8c21e81a021..fab49a60d508 100644
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
2.43.0.rc2.451.g8631bc7472-goog

