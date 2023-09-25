Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6ED21376
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 15:44:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso32554375e9.3
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695656641; x=1696261441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtNJTeTn8zCFpnwQ2yAv3q9ZzhPnaUxajrS7IyL2tyk=;
        b=PG2F972tELc2bs3X9K04BgcTYrJ9CWKsPS6Fb/H4A+njDLdsa4lf7p9bzhlbJtJJdc
         h9s55OWvY61gZ6G70MlOn6901P5Cqwf4TkojbX1Uz2mTUaU0QLjUHeC17F6IkUjQ4KTW
         sTGhFhpiODyLBC4HO348PVA4AsufvnHCZpgm5Kpdypzo9MvT2pni7rjnn496YCgLNuKl
         1dPPc/GaSV/WMZPgxo9dicwNLHOUx1oK5TzD+Emp7TpIMNihOjQqWKgDYlHcIQJXDd2l
         /xMwEgzl3samrQ8ScD/FbEJWEei1nefzoon6bQEWLpZlhy3Pf4jc/6vtlthJ6U1hCD4v
         4QMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656641; x=1696261441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtNJTeTn8zCFpnwQ2yAv3q9ZzhPnaUxajrS7IyL2tyk=;
        b=TiPVWGYT/El7Vrd74tvr1ci1qwxJZ9Q0CkX6yBZSYailtSGs4zPVSrI8yy5it4yhxZ
         G0cX/J6rCC20lsPPK+mYEDxbeMl8jvY3CrqyQfZ3IptgPtTJI5rwpdPBeGQ3md5c0AQo
         5gmsuoU46yyjJmuHGw9bhEUxz0kLf7NWaajaybOJ1ZGYcEb7CIdqhcfV32TvFntTM2mJ
         wUPf9vUaXevbAZDBOihYrGs0WaBLpFmW4ZYDOsAizLK4yegktuY9Jnmbmy2Uuy1ZHlgS
         6J0GFXYMRFeoIuY05QQKW2xnm3oL/7QwZQgs3hMT1IOAbFS2GFBY5kxYXvfLu7frk/rU
         qu5g==
X-Gm-Message-State: AOJu0Yy0FW8V2vl4mmtyy+7i4OaxV3+xXEeK3Fib0ESYVXdeV7US2U89
	FmPOoYnl/B913gsogsaYnt9jjGt2HcPo/iPQ9pEYYw==
X-Google-Smtp-Source: AGHT+IGqnItEdifav9vybTr0GkP0gvqcEVAaGKC0hh68JGilQJUcfm9ace+LAwaLXavBJl7e/rVQ+ZoV44Z88NpDnQg=
X-Received: by 2002:a1c:4c1a:0:b0:401:bdf9:c336 with SMTP id
 z26-20020a1c4c1a000000b00401bdf9c336mr6175474wmf.27.1695656640529; Mon, 25
 Sep 2023 08:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com> <20230923053515.535607-4-irogers@google.com>
In-Reply-To: <20230923053515.535607-4-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Sep 2023 08:43:45 -0700
Message-ID: <CAKwvOdngy8a0n7TapeMPvANvp1uQuJAJk9i3kDNWx+czFL0=cQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/18] run-clang-tools: Add pass through checks and and
 header-filter arguments
To: Ian Rogers <irogers@google.com>
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

On Fri, Sep 22, 2023 at 10:35=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Add a -checks argument to allow the checks passed to the clang-tool to
> be set on the command line.
>
> Add a pass through -header-filter option.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  scripts/clang-tools/run-clang-tools.py | 34 ++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools=
/run-clang-tools.py
> index 3266708a8658..5dfe03852cb4 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -33,6 +33,11 @@ def parse_arguments():
>      path_help =3D "Path to the compilation database to parse"
>      parser.add_argument("path", type=3Dstr, help=3Dpath_help)
>
> +    checks_help =3D "Checks to pass to the analysis"
> +    parser.add_argument("-checks", type=3Dstr, default=3DNone, help=3Dch=
ecks_help)
> +    header_filter_help =3D "Pass the -header-filter value to the tool"
> +    parser.add_argument("-header-filter", type=3Dstr, default=3DNone, he=
lp=3Dheader_filter_help)
> +
>      return parser.parse_args()
>
>
> @@ -45,14 +50,29 @@ def init(l, a):
>
>  def run_analysis(entry):
>      # Disable all checks, then re-enable the ones we want
> -    checks =3D []
> -    checks.append("-checks=3D-*")
> -    if args.type =3D=3D "clang-tidy":
> -        checks.append("linuxkernel-*")
> +    global args
> +    checks =3D None
> +    if args.checks:
> +        checks =3D args.checks.split(',')
>      else:
> -        checks.append("clang-analyzer-*")
> -        checks.append("-clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling")
> -    p =3D subprocess.run(["clang-tidy", "-p", args.path, ",".join(checks=
), entry["file"]],
> +        checks =3D ["-*"]
> +        if args.type =3D=3D "clang-tidy":
> +            checks.append("linuxkernel-*")
> +        else:
> +            checks.append("clang-analyzer-*")
> +            checks.append("-clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling")
> +    file =3D entry["file"]
> +    if not file.endswith(".c") and not file.endswith(".cpp"):
> +        with lock:
> +            print(f"Skipping non-C file: '{file}'", file=3Dsys.stderr)
> +        return
> +    pargs =3D ["clang-tidy", "-p", args.path]
> +    if checks:

^ can `checks` ever be falsy here?  I don't think we need this
conditional check?

> +        pargs.append("-checks=3D" + ",".join(checks))
> +    if args.header_filter:
> +        pargs.append("-header-filter=3D" + args.header_filter)
> +    pargs.append(file)
> +    p =3D subprocess.run(pargs,
>                         stdout=3Dsubprocess.PIPE,
>                         stderr=3Dsubprocess.STDOUT,
>                         cwd=3Dentry["directory"])
> --
> 2.42.0.515.g380fc7ccd1-goog
>


--=20
Thanks,
~Nick Desaulniers
