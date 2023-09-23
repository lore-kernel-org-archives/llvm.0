Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15732117
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:53 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59bdb9fe821so50462867b3.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447352; x=1696052152; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JLMR1XL8zAjwZWVAlK6A4BDEZJsECGT2sz2xABlKYc=;
        b=aPfOrsyoQuEml3hBDfA+8YNOyuEsIauzj89YD7RU8HXX7i20hpnnBMURKh1Mqx7bge
         LWDX12wk+IgDluudQ9ESTxb1cOmKvXSj0/87fEQ6p0hATlDAIGuyzZsRnG58pCNQV8Z3
         HOBQ09JrzntI4iXRrU1sNswPA7m4iOzihx27Kb9fy79oX92ODZ6zrBTynHkdXC0pWbti
         HlJN42MFu8SiP2siyW4C9MGdhbupZ1hSb1LB9cN/91Km+P6Ws2JOxUsIJ6A79qEc1gx0
         QUWYGxKzMTnFGy77YE4J1+a+P44pwOM/Cn/U78+UDtH3Y1vozdIHNaW8QYIXk3en2LaJ
         CXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447352; x=1696052152;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JLMR1XL8zAjwZWVAlK6A4BDEZJsECGT2sz2xABlKYc=;
        b=bH9VSRzBXupGY1EbQoyZzd75wruhrTbHV46VNUeTlhpdJT8Ov3+mu1ReNXVQpPOetg
         bJ7Akt1QOCtU6WMUrtzRCsxUaHNCX1TXhF1DcnOW0yP4SMNgwCculSr2DH606qCSobcR
         P/82PTBz0Yr8XAEuxuHsmYgMBXlA45OG6LOaA3Wo1LUNQIB1xN2rmQYyLU/0HdE7J8r6
         jwqroLyGBxJuH6Rhi1Baly1cu4kEMDohRSAABtwcwOlX+sxmzgKFPHu91ZpynTtJygoS
         RZ3WKRwVrZu7iwGHduKJ/cMrRX8z5Zg6mj5SNkA+1gBBSe70gPG9eEi0LgEUEJJy61A2
         9A8Q==
X-Gm-Message-State: AOJu0Ywy6UEP1OPWAndCNTYnEstI3XS3CyZ9r0yHj8oXFEMU+nY7EzHR
	BunfvXPsNtW4oIzsmv0RsoNBF2/AkTkZ
X-Google-Smtp-Source: AGHT+IGwoVliXHNo2Ezm8GW+6WCcr1eN33xbWzqXWDeiL+JMjQWZaBaqiW/AxKNeH9OmHAU2FWAtbGPCLBod
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a05:6902:1105:b0:d81:6637:b5b2 with SMTP
 id o5-20020a056902110500b00d816637b5b2mr14384ybu.0.1695447352596; Fri, 22 Sep
 2023 22:35:52 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:04 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 07/18] perf env: Remove unnecessary NULL tests
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

clang-tidy was warning:
```
util/env.c:334:23: warning: Access to field 'nr_pmu_mappings' results in a dereference of a null pointer (loaded from variable 'env') [clang-analyzer-core.NullDereference]
        env->nr_pmu_mappings = pmu_num;
```

As functions are called potentially when !env was true. This condition
could never be true as it would produce a segv, so remove the
unnecessary NULL tests and silence clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/env.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index a164164001fb..44140b7f596a 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -457,7 +457,7 @@ const char *perf_env__cpuid(struct perf_env *env)
 {
 	int status;
 
-	if (!env || !env->cpuid) { /* Assume local operation */
+	if (!env->cpuid) { /* Assume local operation */
 		status = perf_env__read_cpuid(env);
 		if (status)
 			return NULL;
@@ -470,7 +470,7 @@ int perf_env__nr_pmu_mappings(struct perf_env *env)
 {
 	int status;
 
-	if (!env || !env->nr_pmu_mappings) { /* Assume local operation */
+	if (!env->nr_pmu_mappings) { /* Assume local operation */
 		status = perf_env__read_pmu_mappings(env);
 		if (status)
 			return 0;
@@ -483,7 +483,7 @@ const char *perf_env__pmu_mappings(struct perf_env *env)
 {
 	int status;
 
-	if (!env || !env->pmu_mappings) { /* Assume local operation */
+	if (!env->pmu_mappings) { /* Assume local operation */
 		status = perf_env__read_pmu_mappings(env);
 		if (status)
 			return NULL;
-- 
2.42.0.515.g380fc7ccd1-goog

