Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85146B0
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 22:50:54 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id h4so358382vsr.11
        for <llvm@lists.linux.dev>; Wed, 05 Oct 2022 15:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=s8EMTXiUwrOa6YLnf1xSNISKDp/9rxbmpvrrsPdKN14=;
        b=IWzxhs+IVgBICIpnd5W1YnUvyc2lcj3u9zrlwggNI3fvqZJzT/1ghyPDeFxYw4TyRZ
         g2gF/gMVip5CwQptYdhNu21LbY+O/uccSjrwhaHtHAAZWqmwQ7YggGMPjJdzQFXHLQ1f
         5QrH109nstuJoi1OC5rpDfTTARLtPCG02gY0a+v6YCde2RfwIQed6ynBA4C0DwsGFoiy
         6H8pdIEczUnH9hSyufI+rukzsu05FF1fZdOYAJdbAatEiXCkAsfmYjJNJ6rHomrSU0DA
         xCjtGAF/dnNkrYfz6u5LS0KXDSa7AaXQqdymQQHGhMDVXxSv3JS8IdihfznObVForWp6
         dyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s8EMTXiUwrOa6YLnf1xSNISKDp/9rxbmpvrrsPdKN14=;
        b=LPv3K7ZtpIN3P+Qu5LA8to85ynxdRtCT/1L8c9jVl4HZ5BuTl1eInNruxubIBpDwli
         exm9xuA2FgVzBELh51mWeyhulLaL5hlOfONpUDsrxoD5g+3IyJDlt8I2vCoGio3dcbYA
         tmcd9qOTeR8fNAwRvMpH8ZBf5yGAkd92WC92l0X8WVxbXXpFiwelHNVEakvQ6wfyqoOp
         ytuCfhbCff1rP1rZ+ytcajBe8hgxFEu7P1D0rfuu5FETsMBSRi6EsanEFGrXuXu+oRyf
         nwjDUzP+VSPvoyKuzZnQuH7zCeisHiO9+N0LxAzNeGp2rc60nZD/gFXisZgIw3h+E6Ba
         X6Og==
X-Gm-Message-State: ACrzQf10aBFBk4M/K51eBCkLZd4b7ajNWGyjgBKYnPLxQ8xal6/PdmVD
	R+96z92B7qmJODJ4/qC4UMQyCz9H+80KZDY7Q7FXhg==
X-Google-Smtp-Source: AMsMyM62970tjFWrttfs72GbVwmQjKGlrpxkSjfKFZNtquqVpdzda6ue0pj9O3MTdDDRalSIuZj+bMKhsyrVQ4a4HCs=
X-Received: by 2002:a05:6102:358d:b0:3a6:cf61:6208 with SMTP id
 h13-20020a056102358d00b003a6cf616208mr1119928vsu.12.1665010252862; Wed, 05
 Oct 2022 15:50:52 -0700 (PDT)
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
In-Reply-To: <CAKwvOdk6TTNhu_+FdONTXPo9Z8u5D4-5kf-rMN8oK4+6fMyc-w@mail.gmail.com>
From: Stephane Eranian <eranian@google.com>
Date: Wed, 5 Oct 2022 15:50:41 -0700
Message-ID: <CABPqkBQVfQFJKCdHXEMGFcupzvy8zq14F52eLW5s9vr2Shmi6w@mail.gmail.com>
Subject: Re: Invalid event (cycles:pp) in per-thread mode, enable system wide
 with '-a'.
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Ravi Bangoria <ravi.bangoria@amd.com>, Slade Watkins <srw@sladewatkins.net>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@gmail.com>, 
	Kees Cook <keescook@chromium.org>, sandipan.das@amd.com, 
	Bill Wendling <morbo@google.com>, clang-built-linux <llvm@lists.linux.dev>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2022 at 2:56 PM Nick Desaulniers <ndesaulniers@google.com> w=
rote:
>
> + Stephane, Kees, Sandipan, Bill, ClangBuiltLinux mailing list, Yonghong
> https://www.spinics.net/lists/linux-perf-users/msg23103.html
> starts the thread, for context.
>
> On Thu, Sep 29, 2022 at 9:32 PM Ravi Bangoria <ravi.bangoria@amd.com> wro=
te:
> >
> > On 30-Sep-22 9:56 AM, Namhyung Kim wrote:
> > > Hello,
> > >
> > > On Thu, Sep 29, 2022 at 8:49 PM Ian Rogers <irogers@google.com> wrote=
:
> > >>
> > >> On Thu, Sep 29, 2022 at 3:10 PM Slade Watkins <srw@sladewatkins.net>=
 wrote:
> > >>>
> > >>> Hey Nick,
> > >>>
> > >>>> On Sep 29, 2022, at 5:54 PM, Nick Desaulniers <ndesaulniers@google=
.com> wrote:
> > >>>>
> > >>>> I remember hearing rumblings about issues with zen 2, LBR, vs zen =
3.
> > >>>> Is this a known issue, or am I holding it wrong?
> > >>>
> > >>> Hm=E2=80=A6 I also remember this. I have a Zen 2 based system that =
I can do testing on, so I will do so when I=E2=80=99m able.
> > >>>
> > >>> If I discover something of note, I=E2=80=99ll get back to you.
> > >>>
> > >>> Cheers,
> > >>> -srw
> > >>>
> > >>
> > >> LBR isn't yet supported for Zen but is coming:
> > >> https://lore.kernel.org/lkml/166155216401.401.5809694678609694438.ti=
p-bot2@tip-bot2/
> > >> I'd recommend frame-pointers.
>
> Having to recompile is less than ideal for my workflow.  I have added a n=
ote to
> https://github.com/ClangBuiltLinux/profiling/tree/main/perf#errors
> Please let me know how I might improve the documentation.
>
> > >>
> > >> +Ravi who may be able to say if there are any issues with the precis=
e
> > >> sampling on AMD.
> > >
> > > Afaik cvcles:pp will use IBS but it doesn't support per-task profilin=
g
> > > since it has no task context.  Ravi is working on it..
> >
> > Right.
> > https://lore.kernel.org/lkml/20220829113347.295-1-ravi.bangoria@amd.com
>
> Cool, thanks for working on this Ravi.
>
> I'm not sure yet whether I may replace the kernel on my corporate
> provided workstation, so I'm not sure yet I can help test that patch.
>
> Can you confirm that
> $ perf record -e cycles:pp --freq=3D128 --call-graph lbr -- <command to p=
rofile>
>
> works with just that patch applied? Or is there more work required?
> What is the status of that patch?
>
> For context, we had difficulty upstreaming support for instrumentation
> based profile guided optimizations in the Linux kernel.
> https://lore.kernel.org/lkml/CAHk-=3DwhqCT0BeqBQhW8D-YoLLgp_eFY=3D8Y=3D9i=
eREM5xx0ef08w@mail.gmail.com/
> We'd like to be able to use either instrumentation or sampling to
> optimize our builds.  The major barrier to sample based approaches are
> architecture / micro architecture issues with sample based profile
> data collection, and bitrot of data processing utilities.
> https://github.com/google/autofdo/issues/144

On existing AMD Zen2, Zen3 the following cmdline:
$ perf record -e cycles:pp --freq=3D128 --call-graph lbr -- <command to pro=
file>

does not work. I see two reasons:

1. cycles:pp is likely converted into IBS op in cycle mode.
    Current kernels do not support IBS in per-thread mode.
    This is purely a kernel limitation

2. call-graph lbr is not supported on AMD because they do
   not have LBR and therefore no LBR callstack mode

The best way to get what you want here today on AMD Zen2 and Zen3:

   $ perf record -e cycles --freq=3D128 -g -- <command to profile>

On AMD Zen3, there is a precursor to LBR with Branch Sampling (BRS),
and you can use it to sample taken branches but not for callstacks. I
mention the cmdline here for reference:

$ perf record -e cpu/branch-brs/ -c 1000037  -b  -- <command to profile>

Note that AMD Zen3 BRS is enough to get the autoFDO usage of an
LBR working as per the cmdline above.

Hope this helps.
