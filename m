Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72014A08E
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708127715; cv=none; b=FT3siU7ahPHhEEjsyemFT6Vs51PYiNKkDJQ8DvfMf3WtZoZFuRiyZQwM0pa1OBVSjcttyGcn4zW/5CDH0YdNqfU2tffUD/0RdIKsm7bCcZQ60Qa73q+yuwVHka+bXRsfE/xi0unrM5/CUPjGR1XpTeutIemL8G+PhOzDTf1/j68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708127715; c=relaxed/simple;
	bh=1Dvtya1H7/PzNMqdtVJUl8hBgvbrmgnqki4J5eyi26c=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=aDk2qx1AnDlO9mYO1hDejfxV+CEuo2mOSblB76ApgIL24VQnquUesuSDMkPrrZQt2VgPERJDNZeFbsFyvGJZgaRAFKdC105g4QSpPt2KNYeHBXGwJKr6bz8qChAaS6+E9jZ21vMVGLPUop6M1Sj2m4M7MLqcgWdZdvx8ePuTBbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2bKCvtNZ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2bKCvtNZ"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc74645bfa8so3540808276.1
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708127712; x=1708732512; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QBl8zgtekWPhTI5Bs2qcCKwIbqRGQ//OBxDNQEaVnho=;
        b=2bKCvtNZTKEuk8aDODznTRdFKqbTpsHkiWWpjNLIoaohrnbOb17J2G9j1StbAwhhY4
         G0wh/89VQY+DaZn+bKBYQrrTnLmNax+d1c6Pt5RCd/1EexfaWMWEGk+hLZpYEqh72dlo
         2uRZok3KUQ4b+gT4xW1fBnOGT03mgjpjW0gvWQ1+jmioZsmrloQwaGtKq0zjZMr9ewBs
         blCO5e5AxI81iYixqk9ibe386E32gXa9cZXarxCa7fcH2jQVCfemKdOY5zGIiwcJbz2G
         uMprOiPDmdnDJFaiMu22N7AmC2vFcDde/GYjPrFNH1Afv5jyAPetI/Pm2d4wEifoqc2z
         ll/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708127712; x=1708732512;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QBl8zgtekWPhTI5Bs2qcCKwIbqRGQ//OBxDNQEaVnho=;
        b=nLiTjwhSYzV6zzmSxlfD8zsZXHUFd+oWz4IvR2wwmOj4F8OX3/gs0NXbQqvcEnIQGq
         2PtI5HPPJEW6rOHcIj/JxEX7Fnlwzv749p3XLWGySliaOZT5cEs/vS69/bONBS4SNKz9
         nMEsGNn1Btkq7G9Lj5M8TJu8zsRPQmxYVCTXs8K1P7SeNPasjc835wEc/edJ2DnL/l+k
         /Iw57fnsVzYMGjfkZaSVKfEb2Op/RQmzNRgFr/lWL0gVxLxC2Hu60J7U/gVPsODgxyFE
         JyqU7H9vCvdX3g/5648prD3akoBCa+hova520vftCfxH4KfnHiOMvkIzgdO6Wc0R1roD
         2P5g==
X-Forwarded-Encrypted: i=1; AJvYcCViaD+7/s/pKHM1anTIVdHk29mp3vzNDbtOyYw7sbs+aefmdOHhHWIgly7TSsutbQi6yEevuKxv31y/uCO0ADGvqrhyNA==
X-Gm-Message-State: AOJu0YxNK6wvDSQEUkSbOXQE7atcIHfyuV8HHH5M+nllAcqBNZmtuVLE
	yW+Mft1Tebjb5Hygmf9wKrumRFQqsqEW+QD7ei4/Dg5OnNrSl95Ye011sJGb27pY458UMEu1VZv
	kD8tlYQ==
X-Google-Smtp-Source: AGHT+IEMz+3RYNoGBF343NN7VH7kEkTuo9e+7EPD1rOracd954OtISvpyHGwVvDYBFvc29zPAHCM8qIzo6wC
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4b5c:352:4272:e34e])
 (user=irogers job=sendgmr) by 2002:a05:6902:1005:b0:dc7:59d9:7b46 with SMTP
 id w5-20020a056902100500b00dc759d97b46mr224264ybt.3.1708127712581; Fri, 16
 Feb 2024 15:55:12 -0800 (PST)
Date: Fri, 16 Feb 2024 15:51:54 -0800
Message-Id: <20240216235203.229256-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v5 0/8] Run tests in parallel
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
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

v5 - fix a -Wunused-result
v4 - fix bug in width computation.
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
 tools/perf/tests/builtin-test.c               | 378 ++++++++++--------
 tools/perf/tests/shell/lib/perf_has_symbol.sh |   2 +-
 tools/perf/tests/tests-scripts.c              | 256 ++++++++++++
 tools/perf/tests/tests-scripts.h              |   9 +
 tools/perf/util/print-events.c                |  12 +-
 tools/perf/util/thread_map.c                  |   9 +-
 tools/perf/util/util.c                        |  19 +
 tools/perf/util/util.h                        |   8 +
 13 files changed, 508 insertions(+), 410 deletions(-)
 delete mode 100644 tools/perf/tests/builtin-test-list.c
 delete mode 100644 tools/perf/tests/builtin-test-list.h
 create mode 100644 tools/perf/tests/tests-scripts.c
 create mode 100644 tools/perf/tests/tests-scripts.h

-- 
2.44.0.rc0.258.g7320e95886-goog

