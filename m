Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0A186E58
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396130; cv=none; b=F3x6dQKSVjv37QxSUSkk6GbZb/qnNMy1uol+4q8HwFbIbp3ISH+BJJO0kTYQ7/kfGRySnzWrFzoA55DET6kTD7uuHY28Ca7otRlWF5xVnM4bZnBs7hky6fzIdQuDGufpAlRM39hR2zCcJVnpi1MVL6FRjamNvSP+DLP8AVRDcXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396130; c=relaxed/simple;
	bh=qXTmxjTyras+zm7PUf2sQaZd9rONMZStbuXFBM1xrGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJ5uR+kLqQpZVKZgZCNM9xut2XKumTpy1OE9brP+hfDZslEOEb327ZvJs1HB8dL2to1xBnkYRtxjJVQEkll9KjIqyiIe0YBCojzzL3VHYeElrO9KuNtPESs+TJZUwsPY8315R2761vG7ZrVNddjhs86Xobp+Tb4lEbUH1LpajV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lMCgqgNJ; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lMCgqgNJ"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so405335ab.0
        for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737396127; x=1738000927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fekVV59GjYhc1/yF3/Wchj+CM9gXR6qiNxtKcL/5lRQ=;
        b=lMCgqgNJbaeVASsK7+a/s9hN6+m/zHifMpy2lJieYm4abnUZtsQg14cmNyMVnKg2iD
         qQtTefyLUMHy6wVUd8qMy0H0m+NZ8CiJm8O1izcX3EvJ9KYSk3Uu9Sd6Qe0+9zzGyWnZ
         utE7/GIqUGbABJG47jKvUPWuLkNiwjgnHN6oXmoTt+h6nFVaPNzLJ9hZgzD/q8oL8fpC
         fIyQ6Npo3lGIErB/DmeMYXa8C4OY8i+kAWKvXHihbsLeAIvz1ob4RBC3FsphcsbPkBfg
         2Vm5t1eo1EDomPycyFVYWgru1OFDkhz2fiHR5FNw06De1VNZzkC4SvmwTEmsCTRuUeHV
         C/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737396127; x=1738000927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fekVV59GjYhc1/yF3/Wchj+CM9gXR6qiNxtKcL/5lRQ=;
        b=LU6GccdQbLcAplHz0i+apkKDqE1htPajoRQEwSlMQIOswZ4w+ogqN3SfsQOvcVE7GH
         9aaM5H/+9qJSsswU1RUzSxO+pwFO+01OC/VCu6+3JjtcRmAvYtqabNhGmlsnSTNFnEHJ
         wDv16t9Dlg02tPbxKYpsWKZtFCGz69NdC8I1GBU3jMELHV8guGNGHR76LiFxZbCtMuA5
         aT9jaf7u63s20JSsLOCxOvCkOFo95+y7qs3XNjxn2JZHAk938twZY+I5uB8aO68NPme+
         tA56tin+ZUhOcWJFU6zoplSr7E7cOmQqYcP6VhEM91GO+D+k9k2i1Zbf9XoFKwWcZvbS
         KH3w==
X-Forwarded-Encrypted: i=1; AJvYcCUQjEnPJMGo91Wsk+ZvmrN4ds7GmMRksb3mE2AIpt+TgKYknfzjSlI5TCZDWhyzd/Z9NuzQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyTlItreWFDR4WwXaDlEE91JhtJZt7bUDCHcr8GCAc5fQOw8/0d
	ut0FPjXn48CkgKD3cpP/DaQjnBjSqvh5XoU3xKmRgOVA5Vk3qjOG/AvPlGl2/PE9w7A6d3sYrif
	ei0nzYxeaBmsjA9axmWCDTDBk0URlq8XWbUSw
X-Gm-Gg: ASbGnctwPdG1msGWuhsvBvp6wUCOJMStoL2U/OedIxa28WVRboFs5/cDsHSaN02BXFt
	/+z3Ii1KAZ6aMmL6yOsAq6IDcZThucjElMcTou42IwzTMF9hTuqDQ
X-Google-Smtp-Source: AGHT+IHiGRGdGZ8uZ6p34vU8z2qvnbD7hPKh9nIaC56NJUv9jyvSQVjqZVaoe0DeZXyE/skysTne5u4Ted9Lzogw/zw=
X-Received: by 2002:a05:6e02:3110:b0:3a7:8a66:dbaf with SMTP id
 e9e14a558f8ab-3cf7e8a37afmr5325515ab.16.1737396127294; Mon, 20 Jan 2025
 10:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120173208.344231-1-irogers@google.com>
In-Reply-To: <20250120173208.344231-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 20 Jan 2025 10:01:55 -0800
X-Gm-Features: AbW1kvah6kRYecZfVwKLobDr0yWP0_R9lMy5BLexqZSYXd51R3CuzmYQE5KKvEI
Message-ID: <CAP-5=fX8aoEKaFKzdJowq6q470GfpzX-vWTASJEDx3=LHumChA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Support dynamic opening of capstone and libLLVM
To: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, llvm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>, Dmitry Vyukov <dvyukov@google.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, James Clark <james.clark@linaro.org>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Andi Kleen <ak@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 9:32=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> Linking against libcapstone and libLLVM can be a significant increase
> in dependencies and size of memory footprint. For something like `perf
> record` the disassembler and addr2line functionality won't be
> used. Support dynamically loading these libraries using dlopen and
> then calling the appropriate functions found using dlsym.
>
> The patch series:
> 1) moves the capstone and LLVM code to their own C files,
> 2) simplifies a little the capstone code,
> 3) adds perf_ variants of the functions that will either directly call
>    the function or use dlsym to discover it.
>
> The addr2line LLVM functionality is written in C++. To avoid linking
> against libLLVM for this, a new LIBLLVM_DYNAMIC option is added where
> the C++ code with the libLLVM dependency will be built into a
> libperf-llvm.so and that dlsym-ed and called against.

A question for the LLVM folks longer term, could the
llvm/DebugInfo/Symbolize/Symbolize.h functionality be added to the
llvm-c API (ie the not C++ one) for the sake of perf's use using dlsym
for its addr2line implementation? This would enable the
libperf-llvm.so library added in these patches to be removed and
libLLVM.so used in its place.

Thanks,
Ian


> Ian Rogers (5):
>   perf capstone: Move capstone functionality into its own file
>   perf llvm: Move llvm functionality into its own file
>   perf capstone: Remove open_capstone_handle
>   perf capstone: Support for dlopen-ing libcapstone.so
>   perf llvm: Support for dlopen-ing libLLVM.so
>
>  tools/perf/Makefile.config         |  13 +
>  tools/perf/Makefile.perf           |  23 +-
>  tools/perf/builtin-script.c        |   2 -
>  tools/perf/tests/make              |   2 +
>  tools/perf/util/Build              |   4 +-
>  tools/perf/util/capstone.c         | 723 +++++++++++++++++++++++++++++
>  tools/perf/util/capstone.h         |  24 +
>  tools/perf/util/disasm.c           | 612 +-----------------------
>  tools/perf/util/disasm.h           |   2 +
>  tools/perf/util/llvm-c-helpers.cpp | 113 ++++-
>  tools/perf/util/llvm.c             | 537 +++++++++++++++++++++
>  tools/perf/util/llvm.h             |  24 +
>  tools/perf/util/print_insn.c       | 117 +----
>  tools/perf/util/srcline.c          |  65 +--
>  tools/perf/util/srcline.h          |   6 +
>  15 files changed, 1481 insertions(+), 786 deletions(-)
>  create mode 100644 tools/perf/util/capstone.c
>  create mode 100644 tools/perf/util/capstone.h
>  create mode 100644 tools/perf/util/llvm.c
>  create mode 100644 tools/perf/util/llvm.h
>
> --
> 2.48.0.rc2.279.g1de40edade-goog
>
