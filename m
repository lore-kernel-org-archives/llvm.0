Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A663988E1
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249719; cv=pass; b=Leu4B7sT/IkQk+yUpPSvfIYn4/BwTPFZpmVHA6S17rmdNGEWhm704fAee9xkV7HQSQu/R3Oun2xVb4tHeorWuRLaAlpfd09vx67D+hg9xN4httRIzpeZpFxLAUbilY629WukgyLBi+W/FA+Z9mn1kqU19YCeq+qPfpzk+CvMG1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249719; c=relaxed/simple;
	bh=p6q8LWPMVa2osOVn3baZs5YxnHGVEKp86xJ2gk1+YxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsdF4Z+k77ZckHdy9AZ2lS7tbNN/zq8kvnTlsQUov1ajs40KIu6+UGiPR5LmDb4GXnJixUjR5sWPZ/zB7M/7oqjBwiINVOVTmXHDLtHBfOQQiDhWIECpCqGITj0e+/3Yt2mTuzMkCLRKLIdjgHhCzd2hO5cgC2UbQiztf6OLqcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tw0b1T0A; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tw0b1T0A"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e2fc11088dso6421747b3.2
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 00:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249717; cv=none;
        d=google.com; s=arc-20240605;
        b=X6apS+zDrMzLfv4LDITfvueuRnqDmuMppRoLU5PHmpVULp1Smu1jatbnIMpEBGA50m
         iljf/d3jq5TucXPC8+5rbsAZLBby90L9gkFORkxDzc+7ufDo4no3nD/mEeCCj3QivpYk
         aAYp/Up5QsB9U5aquwx2eyxbQ/IaEtVjN08+WXlYjC6g+waX76Ks9Nd7DthiqKE5YkNx
         h36+nf6NpLpeTyVncR1zjIsRUk/NeWWcA1TfkJwSpXoudUGSATPpyB2Rka1t54tp0Z3x
         dDVMTXMsoiohqDHSWxlKVpqPwp6GNwCfnuuNUweBTyvK1gRqVAkC45HfWL0Kr+LC91Tb
         Sa+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        fh=13Nj0QuFG0IgXcG4mJxskWrakMzCzbO9LFlzaMLRYTQ=;
        b=hhqCVAWKP7O0Uy4UcQ+rYa8oVs/kHNdvFpThTvjLjPPB5dQqgs2Ldv6PjbBQeEzbSk
         BwLf/9OJYABDgitfX/dtfwcma6bJIn8/6oe7ohvOlmtpNZ0l1UaorxRIO0uvEO7KxuwK
         pFKELpmy+w6pQqhEQru4QyNGunCpInpTci7fJswXOUcLa7gQX4WXl6lwbPNXZ4ddt71J
         cM/J2r/H1vA59P8UxnWQqHoBzA+ityjAKq9JhhsOB0Mmk1lh7sSQ6ky24iY4KaUXkJyr
         lCjHEnfishKO6KCwAJmubLZWDEIK5rXEjRX48tOB+A0ACAff+tUkno1GaYVkI6RvyA09
         G5Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249717; x=1781854517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=tw0b1T0Aow2KtomAzIttwVPH4gAmMlh/wl9HnezoIjawfTEullmrdJvyCGNiTVFFst
         5/A+OnFbXApNJN8EECFpbyYmZ9qcSGzBeYI3llTIy4YpPzHEPYZLmy8uAwPdpfuuc/7Y
         xuCLdOv9argaGkIYDFTyFtMo06gkF8AzLMTSBIqd4qyuAfnibmpz7kgfzv3ZkuMOacVs
         w6OYquo01mUrSLTBgu/0LAU7mpTJZWrTsgXW1tbjP8IJYVv7AXfXQH8fETWPo3Oo1Q1u
         pHXLuIEr8JcTY0LbVUNLHo3rlKikrBxfBwcjR7edrARcqRZioFCyzrESB6ru2wws1ZS/
         HybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249717; x=1781854517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=T+kBJ+XL2iBfpRhxE87/2icpQuRoL93EkgqSqD0wErROkBLT4Q32ggBoqYVRX5toto
         dEWvHlXzvXhYF8vEASgCLepaemzIgcrdukCZwdnZ6R0iYvelMqDqv+pHfheeytnL+PeW
         HlQTZE0955DVL42vyg+4bRJ3MiGjkZWNZyXdTlTD2y1/P7D4FZju2wm1jSMpkAYhkxY4
         8SjjAK1t4Ijwuz7Wzt8tRl+jUaBE19GfgHczg+3lgahIh2+kQBduE9QG4TmFpK/pUfI6
         PRFuaO8N/7GM49Rb5N4O62GruTC+muLmFZXGxiMx+hc3jQIYgq0EY/HfMxpuvbXyPd+5
         SLdw==
X-Forwarded-Encrypted: i=1; AFNElJ+LbBQjPsQ3lTSsJh1bjb5HdqNOYWMb0PMawppaxtfEnU6RgcxE1Ht/5caP7GNLHAwmZwHS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh69rWzY2NWfkXupIXcA2+yvKie6wQApgQY63ZxLpTGuy35oHN
	291tV9pkV8YyswXvPNWba/LSWewqe/aLGU++uTYG3D8stTvojOEYBf5Qc01J/gn0nVy6t6tubZY
	mrvsipCBD+IqnST8+j76INnVpn2Rha/UzogilWAhv
X-Gm-Gg: Acq92OGnGled9UjxlL5/3617Jl7PTKSvjgPmUyC+lQ/fEwgDdm517FL0J3hf3RAmzW+
	mI6wE/4nP4YW3cyHZ5pEd6cg7PM6g3frQHSRy2rgvFPcetIgnurrAmCI47SJZ1bVBWtt0pBBZy9
	TtB+5FpVriq1kfMs3ddNKx+7doAQmz8CH/mhHlTfDDwOKr+OImstiXRajaPVSbMN0cPnkEszQB2
	F6hJobo6i5ECy8POLuNc47npZI+i8cGHZTK1j9pPHAkG68H5ymYdxSF+QRWNOg18gMM1XZkh3Fo
	ZFVemz6l9J0gWlDLoaWrlUqnDeomwMgp6R2imQ==
X-Received: by 2002:a05:690c:4b0f:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7f7b9020616mr15009847b3.40.1781249716383; Fri, 12 Jun 2026
 00:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:34:31 +0200
X-Gm-Features: AVVi8Cfm4phss8ao3422B1w1tp_vYDP5PJUsvm_ZDGjV7MhrtYD94WvUDwrEe3M
Message-ID: <CAG_fn=WYdnX_09RNs3sTQWn+KZZaw+X9a=s1Uk1bqd3gW04h6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Add a new tracking mechanism that captures function arguments/return
> values at instrumented function boundaries via submitted as an LLVM
> RFC SanitizerCoverage callbacks:
>
>   __sanitizer_cov_trace_args
>   __sanitizer_cov_trace_ret
>
> This requires a custom LLVM/Clang build with the trace-args/ret passes:
>
> LLVM RFC:
>
>   https://discourse.llvm.org/t/rfc-sanitizercoverage-add-fsanitize-covera=
ge-trace-args-trace-ret/91026
>
> LLVM PR:
>
>   https://github.com/llvm/llvm-project/pull/201410
>
> Clone and build toolchain:
>
>   git clone --recursive --depth 1 --shallow-submodules \
>     --jobs `nproc` https://github.com/yskzalloc/kcov-dataflow.git
>   cd kcov-dataflow
>
>   cd llvm-project
>   cmake -S llvm -B build -G Ninja \
>     -DCMAKE_BUILD_TYPE=3DRelease \
>     -DCMAKE_C_COMPILER=3Dclang \
>     -DCMAKE_CXX_COMPILER=3Dclang++ \
>     -DLLVM_ENABLE_LLD=3DON \
>     -DLLVM_ENABLE_PROJECTS=3D"clang;lld" \
>     -DLLVM_TARGETS_TO_BUILD=3D"X86;AArch64"
>   ninja -C build
>   cd ..
>
> Build and boot kernel (using virtme-ng):
>
>   export PATH=3D$PWD/llvm-project/build/bin:$PATH
>   cd linux
>   vng --build \
>     --configitem CONFIG_KCOV=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_ARGS=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_RET=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=3Dy \
>     --configitem CONFIG_DEBUG_INFO=3Dy \
>     --configitem CONFIG_RUST=3Dy # for rust module kselftest
>     LLVM=3D1 CC=3Dclang
>
> Core implementation in kernel/kcov_dataflow.c (separating from kcov.c
> as Alexander's request):
>   - Per-task lock-free ring buffer via debugfs kcov_dataflow device
>   - READ_ONCE/WRITE_ONCE atomic pattern (tested on arm64)
>   - copy_from_kernel_nofault() for safe struct field reads
>   - in_task() guard rejects interrupt context
>   - Bit-31 recursion guard prevents INSTRUMENT_ALL re-entry
>
> Build system (scripts/Makefile.kcov, scripts/Makefile.lib):
>   - CFLAGS_KCOV_DATAFLOW: -fsanitize-coverage=3Dtrace-args,trace-ret
>   - RUSTFLAGS_KCOV_DATAFLOW: -Cllvm-args=3D-sanitizer-coverage-trace-args=
/ret
>   - Per-file opt-in: KCOV_DATAFLOW_file.o :=3D y
>   - Respects KCOV_INSTRUMENT :=3D n for noinstr exclusion
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for whole-kernel
>
> Kconfig (lib/Kconfig.debug):
>   - CONFIG_KCOV_DATAFLOW_ARGS / CONFIG_KCOV_DATAFLOW_RET
>   - Depends on CONFIG_KCOV and CONFIG_DEBUG_INFO
>   - CONFIG_KCOV_DATAFLOW_NO_INLINE (default n)
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
>
> Also fix rust/kernel/str.rs unused import (flags::* -> flags::GFP_KERNEL)
> which newer rustc (1.98-nightly) rejects as a hard error.
>
> Rust support requires rustc built against the custom LLVM with
> trace-args/ret passes compiled in:
>
>   https://github.com/yskzalloc/rust
>
> Link: https://github.com/yskzalloc/kcov-dataflow/
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h  |  10 ++
>  kernel/Makefile        |   3 +
>  kernel/kcov.c          |   2 +
>  kernel/kcov_dataflow.c | 324 +++++++++++++++++++++++++++++++++++++++++++=
++++++

I think the total size of kcov_dataflow.c doesn't justify splitting it
in multiple patches.
