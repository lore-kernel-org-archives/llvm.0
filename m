Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB9441B
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 19:08:18 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-11e7e0a63e2so2378433fac.4
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 12:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=squGQK7T4fhu/A2+puelG7xJpkvvOARv9nk4HKG56Rg=;
        b=DF+3cm5rrVCppuWJ+bvsHQF/hj0jryiOHCBlnQp84LC1IWgCVT37X9K5YK6cU4RiRQ
         Hk8GVAB/i19KVt3gSjFH76sh1BGNSCQj8FCgrsVNvhEP3z1x2y4GFwpYjqy0HUu4gL4a
         hxf2y96Kx6HG6C61IeZ4vWwddorGvHm0aEY8Z0lYuE68/vkOVxwgnLtH+X+gw3L4Rn8Q
         e/UEipS9XEvoSn/81WgNvJ0VJKgH/hoMcY9EFml05r3vcPMh4sq0XVjD0JZ3Fq3xR814
         VQSqIoV/X//QU9BZsdQio78TQ5FhCK+fu+QU20QeL/TvVvG4eqtlJVk015aiN4EFgZz5
         x2wg==
X-Gm-Message-State: ACgBeo1jPG3+sLOIxi6AyeI3uuCRC61d8cPrq7fMytsj7Zt7NTJ+xKnJ
	TSs97Hw7pP8oQcmahCSOrwIq5SCM2pbI1ukm1A4=
X-Google-Smtp-Source: AA6agR58gxvkRi0KncHAt6chs7qM7Vpd1++erLoRCXwUTB64LZQ+R+YGyhU1eRiWnbszMjVWh1LNiVpB+ROvHpVBb9E=
X-Received: by 2002:a05:6870:a184:b0:116:bd39:7f94 with SMTP id
 a4-20020a056870a18400b00116bd397f94mr2582144oaf.5.1661540897768; Fri, 26 Aug
 2022 12:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 26 Aug 2022 12:08:06 -0700
Message-ID: <CAM9d7cgQZsbwWSdRNQqUE+GsSgPVqFmKs9LJ5b6ta2-dax5T2Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] Mutex wrapper, locking and memory leak fixes
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 9:42 AM Ian Rogers <irogers@google.com> wrote:
>
> When fixing a locking race and memory leak in:
> https://lore.kernel.org/linux-perf-users/20211118193714.2293728-1-irogers@google.com/
>
> It was requested that debug mutex code be separated out into its own
> files. This was, in part, done by Pavithra Gurushankar in:
> https://lore.kernel.org/lkml/20220727111954.105118-1-gpavithrasha@gmail.com/
>
> These patches fix issues with the previous patches, add in the
> original dso->nsinfo fix and then build on our mutex wrapper with
> clang's -Wthread-safety analysis. The analysis found missing unlocks
> in builtin-sched.c which are fixed and -Wthread-safety is enabled by
> default when building with clang.
>
> v4. Adds a comment for the trylock result, fixes the new line (missed
>     in v3) and removes two blank lines as suggested by Adrian Hunter.
> v3. Adds a missing new line to the error messages and removes the
>     pshared argument to mutex_init by having two functions, mutex_init
>     and mutex_init_pshared. These changes were suggested by Adrian Hunter.
> v2. Breaks apart changes that s/pthread_mutex/mutex/g and the lock
>     annotations as requested by Arnaldo and Namhyung. A boolean is
>     added to builtin-sched.c to terminate thread funcs rather than
>     leaving them blocked on delted mutexes.
>
> Ian Rogers (17):
>   perf bench: Update use of pthread mutex/cond
>   perf tests: Avoid pthread.h inclusion
>   perf hist: Update use of pthread mutex
>   perf bpf: Remove unused pthread.h include
>   perf lock: Remove unused pthread.h include
>   perf record: Update use of pthread mutex
>   perf sched: Update use of pthread mutex
>   perf ui: Update use of pthread mutex
>   perf mmap: Remove unnecessary pthread.h include
>   perf dso: Update use of pthread mutex
>   perf annotate: Update use of pthread mutex
>   perf top: Update use of pthread mutex
>   perf dso: Hold lock when accessing nsinfo
>   perf mutex: Add thread safety annotations
>   perf sched: Fixes for thread safety analysis
>   perf top: Fixes for thread safety analysis
>   perf build: Enable -Wthread-safety with clang
>
> Pavithra Gurushankar (1):
>   perf mutex: Wrapped usage of mutex and cond

For the patches 1-7 and 10-13

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung


>
>  tools/perf/Makefile.config                 |   5 +
>  tools/perf/bench/epoll-ctl.c               |  33 +++---
>  tools/perf/bench/epoll-wait.c              |  33 +++---
>  tools/perf/bench/futex-hash.c              |  33 +++---
>  tools/perf/bench/futex-lock-pi.c           |  33 +++---
>  tools/perf/bench/futex-requeue.c           |  33 +++---
>  tools/perf/bench/futex-wake-parallel.c     |  33 +++---
>  tools/perf/bench/futex-wake.c              |  33 +++---
>  tools/perf/bench/numa.c                    |  93 ++++++----------
>  tools/perf/builtin-inject.c                |   4 +
>  tools/perf/builtin-lock.c                  |   1 -
>  tools/perf/builtin-record.c                |  13 ++-
>  tools/perf/builtin-sched.c                 | 105 +++++++++---------
>  tools/perf/builtin-top.c                   |  45 ++++----
>  tools/perf/tests/mmap-basic.c              |   2 -
>  tools/perf/tests/openat-syscall-all-cpus.c |   2 +-
>  tools/perf/tests/perf-record.c             |   2 -
>  tools/perf/ui/browser.c                    |  20 ++--
>  tools/perf/ui/browsers/annotate.c          |  12 +--
>  tools/perf/ui/setup.c                      |   5 +-
>  tools/perf/ui/tui/helpline.c               |   5 +-
>  tools/perf/ui/tui/progress.c               |   8 +-
>  tools/perf/ui/tui/setup.c                  |   8 +-
>  tools/perf/ui/tui/util.c                   |  18 ++--
>  tools/perf/ui/ui.h                         |   4 +-
>  tools/perf/util/Build                      |   1 +
>  tools/perf/util/annotate.c                 |  15 +--
>  tools/perf/util/annotate.h                 |   4 +-
>  tools/perf/util/bpf-event.h                |   1 -
>  tools/perf/util/build-id.c                 |  12 ++-
>  tools/perf/util/dso.c                      |  19 ++--
>  tools/perf/util/dso.h                      |   4 +-
>  tools/perf/util/hist.c                     |   6 +-
>  tools/perf/util/hist.h                     |   4 +-
>  tools/perf/util/map.c                      |   3 +
>  tools/perf/util/mmap.h                     |   1 -
>  tools/perf/util/mutex.c                    | 119 +++++++++++++++++++++
>  tools/perf/util/mutex.h                    | 108 +++++++++++++++++++
>  tools/perf/util/probe-event.c              |   3 +
>  tools/perf/util/symbol.c                   |   4 +-
>  tools/perf/util/top.h                      |   5 +-
>  41 files changed, 569 insertions(+), 323 deletions(-)
>  create mode 100644 tools/perf/util/mutex.c
>  create mode 100644 tools/perf/util/mutex.h
>
> --
> 2.37.2.672.g94769d06f0-goog
>
