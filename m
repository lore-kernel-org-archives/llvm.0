Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC74434
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 15:59:14 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-11c4d7d4683so2249800fac.8
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 08:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BvvW0Kg0W3K042unQaj9CEGknRtz7aMFSz438VmibVU=;
        b=eBQlwlzYZPt+B8fX5ylPBdpnUXKln0ba0CUgvVPcKbDR4gau3DTN7Ye08VCTZ5wFzC
         gKClSWwq+lcrHXwp0gfNzolufVnQ61EUtn3FUDFGnP4dXIwvsOTDoDFZDyobZXvheyG3
         PyiTrcY5irtNRi9Zrk6phn7idzjefkIHonNPx9/cVjL2cVjXHLiwREWO98EuGbAXwBi+
         bx/km1MdqwDMOSKQQ9MH3/GFQD1QdjtZzExCBXhUg3Mhaidx50PB8hKQfk/xnsHSoGb3
         oKGWvR4vT9FSC8F99PuiFlUSjujf4MieDAvUgdCX8NNz4D0brjCa+tD0jpwubmuE0DjB
         L10A==
X-Gm-Message-State: ACgBeo0VtxYukDNmNp3gsWgPpj5e5Bgc57eVYFwCHCkSq0bsRabokPRb
	vWwGoo4EU8a67tpLbfWC+4sUHKD4rj/cgp7IwF4=
X-Google-Smtp-Source: AA6agR6czoG2IuIpJT0uN8EiCBtNFl5v6joWRtCVtnbHFBg88ktpsFC0VyRExdFR7njpEy9CEVrKQpWafFOs3JSLo1E=
X-Received: by 2002:a05:6870:5b84:b0:10c:d1fa:2f52 with SMTP id
 em4-20020a0568705b8400b0010cd1fa2f52mr1748656oab.92.1660838353887; Thu, 18
 Aug 2022 08:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817053930.769840-1-irogers@google.com> <20220817053930.769840-7-irogers@google.com>
 <CAM9d7cgd-KsqJNxh_MbX9h4tr8rOtAqKe-t7Qfck0m9pTxWK7w@mail.gmail.com> <CAP-5=fVVV8UPppzet7jwvrf9ig8RpWE1x4mxAJBAnuqbdSbP-Q@mail.gmail.com>
In-Reply-To: <CAP-5=fVVV8UPppzet7jwvrf9ig8RpWE1x4mxAJBAnuqbdSbP-Q@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 18 Aug 2022 08:59:01 -0700
Message-ID: <CAM9d7ciGRnz-wP+Riz5AYf8k9QOztV-Acfg=jivijeM8UUAPEw@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 6:17 AM Ian Rogers <irogers@google.com> wrote:
>
> On Wed, Aug 17, 2022, 11:11 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > Hi Ian,
> >
> > On Tue, Aug 16, 2022 at 10:39 PM Ian Rogers <irogers@google.com> wrote:
> > >
> > > If building with clang then enable -Wthread-safety warnings.
> >
> > Do you know the minimal supported version for the option?
> > I'm not sure we have a check for that kind of thing.
>
>
> It has been supported for a long time, close to 10 years. Looking
> around it looks like clang 3.5 had the support. For context, BPF was
> supported after clang 3.7. Given this long support, and we don't
> version check for BPF, I think it is okay to assume the flag is
> supported.

Good, thanks for checking it.
