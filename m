Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB8374C2
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SylLpda0"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59b59e1ac70so77266367b3.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876811; x=1697481611; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfL4FLU++s9CKjil59t6XdpqiER2jatUC+zl7nbhx6Q=;
        b=SylLpda0z9ABB+JirEFwrZecjfQwUH1yPshUab/DV0MUwXJ7zgUsMU7xudhXovqnfA
         18z3tCGEat1CXcIvlLkbYtlMaOHKqf4tYxfBouLPSvBoMmPFOqJIGbRQCjS+pBXZOwDv
         E8cYOI2LwGU4poxkG/DpI84bjO8LXYhBkCn+00Y0AcNN2KHxUQef/2U8D11T3EndYlX2
         6UAiesyJd0xAB9WqGcTwu5KE6ZSvcgY1tsRHJEENaa/wTbRogLwh2vtM8VjgT8Gx44ba
         TLHTcJd7b1Gs8sCTs2prf6MTUpVfiHPTKoepQWDJFYvUXnJ+hEx6fy0m4gJfdJ5dyz+c
         4tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876811; x=1697481611;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfL4FLU++s9CKjil59t6XdpqiER2jatUC+zl7nbhx6Q=;
        b=WI2VEGqjUSpHknyWLW2A73lolMEVA2pvibva3Buo2KWkRviQ8OkPm6Mxsf9eO5NI62
         bqbU7v46kOb5qiGIF5giH/eeJ+x7lbekAZoSa5c01h1hSKMTSCrePk+NOUJjTpTZanCC
         irD6zY0XKVGw9/+7kT6p5o+5rrnD2qQ+HW7NFYScWktilPplj3YCTpKik1XBIiPKXg9s
         Ng1hfjx4U+8wnOItj5kgECuuPKQt0PfKt7lw0fg3TNTGVTHmybEhAyfAyCneQ5YPHoXt
         FlgKGXUkMQks3l1zNHqquQqN2LLN2+zFRQa/8G42XHbJimRgUCzDibtIAIKNjkEBoZMo
         Bfrw==
X-Gm-Message-State: AOJu0YyCghJAjHXR2zXajrEhOYlSEvVqfVJ+ZfqV4e+94UQy1wgWUsJV
	seGH0614vckdOLS3JDOoufK0WDGXUTNl
X-Google-Smtp-Source: AGHT+IEgB0ixdKNlygdhv4h59H76SFd7CewMHkUz7uO+EUvepYTGPVZ0JlyDFpg5Eeb38pxoje/eR8ZZskOD
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:e74f:0:b0:d9a:43eb:4391 with SMTP id
 e76-20020a25e74f000000b00d9a43eb4391mr17704ybh.9.1696876810948; Mon, 09 Oct
 2023 11:40:10 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:20 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-20-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 18/18] perf bpf_counter: Fix a few memory leaks
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

