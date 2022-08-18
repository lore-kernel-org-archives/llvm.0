Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED224699
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 18:17:26 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id z185so2310471vsb.4
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=rT2H7zlcI3RbMs94rTqf1TBmQjKXhRQAfwkbwmUxhx8=;
        b=ZAe8Fo690UR35gXYrC8n1f6/45PnTs0JqPtd/wzOqd21vWG8HzQqnUef38dnjI+jIo
         F/AF3v6Go4ZhQy72p3BLVZ9xq1OM/OjXCeqaFXW+JjQeDXrr0C+vAA2luAnzsiZ05IZG
         uuofD+JCbEEFQvKGcSU6Zm59tINvNljz/buqfNO4Jvk8342/bQ3dFu7G9B+R8nT9Z6Ei
         HlCJXTJC3OWgwntsTuf+AR1j0Wq2z+FZfgwCWnAWuXyZOvfKMx1jKHzomLG4L74Qd90Y
         I2qZ1eQ9SPy8Hh+oiQmkmn1fZsEU7atoma6CQbCywU2aoxKcsVpKJ6AcQiRaWSAzI5VD
         EvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=rT2H7zlcI3RbMs94rTqf1TBmQjKXhRQAfwkbwmUxhx8=;
        b=fvCPNOR0zBDCwqehKfDDRjetgob0TfphJDWY+sjmIfR0ZuBbMiu+HAZJC2a3R4Nwho
         bLjYYrh/RvErl6b8o26oTep9xFR1STDRQVCkXkQJVmwH02N/ECUyHJ6l66IMBKKsFHfR
         Zt0FQ8RVRCcfvvMRjnrPxe8I5NcsvCxb2/XXBwyrpvdZBfiSQfuBCM83NnN1m8Fk1O6O
         o8qeWFu3n5p+GsvwHpjSapCUz4aTu45U5EZBUWBtp+UYZ8qDZyNi0VcpCGt4+pSDdcdy
         yKC8OuS0i+RLYiDhlNeLljqZTwIEww3ZVEcVDPprXNVjjDQtNWAWNs8+HBdhEuBgZH/F
         weXw==
X-Gm-Message-State: ACgBeo0fZRf+hxWFmXtbs1yVLLo1lLba6Of+vP7QNETkv4aDgOUwOsds
	/KhFaLlUSSlAgzEpcveaMGMSDHY2OKLG+reQxCgSYQ==
X-Google-Smtp-Source: AA6agR5+uj3uGbdRY155vc58puxQAjmKpFPCCn8f/lDMgE/7pqVk3fGVMYvkjQkSYIi/zK78CfDGYqSChiTxMLjRj1Q=
X-Received: by 2002:a67:d105:0:b0:38d:c73d:fe21 with SMTP id
 u5-20020a67d105000000b0038dc73dfe21mr1675728vsi.36.1660846645628; Thu, 18 Aug
 2022 11:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817053930.769840-1-irogers@google.com> <20220817053930.769840-6-irogers@google.com>
 <CAM9d7ciBh2DhH7wEVFfXucxtvaog_BBVkuYcNC4vX_XQDx-QCw@mail.gmail.com>
In-Reply-To: <CAM9d7ciBh2DhH7wEVFfXucxtvaog_BBVkuYcNC4vX_XQDx-QCw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 18 Aug 2022 11:17:14 -0700
Message-ID: <CAP-5=fWPgfSa5ck9DLUZaMd4g6y=3hY1Q-=vjgZxNS0Et6Qjuw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] perf mutex: Fix thread safety analysis
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Weiguo Li <liwg06@foxmail.com>, 
	Pavithra Gurushankar <gpavithrasha@gmail.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Dario Petrillo <dario.pk1@gmail.com>, 
	Wenyu Liu <liuwenyu7@huawei.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Dave Marchevsky <davemarchevsky@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexandre Truong <alexandre.truong@arm.com>, 
	Kim Phillips <kim.phillips@amd.com>, Leo Yan <leo.yan@linaro.org>, 
	Quentin Monnet <quentin@isovalent.com>, William Cohen <wcohen@redhat.com>, 
	Andres Freund <andres@anarazel.de>, Song Liu <songliubraving@fb.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Andi Kleen <ak@linux.intel.com>, 
	Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, Riccardo Mancini <rickyman7@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Zechuan Chen <chenzechuan1@huawei.com>, Jason Wang <wangborong@cdjrlc.com>, 
	Lexi Shao <shaolexi@huawei.com>, Remi Bernon <rbernon@codeweavers.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 9:41 AM Namhyung Kim <namhyung@kernel.org> wrote:
>
> On Tue, Aug 16, 2022 at 10:39 PM Ian Rogers <irogers@google.com> wrote:
> >
> > Add annotations to describe lock behavior. Add missing unlocks to
> > perf_sched__replay. Alter hist_iter__top_callback as the thread-safety
> > analysis cannot follow pointers through local variables.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-sched.c | 8 ++++++++
> >  tools/perf/builtin-top.c   | 5 +++--
> >  2 files changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> > index 0f52f73be896..a8a765ed28ce 100644
> > --- a/tools/perf/builtin-sched.c
> > +++ b/tools/perf/builtin-sched.c
> > @@ -658,6 +658,8 @@ static void *thread_func(void *ctx)
> >  }
> >
> >  static void create_tasks(struct perf_sched *sched)
> > +       EXCLUSIVE_LOCK_FUNCTION(sched->start_work_mutex)
> > +       EXCLUSIVE_LOCK_FUNCTION(sched->work_done_wait_mutex)
> >  {
> >         struct task_desc *task;
> >         pthread_attr_t attr;
> > @@ -687,6 +689,8 @@ static void create_tasks(struct perf_sched *sched)
> >  }
> >
> >  static void wait_for_tasks(struct perf_sched *sched)
> > +       EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
> > +       EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
> >  {
> >         u64 cpu_usage_0, cpu_usage_1;
> >         struct task_desc *task;
> > @@ -738,6 +742,8 @@ static void wait_for_tasks(struct perf_sched *sched)
> >  }
> >
> >  static void run_one_test(struct perf_sched *sched)
> > +       EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
> > +       EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
> >  {
> >         u64 T0, T1, delta, avg_delta, fluct;
> >
> > @@ -3314,6 +3320,8 @@ static int perf_sched__replay(struct perf_sched *sched)
> >         for (i = 0; i < sched->replay_repeat; i++)
> >                 run_one_test(sched);
> >
> > +       mutex_unlock(&sched->start_work_mutex);
> > +       mutex_unlock(&sched->work_done_wait_mutex);
>
> But this would wake up the replay tasks and let them burn cpus unnecessarily.
> Maybe we can make them exit at the moment.

I think I've stumbled on a can of worms. Why would you spin and not
use a condition variable? Anyway, I can remove this by just saying
this function leaves these locked.

>
> >         return 0;
> >  }
> >
> > diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
> > index 3757292bfe86..e832f04e3076 100644
> > --- a/tools/perf/builtin-top.c
> > +++ b/tools/perf/builtin-top.c
> > @@ -196,6 +196,7 @@ static void perf_top__record_precise_ip(struct perf_top *top,
> >                                         struct hist_entry *he,
> >                                         struct perf_sample *sample,
> >                                         struct evsel *evsel, u64 ip)
> > +       EXCLUSIVE_LOCKS_REQUIRED(he->hists->lock)
> >  {
> >         struct annotation *notes;
> >         struct symbol *sym = he->ms.sym;
> > @@ -724,13 +725,13 @@ static void *display_thread(void *arg)
> >  static int hist_iter__top_callback(struct hist_entry_iter *iter,
> >                                    struct addr_location *al, bool single,
> >                                    void *arg)
> > +       EXCLUSIVE_LOCKS_REQUIRED(iter->he->hists->lock)
> >  {
> >         struct perf_top *top = arg;
> > -       struct hist_entry *he = iter->he;
> >         struct evsel *evsel = iter->evsel;
> >
> >         if (perf_hpp_list.sym && single)
> > -               perf_top__record_precise_ip(top, he, iter->sample, evsel, al->addr);
> > +               perf_top__record_precise_ip(top, iter->he, iter->sample, evsel, al->addr);
> >
> >         hist__account_cycles(iter->sample->branch_stack, al, iter->sample,
> >                      !(top->record_opts.branch_stack & PERF_SAMPLE_BRANCH_ANY),
>
> Looks like a separate change.

This is subtle and relates to how the thread safety pass in clang is
implemented. I'll waffle but the TL;DR is that without this change we
can't enable Wthread-safety so I'd say it is part of the same change.
The waffley bit:

Thread safety checking puts the annotation on to the variable and not
the type. We know that:
const char *x = "hi";
char *y = x;
will give a compile time error on the assignment to y as const-ness
was lost. With the thread safety checks you could have:
char *x PT_GUARDED_BY(lock) = ...;
char *y = x;
And if you used x without holding "lock" you'd get an error but you
wouldn't get the same error from y, even though behind the scenes it
is the same memory. It is the same case here, on entry we know that
"iter->he->hists->lock" is held but the assignment to "he" means clang
doesn't know that "he->hists->lock" is held. This then fails the check
on perf_top__record_precise_ip that the lock be held as we pass "he"
rather than "iter->he".

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > --
> > 2.37.1.595.g718a3a8f04-goog
> >
