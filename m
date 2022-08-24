Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101A7E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:05:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so1022323wms.5
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hGnu2y59OBtorqhLwIUK+o18oWZXjlL2FYRhWhdiwO0=;
        b=A6qlhecpQzmKJXTAJ7hZpGEQ0tMojsLooAjp0kAbavqDICMZpjH1pwvI1G8L0tjCWi
         ycOKn2MiSSesS42WM/CAowwbPcvQVWoC98UuZQI5M90uIIcUvi3+w44rEi3XmpI4VAnq
         8nzhyoAINFfyiULvZZsFG+mKujIQxjBQrXR2C0v8VSzUgqAhmHTA4eBN5w6ge2fTdMCD
         hngOOap17HTbtL22wpij4w8HdbNW4lzpLQD+wsR3s02n7ivLZgO8n2gFqr8lNrd/G69M
         kQZPrzjC+uWt/BWrQBe+8q88lVJ8a8imDUDxpnAUSpX2N1B2bgFXxM1EUyHZOVbXS4hW
         LjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hGnu2y59OBtorqhLwIUK+o18oWZXjlL2FYRhWhdiwO0=;
        b=RIQjL2gqbI1YUJJ7f11a4JliVu5L5QzejJCOaap7lh+36H+2n0CCysBqsCPrH5S/Zr
         zyYfjtBc0X+n8CJPJujCOejlVO6vGYEeX2I51nbLY9ivaWwyy3tGpRm1YPzjt8Xmm75q
         JRbrIO+OdNoQBzQr7kdAS9eI20mZAIqWMZOdWlH6LSqSsTttJ2dZko1cPkW5VHRdAt4X
         K9Zx8dyWsKSNx9DJU6sUo8CAEXWBiFvqf2j/NDnXmscYUczrfZ6GVAAopm8RtsRNYXiq
         UfpopKaaCHbrfARf/VLN2gdczOPo0hKyEzrFlvmgAs2jzQ2R5PCBdBG5j6myRBbfJ07T
         ya9w==
X-Gm-Message-State: ACgBeo3TEchc/qCmLUHQxMOYUMdx8e02sXHBxRtXmMlZzCRfbOPBb0Y0
	w1E6RLdXM4BfPALAuEfT6Tjm3dB2OSYfc2GCoAQPKA==
X-Google-Smtp-Source: AA6agR499WDzKJBSZv898v0PqTQOgUe7hv6qsT+KpXp2Cc1g39NpRfCYua8LxewTzPevm6USVRlixpygLB9iau6ycVw=
X-Received: by 2002:a05:600c:25ce:b0:3a5:a3b7:bbfe with SMTP id
 14-20020a05600c25ce00b003a5a3b7bbfemr5784783wml.115.1661353504851; Wed, 24
 Aug 2022 08:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220823220922.256001-1-irogers@google.com> <20220823220922.256001-8-irogers@google.com>
 <02152f40-1dc5-7f1b-ad88-61ecb146a3da@intel.com>
In-Reply-To: <02152f40-1dc5-7f1b-ad88-61ecb146a3da@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 24 Aug 2022 08:04:53 -0700
Message-ID: <CAP-5=fWZaN94M1OS2xRYo6M012mi-cRP_boeBi=p6VPnhbOS7g@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] perf record: Update use of pthread mutex
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
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
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 3:15 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 24/08/22 01:09, Ian Rogers wrote:
> > Switch to the use of mutex wrappers that provide better error checking
> > for synth_lock.
>
> It would be better to distinguish patches that make drop-in
> replacements from patches like this that change logic.

The only change here is PTHREAD_MUTEX_INITIALIZER to mutex_init
because PTHREAD_MUTEX_INITIALIZER doesn't have error checking. The two
are morally equivalent and so no logic change is intended - although
one may inadvertently happen by the moving initialization from compile
time to runtime.

> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-record.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> > index 4713f0f3a6cf..02eb85677e99 100644
> > --- a/tools/perf/builtin-record.c
> > +++ b/tools/perf/builtin-record.c
> > @@ -21,6 +21,7 @@
> >  #include "util/evsel.h"
> >  #include "util/debug.h"
> >  #include "util/mmap.h"
> > +#include "util/mutex.h"
> >  #include "util/target.h"
> >  #include "util/session.h"
> >  #include "util/tool.h"
> > @@ -608,17 +609,18 @@ static int process_synthesized_event(struct perf_tool *tool,
> >       return record__write(rec, NULL, event, event->header.size);
> >  }
> >
> > +static struct mutex synth_lock;
> > +
> >  static int process_locked_synthesized_event(struct perf_tool *tool,
> >                                    union perf_event *event,
> >                                    struct perf_sample *sample __maybe_unused,
> >                                    struct machine *machine __maybe_unused)
> >  {
> > -     static pthread_mutex_t synth_lock = PTHREAD_MUTEX_INITIALIZER;
> >       int ret;
> >
> > -     pthread_mutex_lock(&synth_lock);
> > +     mutex_lock(&synth_lock);
> >       ret = process_synthesized_event(tool, event, sample, machine);
> > -     pthread_mutex_unlock(&synth_lock);
> > +     mutex_unlock(&synth_lock);
> >       return ret;
> >  }
> >
> > @@ -1917,6 +1919,7 @@ static int record__synthesize(struct record *rec, bool tail)
> >       }
> >
> >       if (rec->opts.nr_threads_synthesize > 1) {
> > +             mutex_init(&synth_lock, /*pshared=*/false);
>
> It would be better to have mutex_init() and mutex_init_shared()
> since /*pshared=*/true is rarely used.

Will change in v3.

Thanks,
Ian

> >               perf_set_multithreaded();
> >               f = process_locked_synthesized_event;
> >       }
> > @@ -1930,8 +1933,10 @@ static int record__synthesize(struct record *rec, bool tail)
> >                                                   rec->opts.nr_threads_synthesize);
> >       }
> >
> > -     if (rec->opts.nr_threads_synthesize > 1)
> > +     if (rec->opts.nr_threads_synthesize > 1) {
> >               perf_set_singlethreaded();
> > +             mutex_destroy(&synth_lock);
> > +     }
> >
> >  out:
> >       return err;
>
