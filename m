Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D53440F
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 13:17:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso914874wmb.2
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0hMBZdmypFeE7nn9xpMgEu0GnAmxZ1jeqSSwSJUPNNw=;
        b=rx/8KX1mx8pJRM89xEGW6NK8OKmkJd2/woep5gOqGBrN/7wCef8CijbpKqeuvkrDYH
         w5swqrKMHXoMv7i14LzcSTZJ2MLuu9/I14kjsrvs9GjUEUeA0/P08z4yLkPgOJ9VDGtN
         pt64OkRaZh8MkRfyO0I5R2Mta5tE2GNS2hZvV22yguSN3xkZjzQb1xusC3wVGapEw+x3
         ffCmamFDmN3upQjRi3SO99qIXUUa3sJ4fcBhAeQOZwShAscwfy+2fMOCGt5l1tQqaFta
         nzS1rjpyYyFrOG86aRO6hxDT7mQblkdXd14wXqSKrochgVcu1kGs5Vseao4cayI9iuEQ
         esMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0hMBZdmypFeE7nn9xpMgEu0GnAmxZ1jeqSSwSJUPNNw=;
        b=2Qu4ClMQGLIn0MeTOKRH/4I0LDkh7vqs2ZCKIEPyWELzy+6esRcUDWAE2R2CDlyUP6
         8sBiPsIQPUcuZkboGBsYgWQEtA1VwYJ4md1j6fUVjQoRcAZU0X2s29XR/WFDxjPjU9Kq
         hfXW2yJk0M9VD98uJNbyybghYCfcLyAD6ipjgEbjGFvo+6uv7KF4PX/t3B0A+s4022FB
         2bTzInn+lJmw3btZY/SkuaY9Pk3oF/zgvql2OXoXEJYCKJGPCkYEd2WxKvZMpwAWV30V
         GlRuKQ3FtTHMO/ikkYGegSGpMF8Mg+pIdu7dUU9KDGmdaICPA4/abyMnUmUoS3ksgK5g
         HNNg==
X-Gm-Message-State: ACgBeo28AVZlxsNAWdba6D40JiP8qEafDkE7XXAsOkBW7333UBF/BEcx
	TnC0r3SAWU9oK108FDstLySDjQnCu4sTf72Oaag/BA==
X-Google-Smtp-Source: AA6agR4P2W83lFoyy+21Wbj3xoywCVddVDI5GzAZccFnalAxynNAHBGH73Kr8DU9jGhKcsmqEpavY1+anpVqWP3s4UA=
X-Received: by 2002:a05:600c:19c8:b0:3a5:ec6a:8d16 with SMTP id
 u8-20020a05600c19c800b003a5ec6a8d16mr5021369wmq.182.1660828670994; Thu, 18
 Aug 2022 06:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817053930.769840-1-irogers@google.com> <20220817053930.769840-7-irogers@google.com>
 <CAM9d7cgd-KsqJNxh_MbX9h4tr8rOtAqKe-t7Qfck0m9pTxWK7w@mail.gmail.com>
In-Reply-To: <CAM9d7cgd-KsqJNxh_MbX9h4tr8rOtAqKe-t7Qfck0m9pTxWK7w@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 18 Aug 2022 06:17:38 -0700
Message-ID: <CAP-5=fVVV8UPppzet7jwvrf9ig8RpWE1x4mxAJBAnuqbdSbP-Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] perf build: Enable -Wthread-safety with clang
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

On Wed, Aug 17, 2022, 11:11 PM Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hi Ian,
>
> On Tue, Aug 16, 2022 at 10:39 PM Ian Rogers <irogers@google.com> wrote:
> >
> > If building with clang then enable -Wthread-safety warnings.
>
> Do you know the minimal supported version for the option?
> I'm not sure we have a check for that kind of thing.


It has been supported for a long time, close to 10 years. Looking
around it looks like clang 3.5 had the support. For context, BPF was
supported after clang 3.7. Given this long support, and we don't
version check for BPF, I think it is okay to assume the flag is
supported.

Thanks,
Ian

>
> Thanks,
> Namhyung
>
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/Makefile.config | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index 0661a1cf9855..0ef6f572485d 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -19,6 +19,11 @@ detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
> >  CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
> >  HOSTCFLAGS := $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
> >
> > +# Enabled Wthread-safety analysis for clang builds.
> > +ifeq ($(CC_NO_CLANG), 0)
> > +  CFLAGS += -Wthread-safety
> > +endif
> > +
> >  include $(srctree)/tools/scripts/Makefile.arch
> >
> >  $(call detected_var,SRCARCH)
> > --
> > 2.37.1.595.g718a3a8f04-goog
> >
