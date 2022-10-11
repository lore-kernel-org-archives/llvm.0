Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545916112
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 21:38:34 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id f193so13954761pgc.0
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 14:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZNbHUK+yxH7xAz5qDHWdQhAXZuHH8sbrlRR1vf4g80=;
        b=gzxgwKgiydl0fWeXtr36pOqpNkD/Eh+hQ7pxOctcmyL0l/QcBulsIZQ68AxZtn/VqO
         9qy8UuWT15HZlUAxfRcZUqeos1cKMlu/iwJvpwM6lDk5kPG6+5KJkl1vUOz094B2ZRjp
         BXEABV1RGcAara2Kev2UOagrPdSZea8yr5CiWE9BSQsD+BhHp0rqe9S3eSOiBdJRu0hG
         vN2QHf3bxg6sEe9K8PGReC+lrNkn4CS57pwIPExsxg/8J+ZGptz97Jg+6VbO5Ypo94Q/
         F7cH7P42e9X+YW1Cg0f9UyG+RVKtvJA/yDZVDdFUCz+UYMNFH/STNXNezo6PnuKEE28F
         3Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZNbHUK+yxH7xAz5qDHWdQhAXZuHH8sbrlRR1vf4g80=;
        b=nJWZyykDR6LgHkZedBvULwYo7VY5KsKgFDtpGhKfUiLBzl284kJ5Sx/ipIpdznpoDn
         +O6RMyRb66FlwJrwdkQ0K3aITijK5ATXcjcWeu9TtUAMs6vsmE4u5f2BJR/cM/AO97vJ
         I/iSS3B4233mjKJw4rn2SIAbFvY7z5ueoLGVvmLalWXjUEqKf121CZ7ue7CHxP1iZ/VB
         K4LhrMoB7fyw+mRCJsQSWVdT8xZu7o6NwdPwJif7A8qPRM/J7j2rhXYYB+mgUyIi2E/F
         JF6n6AlQ0QImZ+RK8Tu0lyDdf5LFiXQarAiGYJCF+64NrnASFyFTEFpMcDDlRKFhUhbt
         gU/Q==
X-Gm-Message-State: ACrzQf1+VhgC9Mk2szZPIakafhAvX+hMVqGdCEBbn6vDa1C6HVsKcNJv
	HH2Psj7peqTzlmzhQ4QSWR3qQiyaZB+NGyaBtZz/YA==
X-Google-Smtp-Source: AMsMyM41HQCJsDoOACpdXz7qk4nKjM5Kr/SWUAFXy3eG4RpHyOfbtr8EsnX1CZO2CMuCpmbGhoRnZINnIDU7htvexmg=
X-Received: by 2002:a63:6285:0:b0:461:686a:f747 with SMTP id
 w127-20020a636285000000b00461686af747mr13254100pgb.403.1665524313493; Tue, 11
 Oct 2022 14:38:33 -0700 (PDT)
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
 <CABPqkBQVfQFJKCdHXEMGFcupzvy8zq14F52eLW5s9vr2Shmi6w@mail.gmail.com>
In-Reply-To: <CABPqkBQVfQFJKCdHXEMGFcupzvy8zq14F52eLW5s9vr2Shmi6w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Oct 2022 14:38:21 -0700
Message-ID: <CAKwvOdnyTor=z7JA84yMcxf-VuSdXE+oLNvnhd8VJmma9_oDyA@mail.gmail.com>
Subject: Re: Invalid event (cycles:pp) in per-thread mode, enable system wide
 with '-a'.
To: Stephane Eranian <eranian@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Slade Watkins <srw@sladewatkins.net>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@gmail.com>, 
	Kees Cook <keescook@chromium.org>, sandipan.das@amd.com, 
	Bill Wendling <morbo@google.com>, clang-built-linux <llvm@lists.linux.dev>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2022 at 3:50 PM Stephane Eranian <eranian@google.com> wrote:
>
> On Wed, Oct 5, 2022 at 2:56 PM Nick Desaulniers <ndesaulniers@google.com>=
 wrote:
> >
> > + Stephane, Kees, Sandipan, Bill, ClangBuiltLinux mailing list, Yonghon=
g
> > https://www.spinics.net/lists/linux-perf-users/msg23103.html
> > starts the thread, for context.
> >
> > On Thu, Sep 29, 2022 at 9:32 PM Ravi Bangoria <ravi.bangoria@amd.com> w=
rote:
> > >
> > > On 30-Sep-22 9:56 AM, Namhyung Kim wrote:
> > > > Hello,
> > > >
> > > > On Thu, Sep 29, 2022 at 8:49 PM Ian Rogers <irogers@google.com> wro=
te:
> > > >>
> > > >> On Thu, Sep 29, 2022 at 3:10 PM Slade Watkins <srw@sladewatkins.ne=
t> wrote:
> > > >>>
> > > >>> Hey Nick,
> > > >>>
> > > >>>> On Sep 29, 2022, at 5:54 PM, Nick Desaulniers <ndesaulniers@goog=
le.com> wrote:
> > > >>>>
> > > >>>> I remember hearing rumblings about issues with zen 2, LBR, vs ze=
n 3.
> > > >>>> Is this a known issue, or am I holding it wrong?
> > > >>>
> > > >>> Hm=E2=80=A6 I also remember this. I have a Zen 2 based system tha=
t I can do testing on, so I will do so when I=E2=80=99m able.
> > > >>>
> > > >>> If I discover something of note, I=E2=80=99ll get back to you.
> > > >>>
> > > >>> Cheers,
> > > >>> -srw
> > > >>>
> > > >>
> > > >> LBR isn't yet supported for Zen but is coming:
> > > >> https://lore.kernel.org/lkml/166155216401.401.5809694678609694438.=
tip-bot2@tip-bot2/
> > > >> I'd recommend frame-pointers.
> >
> > Having to recompile is less than ideal for my workflow.  I have added a=
 note to
> > https://github.com/ClangBuiltLinux/profiling/tree/main/perf#errors
> > Please let me know how I might improve the documentation.
> >
> > > >>
> > > >> +Ravi who may be able to say if there are any issues with the prec=
ise
> > > >> sampling on AMD.
> > > >
> > > > Afaik cvcles:pp will use IBS but it doesn't support per-task profil=
ing
> > > > since it has no task context.  Ravi is working on it..
> > >
> > > Right.
> > > https://lore.kernel.org/lkml/20220829113347.295-1-ravi.bangoria@amd.c=
om
> >
> > Cool, thanks for working on this Ravi.
> >
> > I'm not sure yet whether I may replace the kernel on my corporate
> > provided workstation, so I'm not sure yet I can help test that patch.
> >
> > Can you confirm that
> > $ perf record -e cycles:pp --freq=3D128 --call-graph lbr -- <command to=
 profile>
> >
> > works with just that patch applied? Or is there more work required?
> > What is the status of that patch?
> >
> > For context, we had difficulty upstreaming support for instrumentation
> > based profile guided optimizations in the Linux kernel.
> > https://lore.kernel.org/lkml/CAHk-=3DwhqCT0BeqBQhW8D-YoLLgp_eFY=3D8Y=3D=
9ieREM5xx0ef08w@mail.gmail.com/
> > We'd like to be able to use either instrumentation or sampling to
> > optimize our builds.  The major barrier to sample based approaches are
> > architecture / micro architecture issues with sample based profile
> > data collection, and bitrot of data processing utilities.
> > https://github.com/google/autofdo/issues/144
>
> On existing AMD Zen2, Zen3 the following cmdline:
> $ perf record -e cycles:pp --freq=3D128 --call-graph lbr -- <command to p=
rofile>
>
> does not work. I see two reasons:
>
> 1. cycles:pp is likely converted into IBS op in cycle mode.
>     Current kernels do not support IBS in per-thread mode.
>     This is purely a kernel limitation

Sounds like Ravi has a diff that might work?
https://lore.kernel.org/linux-perf-users/85822c3c-2254-52cc-e6b1-9c89adb637=
71@amd.com/

>
> 2. call-graph lbr is not supported on AMD because they do
>    not have LBR and therefore no LBR callstack mode
>
> The best way to get what you want here today on AMD Zen2 and Zen3:
>
>    $ perf record -e cycles --freq=3D128 -g -- <command to profile>

So without recompiling to explicitly re-enable frame pointers, code
I'm looking to profile is built with -gmlt, so I get symbols, but I
can't observe callers.

Sounds like I'd need to rebuild with -fno-omit-frame-pointers which is
more painful than my prior LBR based workflow.

>
> On AMD Zen3, there is a precursor to LBR with Branch Sampling (BRS),
> and you can use it to sample taken branches but not for callstacks. I
> mention the cmdline here for reference:
>
> $ perf record -e cpu/branch-brs/ -c 1000037  -b  -- <command to profile>
>
> Note that AMD Zen3 BRS is enough to get the autoFDO usage of an
> LBR working as per the cmdline above.

Interesting, but I'm stuck with a Zen2 box for a couple years now
(corporate workstation).  This pretty much blows up all of the
profiling work I was doing, and any hope I had of contributing towards
building the kernel with AutoFDO profiles until this works on my box
with the kernel it has.

>
> Hope this helps.



--=20
Thanks,
~Nick Desaulniers
