Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F124401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:42:53 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-33f8988daecso24902727b3.12
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=x7OCRh/WujRFV4WEHTN0aVfGYVTj+gZ5+QGOawN0UMQ=;
        b=dOmEkYWv5eacAeX+bYu/5ceyXdLgNpDQPzA9DZnGT6HLOQVMNYJg3R8q8K9vrarc0O
         DtMvGoOJssxiHtmL5PkSz065DyB8gBC28ondjU4uYQ8PT3TpEuQ2mgepQN7+FJ7zv2cM
         NClcBXtNBvgKPi9HVMdMjHZc1a+dwbPwIbOJRIy0AQ3T9WNMgyQE2W/eBi7Fw79SO+xu
         c3e1Mn3pZyNNP5v3kZcwdHZ7WYXFJecUDOo0qYhkReiVmtPNX9LxemrqJzhu7gXjXjLi
         1T3+dviNWOMZMMgd2bElRLtXoMDHOoZ4crMWrC7PAFv482VOrjdjexuA0wbDenO9NyH5
         tYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=x7OCRh/WujRFV4WEHTN0aVfGYVTj+gZ5+QGOawN0UMQ=;
        b=Rk85GqJn8UtOCIZ6Iz6E5OB1dtkHFSpgoie9vST5ZBSGqd1g4fn1vIfpjKzkI0M3fg
         1kV/YTfbhe9YEt8nT3P2KqDecy23+qKd5Dfx/ljur3KxO22DmB+XxmFG+sM6IaHzPqtH
         +fuqqoWvxzxbHSmzCtvfPcaT9P6Jc8e0MF+DhDagjdGMsnAoFcXSfg09GYXle+N3ehKA
         z83Bm4+AmzzYvIWiDrhMqkXO29yAP8Wyqm3cyWxtp6qVAv0joTiWvnpf18gYMNHYA1dq
         eu6K7F8ZA0Ws1ifJxAX5KuDRUm8V4MWWmaePTd5XuvAl+6pdk82dI4yQwufDMFmhtUjQ
         Q6xg==
X-Gm-Message-State: ACgBeo315Aj2/ppM6sVIrtiUph+AQkVkoXsYHkadbTjcUi5qDEpA/rNi
	0SzeIfLVvunvHLdYXNJwdkQ3n6IvA39e
X-Google-Smtp-Source: AA6agR60YCDarlCEotO39GXAdMY5aHeBRNEw6vaCOtc2CzOpsY/VBmH/cffxSqGPWU0anRXBd9lhbojQL9Bn
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP
 id t14-20020a056902124e00b00668222ce8damr469773ybu.383.1661532172310; Fri, 26
 Aug 2022 09:42:52 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:24 -0700
Message-Id: <20220826164242.43412-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 00/18] Mutex wrapper, locking and memory leak fixes
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

v4. Adds a comment for the trylock result, fixes the new line (missed
    in v3) and removes two blank lines as suggested by Adrian Hunter.
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
 tools/perf/util/mutex.h                    | 108 +++++++++++++++++++
 tools/perf/util/probe-event.c              |   3 +
 tools/perf/util/symbol.c                   |   4 +-
 tools/perf/util/top.h                      |   5 +-
 41 files changed, 569 insertions(+), 323 deletions(-)
 create mode 100644 tools/perf/util/mutex.c
 create mode 100644 tools/perf/util/mutex.h

-- 
2.37.2.672.g94769d06f0-goog

