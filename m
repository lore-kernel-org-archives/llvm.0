Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67F41E41
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2L3qoVHK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-502f29ed596so2383e87.0
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696545549; x=1697150349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVE7SUNr8dOdJFRW7Bjbr6OwiQITtpL3cHyTpIFhRi4=;
        b=2L3qoVHK9RYaeMdDe4LbifWiQRe5yJj5yhZ5ybbNgir/a/LSX758quoEYdZ04b3wiU
         aqdl+OeLZlKGnbIxDfkBlCO3JhVjnCYrbwoZ7uOGCWH6xI7DJzrn3FR4Lt782fdFD/Vy
         dXsupX/c5K7LbQlgzXQAQ2HtOY7Gvf1j3t+mAKvIgbT1+TZmk0fKRmKYZ4Wn2yCy0twP
         P2AKhYyBIp9qn2Zf1dztpBmvjFO+U9fXvZoPRAdbMCa9vWlHI8jGmjf31IWqz32Gb9PL
         ypYcjEuCw2g/A54iDwbwvnr8GAkBUmbajh6osAcdYuvvSZ/UtKi/enp6bsAbsOSjvUeZ
         OCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696545549; x=1697150349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVE7SUNr8dOdJFRW7Bjbr6OwiQITtpL3cHyTpIFhRi4=;
        b=vBoMNqMpElZlCOTc4Ju1HQrAxeyEo16ENgzyEtyYhJ4MMnyjjc0YX4ToRVaQYn8PLa
         c/a/g868Rqn/vCJuETZq08zlQ11ABxHOHFoMTHuHgI2OYnb+4Ejy27ona2tz06x6U6wz
         xlOpB7YXuW0Lhv+GjbInaKLhycz2HmuMksvzPABr1OR0RYlI6F1Ioun6pVLwJzAJFq0m
         KCwMDbcIUf2VcXYlekvUBxEQ0mktiPbWfV1SKJtBkuhhJGURXQN90m4g56O3dUUf7NAb
         a5it3+iKuKtsRLJWNbiQf9F9LlSCIABnMz2YlgMvxuwFAZCo1qxPm1+ddlD/LhqWxbGR
         3jbg==
X-Gm-Message-State: AOJu0Yz0WiQykZO7lNNnrNVAk0v3MZux9qrCNWA/IBEuVGmm69KfvZnI
	svH0IWQKp9+4a/KEl1YybZ29i5n7sVvC9Uh3rVNwhg==
X-Google-Smtp-Source: AGHT+IHYdBFarHeFFHinCQkTkwRAYhuGd8qGiXmmKvGN+V9Xz8zSAPN3oWFopZLixwBanSyCcHoIrKXARV0tZ/Pi7x8=
X-Received: by 2002:ac2:51a5:0:b0:501:a2b9:6046 with SMTP id
 f5-20020ac251a5000000b00501a2b96046mr70418lfk.7.1696545549064; Thu, 05 Oct
 2023 15:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com> <20230923053515.535607-4-irogers@google.com>
 <CAKwvOdngy8a0n7TapeMPvANvp1uQuJAJk9i3kDNWx+czFL0=cQ@mail.gmail.com>
In-Reply-To: <CAKwvOdngy8a0n7TapeMPvANvp1uQuJAJk9i3kDNWx+czFL0=cQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 5 Oct 2023 15:38:57 -0700
Message-ID: <CAP-5=fUos9Hv2OmVVGrcLdZz15U-L+xD5d-6HYaqaVSoT39siQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/18] run-clang-tools: Add pass through checks and and
 header-filter arguments
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Yang Jihong <yangjihong1@huawei.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Yanteng Si <siyanteng@loongson.cn>, Yuan Can <yuancan@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 8:44=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 22, 2023 at 10:35=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > Add a -checks argument to allow the checks passed to the clang-tool to
> > be set on the command line.
> >
> > Add a pass through -header-filter option.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 34 ++++++++++++++++++++------
> >  1 file changed, 27 insertions(+), 7 deletions(-)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-too=
ls/run-clang-tools.py
> > index 3266708a8658..5dfe03852cb4 100755
> > --- a/scripts/clang-tools/run-clang-tools.py
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -33,6 +33,11 @@ def parse_arguments():
> >      path_help =3D "Path to the compilation database to parse"
> >      parser.add_argument("path", type=3Dstr, help=3Dpath_help)
> >
> > +    checks_help =3D "Checks to pass to the analysis"
> > +    parser.add_argument("-checks", type=3Dstr, default=3DNone, help=3D=
checks_help)
> > +    header_filter_help =3D "Pass the -header-filter value to the tool"
> > +    parser.add_argument("-header-filter", type=3Dstr, default=3DNone, =
help=3Dheader_filter_help)
> > +
> >      return parser.parse_args()
> >
> >
> > @@ -45,14 +50,29 @@ def init(l, a):
> >
> >  def run_analysis(entry):
> >      # Disable all checks, then re-enable the ones we want
> > -    checks =3D []
> > -    checks.append("-checks=3D-*")
> > -    if args.type =3D=3D "clang-tidy":
> > -        checks.append("linuxkernel-*")
> > +    global args
> > +    checks =3D None
> > +    if args.checks:
> > +        checks =3D args.checks.split(',')
> >      else:
> > -        checks.append("clang-analyzer-*")
> > -        checks.append("-clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling")
> > -    p =3D subprocess.run(["clang-tidy", "-p", args.path, ",".join(chec=
ks), entry["file"]],
> > +        checks =3D ["-*"]
> > +        if args.type =3D=3D "clang-tidy":
> > +            checks.append("linuxkernel-*")
> > +        else:
> > +            checks.append("clang-analyzer-*")
> > +            checks.append("-clang-analyzer-security.insecureAPI.Deprec=
atedOrUnsafeBufferHandling")
> > +    file =3D entry["file"]
> > +    if not file.endswith(".c") and not file.endswith(".cpp"):
> > +        with lock:
> > +            print(f"Skipping non-C file: '{file}'", file=3Dsys.stderr)
> > +        return
> > +    pargs =3D ["clang-tidy", "-p", args.path]
> > +    if checks:
>
> ^ can `checks` ever be falsy here?  I don't think we need this
> conditional check?

Agreed, it was for an option that I removed. Will fix in v2.

Thanks,
Ian

> > +        pargs.append("-checks=3D" + ",".join(checks))
> > +    if args.header_filter:
> > +        pargs.append("-header-filter=3D" + args.header_filter)
> > +    pargs.append(file)
> > +    p =3D subprocess.run(pargs,
> >                         stdout=3Dsubprocess.PIPE,
> >                         stderr=3Dsubprocess.STDOUT,
> >                         cwd=3Dentry["directory"])
> > --
> > 2.42.0.515.g380fc7ccd1-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
