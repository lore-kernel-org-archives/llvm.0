Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019E436B9
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NYOs/4GQ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a21c283542so23562297b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547368; x=1697152168; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3q7J1zaKrxcJsN5cKPHsdKPNVlGGTILkxMs0fP/b8pI=;
        b=NYOs/4GQqiP1c4CzrkLvi3sR+2KNUM3qZR+glbbzM7yNGrqAbg9PuBbicVo8Pz9YjK
         NLlxhvtYNcL6jdHoGSuZ6HgPzRGSzSbcxvHC+YrSTYuCjqkbBX7HspZacyESAkxTAFDp
         UngIfSRflqTczzoFlA9NMM65AJ+gYPo24DthUPi0pLixd9ntjS2xUPIHjDsAn2D5i6wD
         3lmQyCd7rH1evwxio/AiC178im9nFm+qPMPLZ5E24Tvw8JchJj12seFPvntLZNrRRn2k
         gMTHpiuaTc3DaJl755bmaYVlnaXtqfN7/mxfNDjBisyhYwPB4bstYzaZpi3epiUhE7oj
         dqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547368; x=1697152168;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q7J1zaKrxcJsN5cKPHsdKPNVlGGTILkxMs0fP/b8pI=;
        b=ia2LVhDxqjx9OpaJ3ZYWHSYYjqgLLLYQkTODuyPuRFgVeY3RkWTYYopzKOeSnQUnfK
         wu+R+WSDNeKY1GKRP80A8nTWez37x9IiLApx6fkiVvVnO/e/aL+XDLdFRfNTWXS28g0I
         9eHB+gnGVHi7EjO2J9PFoKIeSqkCvr2HzEdg5OcPUT0zQmkWXOY1Cz61QfcbiUcqGHb0
         86M9SPD/ouCZJS5D11Hq6tFQm+CfHOc6XHm44kB5vakHC4bkUDjC6TeP4aePefsjO7Cd
         JgQodnLdOPLi7IcgBIW/Q1MEWYsYrT7BOt61R5ljCcG9nqaPi5jIKK6qYALCqW11TU9r
         ewWQ==
X-Gm-Message-State: AOJu0Yw6LzmId88IXoVov2cFXEy3KXUJwv0dbEzloJt2VUcGqqBpBbER
	/7OiB7X6zvVpr0KxCdojgbaWEhP6th8A
X-Google-Smtp-Source: AGHT+IEV9eKUl8jHouya/2mrGEIvTy7eAbccM7CjR+efeiDf6wWkcXilTE2icrLHqdeRcbaf181kT4qfwnl5
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a81:a8c8:0:b0:592:7bc7:b304 with SMTP id
 f191-20020a81a8c8000000b005927bc7b304mr115386ywh.8.1696547368133; Thu, 05 Oct
 2023 16:09:28 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:46 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-14-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 13/18] perf svghelper: Avoid memory leak
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
2.42.0.609.gbb76f46606-goog

