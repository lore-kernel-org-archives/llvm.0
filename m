Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909EA53
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:06 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d859ac9ea15so4927183276.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447366; x=1696052166; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lP0CZzDRsMehpIV0W6qVRwyai9STrfRNe8AVt5V6Hgk=;
        b=Ur+0t2sm5R18F5kI8oz5vrjXaFF7bmgPQvhhiG/DxaSKZcRETPpR1d/DT6r48Ft1NE
         CwXYv71XdMle9YInc3TWhK4i0BLIrqI4vzG6mpdZO2DFUcH+ILxC9d8droV141tNi4Rj
         4vPSbFjQNHqiBjrIgNm2vHtWieVaSgOnuDNdvHGSYG1CO8BIB5quqi55BOG19ug//+NI
         LnSVYcImlbSriQK9TYAEsPRZkS18jm14VLHEdDnIGR8yKtVxi7LKF/KEiHb2fgKPruHL
         S1gJwOaRSkDO5jp01cQr+EUnJepjbivSrSae50udEQkNlW9K19UHKvHLYeCnFuI2Iacx
         FwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447366; x=1696052166;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lP0CZzDRsMehpIV0W6qVRwyai9STrfRNe8AVt5V6Hgk=;
        b=SvclwSqVksxP6VVrp4Zs39F9lvlKZUSeXsLHgbQbnEZbL/0jtgyDoM2dzEav0/sGvo
         Q7/qrcAQftl6w4IkfjL+Ff7N8wPZmv2wnQGokXHQXb91EXhyy2iP457pzFnBGg82Ejmw
         TiBnd5KQSO2HBWgM7qeL9J1xkYHcMezSnOkNs0CiRTvMKuxvTKMXvZFXrgWpNBtxHNxR
         3dnomz46r6m8HhHvgCmC4oHyJwA30V6BXjRv6OWfEp/unM5HzQHJm2Q8nWvYq8kWMiKh
         ZmrJfDQst4xGKhLdZ6BSXUAVV4tWV9jHjRVdNAgvCVEdX3lJOC2W1dlGubLbE5Sigzud
         Kn/A==
X-Gm-Message-State: AOJu0YyS4hgmdnDsEfH8WYIAIletOMDawm45TSfLXspvG4HlCTXUk6xI
	u2KKp/LFZgbzViSN346OJlDRN10+ni9v
X-Google-Smtp-Source: AGHT+IGdqprUHXLHeZlwQEnyqkBR7ouFdtc/hDEKXB+YundtzyRDtuNFuTKtwqpwNev1VOexHXen0ztDFEGv
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a25:403:0:b0:d7a:bfcf:2d7 with SMTP id
 3-20020a250403000000b00d7abfcf02d7mr11997ybe.6.1695447366091; Fri, 22 Sep
 2023 22:36:06 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:10 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-14-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 13/18] perf svghelper: Avoid memory leak
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
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On success path the sib_core and sib_thr values weren't being
freed. Detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-lock.c   | 1 +
 tools/perf/util/svghelper.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index d4b22313e5fc..1b40b00c9563 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -2463,6 +2463,7 @@ static int parse_call_stack(const struct option *opt __maybe_unused, const char
 		entry = malloc(sizeof(*entry) + strlen(tok) + 1);
 		if (entry == NULL) {
 			pr_err("Memory allocation failure\n");
+			free(s);
 			return -1;
 		}
 
diff --git a/tools/perf/util/svghelper.c b/tools/perf/util/svghelper.c
index 0e4dc31c6c9c..1892e9b6aa7f 100644
--- a/tools/perf/util/svghelper.c
+++ b/tools/perf/util/svghelper.c
@@ -754,6 +754,7 @@ int svg_build_topology_map(struct perf_env *env)
 	int i, nr_cpus;
 	struct topology t;
 	char *sib_core, *sib_thr;
+	int ret = -1;
 
 	nr_cpus = min(env->nr_cpus_online, MAX_NR_CPUS);
 
@@ -799,11 +800,11 @@ int svg_build_topology_map(struct perf_env *env)
 
 	scan_core_topology(topology_map, &t, nr_cpus);
 
-	return 0;
+	ret = 0;
 
 exit:
 	zfree(&t.sib_core);
 	zfree(&t.sib_thr);
 
-	return -1;
+	return ret;
 }
-- 
2.42.0.515.g380fc7ccd1-goog

