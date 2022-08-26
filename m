Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C954401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 17:46:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id n17so2634619wrm.4
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Uh5dFSwK4Zt6YSWyVYmlZi4W8FwEVSfgNxzBjpzWgRU=;
        b=ASsXRXxFXGbufFEF85lod6Fj6XovOs3tY/mYL2fNrOFrUZgxQQoyt0oFzOY+F91wk1
         GI8TIDJN/x2/q2Mim77qosgmD1MAx/eukjBGfiRDMM9OFzEwiOAMBkzp7UujOdrQ1bEm
         WNgeidlm+XQAzuGQ9jj3eQbJCevzgt+Xcob0pGxvdEokcJSegi1kYztOTJV/RwUjwIaG
         sTKYt5F6y/9P74lSxu3KkCeCFc8YHJjL9Bon5Hcnwo8uNM5aZL0YeoRe1SB44AxPQ/08
         9tvtaJXrw4+t0D2X4PU5z5whKre+zxyxztg9r8tH8Qled+Yp+DKkWwrMpgoOATkPHPr6
         2IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Uh5dFSwK4Zt6YSWyVYmlZi4W8FwEVSfgNxzBjpzWgRU=;
        b=7sIKBdwJFttyWilLckgooSoCJUpPxdGuHbw3ehyktJf9iyUL+6FIx+fU4d3L38UUqY
         RF/A8/TfLrpVsI9FwWSwqqzkElzuUF6BXwrPATsCUv/V8x1aO6V8eUwP2PtE85nuoG4R
         +xQG2aUtiCWHhT0w3825h7rExqC6DF81PfOY5qLU+nY/0Hon8M2zK9m612F1PKZQBpSj
         DuJylQLMrjauKG2YvkDJXyXbsOxVYsUVOpLQItU8LUrVdSuwlKbyK6cWjIgW8IW63P2a
         87ptFDxAImE6+OaA/dEmtVy7gOLXjK8on/x+Mtey9XS+KEdM/8n+BLxZAnUKZU7slaU7
         Rt6Q==
X-Gm-Message-State: ACgBeo3i21g3tDCkSQMGrZLVRtptZBzzYtZEyiJ+YPILPoMRomsMm/tc
	zQY51djWOgMbYW7x3zsM4EkEv0dYOG5jO7mW6ZgqcQ==
X-Google-Smtp-Source: AA6agR6UXgkazQ9d8SSn07/lRGYnesHuQWNqOEjB0qqIsN2zrj0kJqBzDCcQs4/3b7t17h2xp4xpiFOoZZyMRKGAjGw=
X-Received: by 2002:a05:6000:1008:b0:225:58e0:223f with SMTP id
 a8-20020a056000100800b0022558e0223fmr419790wrx.375.1661535977496; Fri, 26 Aug
 2022 10:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com> <20220824153901.488576-12-irogers@google.com>
 <12acbe02-bd73-07bb-d0e1-cb13dcd790c0@intel.com> <CAP-5=fWCpoqAhLzdMn1zHXfKpsYg0LQPMSz6Uy82+QL_MQpc8g@mail.gmail.com>
 <dc25fa1b-1c29-755a-2fc9-b30ec79eb2ac@intel.com>
In-Reply-To: <dc25fa1b-1c29-755a-2fc9-b30ec79eb2ac@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 26 Aug 2022 10:46:05 -0700
Message-ID: <CAP-5=fVHi9h5mgW3GGkaO4b0aR=CQea3bNSY9ghHJV4KiGC=Nw@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] perf dso: Update use of pthread mutex
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

On Fri, Aug 26, 2022 at 10:34 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 26/08/22 19:05, Ian Rogers wrote:
> > On Fri, Aug 26, 2022 at 3:37 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
> >>
> >> On 24/08/22 18:38, Ian Rogers wrote:
> >>> Switch to the use of mutex wrappers that provide better error checking.
> >>>
> >>> Signed-off-by: Ian Rogers <irogers@google.com>
> >>> ---
> >>>  tools/perf/util/dso.c    | 12 ++++++------
> >>
> >> Some not done yet
> >>
> >> $ grep -i pthread_mut tools/perf/util/dso.c
> >> static pthread_mutex_t dso__data_open_lock = PTHREAD_MUTEX_INITIALIZER;
> >>         pthread_mutex_lock(&dso__data_open_lock);
> >>         pthread_mutex_unlock(&dso__data_open_lock);
> >>         if (pthread_mutex_lock(&dso__data_open_lock) < 0)
> >>                 pthread_mutex_unlock(&dso__data_open_lock);
> >>         pthread_mutex_unlock(&dso__data_open_lock);
> >>         pthread_mutex_lock(&dso__data_open_lock);
> >>         pthread_mutex_unlock(&dso__data_open_lock);
> >>         pthread_mutex_lock(&dso__data_open_lock);
> >>         pthread_mutex_unlock(&dso__data_open_lock);
> >
> > Yes, these are all solely dso__data_open_lock that lacks any clear
> > init/exit code to place the initialization/destruction hooks onto. I
> > don't plan to alter these in this patch set.
>
> Perhaps that could be explained in the change log.
>
> But why not just add init / exit code.  Could be called out
> of main(), or maybe use __attribute__((constructor)) /
> __attribute__((destructor))

Because the lock is global and not part of the dso.

Thanks,
Ian
