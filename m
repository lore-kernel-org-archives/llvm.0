Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F1F4C94
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 20:48:21 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11cb3c811d9so3563725fac.1
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 13:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+sFY7D0l2mnCR+yBDf+opIgpmAA2WEbHZKwcSvQkuz0=;
        b=0nCuo7qPL/8Sz3uoG565gwZU69wHi3V4navaQ8+PdDX2Oahq+dS2QFVQtt7S0rv6IF
         FlXV9Es1tnITisubzoOyTDrtl4ejZ4Mrg20r0GWgFX7HhzdQBib1QyjhRhT85LQOvglO
         x+GoAdVlBy6VN6V0IOdoG5fE0+gIzvqY/M0pL0etuw3G1Ia88RPBzBvKWMYGCjg86tYV
         acdd8s1XPwz955+g/4rAN3ZRn+AWDgF2h2Jf/RFRv+hx9Ny1gCrXiDHu/cjljHFgyJXJ
         9Qr0yjnq1DHaVEy5e4ptSgm6y7QhFCczuZOKjhy6IaitIe0mH93bI3qdvSxTlqvJuL/Y
         FtXw==
X-Gm-Message-State: ACgBeo32d36VzIBPVibqmpK8kspz/rP7dagMTQej9PJuWd+I/I8kLv/E
	qaec2L6qAeRmGBc3vRzz8g6jC8AgiTcd6CAg+D0=
X-Google-Smtp-Source: AA6agR5zjotJNa9cZNMRCVklNAcj4vN3wXvrE7llGej28AXg2L/RwCW7jMpT+qihLPXgoIk9036xBPWFpfl3w2jC2PQ=
X-Received: by 2002:a05:6870:5b84:b0:10c:d1fa:2f52 with SMTP id
 em4-20020a0568705b8400b0010cd1fa2f52mr2736185oab.92.1661546900488; Fri, 26
 Aug 2022 13:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com> <20220824153901.488576-17-irogers@google.com>
 <a7176263-7dc8-6cbd-af2d-5338c4c4b546@intel.com> <CAP-5=fXk+mLv=C0CTrvnBeuhCTAtJ=x2O8D2YqvmVZSMHqcLvQ@mail.gmail.com>
 <b9ffea78-48c4-e2cd-20c2-dc0c9c2c69f7@intel.com> <CAP-5=fVXuwxP-REryDShX0RZQjkdy2YJKJ5M+zczUqDE2=59Bg@mail.gmail.com>
 <CAM9d7cgcLHYded1w4h22F_KWcHUpuxqak7Ny02Awj1WDFLynDQ@mail.gmail.com> <5a0b4083-084a-56b3-a6a1-0fad1100a316@intel.com>
In-Reply-To: <5a0b4083-084a-56b3-a6a1-0fad1100a316@intel.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 26 Aug 2022 13:48:09 -0700
Message-ID: <CAM9d7chNUhmULYUfkEuBC3LcD08y7hLGmFn0qeX83KqoPksvCQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] perf sched: Fixes for thread safety analysis
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>, 
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

On Fri, Aug 26, 2022 at 12:36 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 26/08/22 21:26, Namhyung Kim wrote:
> > On Fri, Aug 26, 2022 at 10:48 AM Ian Rogers <irogers@google.com> wrote:

> >> In the previous code the threads were blocked on mutexes that were
> >> stack allocated and the stack memory went away. You are correct to say
> >> that to those locks I added an init and destroy call. The lifetime of
> >> the mutex was wrong previously and remains wrong in this change.
> >
> > I think you fixed the lifetime issue with sched->thread_funcs_exit here.
> > All you need to do is calling pthread_join() after the mutex_unlock, no?
>
> Like this maybe:

Yeah, but at this point we might want to factor it out as a function like
destroy_tasks().

Thanks,
Namhyung

>
> diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> index b483ff0d432e..8090c1218855 100644
> --- a/tools/perf/builtin-sched.c
> +++ b/tools/perf/builtin-sched.c
> @@ -3326,6 +3326,13 @@ static int perf_sched__replay(struct perf_sched *sched)
>         sched->thread_funcs_exit = true;
>         mutex_unlock(&sched->start_work_mutex);
>         mutex_unlock(&sched->work_done_wait_mutex);
> +       /* Get rid of threads so they won't be upset by mutex destruction */
> +       for (i = 0; i < sched->nr_tasks; i++) {
> +               int err = pthread_join(sched->tasks[i]->thread, NULL);
> +
> +               if (err)
> +                       pr_err("pthread_join() failed for task nr %lu, error %d\n", i, err);
> +       }
>         return 0;
>  }
