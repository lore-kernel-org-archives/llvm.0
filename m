Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8517F9
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:37 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f4f2b6de8so16148017b3.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447337; x=1696052137; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nz52NPo/ldRCO4SlmJCa/5s+fqete8nkApWr4O0tYXg=;
        b=sw+osepLw3FG+3zNJu152NgNqHtD1Mjhfd8M+Z2ZDHh5CCQEkKCPvECCUqk1k6HndD
         rnu/r2VLHM7Q0Mi4INxKV7Y2tutJWBuzqG7ElE4BJ0a9Dmbr3HwYdjrYmSr5DzJg7Dzd
         ZQ9hM9x7YgO3ANi8L2d1NcQSNSNpj2KqE/vQTO0EtJmyo8n+D3JYeG4ekORNnpbeAx60
         Ef5wBi9zVCZV0UrZpCO/0EjW7XUMvWIcF0kPF2aqbuSA5M2O65zVU+7YHX6GGsmSjFRR
         b2hUY8Q56Oy8xwt7XcHHn4ZGVwiFcGbgsH7BXyrrzZvuFs7d6tflQAh/NqCD0aJtkNTF
         wXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447337; x=1696052137;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nz52NPo/ldRCO4SlmJCa/5s+fqete8nkApWr4O0tYXg=;
        b=XeUa8rxh+N5IfNZfUFhYQP+UwqqpbribkTkBl4rbBF1ru+nB0jkbhYWY681CJYkoER
         RzLrpF58VsSpSGLXKKCCSJoi7GapfZRk3yG1wPe1dZSQpLJLK5qmluREOpx28SdJmdWL
         qbhsd/WS4yt5VecmIRUJ21qlF0oNVEIdqL2BHkQU1ZHzi2nNy7ZmjEHGeja5W7C17APR
         /eXuTD5yPp4Qp53OeUqy/5Eyh8/WYiaRc9aqaxFDw+7ot3S9TFiqoTh9HBevtuGHCQu9
         Ylcbl+Tv9pX8YlLUMRDiOnqOyKltOzOsIUWnnWrJKA5oRuWQ/5KWcDgDCg+vFhk0g6/N
         refg==
X-Gm-Message-State: AOJu0Yzug4iwZ5DrhyAmFwlDRW35OQ10VL55orvMsOpJfIMAnw55Y34J
	utlARaZj6gtUptuz6/ncH4elfoQdP2hR
X-Google-Smtp-Source: AGHT+IFCqnNJv73Q/yXR30wTlheSaQlr3r+LpivpJ1x8n3rk2tghT2eny4ehycX34rqpiIXzwwawLsihbDb2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a81:4417:0:b0:59b:db15:a088 with SMTP id
 r23-20020a814417000000b0059bdb15a088mr21169ywa.3.1695447336863; Fri, 22 Sep
 2023 22:35:36 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:34:57 -0700
Message-Id: <20230923053515.535607-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 00/18] clang-tools support in tools
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
 scripts/clang-tools/run-clang-tools.py      | 34 ++++++++---
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
 17 files changed, 106 insertions(+), 57 deletions(-)

-- 
2.42.0.515.g380fc7ccd1-goog

