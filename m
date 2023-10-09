Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ECB1A701
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a+O+ZURi"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59ee66806d7so73528407b3.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876782; x=1697481582; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fapvG1sgoYBqHgoFOW9TcSIAiI5hx1hj0GAN7+v4jh4=;
        b=a+O+ZURiBUX9XCvy0TxyIjIlvsrZK65Gwd+tDURHzhDO6jnZdEg9pZgKlwUB+Ptgn1
         UMHaINYreUs9FID6uvN4GaukozfrFPCpXJ+LoxEMipLFv8C4MCM4h/ji0Pf9hmPr1FWp
         cB/qlw40s1K7906BIzrSPWKR8W1+khqMekHlu5Yh4K1JyFfQrxfEWCtRk5zhMAJSOUXB
         /0ETM3Egf+R6QbuVGdCMxtBK+9TTqG/xSDqw4ylZ6vk2RM/qXQ8FrU1626u9pSqjxUHc
         OuDUDpsF6PFEfLo1c0IigI5GPqyyrGxfR/pWBmeTacDjZ45bWv+PCu/DplL+Qam7V/n2
         otkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876782; x=1697481582;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fapvG1sgoYBqHgoFOW9TcSIAiI5hx1hj0GAN7+v4jh4=;
        b=TO0pnF47qW1OgOsyUibsvSTLQnag/fAg7PgmcNcHnE33xhGI71two139jtrLu2leT2
         Keu6ILBxuJCJZEiGTuMWDLk33EWYYISItNBSjrDRRBovuxeIYXQkYZsFm+MxcdaubIXJ
         EljFo1b9bTK66x6oBvKX3orjX03SJtqtIHKUxjy1n+vc7ampcp+4+6/LZcD/FI3dFF0l
         j3P6eJNE7Ayxeg8ngenkG2bInQyN+X0Ifsg/uyKRAJUBtjs3KNLlulXxnsD3X0hVwJX8
         T+/HvbWVO1RoX1jNimmXnQjlWMtmlOP5/AZy/3LSpYyDDW4wFwVnBBiDqIPdZTnqwOIt
         CH1A==
X-Gm-Message-State: AOJu0Yyf9pkGkJFcj9CHg08KTlIhX2nNEHqdvCNYNBjBigGc5f/Iu3KQ
	h3Aq0gFCD8/J5YH/LcOPlAu11Qlk2rHm
X-Google-Smtp-Source: AGHT+IFF5Ce3xTASsAOk8I7voMtqVFZ/Fie+83QxW2GS/qJ0vRq1xrYlGTONWtgU9T98ME4DI6ky2PLg0Jc+
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a81:bc03:0:b0:59b:c6bb:babb with SMTP id
 a3-20020a81bc03000000b0059bc6bbbabbmr297631ywi.6.1696876782479; Mon, 09 Oct
 2023 11:39:42 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:08 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 06/18] perf env: Remove unnecessary NULL tests
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
2.42.0.609.gbb76f46606-goog

