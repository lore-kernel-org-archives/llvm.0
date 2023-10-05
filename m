Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852014001
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wjg6H4/5"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d81a47e12b5so2169343276.0
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547336; x=1697152136; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6PH2cAsL7ZmGW0ga84DGnl+E4H8MGEhL8hL3s4dJUcs=;
        b=Wjg6H4/5zjJKHu5ULD853F/X9oMFaGoBq4wT37fRdYJePCDOmc6whscN0FArgIOa/J
         UF3Vx6dyXI98WHQj+QwSz1Zqx1PPnVhmapvfKeXNE2lVDBLZ07v5iQsreqpuaBv2gVpW
         lEegHuuqWKF1Xc1OfTSGhv4llkqI0u4A44QLPloB2FTKYin773nP3+SYCi4ioIIWCc0s
         JQpkxMnSvlm504l2KUTSq1LEsnYYLGgIg6vewkAiJpVaKqQYyt//ue8g6XdAyUTiPRqi
         3ehsPdCkARkWLOBATNZJv6qfYeaUfjXH/bhG96SCGHZQq+vw8xcJr9hhhhaad+OO++Ig
         w+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547336; x=1697152136;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PH2cAsL7ZmGW0ga84DGnl+E4H8MGEhL8hL3s4dJUcs=;
        b=wXOq9DAIIJw7tkJ5vhj94Sf5sJhFjmUEF6Iv0SzHIPc2ZtTij5dLfV8uvkzEex6U0O
         C/ysr57hhjqXBkFrfGjfZ0ebpNf22MijTOLh0XOZNjxApaHx8H6gcIJijn7SsfmL4TNi
         Ye+teu7hTGztB3kjR98ojrLfJLgc8BBmqqWv7xDiLVfttgY6D9U1/DSES2x9znryfutG
         Z4HE/ShohuxSo77BlkJFqwN1g7z/wX/dswmLCY+l3fm92u8Ccm8aFVrCfpzA7ug41ElD
         LrjSJdqFc2NDV5iAwAb7m+JaiDzquPvH+IbsJV/67Yoo+w+0lJZeadS/DDaS1G1n/Pzx
         /Gjw==
X-Gm-Message-State: AOJu0YwwTRrIRnTWG08bFIyrK40CXpnxCT82AYadACkfsJNg46p8D6nM
	5JqTgeEn5Gmzu4viaEoF5U6ixHhIn4/A
X-Google-Smtp-Source: AGHT+IGmTeCTxelDhJ6LgrAsC5ohSvy9KxR9w2zSEbYKKeER/RxN0dw/vm8Y+jDSo+tx+urMxsQIl5sLvuPE
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:694b:0:b0:d7b:8d0c:43f0 with SMTP id
 e72-20020a25694b000000b00d7b8d0c43f0mr104227ybc.11.1696547336405; Thu, 05 Oct
 2023 16:08:56 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:33 -0700
Message-Id: <20231005230851.3666908-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 00/18] clang-tools support in tools
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

Allow the clang-tools scripts to work with builds in tools such as
tools/perf and tools/lib/perf. An example use looks like:

```
$ cd tools/perf
$ make CC=clang CXX=clang++
$ ../../scripts/clang-tools/gen_compile_commands.py
$ ../../scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json -checks=-*,readability-named-parameter
Skipping non-C file: 'tools/perf/bench/mem-memcpy-x86-64-asm.S'
Skipping non-C file: 'tools/perf/bench/mem-memset-x86-64-asm.S'
Skipping non-C file: 'tools/perf/arch/x86/tests/regs_load.S'
8 warnings generated.
Suppressed 8 warnings (8 in non-user code).
Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
2 warnings generated.
4 warnings generated.
Suppressed 4 warnings (4 in non-user code).
Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
2 warnings generated.
4 warnings generated.
Suppressed 4 warnings (4 in non-user code).
Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
3 warnings generated.
tools/perf/util/parse-events-flex.c:546:27: warning: all parameters should be named in a function [readability-named-parameter]
void *yyalloc ( yy_size_t , yyscan_t yyscanner );
                          ^
                           /*size*/
...
```

Fix a number of the more serious low-hanging issues in perf found by
clang-tidy.

This support isn't complete, in particular it doesn't support output
directories properly and so fails for tools/lib/bpf, tools/bpf/bpftool
and if an output directory is used.

v2: Address comments by Nick Desaulniers in patch 3, and add their
    Reviewed-by to patches 1 and 2.

Ian Rogers (18):
  gen_compile_commands: Allow the line prefix to still be cmd_
  gen_compile_commands: Sort output compile commands by file name
  run-clang-tools: Add pass through checks and and header-filter
    arguments
  perf hisi-ptt: Fix potential memory leak
  perf bench uprobe: Fix potential use of memory after free
  perf buildid-cache: Fix use of uninitialized value
  perf env: Remove unnecessary NULL tests
  perf jitdump: Avoid memory leak
  perf mem-events: Avoid uninitialized read
  perf dlfilter: Be defensive against potential NULL dereference
  perf hists browser: Reorder variables to reduce padding
  perf hists browser: Avoid potential NULL dereference
  perf svghelper: Avoid memory leak
  perf parse-events: Fix unlikely memory leak when cloning terms
  tools api: Avoid potential double free
  perf trace-event-info: Avoid passing NULL value to closedir
  perf header: Fix various error path memory leaks
  perf bpf_counter: Fix a few memory leaks

 scripts/clang-tools/gen_compile_commands.py |  8 +--
 scripts/clang-tools/run-clang-tools.py      | 32 ++++++++---
 tools/lib/api/io.h                          |  1 +
 tools/perf/bench/uprobe.c                   |  1 +
 tools/perf/builtin-buildid-cache.c          |  6 +-
 tools/perf/builtin-lock.c                   |  1 +
 tools/perf/ui/browsers/hists.c              |  6 +-
 tools/perf/util/bpf_counter.c               |  5 +-
 tools/perf/util/dlfilter.c                  |  4 +-
 tools/perf/util/env.c                       |  6 +-
 tools/perf/util/header.c                    | 63 +++++++++++++--------
 tools/perf/util/hisi-ptt.c                  | 12 ++--
 tools/perf/util/jitdump.c                   |  1 +
 tools/perf/util/mem-events.c                |  3 +-
 tools/perf/util/parse-events.c              |  4 +-
 tools/perf/util/svghelper.c                 |  5 +-
 tools/perf/util/trace-event-info.c          |  3 +-
 17 files changed, 104 insertions(+), 57 deletions(-)

-- 
2.42.0.609.gbb76f46606-goog

