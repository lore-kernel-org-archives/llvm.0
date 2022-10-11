Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D76112
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 21:32:23 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id b15so13616261pje.1
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 14:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ikGBgko34MK8Q4AzkK3JoVI5yFlG4OFIaLI3Bh2Pdvk=;
        b=TBVibUTb+e+fqcJcnLpSEAgXBwg/5lAvgViQjDw5VSZnqEIJ4ZYFGy4Lx0WWSlruVY
         yYzo8d5UsknaIBJ05dROYJNKw1IBdsNHfqJWTX6aTAEtpa7LdQlExy5dwrWW2IvCN++Z
         wNfDaDvn7TdNqXf6R0909mywmpJJaswv6WKub/g4xXrPsVkVxQhimgJZwoMZsiFJYRIB
         Dha6Hx7uzVLNRRM8Zk1iwJbchU2+cUjtjyDI66jRw8z4tJMBs8+Xi/zyW3X9nPVrI5Ij
         hD61P6ACVj5QHawphHPWH1Kf73y6Zdz9FwntK8yUZDl9TiXYytbelmNFNSyQdnSdfbsT
         u0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikGBgko34MK8Q4AzkK3JoVI5yFlG4OFIaLI3Bh2Pdvk=;
        b=fJ+gIPYAy9ItdQKzLyjhyDyDsEj6dB7Max6jE1MEt1KrmZyBw+5dIR+yl2atEzSI/H
         yguTTT2gvFY+2nlGlDPG68qkeNmPfNC6OE12BimRxwLhsmlIT+jtOXZBBxQ7DeQv//he
         QLHh/rDH07yFTrZI0aED1IL/Pdr2akrqvw8Y5gfaA0ThqMWF20LrUKkfoLuj6ZDUm65B
         oMMOLMUV/STr4BxjXTp2l7MvEKaHOBAvl5xhXWdKWvO8qDXJxTnHeZMT4U8ezpNSpx15
         z3vlcHnqkeqM+e7V633O0jh7/jxW/il7TCyATF99lwXqYmWKIBvzrn/ECBNW6U6s1yC8
         W2UA==
X-Gm-Message-State: ACrzQf0D6rpCYF1giNtydu+PtjguzETdKCtbNTd+DXNCnV3+cxb7osZJ
	qFTyH3c0DaEzAxyQi8ZM7lQAp+gNVk5y7n/eNva8iw==
X-Google-Smtp-Source: AMsMyM7vUNgsNdzlwAgOOqjbogivmsfmkpSHWwUyP76bR5WmeWGZF8Mjzaf+a+QNqMDUPosfKwLOOYdIJLja5h2QLMw=
X-Received: by 2002:a17:902:b218:b0:184:710c:8c52 with SMTP id
 t24-20020a170902b21800b00184710c8c52mr92201plr.95.1665523942762; Tue, 11 Oct
 2022 14:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnrHErOK+w878izVauHUKaX3eD-HXgigq2Ogm3iSj-fHA@mail.gmail.com>
 <76CB17D0-5A66-4D49-A389-8F40EC830DC0@sladewatkins.net> <CAP-5=fXVgwMO_CpS-EHN6PFhLB-J5Ft7qHz7oQd-WOMnTj72Cw@mail.gmail.com>
 <CAM9d7chvZjZ4YVc6j3w7OkdHteyJ0GUZboieu9G7jAWBevoZqA@mail.gmail.com>
 <e553c4f8-ed3d-0755-cc8a-b5ffe43b2c2f@amd.com> <CAKwvOdk6TTNhu_+FdONTXPo9Z8u5D4-5kf-rMN8oK4+6fMyc-w@mail.gmail.com>
 <CABPqkBQVfQFJKCdHXEMGFcupzvy8zq14F52eLW5s9vr2Shmi6w@mail.gmail.com> <85822c3c-2254-52cc-e6b1-9c89adb63771@amd.com>
In-Reply-To: <85822c3c-2254-52cc-e6b1-9c89adb63771@amd.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Oct 2022 14:32:11 -0700
Message-ID: <CAKwvOdkfEexsE07XXGW3FF+nMt-pR8uv2EA7QzsPbEZsSQBO-Q@mail.gmail.com>
Subject: Re: Invalid event (cycles:pp) in per-thread mode, enable system wide
 with '-a'.
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Stephane Eranian <eranian@google.com>, Slade Watkins <srw@sladewatkins.net>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@gmail.com>, 
	Kees Cook <keescook@chromium.org>, sandipan.das@amd.com, 
	Bill Wendling <morbo@google.com>, clang-built-linux <llvm@lists.linux.dev>, Yonghong Song <yhs@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 6, 2022 at 8:56 PM Ravi Bangoria <ravi.bangoria@amd.com> wrote:
>
> +cc: PeterZ
>
> >>>>> +Ravi who may be able to say if there are any issues with the precise
> >>>>> sampling on AMD.
> >>>>
> >>>> Afaik cvcles:pp will use IBS but it doesn't support per-task profiling
> >>>> since it has no task context.  Ravi is working on it..
> >>>
> >>> Right.
> >>> https://lore.kernel.org/lkml/20220829113347.295-1-ravi.bangoria@amd.com
> >>
> >> Cool, thanks for working on this Ravi.
> >>
> >> I'm not sure yet whether I may replace the kernel on my corporate
> >> provided workstation, so I'm not sure yet I can help test that patch.
> >>
> >> Can you confirm that
> >> $ perf record -e cycles:pp --freq=128 --call-graph lbr -- <command to profile>
> >>
> >> works with just that patch applied? Or is there more work required?
> >> What is the status of that patch?
> >>
> >> For context, we had difficulty upstreaming support for instrumentation
> >> based profile guided optimizations in the Linux kernel.
> >> https://lore.kernel.org/lkml/CAHk-=whqCT0BeqBQhW8D-YoLLgp_eFY=8Y=9ieREM5xx0ef08w@mail.gmail.com/
> >> We'd like to be able to use either instrumentation or sampling to
> >> optimize our builds.  The major barrier to sample based approaches are
> >> architecture / micro architecture issues with sample based profile
> >> data collection, and bitrot of data processing utilities.
> >> https://github.com/google/autofdo/issues/144
> >
> > On existing AMD Zen2, Zen3 the following cmdline:
> > $ perf record -e cycles:pp --freq=128 --call-graph lbr -- <command to profile>
> >
> > does not work. I see two reasons:
> >
> > 1. cycles:pp is likely converted into IBS op in cycle mode.
> >     Current kernels do not support IBS in per-thread mode.
> >     This is purely a kernel limitation
>
> Right, it's purely a kernel limitation. And below simple patch on top
> of event-context rewrite patch[1] should be sufficient to make cycles:pp
> working in per-process mode on AMD Zen.
>
> ---
> diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
> index c251bc44c088..de01b5d27e40 100644
> --- a/arch/x86/events/amd/ibs.c
> +++ b/arch/x86/events/amd/ibs.c
> @@ -665,7 +665,7 @@ static struct perf_ibs perf_ibs_fetch = {
>
>  static struct perf_ibs perf_ibs_op = {
>         .pmu = {
> -               .task_ctx_nr    = perf_invalid_context,
> +               .task_ctx_nr    = perf_hw_context,
>
>                 .event_init     = perf_ibs_init,
>                 .add            = perf_ibs_add,
> ---
>
> [1]: https://lore.kernel.org/lkml/20220829113347.295-1-ravi.bangoria@amd.com

Hi Ravi,
I didn't see the above diff in
https://lore.kernel.org/lkml/20221008062424.313-1-ravi.bangoria@amd.com/
Was there another distinct patch you were going to send for the above?

-- 
Thanks,
~Nick Desaulniers
