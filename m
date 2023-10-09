Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0486A358AF
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1106Y38"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a4f6729d16so84215557b3.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876787; x=1697481587; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGGlE54ge9XxgsvPeqIZ7isbDlHsMUv/MJYLVA09opo=;
        b=J1106Y38TW4IqoUhw8FCGdnjm+xMG7nK3p/Kze+jyfrCnW04Ki+Cm5HVCmhTsbWyN8
         xdQxwiYJkgmZtcKHuWkCVVjJARanlEr/tmG5n/SD3VHNB+XGKzOAf9OSiyQdngQuGaIe
         XRClpTLyBSUZo+MLsTuPbom0/Z3ogSTtsGQT/2zbu27Wlu+3uD5DKGAqv9iXKoEzhpKt
         kv6ejWgKgKlOzA+f5S8EL619dLFMfaruRz/03mj7NZyqB6OdZqPSSiPzsS5CsSx4xgqV
         SSA9aPjpvCawVgkQmQqJyQHLQkVGgnZpCd+Sd5zgXQ12g+1tG9abD7H6Wkv+JEf9tkFR
         3eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876787; x=1697481587;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGGlE54ge9XxgsvPeqIZ7isbDlHsMUv/MJYLVA09opo=;
        b=KsTdGtaRtAdwmyrVCjG/9m5xxGRHYUFQkKt8Ac82TSdoWa34S3kSm+ondZXDVjzsfs
         oy9AGAo3sSNmQfWxX7q6pZ1uplI4z5bZ1fhNJQVsW1uzY4iEVzU1wfTfLhW0IUvDDiav
         oX6swVB6FqXAAYqW7SsQA58Lsxk+drn+5SJbEsmEBCnR0ypzdptP2MlPYGSOdOJe7F1Y
         eq8M1AZznck0gw08K2Jjg9fmNdo8rZpLJUNxs55Ded1EgUw8rLXIDGJeSyo1NRXFH4wQ
         oMoZS5JMALFo8iuAkSZGYwc35fSPH4mxQkLFP18RBz7+ytkwTR70Gkjr8aCM71t+6FET
         XF8A==
X-Gm-Message-State: AOJu0YwdHeJ51/Wh+WL1MQEeqjjRCEpYNWRaxf6P8vFFclf1m5V1JMBA
	JQFGjAY8VlKhwbl8ChbS0rNw5xuNK/mi
X-Google-Smtp-Source: AGHT+IGpysIorYdi8kbri+eoNngVpsBmCut1uHA899pI7BzlPq5MUUHT7YyMhz0NTaD8xsX1mPms8KyxGvsu
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:c243:0:b0:d89:4d2c:d846 with SMTP id
 s64-20020a25c243000000b00d894d2cd846mr246744ybf.12.1696876787012; Mon, 09 Oct
 2023 11:39:47 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:10 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-10-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 08/18] perf mem-events: Avoid uninitialized read
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
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

