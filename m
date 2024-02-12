Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5EC481BE
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764360; cv=none; b=H/kRTNAwuvmkBGlLaiY3NYVNT09+Et0POql98vO7Kx4W3Ud0YOQ83jdTXv+3mSEhVna88k7zDc/4DRzoV01undEOp9IbeKm8kkdpA6nDocrrVO3ex9lsUNA42JBCV7eYfxGhyjb7UoNYXoFy8zBWsa+AOYXZMrqZMa4vp9k7LBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764360; c=relaxed/simple;
	bh=d/hQVr7HLwaHgpbOrtRFt5ktwlU8Fbwq9EyeSqxfkuQ=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=bJRQUlPH9g58RIfl8X4EsmLneTNbp273bq7GRNJSUvshmQVa1x4E7/bX118bmAp1yA5UMLHi4Y2V1HrZrIG5NPwLv45wawWQzdOs0OcQKZb40NGKc9PcZsij2IE8lb4qPMvuDgToirRdVKaYSQfSDrWaX1nQEkx+WobekeNLJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sOLwXtof; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sOLwXtof"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6ceade361so6188806276.0
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 10:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707764358; x=1708369158; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORLaSbqJ7XxCjGmPCGfASaJCafSHFkQjULJrCBkVFqo=;
        b=sOLwXtofN2PMfUXGO9m9QPqdWIamxfAMTEwA7l9+EvkHPq1+L70nfr3M/dCm0gv33n
         6xrq+1G0hk0XacTrt3FYMTCMsl8/cixUlLmncWPxpuujYoXaI44ucHYQIV81SWOVrD8L
         fLu8BlAMfDJJ3wXR6bWdXaJbP/9m+5zBYp7Nmhq2p0KUi4c3UzY/eUBOFPW/w7jjQz0d
         mXb+uTP1e0iwRRDveRBj2B1SsNLQ3Nq20GQCaiD6DPa8oBpC4t493I47h7iYtHyUhaRB
         UEJEX9lUPiVUP62lfNFeebU1if6kyO3cYvEBdbC0/C0Z7WJ6FQ2qZ2c8XdySfh98RHD2
         6lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764358; x=1708369158;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORLaSbqJ7XxCjGmPCGfASaJCafSHFkQjULJrCBkVFqo=;
        b=ivxqESSMCSsD75pkBvqVujs0F9DE/SPPNZiPdeGR3jrGBraHss3MXdCepXGA38yiTK
         ilCZTIrPMB34C8rcfkvdY1+t2pMOTqpkoMK3e3YiZsr/9LSZK/RFDDhD02tMaQB3sSwE
         Ae1/8nHMP1KPIYZg8/4dVwPN8Swx0Y04Gx++8McRoBJsmcy7E1SsHlbgDgi9ykL6g7/p
         7OKepU1YmUrRhe6jlUAP+AZ6Zvbc7RTkMgrwT2dBUkzVQZIfY9i+LU/ktjXmM/uI19Y+
         ZfR+XLCMr2xDZwzl08W1GMhja3q0Dvbx9CTmjXY5KsEOi4aga3L1C0F1EboqrZAda64/
         nquw==
X-Forwarded-Encrypted: i=1; AJvYcCUWzg1NX3t3PKfNI0taBByPPv0KGx7k823/iqMqUTbpABXiTskrngbvIUFShJVpPCdZ437M3L1DXGxuujKmpWXztCMCjw==
X-Gm-Message-State: AOJu0YxS1RNcpln8rFmqWdRbbgPe7yTzPSnRCJCUk7qms3cWMOUW1y+v
	kxNo3L06x8JmP+x1b8wOiG8IAdDuTyOcWzwajlF6k9RdrDhUn2uxA70GcDUaiN3AywUr/1ySiml
	4ErryHg==
X-Google-Smtp-Source: AGHT+IEgg5F6/JDC9O18WbAqy6Jn09Lk9KedltE8Flre9vl6bkzkS2WkyxJZcH+1HD8YPk9Has0tt+LZbMMt
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:125c:bcda:4fe2:b6e6])
 (user=irogers job=sendgmr) by 2002:a05:6902:1027:b0:dc2:550b:a4f4 with SMTP
 id x7-20020a056902102700b00dc2550ba4f4mr1970106ybt.1.1707764358452; Mon, 12
 Feb 2024 10:59:18 -0800 (PST)
Date: Mon, 12 Feb 2024 10:58:55 -0800
In-Reply-To: <20240212185858.68189-1-irogers@google.com>
Message-Id: <20240212185858.68189-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240212185858.68189-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v3 5/8] perf test: Rename builtin-test-list and add missed
 header guard
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
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
2.43.0.687.g38aa6559b0-goog

