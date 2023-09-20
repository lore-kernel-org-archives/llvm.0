Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A981FC1
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 04:11:56 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-794c7d95ba5so255351339f.0
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 21:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695183116; x=1695787916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kQQlbHlUxfvLP9JSHJJYqYxl0q48pw7jR99N+jK2zs=;
        b=kvNEVbYRvW72NqEwgKOMY+kNeiqMnVVwDQpJi082ngLTTACZHTlLnctOkU9qQnFKzq
         vt6u/6aaBOHn8UTtFDeZJr8y6JftVn//FfG987FtCVpmGWc83fnqgQ7Ufa45z3vLmyS3
         AOYI70szINfio6J2UG0lWSgHfqTqRlm2Ya22HOEtVgCcQjX2BwcuwuSogxy/I5Ll1uTh
         pxj37e/JX8meqXTgECTqPvQxepKQHQo5vorRX8HYQT+Wi6s2nSwvg87n+0VkePgS8xCB
         emMAX/YGXoyNPjJ+D0AorMMFNy2fGXQvwJS79oZkFXjck1CaUkuHEQnleIZE5kjzU9Or
         4KeQ==
X-Gm-Message-State: AOJu0Yxi67ojNi5y45/kns9fDmxadc6kFnmGypxE6BmIw/rqbmxYC5w5
	cfwAaszwcbnO9tPOFd/+rNEOoHqZCGiDpK+mmGQ=
X-Google-Smtp-Source: AGHT+IEpMvZa4NkKWo18Kgj65yVW8DYWPW8hqDW98NyY095dxfD7Q0TysgmIaqYcrl+hWzzHImFiUB0bFJZPYFtkKkw=
X-Received: by 2002:a5d:9e0f:0:b0:792:6963:df30 with SMTP id
 h15-20020a5d9e0f000000b007926963df30mr1606515ioh.0.1695183115828; Tue, 19 Sep
 2023 21:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com> <CAM9d7cgNbRs3LJh_AjqAnRkJzsTxrGr_yqVK-urtoS-B2k1S=w@mail.gmail.com>
 <ZQmfOO0tt9FuIkrj@kernel.org> <CAP-5=fXn=5SXqHKxaSAxs3bwQifUTVQWnrQb5A6D=3CHygfHLg@mail.gmail.com>
In-Reply-To: <CAP-5=fXn=5SXqHKxaSAxs3bwQifUTVQWnrQb5A6D=3CHygfHLg@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 19 Sep 2023 21:11:44 -0700
Message-ID: <CAM9d7cgTAQ9pQfC7pNHPy1UdZr+5zD0T76EYkosV72-P7HPQjg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable BPF skeletons by default
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 8:40=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Tue, Sep 19, 2023 at 6:16=E2=80=AFAM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > Em Mon, Sep 18, 2023 at 04:40:15PM -0700, Namhyung Kim escreveu:
> > > On Thu, Sep 14, 2023 at 2:20=E2=80=AFPM Ian Rogers <irogers@google.co=
m> wrote:
> > > >
> > > > Enable BPF skeletons by default but warn don't fail if they can't b=
e
> > > > supported. This was the intended behavior for Linux 6.4 but it caus=
ed
> > > > an issue captured in this thread:
> > > > https://lore.kernel.org/lkml/20230503211801.897735-1-acme@kernel.or=
g/
> > > >
> > > > This issue isn't repeated here as the previous issue related to
> > > > generating vmlinux.h, which is no longer performed by default as a
> > > > checked-in vmlinux.h is used instead.
> > > >
> > > > Unlike with those changes, the BUILD_BPF_SKEL is kept and setting i=
t
> > > > to 0 disables BPF skeletons. Also, rather than fail the build due t=
o a
> > > > missed dependency, dependencies are checked and BPF skeletons disab=
led
> > > > if they aren't present.
> > > >
> > > > Some related commits:
> > > > b7a2d774c9c5 perf build: Add ability to build with a generated vmli=
nux.h
> > > > a887466562b4 perf bpf skels: Stop using vmlinux.h generated from BT=
F, use subset of used structs + CO-RE
> > > > a2af0f6b8ef7 perf build: Add system include paths to BPF builds
> > > > 5be6cecda080 perf bpf skels: Make vmlinux.h use bpf.h and perf_even=
t.h in source directory
> > > > 9a2d5178b9d5 Revert "perf build: Make BUILD_BPF_SKEL default, renam=
e to NO_BPF_SKEL"
> > > > a887466562b4 perf bpf skels: Stop using vmlinux.h generated from BT=
F, use subset of used structs + CO-RE
> > > > 1d7966547e11 perf build: Add warning for when vmlinux.h generation =
fails
> > > > a980755beb5a perf build: Make BUILD_BPF_SKEL default, rename to NO_=
BPF_SKEL
> > > >
> > > > Ian Rogers (5):
> > > >   perf version: Add status of bpf skeletons
> > > >   perf build: Default BUILD_BPF_SKEL, warn/disable for missing deps
> > > >   perf test: Update build test for changed BPF skeleton defaults
> > > >   perf test: Ensure EXTRA_TESTS is covered in build test
> > > >   perf test: Detect off-cpu support from build options
> > >
> > > Tested-by: Namhyung Kim <namhyung@kernel.org>
> >
> > Is this verbose by default now? Maybe its something on my side, but I
> > noticed a higher level of verbosity, can you check?
>
> I don't see more verbosity. Logs below.

I don't see it either.

Thanks,
Namhyung
