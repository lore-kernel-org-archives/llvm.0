Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2F7E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:39:22 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31f5960500bso296884667b3.14
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=xAbfQkbFPDellsaKp24mP9oyoxp7QvISDP34HXAcivU=;
        b=a2wk7yyHwGIg9lpsjrMBoXBGmUTlnW3gqtujQyK+BxMa4n/0WuJoDBekFkKWNwvK4o
         YphYU74NwhOc59R6BKbI+akTqgq0EdXZPQUd5+TGk8VmuGjlO/KTXNWYE9ljIAhqa+Wz
         w8fHpWGql8hcPAnnhaXPcmM8CWtbl+D5qMz39Ci8/FTDJplXmDJHSDS+Es9sjlFBLQWb
         QshTju5UfzeXpDaT5s8LswU6rfaSr+bOOTR8PRhxJKErIRE9nImFDlfngNpIAp+LzH+V
         cgnGRMxA+vi7div/DMiNovUVS0skrPaODNSFqGHlnHcB7Q2TztN+RYmC5XHoxT3N11hH
         GuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=xAbfQkbFPDellsaKp24mP9oyoxp7QvISDP34HXAcivU=;
        b=1J0vvXQoxvz9e0GdVO42rY4ZuEfH+90HWczNoNkrAVQmkfWzFY3b+5nSSnBWG6XGmL
         zpPQroAvHKD8Wl7JJ88jaDQ0dInx3gnSieQ4RMWjlHwDtr0Yv2XZ3DZqirzpWdihfQew
         p5IOI+s0b1AeYGujCVuvaDQrrAPfgf0GLycTnNpYNZOXVbWTnVEbL2pQaRdEb89v80oc
         TFUEdgkd5FH3WXdqyfe6hzip6n9PBgrDHEbt2Ed0OtAnP2WnhqnCjC03/okViyy7hSZP
         QcbDK+4Rpky9Qjvv54v9zewSZ4MRMp7zUrpoptqgV3UjpOpg367/70A7UdfjfayVSbMX
         /nKA==
X-Gm-Message-State: ACgBeo0ActE+pgcUtUEw5NHZz3peax/TVXZnGNPrPjbpHb8H3l3ub/Z+
	err5d4APkg1DituOimPX8YkDG1AKraTG
X-Google-Smtp-Source: AA6agR7vrZdDjak13qWKrwy63oS2Xh/EMZv6mckisVInWYa9XhxM8MDPH8MwW5A/nm6WBQKRBgBP3E7h3TuG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ab82:a348:500d:1fc4])
 (user=irogers job=sendgmr) by 2002:a25:3285:0:b0:690:aa8c:2a55 with SMTP id
 y127-20020a253285000000b00690aa8c2a55mr30341747yby.255.1661355561255; Wed, 24
 Aug 2022 08:39:21 -0700 (PDT)
Date: Wed, 24 Aug 2022 08:38:43 -0700
Message-Id: <20220824153901.488576-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v3 00/18] Mutex wrapper, locking and memory leak fixes
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When fixing a locking race and memory leak in:
https://lore.kernel.org/linux-perf-users/20211118193714.2293728-1-irogers@google.com/

It was requested that debug mutex code be separated out into its own
files. This was, in part, done by Pavithra Gurushankar in:
https://lore.kernel.org/lkml/20220727111954.105118-1-gpavithrasha@gmail.com/

These patches fix issues with the previous patches, add in the
original dso->nsinfo fix and then build on our mutex wrapper with
clang's -Wthread-safety analysis. The analysis found missing unlocks
in builtin-sched.c which are fixed and -Wthread-safety is enabled by
default when building with clang.

v3. Adds a missing new line to the error messages and removes the
    pshared argument to mutex_init by having two functions, mutex_init
    and mutex_init_pshared. These changes were suggested by Adrian Hunter.
v2. Breaks apart changes that s/pthread_mutex/mutex/g and the lock
    annotations as requested by Arnaldo and Namhyung. A boolean is
    added to builtin-sched.c to terminate thread funcs rather than
    leaving them blocked on delted mutexes.

Ian Rogers (17):
  perf bench: Update use of pthread mutex/cond
  perf tests: Avoid pthread.h inclusion
  perf hist: Update use of pthread mutex
  perf bpf: Remove unused pthread.h include
  perf lock: Remove unused pthread.h include
  perf record: Update use of pthread mutex
  perf sched: Update use of pthread mutex
  perf ui: Update use of pthread mutex
  perf mmap: Remove unnecessary pthread.h include
  perf dso: Update use of pthread mutex
  perf annotate: Update use of pthread mutex
  perf top: Update use of pthread mutex
  perf dso: Hold lock when accessing nsinfo
  perf mutex: Add thread safety annotations
  perf sched: Fixes for thread safety analysis
  perf top: Fixes for thread safety analysis
  perf build: Enable -Wthread-safety with clang

Pavithra Gurushankar (1):
  perf mutex: Wrapped usage of mutex and cond

 tools/perf/Makefile.config                 |   5 +
 tools/perf/bench/epoll-ctl.c               |  33 +++---
 tools/perf/bench/epoll-wait.c              |  33 +++---
 tools/perf/bench/futex-hash.c              |  33 +++---
 tools/perf/bench/futex-lock-pi.c           |  33 +++---
 tools/perf/bench/futex-requeue.c           |  33 +++---
 tools/perf/bench/futex-wake-parallel.c     |  33 +++---
 tools/perf/bench/futex-wake.c              |  33 +++---
 tools/perf/bench/numa.c                    |  93 ++++++----------
 tools/perf/builtin-inject.c                |   4 +
 tools/perf/builtin-lock.c                  |   1 -
 tools/perf/builtin-record.c                |  13 ++-
 tools/perf/builtin-sched.c                 | 105 +++++++++---------
 tools/perf/builtin-top.c                   |  45 ++++----
 tools/perf/tests/mmap-basic.c              |   2 -
 tools/perf/tests/openat-syscall-all-cpus.c |   2 +-
 tools/perf/tests/perf-record.c             |   2 -
 tools/perf/ui/browser.c                    |  20 ++--
 tools/perf/ui/browsers/annotate.c          |  12 +--
 tools/perf/ui/setup.c                      |   5 +-
 tools/perf/ui/tui/helpline.c               |   5 +-
 tools/perf/ui/tui/progress.c               |   8 +-
 tools/perf/ui/tui/setup.c                  |   8 +-
 tools/perf/ui/tui/util.c                   |  18 ++--
 tools/perf/ui/ui.h                         |   4 +-
 tools/perf/util/Build                      |   1 +
 tools/perf/util/annotate.c                 |  15 +--
 tools/perf/util/annotate.h                 |   4 +-
 tools/perf/util/bpf-event.h                |   1 -
 tools/perf/util/build-id.c                 |  12 ++-
 tools/perf/util/dso.c                      |  19 ++--
 tools/perf/util/dso.h                      |   4 +-
 tools/perf/util/hist.c                     |   6 +-
 tools/perf/util/hist.h                     |   4 +-
 tools/perf/util/map.c                      |   3 +
 tools/perf/util/mmap.h                     |   1 -
 tools/perf/util/mutex.c                    | 119 +++++++++++++++++++++
 tools/perf/util/mutex.h                    | 109 +++++++++++++++++++
 tools/perf/util/probe-event.c              |   3 +
 tools/perf/util/symbol.c                   |   4 +-
 tools/perf/util/top.h                      |   5 +-
 41 files changed, 570 insertions(+), 323 deletions(-)
 create mode 100644 tools/perf/util/mutex.c
 create mode 100644 tools/perf/util/mutex.h

-- 
2.37.2.609.g9ff673ca1a-goog

