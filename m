Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91460160
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 06:42:14 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id m6so3880316oib.4
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 23:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xT/8EmOLWgGpotOZrjKtP5nnobd3VpZhpZsW/obGVUc=;
        b=FVnrxU/nhTOeal+lVBE1xWeXHchPG95WhjNJXj6jpAPmDdnDz21hA1bFtDsnwPIwei
         fJKBm7Q83tBDHxvCEODcpxy+C2sh/6/ts011PKPWXQ66tv9d2iD704oN5/Mg3J311MBh
         BAm3ZMF0m/qPb751iBHE2eqQMELEzHoTFLPYEDt7I6tB7BNoJMoyNTQNhCp7tlzrRZ7Y
         dj4HCh21gRYTgrUk39zJ2FeGUP8+5pnuOJSqDGCJ/8POlRbG1WUS0gXpfCDtcqAazFRE
         YVepWspt3CYJvccCxaTwsueB1Y7BEq+/jRgG3fqTt6YmIdHHQ0z03+Afgq+ZFUioelVU
         1rTw==
X-Gm-Message-State: ACgBeo0QW++d9rgRFGVGlErHezgY9L8fXeed4S7Mc6SlJoNhGX5ZLApb
	VfHBzDNBccDHFjmlHKq7iomep17pYUHGqzOciOY=
X-Google-Smtp-Source: AA6agR7+ZYQsBIT+yyrvDvPpd1PiAtyHAPRxJdIOVAmAMD+SBoYMPAYQ0vMAQEbHZAie9v3BtB0Wl75yTPJfbYAyRIs=
X-Received: by 2002:aca:ba86:0:b0:33a:c6f7:3001 with SMTP id
 k128-20020acaba86000000b0033ac6f73001mr5184885oif.5.1660891333580; Thu, 18
 Aug 2022 23:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817053930.769840-1-irogers@google.com> <20220817053930.769840-6-irogers@google.com>
 <CAM9d7ciBh2DhH7wEVFfXucxtvaog_BBVkuYcNC4vX_XQDx-QCw@mail.gmail.com> <CAP-5=fWPgfSa5ck9DLUZaMd4g6y=3hY1Q-=vjgZxNS0Et6Qjuw@mail.gmail.com>
In-Reply-To: <CAP-5=fWPgfSa5ck9DLUZaMd4g6y=3hY1Q-=vjgZxNS0Et6Qjuw@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 18 Aug 2022 23:42:02 -0700
Message-ID: <CAM9d7cgRDgHtAJd9814tbV41yY8Leypzv8Ay=kQgswjNYWj0RA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] perf mutex: Fix thread safety analysis
To: Ian Rogers <irogers@google.com>
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

On Thu, Aug 18, 2022 at 11:17 AM Ian Rogers <irogers@google.com> wrote:
>
> On Thu, Aug 18, 2022 at 9:41 AM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > On Tue, Aug 16, 2022 at 10:39 PM Ian Rogers <irogers@google.com> wrote:
> > >
> > > Add annotations to describe lock behavior. Add missing unlocks to
> > > perf_sched__replay. Alter hist_iter__top_callback as the thread-safety
> > > analysis cannot follow pointers through local variables.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > >  tools/perf/builtin-sched.c | 8 ++++++++
> > >  tools/perf/builtin-top.c   | 5 +++--
> > >  2 files changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> > > index 0f52f73be896..a8a765ed28ce 100644
> > > --- a/tools/perf/builtin-sched.c
> > > +++ b/tools/perf/builtin-sched.c
> > > @@ -658,6 +658,8 @@ static void *thread_func(void *ctx)
> > >  }
> > >
> > >  static void create_tasks(struct perf_sched *sched)
> > > +       EXCLUSIVE_LOCK_FUNCTION(sched->start_work_mutex)
> > > +       EXCLUSIVE_LOCK_FUNCTION(sched->work_done_wait_mutex)
> > >  {
> > >         struct task_desc *task;
> > >         pthread_attr_t attr;
> > > @@ -687,6 +689,8 @@ static void create_tasks(struct perf_sched *sched)
> > >  }
> > >
> > >  static void wait_for_tasks(struct perf_sched *sched)
> > > +       EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
> > > +       EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
> > >  {
> > >         u64 cpu_usage_0, cpu_usage_1;
> > >         struct task_desc *task;
> > > @@ -738,6 +742,8 @@ static void wait_for_tasks(struct perf_sched *sched)
> > >  }
> > >
> > >  static void run_one_test(struct perf_sched *sched)
> > > +       EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
> > > +       EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
> > >  {
> > >         u64 T0, T1, delta, avg_delta, fluct;
> > >
> > > @@ -3314,6 +3320,8 @@ static int perf_sched__replay(struct perf_sched *sched)
> > >         for (i = 0; i < sched->replay_repeat; i++)
> > >                 run_one_test(sched);
> > >
> > > +       mutex_unlock(&sched->start_work_mutex);
> > > +       mutex_unlock(&sched->work_done_wait_mutex);
> >
> > But this would wake up the replay tasks and let them burn cpus unnecessarily.
> > Maybe we can make them exit at the moment.
>
> I think I've stumbled on a can of worms. Why would you spin and not
> use a condition variable? Anyway, I can remove this by just saying
> this function leaves these locked.

I think you can add a boolean variable and set it before unlocking the
mutexes.  In the thread body, it can check the variable and exit.


>
> >
> > >         return 0;
> > >  }
> > >
> > > diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
> > > index 3757292bfe86..e832f04e3076 100644
> > > --- a/tools/perf/builtin-top.c
> > > +++ b/tools/perf/builtin-top.c
> > > @@ -196,6 +196,7 @@ static void perf_top__record_precise_ip(struct perf_top *top,
> > >                                         struct hist_entry *he,
> > >                                         struct perf_sample *sample,
> > >                                         struct evsel *evsel, u64 ip)
> > > +       EXCLUSIVE_LOCKS_REQUIRED(he->hists->lock)
> > >  {
> > >         struct annotation *notes;
> > >         struct symbol *sym = he->ms.sym;
> > > @@ -724,13 +725,13 @@ static void *display_thread(void *arg)
> > >  static int hist_iter__top_callback(struct hist_entry_iter *iter,
> > >                                    struct addr_location *al, bool single,
> > >                                    void *arg)
> > > +       EXCLUSIVE_LOCKS_REQUIRED(iter->he->hists->lock)
> > >  {
> > >         struct perf_top *top = arg;
> > > -       struct hist_entry *he = iter->he;
> > >         struct evsel *evsel = iter->evsel;
> > >
> > >         if (perf_hpp_list.sym && single)
> > > -               perf_top__record_precise_ip(top, he, iter->sample, evsel, al->addr);
> > > +               perf_top__record_precise_ip(top, iter->he, iter->sample, evsel, al->addr);
> > >
> > >         hist__account_cycles(iter->sample->branch_stack, al, iter->sample,
> > >                      !(top->record_opts.branch_stack & PERF_SAMPLE_BRANCH_ANY),
> >
> > Looks like a separate change.
>
> This is subtle and relates to how the thread safety pass in clang is
> implemented. I'll waffle but the TL;DR is that without this change we
> can't enable Wthread-safety so I'd say it is part of the same change.
> The waffley bit:
>
> Thread safety checking puts the annotation on to the variable and not
> the type. We know that:
> const char *x = "hi";
> char *y = x;
> will give a compile time error on the assignment to y as const-ness
> was lost. With the thread safety checks you could have:
> char *x PT_GUARDED_BY(lock) = ...;
> char *y = x;
> And if you used x without holding "lock" you'd get an error but you
> wouldn't get the same error from y, even though behind the scenes it
> is the same memory. It is the same case here, on entry we know that
> "iter->he->hists->lock" is held but the assignment to "he" means clang
> doesn't know that "he->hists->lock" is held. This then fails the check
> on perf_top__record_precise_ip that the lock be held as we pass "he"
> rather than "iter->he".

Oh, I mean this perf top change can be separated from perf sched.

Thanks,
Namhyung
