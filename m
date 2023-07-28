Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38577C2D5
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:49:50 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-c64ef5bde93so1768382276.0
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690526989; x=1691131789;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+NuSN9XkT+qsQuvKgJBdNq4nk4vcI3JH0hFT1DVHgI=;
        b=dBWfagtHD8/GX5CfSM0USkliKrcgjg7HFq51oTJfadYnvK2v3CXXfjwoGKERNpv3cI
         4AUh0LL57JfZLlBfahYZs7188BkkTzaC6XOahh1G7K6UlM+Ll8rC86zWvjSKyi7LhZP5
         M7RMyGdKmtrbQ8AI3nAe18nKyqLPfckUcaMM3nVyHIue/AQSImE85rbc2i4MXRJmHCN9
         TNXXK0CuMC8RLg39DqApn3XqceSzf0vyA3QhKs3XLbwDbUmTT6bLYabPOh73nfBhDH1H
         oH9n2bueV+aOOiThlR2LuT0Qa+Dq1E2g02ybR//9V6PXxgIS5SzcAGGaW5wpHjsLXWuT
         gI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526989; x=1691131789;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+NuSN9XkT+qsQuvKgJBdNq4nk4vcI3JH0hFT1DVHgI=;
        b=PHbi53zfeukJqVHuZVKZ6AWfxvdZI/mpxiJfcXOFq0uDj93dAo6YgOmE1j1bpHowd9
         1qb7DOjFDpEd2gO0+zRH9z1pHFkWE4hs5MnYLEiYx2Sib5Zec8Xf72SM+8HUmk981Xr/
         XQveVU3nX1TfcxSkmT1cMenO20tUgeLZOo2w6XO2he+qsnCXYyH9poCL3yjvH7yHasYS
         Vj/iuAdGoy1WVp4Ylv1FHULCFV+F+EShThPSRgoPvgLG26jXlNzZ1OdfdHp4aNWY6/Ae
         pZ0fZ8u2W68JF2Z7v1bzknqlHfU0bKrlTM9RAQhtleVO65PvSL9krrJRW2bggRs69I/5
         8bJA==
X-Gm-Message-State: ABy/qLaJC/5J8r9RKS2e8Mu2ckYQRf4IaTmvAcfRBnalN1MX8nOw3ky1
	euMwtmYPzImVNSzFq9oYwltqcoes3IAD
X-Google-Smtp-Source: APBJJlH1isPienb9pKw3EcA/eACCf//JnX+EHZyFmUKd3n/1Raax6Ty/uxc322vFBpfbg4KszcnotojxYicG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3d03:ff18:af30:2dad])
 (user=irogers job=sendgmr) by 2002:a25:37d8:0:b0:c64:2bcd:a451 with SMTP id
 e207-20020a2537d8000000b00c642bcda451mr4280yba.7.1690526989081; Thu, 27 Jul
 2023 23:49:49 -0700 (PDT)
Date: Thu, 27 Jul 2023 23:49:14 -0700
In-Reply-To: <20230728064917.767761-1-irogers@google.com>
Message-Id: <20230728064917.767761-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230728064917.767761-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 3/6] perf build: Add Wextra for C++ compilation
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Rob Herring <robh@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Commit d58ac0bf8d1e ("perf build: Add clang and llvm compile and
linking support") added -Wall and -Wno-strict-aliasing for CXXFLAGS,
but not -Wextra. -Wno-strict-aliasing is no longer necessary, adding
-Wextra for CXXFLAGS requires adding -Wno-unused-parameter clang.cpp
and clang-test.cpp for LIBCLANGLLVM=1 to build.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 2 +-
 tools/perf/util/c++/Build  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 14709a6bd622..fe7afe6d8529 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -333,8 +333,8 @@ CORE_CFLAGS += -std=gnu11
 
 CXXFLAGS += -std=gnu++14 -fno-exceptions -fno-rtti
 CXXFLAGS += -Wall
+CXXFLAGS += -Wextra
 CXXFLAGS += -fno-omit-frame-pointer
-CXXFLAGS += -Wno-strict-aliasing
 
 HOSTCFLAGS += -Wall
 HOSTCFLAGS += -Wextra
diff --git a/tools/perf/util/c++/Build b/tools/perf/util/c++/Build
index 613ecfd76527..8610d032ac19 100644
--- a/tools/perf/util/c++/Build
+++ b/tools/perf/util/c++/Build
@@ -1,2 +1,5 @@
 perf-$(CONFIG_CLANGLLVM) += clang.o
 perf-$(CONFIG_CLANGLLVM) += clang-test.o
+
+CXXFLAGS_clang.o += -Wno-unused-parameter
+CXXFLAGS_clang-test.o += -Wno-unused-parameter
-- 
2.41.0.487.g6d72f3e995-goog

