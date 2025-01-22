Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D16214A83
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562312; cv=none; b=TCCpfprZOHo/5ObGvhQivQt80Jb9bY7ufXFt6kIbZNl6xi7a4+25GXRAG9I29a9yl8rJaZ6joaqYC5JBv1P//WHljcXSY4wfw80taFFcNugi0Zc2pdQNjKRBcNKc0eAdjYKz1KJ3UXSQJTKt84ZpUKa/lqai8lFPZfs6RlB3rsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562312; c=relaxed/simple;
	bh=jNCWiuGwLIrwAxoH6c87tzyM63E/aK+e20wre6ZWSr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umFDhh9WiHzmmpgxQaJa3sHExW+E5U18etctxHk+6ue42+jBnhLid6y/SBxY64Alh3hz/lHJYw2LT4L+DCrFhgUO/+zoL88zx9Toh3OX9vZUUweHrh+7YJ19WVAbQEIUd/m5CYus+/MH2GmHFJlFvupaW5gS0rOmdsk2dHNRfas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qobjCwSi; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qobjCwSi"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so214615ab.0
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737562310; x=1738167110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNCWiuGwLIrwAxoH6c87tzyM63E/aK+e20wre6ZWSr0=;
        b=qobjCwSigwmsdyNls99UECUsL6WC8ChDvh/MJjje9C2hqeW7V1NhBZ5FjoaQW5zOud
         rtpBnoECk+1sBbJkVwJJC1+4Xz63yLcL16bIc7SqB7UKiBYikUNbys70LMUy+AOaOeht
         KNxU3tgUOGv1lNNgT3J/gEWRRhA2DwxaBUlHGaGSV5C1+3AONkwE9qGt047MuamasRzO
         Hw9usF7gpnEjV/qBmG2V3moTlb0XrkGKGuG9SQZT4s2ij8aHBHv9/33EcptUQnRphhJM
         Vqvq7T8OI1ttRh5Ec1oA7EdrZe8OXDPO2x698sGfr9WEqs7orW/qtIkz/NvLTX0ZE/F/
         Lj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737562310; x=1738167110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNCWiuGwLIrwAxoH6c87tzyM63E/aK+e20wre6ZWSr0=;
        b=h/pnEUPFIvTI2V5i1DfoPbgZYuZ12x/XyFcHhDSMlyH6f9qh6mqS50aQFawLmL5FtB
         nrZpFp8UxPwo5SMkedh9xzSZ7eU9wxNh6C2i8p9uw/1zW2WIvvZvDvx+jXa3Fxz4LEud
         B7aCvBvpPrPU6H5jZzsIwrwe0GQpIRzypkOIGLpweztiEVLaNQxHtWx0pT96i0XHQ1LE
         NQxk50K1euVsD2QPCFhBXw2s2zENbX2RLH5gz6l+1aQeoMcXlkx2yW3LecD1Qp7mkJ/m
         5DMBpJCoFH5GfUP5JB8iTitzCzj0g61qQg06UiSOPw0zWud6wKGm71tLP6yZft85sHdA
         EO9A==
X-Forwarded-Encrypted: i=1; AJvYcCWlff/SiI/LADw8kG3DTxGZujaezhrWruOqTNAA62tQYRbUj5ynWjGk6JdTlJBx/LkE5rqi@lists.linux.dev
X-Gm-Message-State: AOJu0YzKs+AKtqmzQSN9DnSs7jL6xavVURUWyvRiUKEDnaNQBlKJlApt
	fPWguZ1YNvFFpqIzd07E3kIz1eLSX5MCY1GFFYfXbS2Ca5jc/jOtJ+1nxCvC1RuSsiS8z1GS0mF
	TOJ1zLMow6VLIXdl5Owvla/X+BVWwDTv9i4yS
X-Gm-Gg: ASbGncv5A9IgNNeecvoeOWBDZPa2wdMNej2//Mnyg6akUiBPgxrRoToqhXFIa+mRckF
	q44K0hydqcNtJB5RAt9h64lL1LkR+ul1MTKW292dsLkOYzWVqvDAtpS696gj+od4PtONMrXeFaF
	5WZRs=
X-Google-Smtp-Source: AGHT+IEiFLgAYdHIXS9mFH9WxNkvJOsHn2tSvvkkY8zJ54ZbyBmpqfFOVwUtOm1Q1WCVFVs1ws31sUh2kq3VR1xaSo0=
X-Received: by 2002:a05:6e02:348f:b0:3ce:7852:1e9 with SMTP id
 e9e14a558f8ab-3cfb3fa3d80mr3094505ab.17.1737562310187; Wed, 22 Jan 2025
 08:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com> <Z5EM24qWVQF2VdI8@tassilo>
In-Reply-To: <Z5EM24qWVQF2VdI8@tassilo>
From: Ian Rogers <irogers@google.com>
Date: Wed, 22 Jan 2025 08:11:38 -0800
X-Gm-Features: AbW1kvafVY7CkArTm06Ofo62Z-sE61GIelJQE_qFuHGUl5T-U-N_90G7y7SWyBY
Message-ID: <CAP-5=fW6ZWf6jF3Xnike81S9s_5tZ9w4DS8=8Ff1Ve87O32_Sg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
To: Andi Kleen <ak@linux.intel.com>
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
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 7:21=E2=80=AFAM Andi Kleen <ak@linux.intel.com> wro=
te:
>
> On Tue, Jan 21, 2025 at 10:23:15PM -0800, Ian Rogers wrote:
> > Linking against libcapstone and libLLVM can be a significant increase
> > in dependencies and size of memory footprint. For something like `perf
> > record` the disassembler and addr2line functionality won't be
> > used. Support dynamically loading these libraries using dlopen and
> > then calling the appropriate functions found using dlsym.
>
> It's unclear to me what this actually fixes. If the code is not used
> it should not be faulted in and the dynamic linker is lazy too, so
> if it's not used, it won't even be linked.
>
> I don't see any numbers, but it won't surprise me if it improved
> actual run time or memory usage significantly.

In certain scenarios, like data centers, it can be useful to
statically link all your dependencies to avoid dll hell. The X86
disassembler alone in libllvm is of a size comparable to the perf tool
- I think this speaks to us doing a reasonably good job of size
optimization of the events/metrics in the perf tool. We want these
dependencies for the performance over forking objdump and addr2line,
but we don't want it baked in - unless the person doing the build
wants this and this is still the default if the libraries are detected
by Makefile.config. Using dlopen also means distributions can have a
perf tool that doesn't drag in libLLVM.so and a universe of
dependencies, but when it is installed get the performance advantages.
In data centres having fast disassembly/addr2line is less of a
priority over the binary size cost replicated over 10,000s of machines
because those machines don't tend to be running the annotate/report
commands.

Fwiw, Namhyung's uftrace is doing something similar for python:
https://github.com/namhyung/uftrace/blob/master/utils/script-python.c#L139
and I wish the perf tool were also doing this. I think it is much
nicer to have the tool fail at runtime because of a missing dependency
which you can then install should you want it, rather than doing an
equivalent within the code base with #ifdefs and needing users to
recompile. This patch series significantly reduces the #ifdefs in
places like the core disasm code.

Thanks,
Ian
