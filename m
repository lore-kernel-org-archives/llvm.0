Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50F10A0F
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 04:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707886474; cv=none; b=DTa3sLx8hJ1JtX7ZNf3mRhvyOxzIdoPWL2JoiuLd9IzUTuxdH/xLp9Rh0tomA4wXwfQydswbIGbGZFzaSN3yY6ayeBCf/bIp7P+8/YmjePoi0iMS2qukcT9KxaLQMJ1wDEDQo7NNNA+rWB/o80Qf6eZGZ9RiPsTS1rWfp4zzkOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707886474; c=relaxed/simple;
	bh=AZkj8nr3rTJwCIYBmRK7nb3+iIvG9RkuLmqV/PSrPQs=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=YWv+mNnobSxdx35/RQiPp8i7pBMNAlkR6Wo+AAU9XhIr00+vjSQ8+B/m3Gmavba3ie1S9Mx4jI+IQ1bAre6HP0W8JaQPKnBX1gJ9ek8GWAMyJ2fN1UoE6Fc2Wr7qiQ53XOJ8FXlqbkG+F3EbXRVoVleyEy9xIZ1MVlBSgkLRkWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4YcTtY90; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4YcTtY90"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b26845cdso8796877276.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707886471; x=1708491271; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ctzZOFDIDCO27f6VAbHfS1jvQWovSoWz66g42EKGfuk=;
        b=4YcTtY90+RvHjyRb5LUxl/Skwx4RPLxgfs6Tb8KqLQY+3/HWKPTXFGr/IEk9TWmuUS
         sMRF/sdrriHHYb6b84fHHTGOr8NXzlDC5YMEvkGgSGi9YFysrwVuReD66BtUojUgihea
         NMnM0AZqcwQhDIqFLs11L20iolu1o+V1Hz82q703VKUbiA8BZ0MSm5SjsX2YHrMePl0x
         O65RlI3lYKmOPryARAiH8r+lew2Qn2AEPMgjrHTmy3HFekwcMTKOlKcTHAiDDbh7pfDy
         uDzJQRY0v8wZg+neGmNBJyzChZsQaOlIqoASc5r+97ye2fkYHVurkDPp0iJw2AFrRK8G
         663A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707886471; x=1708491271;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctzZOFDIDCO27f6VAbHfS1jvQWovSoWz66g42EKGfuk=;
        b=K+13NagZHXw4nt+mc5RBWkHKbPpr8hDq4e0rnePp88gtcWMLxy92vtksC74IXlMvBw
         KYunyJpKxG5AaN7mB57JE/erfbeh3wYKlPmJq1sh+apPMLS/OotuSGyz953JSX7p2tI+
         zNcGm+QwK+eUyQWRXPhdrxKoWCQcipBid/f6p/dqi1OcZMgR5vEqbBJhItl6FF21wPvR
         0UqhKheLwaOMhSXu3A2HO+IXYy6tG0gZdE/06YbTlNKE5LCkRP9hfU9e6s39AipN4QoZ
         bOyY14SOgywseAh65Yy4SayqmV+Ia+eBfsKKbCYZGc9tSlhtThwIGeUfGsshFpCcHJ6U
         OE3g==
X-Forwarded-Encrypted: i=1; AJvYcCVdCj4kwZhgk1LEH6WTajIa2QQB4JpPL69t+xtFRaWrDAk9+2DMjQ74nRFm1zDg8sjWPdxEp2MeURzULB2TNdeqBFsTmw==
X-Gm-Message-State: AOJu0Yyo73kCR0WPqnxgOp//Phj+rQSKvxdBR+6g+VhsJ5MTvf9LkjaI
	YCYBdU9VhkqTcuFlZj42bI+19fo4X8TtROuT3BlkHfuuzi0sXewNrdfsoOe4W213VeabVJBa4Xq
	/ObYWgQ==
X-Google-Smtp-Source: AGHT+IGPnmcYdhlTyWdG8WwU1B8c6rYZBkfwPChuZzSyqXfDRxnlsUWRs2jjVCCjiapBLHDNTioXDCpl6oPD
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:6d92:85eb:9adc:66dd])
 (user=irogers job=sendgmr) by 2002:a05:6902:150d:b0:dc6:e1ed:bd1a with SMTP
 id q13-20020a056902150d00b00dc6e1edbd1amr357350ybu.2.1707886471142; Tue, 13
 Feb 2024 20:54:31 -0800 (PST)
Date: Tue, 13 Feb 2024 20:53:48 -0800
Message-Id: <20240214045356.748330-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v4 0/8] Run tests in parallel
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
 tools/perf/util/print-events.c                |  12 +-
 tools/perf/util/thread_map.c                  |   9 +-
 tools/perf/util/util.c                        |  19 +
 tools/perf/util/util.h                        |   8 +
 13 files changed, 509 insertions(+), 410 deletions(-)
 delete mode 100644 tools/perf/tests/builtin-test-list.c
 delete mode 100644 tools/perf/tests/builtin-test-list.h
 create mode 100644 tools/perf/tests/tests-scripts.c
 create mode 100644 tools/perf/tests/tests-scripts.h

-- 
2.43.0.687.g38aa6559b0-goog

