Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350EE4596F
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764349; cv=none; b=CPIQdr7lKB9grhaStp/bRZf/fylZO7AIZEbWpd342009dGF5EyYG73ZsSP0xul+glpEOaROgKh6fc4m3JLKniNFrGlDHYfvwvAGe9S/BFU5Szueop/KsXvCefcdxDf2kusiufdjPtN7uLEV1eiCUvX42AQwbFCVUFw/e7f7ixLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764349; c=relaxed/simple;
	bh=kq2gDZXW4atNH6jHCSAioIQIj7W9ZIfsPic+NuVBLPE=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=aLTooZo/9J+YSgrVoSm294N1oa6evMXT4AlF78Cp8EMwYrB0pu2TmR6YVlo3gHgRgFDeCJSCFAxhsQxlJn/2WGBdI8VNjBYvSJLeDgpGQXjLHeKGLPqcFbaGfnw+DRkv9AuZeatPJVYsdUpGToLMhYLR7baqqpu+8kcAfkj+V5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jxj5PQCj; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jxj5PQCj"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-604b6d55dfcso41071847b3.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707764347; x=1708369147; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/PJeKzS6BQLSmrUIcfcoDlL9jp1b7n/jV99AnuH7tUg=;
        b=Jxj5PQCjM5KRHp89GIDKc/akDjxGyH2jycLYGlS1pYpj2PVkuFG6K3ywiC8dlUxzty
         G5mQIo+yMQYP+2LpDeu5u961yTvj02aiQfitEw8nAamiuOK2Y4NXVy3fcQeMnFGFXU4Y
         l3X61efsDBi3kmJEN+NI9O0XAk3cnTCRC5YBEK7hqNF3+piVYQ7vlSa6t79LVYCHt1BI
         IOHAMwUJIl9M9ZXEy1gd3XYSWJt+sRgXZBD1PMSsFEZY43kp33AkDXqfUy6B5M51dOzB
         5Vmyb3L2uktFj0RXKKCibi/Swi0cqDU9bi1UK08G+tRCE+JxLylchxbaN4wiJPQjNz8u
         7AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764347; x=1708369147;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PJeKzS6BQLSmrUIcfcoDlL9jp1b7n/jV99AnuH7tUg=;
        b=NHfN4g8aI5ImfVfgVbMdB8dguUdmaZcje2W+ipl+fDc7BceYvfjdJhJYeouHhpxPQv
         xI/fxe8WgXLYZhQnGBL9oK4XMsd/yQMup+xolimANajlxAOfhcNbvQJE4HjMhgVQUlNO
         879FitDK9UmsgFrrY8XAZgAhnP8AmOrTPR45nw63xBcUBraRfBEd12qpt0ynUaP/oRFh
         dsubA011wyD+Lie0QJ7gI4VshAxKyODmLSW++ggZY8D8yOpox9jNi/UFfbfpyIPswtxv
         1dFb64MBJ6ZtMbwwIn6EhVbBy3mW2KWJSnRANWg3P8EFOlgMzjWuuyp5FPTc3AolHE3C
         lRPA==
X-Forwarded-Encrypted: i=1; AJvYcCVJwk8jlSQLqsHjNP4XPD+KLzZlwG049pVUmj2XpQg4vmvzwMlGybA3KkUUV78vg5FKk30b6ecUdEiVOWB0dRUjXtmBsQ==
X-Gm-Message-State: AOJu0YzItGq09xOPjKeWtespQKjtobDsVO4LapAA0A+yTF3p1OPefCgH
	W8k6KY7t75IIwynTEyLU9w5YlLs7011A5Yosc5Nw3xHhlLmwViQbuPurPBTZRMqh0I94f6sltt8
	gZUClnA==
X-Google-Smtp-Source: AGHT+IEuj2PSJ7drnwS/N7pgsbF79uuXX/skTkoq1JlqOrNDIKF77Ouw0jnO0S3GBuB1ps9JJGo6+dUHHaE0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:125c:bcda:4fe2:b6e6])
 (user=irogers job=sendgmr) by 2002:a81:920c:0:b0:5ff:6ec3:b8da with SMTP id
 j12-20020a81920c000000b005ff6ec3b8damr72459ywg.1.1707764347288; Mon, 12 Feb
 2024 10:59:07 -0800 (PST)
Date: Mon, 12 Feb 2024 10:58:50 -0800
Message-Id: <20240212185858.68189-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v3 0/8] Run tests in parallel
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

If command line option '-p' is provided, start/fork all tests in the
main thread and then gather them in order at the end. On a laptop test
time was reduced from 5 minutes 21 seconds to 1 minute 50 seconds. The
option isn't default as the test shows up perf and test flakes.

The '-v' option is modified so that 'perf test -v' will give verbose
output only from failing tests.

v3 - fix a crash if shell test directory isn't found, remove merged patch.
v2 - fix parallel test output/verbose issue
v1 - initial PoC

Ian Rogers (8):
  perf thread_map: Skip exited threads when scanning /proc
  perf list: Add scandirat compatibility function
  perf tests: Avoid fork in perf_has_symbol test
  tools subcmd: Add a no exec function call option
  perf test: Rename builtin-test-list and add missed header guard
  perf tests: Use scandirat for shell script finding
  perf tests: Run time generate shell test suites
  perf tests: Add option to run tests in parallel

 tools/lib/subcmd/run-command.c                |   2 +
 tools/lib/subcmd/run-command.h                |   2 +
 tools/perf/tests/Build                        |   2 +-
 tools/perf/tests/builtin-test-list.c          | 207 ----------
 tools/perf/tests/builtin-test-list.h          |  12 -
 tools/perf/tests/builtin-test.c               | 369 ++++++++++--------
 tools/perf/tests/shell/lib/perf_has_symbol.sh |   2 +-
 tools/perf/tests/tests-scripts.c              | 257 ++++++++++++
 tools/perf/tests/tests-scripts.h              |   9 +
 tools/perf/util/print-events.c                |  12 +-
 tools/perf/util/thread_map.c                  |   9 +-
 tools/perf/util/util.c                        |  19 +
 tools/perf/util/util.h                        |   8 +
 13 files changed, 507 insertions(+), 403 deletions(-)
 delete mode 100644 tools/perf/tests/builtin-test-list.c
 delete mode 100644 tools/perf/tests/builtin-test-list.h
 create mode 100644 tools/perf/tests/tests-scripts.c
 create mode 100644 tools/perf/tests/tests-scripts.h

-- 
2.43.0.687.g38aa6559b0-goog

