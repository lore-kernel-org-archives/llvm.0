Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CEF1A70C
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uk2b5kbg"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50348c54439so7267e87.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696869456; x=1697474256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCcIV6Mm7zw1gNMMm0ZkrKGglzNc/5vCe0dsXvh6bqw=;
        b=uk2b5kbg9HiFN2NBL2atozJ7mbJpoB3uWXleUqyKxyNntsHgNuDkhPt41lcY0k7uI7
         ugjl+duvqOxwcxfmsAlVJO3lk1u6RxA1V8SW47xGiiUf+no+ErVCfoOAkclLWpvuF4GW
         BP0hCd8fLp/7pb+CrwByKEsr/ioDEXMRDZ2QhMVrrDGKJ/rwwNqaXHLtblXAHUce6D34
         AEjuY68TU7J9J+srOSKd5NG0gWDiue0OMGd8LjwlwegZyiPWk+8CRrB8F8zhbdDftBwg
         ofbN98pHB/9hySD+Ba0ag7dhqa9Zu1rakvEecQYePRICbFsGsI7jfcsMHOPb37fxi7Tb
         mTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696869456; x=1697474256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCcIV6Mm7zw1gNMMm0ZkrKGglzNc/5vCe0dsXvh6bqw=;
        b=FLelv9KWKRmldk9wH0HU5QAlheN85uEDmfL+LNDcWyeO9LIMwn/Ik5VKC0II/UJIiP
         gAIsms8TO4tiABL2BG9165iJi+BTpYQlRrfM0qj7zer/+zNs4mQCX8E670qt33Wp0xyZ
         oryrtO1QljF7Rgt7mz+x93bC5X3kCeJhQV105Vj2VFkHQ0E0RDAlzTNgF1zTvj3b0TKw
         H/HtBKdw4ZQgOjrkjGuhZkAeq3++0GZqicBkOfCm/RtSk8cPfKJDyJXjdLiG2PkQuaGH
         EBXjw7jQzfiFwKpJBBYR3vhNj4OFbkJaZuTRtmKfusDXJzC3KfVYt4EjhMTnHSKuNzKE
         F6UA==
X-Gm-Message-State: AOJu0YzqE2D/sFck1a+HZJTRdmiQzOY+E4PM+LNlxk66VZVlyZ328gkt
	a6bDrF3XVPwp1S5lDyu0poMNbvrUOtRij+u5/JzJgQ==
X-Google-Smtp-Source: AGHT+IFrz2vFJU/zI3Q1h36XuYf4dJwSe0vnT+pqWgCqVmuceBLNptLoibz7FuY74kPBGRakIVvBm12RbdQ4QIDmIJE=
X-Received: by 2002:ac2:44db:0:b0:505:7c88:9e45 with SMTP id
 d27-20020ac244db000000b005057c889e45mr231500lfm.0.1696869455500; Mon, 09 Oct
 2023 09:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-14-irogers@google.com>
 <CAM9d7cj-ANu1j-6WxGDQ_+pJtDt1xfyuGCNyC_dTpCDECZZgCQ@mail.gmail.com>
In-Reply-To: <CAM9d7cj-ANu1j-6WxGDQ_+pJtDt1xfyuGCNyC_dTpCDECZZgCQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Oct 2023 09:37:24 -0700
Message-ID: <CAP-5=fVpkvtf=8niBTcLUcpEjypJAui0yT4ATtY763-mCSXamg@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] perf svghelper: Avoid memory leak
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

On Sun, Oct 8, 2023 at 11:31=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > On success path the sib_core and sib_thr values weren't being
> > freed. Detected by clang-tidy.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-lock.c   | 1 +
> >  tools/perf/util/svghelper.c | 5 +++--
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
> > index d4b22313e5fc..1b40b00c9563 100644
> > --- a/tools/perf/builtin-lock.c
> > +++ b/tools/perf/builtin-lock.c
> > @@ -2463,6 +2463,7 @@ static int parse_call_stack(const struct option *=
opt __maybe_unused, const char
> >                 entry =3D malloc(sizeof(*entry) + strlen(tok) + 1);
> >                 if (entry =3D=3D NULL) {
> >                         pr_err("Memory allocation failure\n");
> > +                       free(s);
> >                         return -1;
> >                 }
> >
>
> This is unrelated.  Please put it in a separate patch.

Sorry, will fix in v3.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > diff --git a/tools/perf/util/svghelper.c b/tools/perf/util/svghelper.c
> > index 0e4dc31c6c9c..1892e9b6aa7f 100644
> > --- a/tools/perf/util/svghelper.c
> > +++ b/tools/perf/util/svghelper.c
> > @@ -754,6 +754,7 @@ int svg_build_topology_map(struct perf_env *env)
> >         int i, nr_cpus;
> >         struct topology t;
> >         char *sib_core, *sib_thr;
> > +       int ret =3D -1;
> >
> >         nr_cpus =3D min(env->nr_cpus_online, MAX_NR_CPUS);
> >
> > @@ -799,11 +800,11 @@ int svg_build_topology_map(struct perf_env *env)
> >
> >         scan_core_topology(topology_map, &t, nr_cpus);
> >
> > -       return 0;
> > +       ret =3D 0;
> >
> >  exit:
> >         zfree(&t.sib_core);
> >         zfree(&t.sib_thr);
> >
> > -       return -1;
> > +       return ret;
> >  }
> > --
> > 2.42.0.609.gbb76f46606-goog
> >
