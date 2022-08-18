Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2E87B
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 06:11:17 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p128so590256oif.9
        for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 23:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7wi5Dq09PF7tBJQH6bXSrTc2e9ldESvsPGRPC2plYto=;
        b=VM2YbEb1O7M5NwVMyIZjwJPNDZ06PYhsGt8X4yHSog5lk49PGHRBCwWbgXDLoad3Sh
         uYDkVQJrwqOb9h1vH+G0gR8PcT670s1SWKrFi5LQ78uIikGrchtn83CR+IvKnlnCrMJD
         f4KYfVYieZLbf0DoFU8+Oxcy3GYDJaT22Payzub4FheWBBpl5R079BvUXvmy3z89E5lk
         la2O6K3oyTZU3qDdJcaFXge+RlCcFP49zHD+kPG+1bNM8r8p9Atea0XriAdu2t11Mofk
         glpD/7CMxD+OG5pnAlojGFv9yrJ+xKy5VIRTJeEVtZExHdnuOv2U2Mlp/pn/RvaewmfA
         CdXw==
X-Gm-Message-State: ACgBeo28SrgByfI3mzOUvBCcLbh0miuSQAifNADGlIafeQNZxEC9Vhdq
	xTytHGwjGh+Ic89l12Iqwp1Fxy2a5BjrL51xGhw=
X-Google-Smtp-Source: AA6agR4/sPvTIzjHQaJmNk55ffpb1MSMI0f8hww9p7bOSxJWVEuIYeW5MYOhK0zcxE+zpqSo2p6nc7U+NyhPVjAcmJM=
X-Received: by 2002:aca:6088:0:b0:343:75a6:d6a3 with SMTP id
 u130-20020aca6088000000b0034375a6d6a3mr694163oib.92.1660803076558; Wed, 17
 Aug 2022 23:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817053930.769840-1-irogers@google.com> <20220817053930.769840-7-irogers@google.com>
In-Reply-To: <20220817053930.769840-7-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 17 Aug 2022 23:11:04 -0700
Message-ID: <CAM9d7cgd-KsqJNxh_MbX9h4tr8rOtAqKe-t7Qfck0m9pTxWK7w@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] perf build: Enable -Wthread-safety with clang
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

Hi Ian,

On Tue, Aug 16, 2022 at 10:39 PM Ian Rogers <irogers@google.com> wrote:
>
> If building with clang then enable -Wthread-safety warnings.

Do you know the minimal supported version for the option?
I'm not sure we have a check for that kind of thing.

Thanks,
Namhyung


>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/Makefile.config | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 0661a1cf9855..0ef6f572485d 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -19,6 +19,11 @@ detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
>  CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
>  HOSTCFLAGS := $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
>
> +# Enabled Wthread-safety analysis for clang builds.
> +ifeq ($(CC_NO_CLANG), 0)
> +  CFLAGS += -Wthread-safety
> +endif
> +
>  include $(srctree)/tools/scripts/Makefile.arch
>
>  $(call detected_var,SRCARCH)
> --
> 2.37.1.595.g718a3a8f04-goog
>
