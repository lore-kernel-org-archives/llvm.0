Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A67191489
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738179376; cv=none; b=W+9r7E5wUQVJH6yXlPvTZGZunG57MQ12/AMBK+kDtdFy3ByJmA4VAT+WvskBU+nvA4ziew7Ut5BmcOMJQPQuZkmnjCqqEW4cMDNQ9jov4Ruf5c/Ro7dl1Bby57I9UPNV9CK/M8FaZUvqfKIosUpNiW6e9Qy6+XlZcPnUp7QsMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738179376; c=relaxed/simple;
	bh=aog1npG7zbwvqSDpQbzTFt1LmdJAZBP9KpuHlfTmsXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuOw74O+gyeHIBMhBarDlz9zEF18NKJ9NrfpjVWZ3pNK0CsMri7mg7j/Iq3zth81Kz8/+ed+zLXLC5tpK1dOOgJMgk/IE8YGA35IRRrbU8haqS0/qU4kgfTz0l6amKbcFstUCpHsNE2eFoUJuvbpTJGsDsoqFPghuClgkUmrktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1AOVZs/E; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1AOVZs/E"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so19105ab.0
        for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 11:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738179374; x=1738784174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfFH/icuVW98ZGt4CSx3c++Z8r68yk+i5Ztzc10SRjo=;
        b=1AOVZs/ESIDoOW7jtTlJvE3QaFK+BdhNQhIArea+qa0AS+5GqaVOs/BM6hfewWP6p9
         QWDD4Y7a2dmgRlwY18YVBPbVaoCv03IfKIw1W1M4JXjw8wu+kCJtx2Chi41ztdMeXfGG
         GtRUy54uFzA4SQdf0wgWTxPQZn2QpxWktzKM9BRHayoyB7qRQV/lZk20aan5BOlxoVCk
         zHA8pjLDsuJcVnqcLR201j+g4Lyc9Pw5G5C9iLMMiBSqsMCjkLcxNvmcf65Ene0VbSoL
         0yzPdPySBl91CRdtW5sEWbc6pcjt6SRhDgN0vuekk3/LybZJcntiNvsH292wkStHqqsb
         BRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738179374; x=1738784174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfFH/icuVW98ZGt4CSx3c++Z8r68yk+i5Ztzc10SRjo=;
        b=wJ7OlhNJtUFqnIZPWKNnPTtyYpWN6af24OO8iHWXSYesGXHqViUgkF+1nGLC2OZq/S
         8vjuxypdmdOpoaSO8R6trmQ1VtLaojxOtyxozJ5uV0daQgs/D1cO1vmIqS4ICd/Jt9+x
         WX6Mu+ZgRPSFsqnsMxN/XM+WHH8tQ6Z9AET4f4LZ8LncB0SO+ToV0mKH5kidw3ChQgiv
         iemOiaL4h1MRVIY2E1OqJvk2TumxIQj3nuVoRgt72Xia2KfrU89vhemapPeZrhHNKx68
         /lkOieeVB4GUMYQzgvQ898spSWABRo+JJFYWLVQOkDZjQzsBSRgp7kjvxAtEdWrFBBEx
         KJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjT4EfhZzV3wSPN/Kqq0zJeq1+YFFNcf3OsxiwbZPG3HH59DEXgB65BU7yXTWjEykzbEWW@lists.linux.dev
X-Gm-Message-State: AOJu0YzRPPVi2V3ggfLj+hykzjvuLBNTr0WkYCvFdUhmxHxzLgJLmiU7
	AyqKtvj7SdBJ1FOgzsvVrU1NotW1tDFLvv9UNutufGyndmxZEtQfADUCNGATIUOSWmj1S4sza1u
	dX3ubumEjYTbeG14mG+ebLsCr7HPdUMDoREHa
X-Gm-Gg: ASbGncuhRrcjURA4M260Mj7fNN2qTJUzEk97noJjDozXPV5A/CTRLSVgOiDGWLjw4VH
	1YMUGFEriM8axfy94v7G4segJ2Cc5S6FLGgmr+Kc9r8ZymERCvRy4P56mCviERgI3m/9+eXKatG
	3DTZu72IFtI0I/X6WzfC99vJ4l
X-Google-Smtp-Source: AGHT+IHyvEbAe7I0uASeZ+x+1BrZI4xyMO5ykKohX5lInnnPkEZRh2gj5blNBgj45TmtVMq4eUjQ2lW7CVyEyBVLIP8=
X-Received: by 2002:a05:6e02:1987:b0:3ce:471b:1ae4 with SMTP id
 e9e14a558f8ab-3d009a2f410mr216695ab.5.1738179373545; Wed, 29 Jan 2025
 11:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com> <20250122174308.350350-14-irogers@google.com>
 <gnwmibvjtwboisw7uv32bdo4ziw4qzgwzvndqg2czpa6vp4olv@44n36ndbwobc>
 <CAP-5=fW9nM9zoQ5SQOq2HQfkougRotm=EBw99cvGDOpD=giK2g@mail.gmail.com> <jgxfnphfo3nzlfipnuuzdlfc4ehbr2tnh2evz3mdhynd6wvrsu@fcz6vrvepybb>
In-Reply-To: <jgxfnphfo3nzlfipnuuzdlfc4ehbr2tnh2evz3mdhynd6wvrsu@fcz6vrvepybb>
From: Ian Rogers <irogers@google.com>
Date: Wed, 29 Jan 2025 11:36:02 -0800
X-Gm-Features: AWEUYZkc7cnANysO6DBXAQ06kDYu_R25G9BqfZ2LqG1BThHYjZpq_jsx4qaWxvk
Message-ID: <CAP-5=fVcF+F7ST3Ya0_3hXq69ArhZv0gy30U4SPC7Cqih7HAWA@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] perf build: Remove libbfd support
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Changbin Du <changbin.du@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Chaitanya S Prakash <chaitanyas.prakash@arm.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 8:47=E2=80=AFAM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> On Tue, Jan 28, 2025 at 05:40:44PM -0800, Ian Rogers wrote:
> > On Tue, Jan 28, 2025 at 4:31=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote=
:
> > >
> > > Hi Ian,
> > >
> > > On Wed, Jan 22, 2025 at 09:43:03AM -0800, Ian Rogers wrote:
> > > > libbfd is license incompatible with perf and building requires the
> > > > BUILD_NONDISTRO=3D1 build flag. Remove the code to simplify the cod=
e
> > > > base.
> > > >
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >  tools/perf/Documentation/perf-check.txt |   1 -
> > > >  tools/perf/Makefile.config              |  38 +---
> > > >  tools/perf/builtin-check.c              |   1 -
> > > >  tools/perf/tests/Build                  |   1 -
> > > >  tools/perf/tests/builtin-test.c         |   1 -
> > > >  tools/perf/tests/pe-file-parsing.c      | 101 ----------
> > > >  tools/perf/tests/tests.h                |   1 -
> > > >  tools/perf/util/demangle-cxx.cpp        |  13 +-
> > > >  tools/perf/util/disasm_bpf.c            | 166 ----------------
> > > >  tools/perf/util/srcline.c               | 243 +-------------------=
----
> > > >  tools/perf/util/symbol-elf.c            |  86 +--------
> > > >  tools/perf/util/symbol.c                | 135 -------------
> > > >  tools/perf/util/symbol.h                |   4 -
> > > >  13 files changed, 7 insertions(+), 784 deletions(-)
> > > >  delete mode 100644 tools/perf/tests/pe-file-parsing.c
> > >
> > > [..]
> > >
> > > I was briefly investigating why the centos build of perf was not
> > > demangling rust v0 symbols [0]. From looking at the rust issue [1], i=
t
> > > appears the rust team somehow delivered support for v0 demangling
> > > through libbfd. The code itself looked a bit odd (relying on cxx
> > > demangle to run first?), but that's a separate thing.
> >
> > There is still C++ demangling support by way of cxxabi:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/demangle-cxx.cpp?h=3Dperf-tools-next#n44
> > that was in libstdc++ (GNU) and libcxx (LLVM) when I looked.
> >
> > > The centos build does not build with libbfd for the license issues yo=
u
> > > mentioned. So your change probably won't regress any distro use cases=
.
> > > But it does remove support for motivated users who don't have
> > > re-distribution requirements.
> > >
> > > But since this patchset came up first in my search, I thought it'd be
> > > good to mention that someone probably needs to add v0 support to
> > > tools/perf/util/demangle-rust.c.
> >
> > So I don't see any libbfd dependencies in demangle-rust.c:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/demangle-rust.c?h=3Dperf-tools-next#n8
> > Unusually we don't have any tests on the Rust demangling, we do for
> > Java and OCaml:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/demangle-java-test.c?h=3Dperf-tools-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/demangle-ocaml-test.c?h=3Dperf-tools-next
> >
> > Reading a bit more it seems that previous libiberty was coming to the
> > rescue by way of C++ demangling. I'll see if I can write a demangler
> > by way of lex and yacc.
>
> Cool :)

Not by way of lex and yacc, as it seemed overkill, but I sent out:
https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
I only tested with the examples from the doc. If you could take a look.

> > If we have a v0 standard one is there any
> > value in the existing demangler or legacy demangling? It seems this
> > has been broken for the best part of 5 years.
>
> I believe the "legacy" symbol format is still the rust default. So
> probably can't remove that. Looks like there's some desire to change
> that, probably probably not very soon [0].
>
> That probably also explains why nobody reported the breakage - only very
> cool kids are using v0 scheme currently.

Ok. I wasn't sure on the status so I've tried to incorporate the
previous legacy support and the v0 support in my patch.

Thanks,
Ian

> Thanks,
> Daniel
>
>
> [0]: https://github.com/rust-lang/rust/pull/89917
