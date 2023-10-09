Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09220374D3
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UcMPjxCI"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5068b69f4aeso8137e87.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696868561; x=1697473361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN5/tm1CszkBi5CACTQEAKrzQx6IrUZ94+b5uVmgWK4=;
        b=UcMPjxCI5w/FghPKsUediYapm1M1ejbA5WRffpImwTByOy4JzNlSa8sv49f6+hxVUs
         VD0m4mW4hoQvmy/IgI0h2YIv3RUOFORbv0caCdZCg7pwh/0BbTugltlq/U0YK+Bsnv1L
         H/sPv0svRU3bfuv+m0XbizmHfr4zulMr/nYSY8hBFi2MhxPlvqwsbi3CNx/4cvUxJigf
         RtbRLvFtC72ULrHRjNJmqlz0DS3//YisbUxplmLowOAT2+AHYI8Acm2MyIiWnFVcAT/P
         V2Nh1T9VjNyIvqk1YoJjPdlTq+TM001RJvUI69SFd0MuG09TEyd+d2kDlXf9ISWDEGUU
         MjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868561; x=1697473361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN5/tm1CszkBi5CACTQEAKrzQx6IrUZ94+b5uVmgWK4=;
        b=cYAT5FXBJ0+gPU8La3iBbschoYqKSjgbs/MEsvP2WpY41so1B9fMIHXhAcb9IJaZbq
         +N67wHGK+JTgVp0y2HIhL+mCuoDeU0nN6h00TNdAFsf+y0TXVN4SAqe4Y8AvAQZxUcaE
         c4ELvj5TqPGgB/h/Bg8C66bzhqR3YzeGrfa1FLeWEX5k9la7bXm3oUlTTnjN7goqclGo
         szfnnX0U23R2PIK2gFWGxF9fg17x93X469IyeJvdnR9IzccAf8OBSssEhQFePabV/9jE
         zsaWPD6lydZ9taycCuDMfTwDSOPF/UjEZ+8P/vNVvZHK9anP5ntd0To07ZEg+14SDyJ7
         UXXA==
X-Gm-Message-State: AOJu0YzwS627nCln4GsewuoI7kTk2N8TR1ujwmNq0EzRu+6K8We1DS6C
	wHNsJIdsMlvDao7QbYmaKtxsvrb4IL2TcG9F/GrIGw==
X-Google-Smtp-Source: AGHT+IGlKH3BqD0VkM33kCF3I8vg5a06QPB7mGu7SImCtuxjTB4hlaPZKhR3ELfvaLAqTH1s1pn+eL8Fum0ZXA7kbmQ=
X-Received: by 2002:ac2:558c:0:b0:502:cdb6:f316 with SMTP id
 v12-20020ac2558c000000b00502cdb6f316mr227512lfg.3.1696868560649; Mon, 09 Oct
 2023 09:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-7-irogers@google.com>
 <CAM9d7cjB_Sm4xnXexDqq_Q4jmOrwhxBjQbAhr-UTmb_4CPLONw@mail.gmail.com>
In-Reply-To: <CAM9d7cjB_Sm4xnXexDqq_Q4jmOrwhxBjQbAhr-UTmb_4CPLONw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Oct 2023 09:22:29 -0700
Message-ID: <CAP-5=fUEFcMpAS1q+M7RNdREy4gHaJmD8N5aVXowm5gyEJ_hnQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] perf buildid-cache: Fix use of uninitialized value
To: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 8, 2023 at 11:06=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > The buildid filename is first determined and then from this the
> > buildid read. If getting the filename fails then the buildid will be
> > used for a later memcmp uninitialized. Detected by clang-tidy.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-buildid-cache.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/builtin-buildid-cache.c b/tools/perf/builtin-bu=
ildid-cache.c
> > index cd381693658b..e2a40f1d9225 100644
> > --- a/tools/perf/builtin-buildid-cache.c
> > +++ b/tools/perf/builtin-buildid-cache.c
> > @@ -277,8 +277,10 @@ static bool dso__missing_buildid_cache(struct dso =
*dso, int parm __maybe_unused)
> >         char filename[PATH_MAX];
> >         struct build_id bid;
> >
> > -       if (dso__build_id_filename(dso, filename, sizeof(filename), fal=
se) &&
> > -           filename__read_build_id(filename, &bid) =3D=3D -1) {
> > +       if (!dso__build_id_filename(dso, filename, sizeof(filename), fa=
lse))
> > +               return true;
>
> This won't print anything and ignore the file which changes
> the existing behavior.  But if it fails to read the build-id, I
> don't think there is not much we can do with it.  IIUC the
> original intention of -M/--missing option is to list files that
> have a build-id but it's not in the build-id cache.  So maybe
> it's ok to silently ignore it.

If getting the build id filename fails then 'bid' is uninitialized and
I don't think there is an expected behavior for what a memcmp on
uninitialized memory should do - we may hope that it fails and get the
pr_warning in the existing code, but that warning depends on reading
the filename too. This was the smallest change to not change behavior
but to avoid the undefined behavior (bugs) in the code. It could be a
signal the code needs to be worked on more.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +
> > +       if (filename__read_build_id(filename, &bid) =3D=3D -1) {
> >                 if (errno =3D=3D ENOENT)
> >                         return false;
> >
> > --
> > 2.42.0.609.gbb76f46606-goog
> >
