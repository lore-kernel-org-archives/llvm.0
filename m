Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190CF52268E
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915990; cv=none; b=nBA5duVV2VFp/raD7takMSRJaDGO+uMWAL9vgmCMiTT6W0/y9jBO6lTaFWzR2vxXWyDeffrh3Lcp60nDB6QWxaDQ6z9jNHdoVF67k12Oo4KmN8APLk+Ob2KJa/BFGL1gfjFBe+TCDY/u45rKajdDAD1QHSBIZegmLjWoZ+4d2pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915990; c=relaxed/simple;
	bh=NQ3N+KtF1s0lIIfEoQjD3h9bq8byinBG0GY1189Km5c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EbihV9EC7oRGdP2oNKhK+MK/YBtNz1NHCQWy6tZb0gDIHatcrCrJ3mHF+VXyO26/TNmvybJCKHrSTfYYkzjugi1x2udSN74sA2X1aWu8vo3FCHUXVYDtICKgr+uxxwFX9GlxIt2xmNnJ7NbqgSHWkid7RPHy0FVcFe0xUCA2qp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HW4OUh6N; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HW4OUh6N"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so2028892eec.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791915988; x=1792520788; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgKWIghaSLwHkVze9bXo1k3NgwY+M5W7+3Wd5vtJHbY=;
        b=HW4OUh6NKXTbiHfrwYyoO5KzVicpN6Vpv2eFSB5wlTm08EyRI5yISzObwIAJuLIT/V
         4DWqlOfuEQszQE4T8eizPckE1x0wS5ofjMflxPwiLTAZqzFkoGXzwq2iHz2CmG2Xl3GX
         qgyJjS9uileJfv6C+Nb4q1e5KPZf37tN8FUKJLM1ixm7jtrcALe59QVfyXbfvGtZEsQX
         8+r+aBCs3mYeVxIEgidYyGobK7Szmqg8oaUaqHhThSvGr6OyHAAR9ypc4XWdiQ+kZL10
         MPzMUQmzzVrdmD1/XZNXeLM7taMVaZ66b0eSgrVDQA8h5KKzgAzPEUiQUdy+TLPoQS4P
         wz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915988; x=1792520788;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgKWIghaSLwHkVze9bXo1k3NgwY+M5W7+3Wd5vtJHbY=;
        b=ZdcGqfwXP9y84hXIslCZu/hgkd9UkRPkKpeR5uifpY2rwo7eZ9vCnu4vZsqch6yrrE
         wNMPhF7g743uAIXpxxcGJs5RqseLXnmXjqmlQJtURSbFUxAi6A/6a4zwiePvRafzqZ+h
         Hd7j5ILA69exfBS9VcYU5768z7p5Z+98Ek1QBQ0mAcV49z0fYPzUew5TOhwqXydkYB99
         AqWCVM62BboaQvXLDyTT3OTihiKvsEavOuRw7QR5KlhKtSUVFYu5LbuplQfQ2WVWpi9z
         DuVcuHk8Eu30tDi1XdCdebBPQfodbKfOoyqc8SiHVNL665MDbQGdraRLORoP+boYPptd
         jQTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt9sYlI32EpOmfsdl7pJhbAG7slYOk16VmU7iDaEMKCATw5UnxQI9vj4vWhpEhcOMg4yj3@lists.linux.dev
X-Gm-Message-State: AFq9FYK5JyG06ME0TS9aBYLyS0rtu5J5uXi3PdUDnyJD66xCEFoI6UmZ
	iHZXuAe7Re5a6oEXtP1k/iKG1PkWkENPcQlXYjzvREtm6chSejrX+hoqlLTIYFaDiVY15xYbjFR
	LKsnniL8k8A==
X-Received: from dybtm1.prod.google.com ([2002:a05:7300:f0c1:b0:358:cd5e:4e5c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:4706:b0:34e:3ce1:39f8
 with SMTP id 5a478bee46e88-3537e021d3cmr18888848eec.18.1791915987312; Tue, 13
 Oct 2026 11:26:27 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:48 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-1-irogers@google.com>
Subject: [PATCH v1 00/10] tools/perf: Adopt kernel compiler-context-analysis.h annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The perf tool previously added Clang thread-safety annotations in
tools/perf/util/mutex.h (GUARDED_BY, LOCKABLE, EXCLUSIVE_LOCK_FUNCTION,
UNLOCK_FUNCTION, etc.). Since then, the Linux kernel has adopted a
unified set of static context analysis macros and attributes in
include/linux/compiler-context-analysis.h (context_lock_struct,
__guarded_by, __acquires, __releases, __must_hold, etc.).

This series makes tools/include/linux/compiler-context-analysis.h
functional by synchronizing it and the required compiler_types.h helpers
with the kernel headers, converts tools/perf from its custom mutex.h
macros to the kernel-style compiler-context-analysis.h annotations, and
expands context analysis coverage across comm, dso/dsos, thread/threads,
config, intel-tpebs, env, and maps. In the process, it fixes an unlocked
__dsos__add() call in __machine__addnew_vdso(), an unlocked read of
tpebs_reader_thread in tpebs_stop(), and adds a read-lock fast path to
dsos__findnew_id().

Ian Rogers (10):
  compiler-context-analysis: Avoid unused parameter warning in
    _context_unsafe_alias()
  tools headers compiler: Synchronize compiler_types.h with the kernel
    sources
  tools headers: Synchronize linux/compiler-context-analysis.h with the
    kernel sources
  perf mutex: Use kernel style compiler-context-analysis.h annotations
  perf build: Enable additional Clang thread-safety flags
  perf comm: Add __guarded_by annotations to struct comm_strs
  perf dso: Fix unlocked __dsos__add() in vdso and expand lock
    annotations
  perf thread: Expand context analysis annotations to threads and
    namespaces_lock
  perf config, intel-tpebs, env: Add __guarded_by and __must_hold
    annotations
  perf maps: Add context analysis annotations

 include/linux/compiler-context-analysis.h     |   2 +-
 .../include/linux/compiler-context-analysis.h | 518 ++++++++++++++++--
 tools/include/linux/compiler-gcc.h            |  55 +-
 tools/include/linux/compiler.h                |  50 +-
 tools/include/linux/compiler_types.h          | 206 ++++++-
 tools/perf/Makefile.config                    |   5 +-
 tools/perf/builtin-sched.c                    |  16 +-
 tools/perf/builtin-top.c                      |   4 +-
 tools/perf/check-headers.sh                   |   1 +
 tools/perf/tests/dso-data.c                   |   4 +
 tools/perf/util/annotate.c                    |   4 +-
 tools/perf/util/annotate.h                    |   8 +-
 tools/perf/util/bpf-event.h                   |   5 +-
 tools/perf/util/comm.c                        |  10 +-
 tools/perf/util/config.c                      |  39 +-
 tools/perf/util/dso.c                         |  89 ++-
 tools/perf/util/dso.h                         |  12 +-
 tools/perf/util/dsos.c                        |  29 +-
 tools/perf/util/dsos.h                        |   9 +-
 tools/perf/util/env.c                         |   1 +
 tools/perf/util/env.h                         |  19 +-
 tools/perf/util/intel-tpebs.c                 |  86 ++-
 tools/perf/util/libbfd.c                      |   4 +-
 tools/perf/util/maps.c                        | 122 +++--
 tools/perf/util/mutex.c                       |   4 +-
 tools/perf/util/mutex.h                       |  90 +--
 tools/perf/util/rwsem.c                       |   8 +-
 tools/perf/util/rwsem.h                       |  10 +-
 tools/perf/util/thread.c                      |  10 +-
 tools/perf/util/thread.h                      |  30 +-
 tools/perf/util/threads.c                     |   4 +
 tools/perf/util/threads.h                     |   6 +-
 tools/perf/util/vdso.c                        |   2 +-
 33 files changed, 1050 insertions(+), 412 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

