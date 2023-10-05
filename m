Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145D43695
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vVlI3yp7"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d84acda47aeso2096028276.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547353; x=1697152153; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fapvG1sgoYBqHgoFOW9TcSIAiI5hx1hj0GAN7+v4jh4=;
        b=vVlI3yp7ADPtd6hZ3R8h5oQtsZVk7qtpoys4wV6LhSl4Q6xpjEB1zOlMePGXEHJ4Dc
         RIdjXDEKpT9qAuGrgXMOR8YGC2o4mxB4Q10fV3IRDhtwQKiIsIox8CK1QSRKyNmDUBtG
         sher4haqenFfsNfQgzd9H6IE1pO0xlG3s0Bo40ddGPZg6fPRdVSpOBsSzL/Kc0c+BjeD
         ukP4HNSHXslfdCKddg15vlLPW5qjeiAnknjZSNcOv8ivICZ4E+VkPiyFYouvxs3FGtKd
         dTUQ6WnoSHOaJy9Av8202+YAlry4V1mHpInQQ+iD2lLLdbQzneEF4dEglpfMIeOqkAeG
         HEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547353; x=1697152153;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fapvG1sgoYBqHgoFOW9TcSIAiI5hx1hj0GAN7+v4jh4=;
        b=DGwNce5F6dGQss0BMGEDer1rVFH1jxyeZMkMwj4pBTxyq6eUiFEZbS+9pzlclATBa8
         FTDriKdGpJjjJWmM/msih8Kj0QQyrEtZYHpEc2Apd4Qriz827LcPRaHs1q1gjVkyjyPo
         vhrL25Jr5EV0NibSC9MtX+nsV+iiWGw5b143NzMR92tx0byJf/F+Ad8bT6Lw8GNO0Z4G
         2gY2lzPZ+1qDsTKZqJUkk5QARgiiDQdUnyirMVJnMdYRpARCO0UwUgXSziDNqH8NyPvt
         sTsPytUIKmtd12U93Rvt56vd8qp9qag0ZVcQxhVB250xc6GIFKpb/yWAuNBPVbx0q9aa
         O2zw==
X-Gm-Message-State: AOJu0YxVqougXNniGUknYkK2/E9YP4ze6q43GvSV3xTsRzDSpHMVcyBV
	1nCafvhCabefcNdVC3ZMbRvqOBVbISQJ
X-Google-Smtp-Source: AGHT+IFQvzaYKByRTXdCNgbgMtf6ZQo0ZLONfku1Pyu5zu4z+Lcclzm0e0v4jTWzT6RLDSWWI+/6U4DHYIBX
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:770b:0:b0:d0e:d67d:6617 with SMTP id
 s11-20020a25770b000000b00d0ed67d6617mr113429ybc.4.1696547353259; Thu, 05 Oct
 2023 16:09:13 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:40 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 07/18] perf env: Remove unnecessary NULL tests
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

