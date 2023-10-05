Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255294369B
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h9uAPik5"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59b5a586da6so12807847b3.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547358; x=1697152158; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGGlE54ge9XxgsvPeqIZ7isbDlHsMUv/MJYLVA09opo=;
        b=h9uAPik5Z2bX43/++WGwxikyNsadKKyvvFf7s+5aUnGPPHkZlQjlWVUQm7yWFr2ba0
         qzCe14U6Dk7IVIeXPbqbSJY97YqP+8mpMkUbm4EiS8WFXAQLECw0q4PPZpjz/GxKFbSD
         VqFJ4WLjmaGkyuzrm9WnRT4iQxsRSnE5rzrwhYLbXJhbtd3MpJObqEvqMQLUu/SwmM73
         nAPU60qszEE/a7X1UI9z5WEmLplYZt+0CXTEIQpXn/teSDte11HmEASD/DjQVx3XulCL
         42IXYgSj347kb2U+Yb7ebGW5RJ/lCrr9TswXqf7bL/8mY27eWwiQ7jHj5TOyF3WlaXDo
         ndQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547358; x=1697152158;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGGlE54ge9XxgsvPeqIZ7isbDlHsMUv/MJYLVA09opo=;
        b=b0x1LnI7+dPR2bQZ5S3LRsGQs6DfalZn29b4C2MVxK7HpGRzveF+QJtzilYpSa6oE7
         tivIlSTBeMaKzvXuCF5/JCmXZfY+Ya6TkE3H6kxbKrp98IINmiB0WI5heqCUwiNAi12n
         QuKBTdzNleLxnSvShdxHOtax2sFp15hbUlLxbGesBIt/SzSfsxXmMgGt0fjxVxPWJGFh
         28ZYwlGu6HtNJG/WkDlr5TDk0JYa3V2w1CR0gxu/DzFEcwiAW799GYQbOuFMBFSYSuMZ
         LckTrElJlCXKyu81U2ziTYQqpTAU16DK/pPNtH1Zj9J8X7uNrbVuXhfhwtqGbkGpS+kx
         549w==
X-Gm-Message-State: AOJu0YyPeYrszDawfgAHlsBXqEDMqF4pl7eTlBAki+1uCOFDyTikjjuW
	nOwux2y7F4MbPQ3ozRdPjQsJZpJ3yqej
X-Google-Smtp-Source: AGHT+IHZIti6IayoNIIvrlr9f3twKSIg0zCXbRbou+pCuTID4omq25jI81Q4BzjSR5/jxW+VxluvDukpej+F
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a05:690c:c90:b0:59b:b0b1:d75a with SMTP id
 cm16-20020a05690c0c9000b0059bb0b1d75amr51537ywb.4.1696547358196; Thu, 05 Oct
 2023 16:09:18 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:42 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-10-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 09/18] perf mem-events: Avoid uninitialized read
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pmu should be initialized to NULL before perf_pmus__scan loop. Fix and
shrink the scope of pmu at the same time. Issue detected by clang-tidy.

Fixes: 5752c20f3787 ("perf mem: Scan all PMUs instead of just core ones")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mem-events.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 39ffe8ceb380..954b235e12e5 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -185,7 +185,6 @@ int perf_mem_events__record_args(const char **rec_argv, int *argv_nr,
 {
 	int i = *argv_nr, k = 0;
 	struct perf_mem_event *e;
-	struct perf_pmu *pmu;
 
 	for (int j = 0; j < PERF_MEM_EVENTS__MAX; j++) {
 		e = perf_mem_events__ptr(j);
@@ -202,6 +201,8 @@ int perf_mem_events__record_args(const char **rec_argv, int *argv_nr,
 			rec_argv[i++] = "-e";
 			rec_argv[i++] = perf_mem_events__name(j, NULL);
 		} else {
+			struct perf_pmu *pmu = NULL;
+
 			if (!e->supported) {
 				perf_mem_events__print_unsupport_hybrid(e, j);
 				return -1;
-- 
2.42.0.609.gbb76f46606-goog

