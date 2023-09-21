Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6117724
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 18:50:48 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-79f8e4108c3so26471839f.3
        for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 11:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695322248; x=1695927048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTCB/fZzCKUJjiugycN3hEkm9G+K0NXzOwFX7H37ARA=;
        b=cSOm5fYw5jJrFz3COzkrz0O5MahoD5mldNr4V6CZBNZtNl5OMGpd2/xwtxfvtN+zVT
         9wzsoQcVUkTb0ByWTTEd3XpKR41PUipbzg054qR8j4LZh/Oj6yRuFj97c8251dXiQQL/
         R+OQSa6Nb5jd8E6pV81IcrMuu0gY//bJB6GMFG+EoZsYZdtjgKa4Y/by0GRDzQORaBxu
         XZmWhJ08G07+JGkvrAU3EaPuVM3DWYyGcBTTX36D94hk7AgTP3s85zyzXeV1VKkcLjyN
         g/ZdbmyM1TkMfp0qbhhEki/u0eElFYctKIJAM+lKdifKu//mlCPSAnZFCyO4AjxtiEvB
         FYfw==
X-Gm-Message-State: AOJu0YxAKUYdaNQcrfZrWy7up5U9k4qXPGyAUpTfJ7GHO83lkB6rww6w
	bMe1T2MEskxLdlxWQ+fvMb9bO57UYbGmtvFUPVM=
X-Google-Smtp-Source: AGHT+IHquX7sNkJJbRBMHMVeIt+BWoHXIH7/ChIJDk47nk3iNWEsmhLmFyQ2RsTKp6SmKSWapOWJTzffmcoHGGp3YjY=
X-Received: by 2002:a6b:7e43:0:b0:786:25a3:ef30 with SMTP id
 k3-20020a6b7e43000000b0078625a3ef30mr7164735ioq.7.1695322248008; Thu, 21 Sep
 2023 11:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com> <CAM9d7cgNbRs3LJh_AjqAnRkJzsTxrGr_yqVK-urtoS-B2k1S=w@mail.gmail.com>
 <ZQmfOO0tt9FuIkrj@kernel.org> <CAP-5=fXn=5SXqHKxaSAxs3bwQifUTVQWnrQb5A6D=3CHygfHLg@mail.gmail.com>
 <CAM9d7cgTAQ9pQfC7pNHPy1UdZr+5zD0T76EYkosV72-P7HPQjg@mail.gmail.com>
In-Reply-To: <CAM9d7cgTAQ9pQfC7pNHPy1UdZr+5zD0T76EYkosV72-P7HPQjg@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 21 Sep 2023 11:50:31 -0700
Message-ID: <CAM9d7ciso7MN3AVQEmhWxsPt3ahgfVQF=+pCsObAcQgS4CUMTQ@mail.gmail.com>
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

On Tue, Sep 19, 2023 at 9:11=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Tue, Sep 19, 2023 at 8:40=E2=80=AFAM Ian Rogers <irogers@google.com> w=
rote:
> >
> > On Tue, Sep 19, 2023 at 6:16=E2=80=AFAM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> > >
> > > Em Mon, Sep 18, 2023 at 04:40:15PM -0700, Namhyung Kim escreveu:
> > > > On Thu, Sep 14, 2023 at 2:20=E2=80=AFPM Ian Rogers <irogers@google.=
com> wrote:
> > > > >
> > > > > Enable BPF skeletons by default but warn don't fail if they can't=
 be
> > > > > supported. This was the intended behavior for Linux 6.4 but it ca=
used
> > > > > an issue captured in this thread:
> > > > > https://lore.kernel.org/lkml/20230503211801.897735-1-acme@kernel.=
org/
> > > > >
> > > > > This issue isn't repeated here as the previous issue related to
> > > > > generating vmlinux.h, which is no longer performed by default as =
a
> > > > > checked-in vmlinux.h is used instead.
> > > > >
> > > > > Unlike with those changes, the BUILD_BPF_SKEL is kept and setting=
 it
> > > > > to 0 disables BPF skeletons. Also, rather than fail the build due=
 to a
> > > > > missed dependency, dependencies are checked and BPF skeletons dis=
abled
> > > > > if they aren't present.
> > > > >
> > > > > Some related commits:
> > > > > b7a2d774c9c5 perf build: Add ability to build with a generated vm=
linux.h
> > > > > a887466562b4 perf bpf skels: Stop using vmlinux.h generated from =
BTF, use subset of used structs + CO-RE
> > > > > a2af0f6b8ef7 perf build: Add system include paths to BPF builds
> > > > > 5be6cecda080 perf bpf skels: Make vmlinux.h use bpf.h and perf_ev=
ent.h in source directory
> > > > > 9a2d5178b9d5 Revert "perf build: Make BUILD_BPF_SKEL default, ren=
ame to NO_BPF_SKEL"
> > > > > a887466562b4 perf bpf skels: Stop using vmlinux.h generated from =
BTF, use subset of used structs + CO-RE
> > > > > 1d7966547e11 perf build: Add warning for when vmlinux.h generatio=
n fails
> > > > > a980755beb5a perf build: Make BUILD_BPF_SKEL default, rename to N=
O_BPF_SKEL
> > > > >
> > > > > Ian Rogers (5):
> > > > >   perf version: Add status of bpf skeletons
> > > > >   perf build: Default BUILD_BPF_SKEL, warn/disable for missing de=
ps
> > > > >   perf test: Update build test for changed BPF skeleton defaults
> > > > >   perf test: Ensure EXTRA_TESTS is covered in build test
> > > > >   perf test: Detect off-cpu support from build options
> > > >
> > > > Tested-by: Namhyung Kim <namhyung@kernel.org>
> > >
> > > Is this verbose by default now? Maybe its something on my side, but I
> > > noticed a higher level of verbosity, can you check?
> >
> > I don't see more verbosity. Logs below.
>
> I don't see it either.

Applied to perf-tools-next, thanks!
