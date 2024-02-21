Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411E38DD2
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486924; cv=none; b=nbCSldE0jXbcqnipVJegSVI93rHJuu8FNCwCyPbFtNeoSfY/zKKxJ/UfbEMLUjI9dgor6fSwrAxA+5My/n8BX24+p50vHLLQ8S5u3RU1nTR5UXSmT5K4xqpVEZMslTWP4CDTb34B6FyDvwTe3SfVbws0aP/3/voDeItCQVAPPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486924; c=relaxed/simple;
	bh=qBBWee4bsjohLiPXM4U45YwIA5H1h0d6lKaukzf7Cio=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=qR/aJJl3clbaiuz3ufpbY0ZfehuiGAGoPAl4FgpM1KZvSRSz8nxJBdUaHv030B5EWg4m5Y56TexNoh/qCueNoCvmUI7liXwkUaeWvGKYrqbjBQV8bytpgTxuwals9J9HAOHmsBoaAzwfazjUZf+6c0/A2nj3jMrfLWHhhNH7bSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3hw52Hzw; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3hw52Hzw"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcd703b721dso7567319276.1
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 19:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486922; x=1709091722; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s7WjKSr2mVwiWkPP/U/UgciWSCHgFfzH5V639nNOP7Y=;
        b=3hw52HzwC852LW4Sv10oJJk6iRP9IhyJeJfx1Jezzu3GU3HbRngLe7O+/BILoYKjto
         NXaa8dvytTezfqe6FyjZejjseGxGKQI0m5kHUp4zJmxormr8G+RInTBz5phsmgd2plPK
         chKBqcVYmu8IqFECeMfZvXTmcZS6DMKSaWdss2ykfTwVUBpPyjZaJBtR2GZHTB4RO9B4
         hf7jEpOBTOkDcMisiAIEzdHZT6mJSBQek2Z9WSXfRBafNPGuYn671lhMWFejuCKpOfeo
         ZkUjkAPvvGMde4YvjQeDLFzAH2jEa58vLW3C6Vy1kykTK2MzEzrvzKihrzVcAJD+9+tJ
         sBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486922; x=1709091722;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7WjKSr2mVwiWkPP/U/UgciWSCHgFfzH5V639nNOP7Y=;
        b=LBsMoHsWHMCsSsK1sUwIlbKMY0Xlqr/CO3fKU/e6GJnGFvNZ9w7g8wYEis9b64G8Bc
         led3oEBeXTgOcwXC83yYHEAQbSmII95T7BgpRKZhkylDaO3yHhsEfwFmb4CI15RLQNt/
         WZOfvyuYSGir5qYCmKSzB6ks3Gbfc2AeIQE9YyckmTNF6pxwgvR+H13awmwQufmtRWS0
         /j0V7A3W/nPPtgVHJhXQUXVDaK6ECoNTv2d7KQH1nNLWqyohXftxRfETvV8INFwYgRXw
         E1IETpitGcC86nw1MK9MF80aLEwRwmcj+UwAK0Nqx2le8tdBPKh4yCc6tGRzJK23A9uV
         gX+g==
X-Forwarded-Encrypted: i=1; AJvYcCX0JKan6XRIFUVSri8UhU4Yk0EFOYvsfjHLpm2Tb+kkoKObQXFx8Ys5C9sMpiekovsHkRWxWlCStMYChP/4neonbyy/Qw==
X-Gm-Message-State: AOJu0Yxvs145wedYkzW1yi63NyGTG4GrW09dPppfunQSwsAJrZgWb4Ex
	Za0VaVu9ri0rqeAtd9AEg0/7/RuDC2sTQN45Z/u5WEEAJ+d2+8R7iKD0VGQdO/Uo5Ld46lx9F8+
	CLKuiNg==
X-Google-Smtp-Source: AGHT+IFrvrVz/STekeJ0Kw066vLWgDLKhldWGJrVTkT+Pmf7Wne7BKkr3s7PpVJuEJj3xYqUV9Sas2NxDudg
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3c02:f882:5876:b7ab])
 (user=irogers job=sendgmr) by 2002:a05:6902:110d:b0:dc6:44d4:bee0 with SMTP
 id o13-20020a056902110d00b00dc644d4bee0mr1005962ybu.7.1708486922283; Tue, 20
 Feb 2024 19:42:02 -0800 (PST)
Date: Tue, 20 Feb 2024 19:41:47 -0800
Message-Id: <20240221034155.1500118-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v6 0/8] Run tests in parallel
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

v6 - fix/test alpine linux build
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
 tools/perf/tests/tests-scripts.c              | 257 ++++++++++++
 tools/perf/tests/tests-scripts.h              |   9 +
 tools/perf/util/print-events.c                |  13 +-
 tools/perf/util/thread_map.c                  |   9 +-
 tools/perf/util/util.c                        |  19 +
 tools/perf/util/util.h                        |   8 +
 13 files changed, 510 insertions(+), 410 deletions(-)
 delete mode 100644 tools/perf/tests/builtin-test-list.c
 delete mode 100644 tools/perf/tests/builtin-test-list.h
 create mode 100644 tools/perf/tests/tests-scripts.c
 create mode 100644 tools/perf/tests/tests-scripts.h

-- 
2.44.0.rc0.258.g7320e95886-goog

