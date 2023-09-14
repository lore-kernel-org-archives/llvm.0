Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81C26E38
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 21:20:04 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5925fb6087bso18415197b3.2
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 14:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694726403; x=1695331203; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Br6oKi7mTFdhI/sS2Gl2xU7/jDtLT7KyY4n04DEal0=;
        b=ESvSCt2XHvyUq3nLw73oWBfEQcT+5uiS6uvcQQ2jq6M1IVZe4z6smP8FvtKHiqYj0b
         ny9aUpVjzp2feNHJZUPxyZMsx4/aJTRDbzOaVK3wCDXMU2ZUpDy4V2bz3To5sswm9XFr
         wN7nErhjg8RjzhsnI3KfRm5NdYI5PAHpEIQro80qGzqGPZe+tB/kXxeyOfJdfWYT752R
         pm3u+kVhKaQjVQ7oOLLSnz9ahdJ00eMzQLH2RPDYMkaroUSH799Trq7rh06/W9kn2sGd
         WZ9r13o7taoNZwvRn7u7LC/LFGhvxpPpb6aWENLYUspmI2xjiiARPzR/WQWwu8vHsxT7
         NYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726403; x=1695331203;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Br6oKi7mTFdhI/sS2Gl2xU7/jDtLT7KyY4n04DEal0=;
        b=J9Cbndb7zIx0Z8tS9PjyVVsVkv6qLJlyfMu+qcF44iKgnBASLDrXAgriwmKpZE7XSG
         DVNfc6evgk1nJmrYY0FdQqRR8nTlYhKHYSARPq5jfOsU7AHAIpLD0vkzwoGGHpqtWrC4
         +fiOA8S/fu1zSA09P/MMAzh/U802o0hGqEcLImo/CfEVAmsDlFBuo3GVaL7j28URZcbL
         6XDxj2HHDEgZk62OLUW3jrSBqzel62MFYuzK8fmHF+VxQFVkQHPiy0qNk72r/5eWn+Io
         BTeuTP6DR+31VQ6wpOQaggjx+WJUQ42g0PmkYsiMxmdAYly9qc4SPubaNVxoeWcFtqbS
         XmTg==
X-Gm-Message-State: AOJu0Yy1guNYCue+yVnsojTJk3SQ2z5zyvThuLKY8Q1UB/CM00aphGUz
	Sdd7BIw4mJ4BYtbLcPnSArb11yFQYgpW
X-Google-Smtp-Source: AGHT+IHs5wkR+KiaL7EtqQCQpiLyI7h1XQQLsqyWJg8cBDHl64BZ691Sqo/oENqg9GTO1CpzGy0/AIzlBRLZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5357:1d03:3084:aacb])
 (user=irogers job=sendgmr) by 2002:a25:aa83:0:b0:d77:984e:c770 with SMTP id
 t3-20020a25aa83000000b00d77984ec770mr152103ybi.5.1694726403757; Thu, 14 Sep
 2023 14:20:03 -0700 (PDT)
Date: Thu, 14 Sep 2023 14:19:46 -0700
In-Reply-To: <20230914211948.814999-1-irogers@google.com>
Message-Id: <20230914211948.814999-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Subject: [PATCH v1 3/5] perf test: Update build test for changed BPF skeleton defaults
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fix a target name and set BUILD_BPF_SKEL to 0 rather than 1.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/make | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index ea4c341f5af1..a3a0f2a8bba0 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -70,8 +70,8 @@ make_python_perf_so := $(python_perf_so)
 make_debug          := DEBUG=1
 make_nondistro      := BUILD_NONDISTRO=1
 make_extra_tests    := EXTRA_TESTS=1
-make_bpf_skel       := BUILD_BPF_SKEL=1
-make_gen_vmlinux_h  := BUILD_BPF_SKEL=1 GEN_VMLINUX_H=1
+make_no_bpf_skel    := BUILD_BPF_SKEL=0
+make_gen_vmlinux_h  := GEN_VMLINUX_H=1
 make_no_libperl     := NO_LIBPERL=1
 make_no_libpython   := NO_LIBPYTHON=1
 make_no_scripts     := NO_LIBPYTHON=1 NO_LIBPERL=1
@@ -138,7 +138,7 @@ endif
 run += make_python_perf_so
 run += make_debug
 run += make_nondistro
-run += make_build_bpf_skel
+run += make_no_bpf_skel
 run += make_gen_vmlinux_h
 run += make_no_libperl
 run += make_no_libpython
-- 
2.42.0.459.ge4e396fd5e-goog

