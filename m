Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16943ABC
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1PWCy9hq"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f7d4bbfc7so22029567b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547379; x=1697152179; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfL4FLU++s9CKjil59t6XdpqiER2jatUC+zl7nbhx6Q=;
        b=1PWCy9hqFZBchxFUbGeyXousYUbi9aa9AgK0WrcWg8bnchDK/9rjQO6wyldrnvWx5C
         ysWk0inOp3Dw2gfIXcw5bDK1trD6DSqHrLNBxsCRKp4L1o0uWUa2ICQSuJPT4IQ9FJrS
         tMqa5SFr9S9kvrrnKC85/dfxrVWGLPiBk6RNmge9R9wd9+VCVSSiX9zJ221fQWOQt0qv
         +4OXSg2ugkMjgrhGL9rqiFBNB//0z0TFZ759kcVHQ9XJG4q41CJHrh/mn0hJzg5lXjfa
         mw/I+yqHUAo3abBK1uwKUeKPtemUzpKY1iTR5UbmU0jiTTg6NUc58AxRLzsttwadbcbo
         bqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547379; x=1697152179;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfL4FLU++s9CKjil59t6XdpqiER2jatUC+zl7nbhx6Q=;
        b=i/g5Hp1ZUKJNQqyjkoFVFuZj47xppQZEq75DL9zlgCu0HSgArPW82h8upxIMi/ji6X
         17mJagoVZIILV8/XrNhB4GjkIffnBta+PaWki2URpoJiqlgGTWi0gxk9+o/2I5Dhshty
         Urkx4xr9HLGIrvgJIE6zovvylbQvtTUNDNuJBv0uLmfJ2Xlry8PN6ZHcr+pJ8zihs8pD
         bZTUQwcz8DcnFvTkLC1opUFs6wQlEbO5LeqFG4D7vkBTItMDzOcsDzSn6OjNWNud/zAz
         dU/PpIJnGxhcYMji2y29+KArAS8KUbkWQZxd/bOlbGzu0v72KrXQfl+H2Dy/Z1g5tiNV
         BdSw==
X-Gm-Message-State: AOJu0Yw8hqsr5ji5wICbmU/C6OfCvKuEbocon9vZuQSoGLOKLj/7aBRZ
	pCysPQzfpwdJtOps+nVB4zQB/2ADFJ5A
X-Google-Smtp-Source: AGHT+IHgsU7WqtGzIXgNXr1P8QSditE9WLikTdLCJCQWnQLq+FpPEmuFYiUkFS5RxrsXiCHqXCKcfq5Bkre2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:586:0:b0:d7e:dff4:b0fe with SMTP id
 128-20020a250586000000b00d7edff4b0femr96767ybf.7.1696547379763; Thu, 05 Oct
 2023 16:09:39 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:51 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-19-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 18/18] perf bpf_counter: Fix a few memory leaks
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

Memory leaks were detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_counter.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/bpf_counter.c b/tools/perf/util/bpf_counter.c
index 6732cbbcf9b3..7f9b0e46e008 100644
--- a/tools/perf/util/bpf_counter.c
+++ b/tools/perf/util/bpf_counter.c
@@ -104,7 +104,7 @@ static int bpf_program_profiler_load_one(struct evsel *evsel, u32 prog_id)
 	struct bpf_prog_profiler_bpf *skel;
 	struct bpf_counter *counter;
 	struct bpf_program *prog;
-	char *prog_name;
+	char *prog_name = NULL;
 	int prog_fd;
 	int err;
 
@@ -155,10 +155,12 @@ static int bpf_program_profiler_load_one(struct evsel *evsel, u32 prog_id)
 	assert(skel != NULL);
 	counter->skel = skel;
 	list_add(&counter->list, &evsel->bpf_counter_list);
+	free(prog_name);
 	close(prog_fd);
 	return 0;
 err_out:
 	bpf_prog_profiler_bpf__destroy(skel);
+	free(prog_name);
 	free(counter);
 	close(prog_fd);
 	return -1;
@@ -180,6 +182,7 @@ static int bpf_program_profiler__load(struct evsel *evsel, struct target *target
 		    (*p != '\0' && *p != ',')) {
 			pr_err("Failed to parse bpf prog ids %s\n",
 			       target->bpf_str);
+			free(bpf_str_);
 			return -1;
 		}
 
-- 
2.42.0.609.gbb76f46606-goog

