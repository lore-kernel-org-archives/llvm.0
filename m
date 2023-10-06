Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1804338FB5
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GJgXhwl6"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4527d7f7305so1172918137.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696627375; x=1697232175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGVNTkTuEhOSEasSh+f06Vtoy0x55i2wMcWJNOvGy7A=;
        b=GJgXhwl6CUXIIcOtUvxYb2gnGiw8TDs8Aw5/UH5QsE6F1a5ThqkWyHY+9QTSxChkwp
         Ysgqc9swDb04UuZthpFO70I6fbFVWPQjRLHI5OCn02RdtrmEdKJJoObtPZUINQvTa0+f
         F3iuE3l32z63qD4GIbaKvseaT0B0YC8TsfXxw9RavAAkaO5HCr3+dRlkuBiMZo/Bl9vR
         Xmicj63hnOAr3GEDurJgDgsE8mlDgPPNp3VA1iSz2dXjABA9evSO33qGU0xD60Xy79JD
         1Q5oFiFoLwz6XezRtub8moSHKx59zmsneWotzfDUYSdY2DlS1o37TlvAIaPwQAhSm17b
         Bz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696627375; x=1697232175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGVNTkTuEhOSEasSh+f06Vtoy0x55i2wMcWJNOvGy7A=;
        b=pSBs/QfKz0NRXZoQ7xVqYJLNiXmkdqPHE4vX3v53K3XgfHJw3oM3WV4tIbiAqJHSVg
         s9ZhUqnzJotzqyGgzXpK62TbUVs4sKasrQrd5bKiQUe1td145eonqaR2QQOpSfveWHlE
         GsAeGYXtPn2N3AZBk31Y9KVWr2Pmb/8eglzf/CxCCLtz/1V83QXm9w+NTqWGUBTcGlHR
         cLE9CZr6fI/9/RriFa6uVpvvDODFXXL5mBFbwjlcHgOynPJUxJWHPLGt16lROmbd8M54
         o2XsyT9KE2DqdOCoGgXzw2da5Ed2JczCJVp1d4Wv7hJQku2vgP+FA3AX/nekhT71S1bf
         bG1Q==
X-Gm-Message-State: AOJu0YziblMZWXKM4jOCsqbQXTVLFbJg3qX2U5vd6BqMOnc8xd+nS7W8
	ryKVjDQBmEaKq79P7eXtMFCPhv63HhCzxM6hLXOX3A==
X-Google-Smtp-Source: AGHT+IHnX81YT51zxIXl1qmhGCbeGEzay4hR/OGqRxoTUMH7ud/FezhnE2gFVlk4Zt9S1a9t+vYObTEVG+pZ/4S4UyE=
X-Received: by 2002:a67:fe58:0:b0:44d:4c28:55ca with SMTP id
 m24-20020a67fe58000000b0044d4c2855camr9318168vsr.16.1696627374720; Fri, 06
 Oct 2023 14:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-4-irogers@google.com>
In-Reply-To: <20231005230851.3666908-4-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Oct 2023 14:22:42 -0700
Message-ID: <CAKwvOd=7r9v72UadbTqk1EK=kMEH3-JybkmarToCs1_ohRC1sw@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] run-clang-tools: Add pass through checks and and
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
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Add a -checks argument to allow the checks passed to the clang-tool to
> be set on the command line.
>
> Add a pass through -header-filter option.
>
> Don't run analysis on non-C or CPP files.

Three distinct changes; I wouldn't have minded that as three distinct patch=
es.

>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  scripts/clang-tools/run-clang-tools.py | 32 ++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools=
/run-clang-tools.py
> index 3266708a8658..f31ffd09e1ea 100755
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
> @@ -45,14 +50,27 @@ def init(l, a):
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

^ perhaps worth returning earlier if this guard fails? i.e.

rather than do a bunch of work, then do a guard that may return early
that doesn't depend on the earlier work, instead guard first then do
all work.

I don't mind that as a follow up rather than a whole v3 for the series.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +    pargs =3D ["clang-tidy", "-p", args.path, "-checks=3D" + ",".join(ch=
ecks)]
> +    if args.header_filter:
> +        pargs.append("-header-filter=3D" + args.header_filter)
> +    pargs.append(file)
> +    p =3D subprocess.run(pargs,
>                         stdout=3Dsubprocess.PIPE,
>                         stderr=3Dsubprocess.STDOUT,
>                         cwd=3Dentry["directory"])
> --
> 2.42.0.609.gbb76f46606-goog
>


--=20
Thanks,
~Nick Desaulniers
