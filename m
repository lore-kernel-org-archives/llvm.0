Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6343C199C
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673395; cv=pass; b=X6xXeKVbcVAr3bK5ryoG6FcZaSAgUcxTVn9zdKXtIuHy8RUpUDNl/7iJ4bnI8EQjdftYdI0KB0i3mgkNry/mqWMp5abrvvMjmDcsehkxH9CiO6rGML91noDVSSSZZ5OAWYAGbIlRX0mr8Om9kmilO2LnJVvjJEAU/SsyqGdT4uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673395; c=relaxed/simple;
	bh=HON0Vmc+Uv2m+9L/ARZIecJdRDIMB40cGZIqinKUDVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3joPW7TA8mFxPaUsaxpOubYy88ZJat9Ob1e4E8GF7vgjVzXRFLG1qJL6nPAz18iC5Jl005GbkYutwNbY/vayYXopdTkO/EG19y+7mTYkKQxHLmGA/EX579Q34sK5bEB+Q6imP2er7ClSjcH3ChMTNiZWYGdaHCzrDrR1nqfRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mDX2hctU; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mDX2hctU"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7dbd25309f7so23166857b3.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 08:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673393; cv=none;
        d=google.com; s=arc-20240605;
        b=QAs+VlVCFw9g1jGYGt60ZdfQ6oJSO5nxPTKbQSHz3ake8ldBaU5f1nEcLCXbo+iU5V
         YQisU/kBWD+NkLuWlpnGX1G05vIHNNoE/OjFJz+/diIyXfNFKWqQX9ss5sf4lYAqGskY
         vFPT45MfC5Bf7PfKCPXv68TPBJb87FcMadetHoFP0RZYK0dkf4sL0lbVflzXAcYPa5Ad
         H5XRFC9Q7R/90Ag4+wFPTS/OpYLOTv2Mdb6sRfqcbPox6rxSZB1HxPRvO7o9Ls8rqRVz
         kgHYer/QhQ+0Ay+rgtPYbcvgVcZwQ97WK3kmruWeMLYjkOwky1mzxoYMGPmyRKX7HOvM
         iMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        fh=02Ai7SUgZQJuV8FMKdgukCbVUg1MFxt3yBZFnplk+gI=;
        b=Sccv+QThwLsriIb61rMZRILPVkQ2vU8CXiD9sw+VL7QdPR40GY6ibOgysPTou2cCzV
         zmo9eyl7e1Zigr/zBT6b8v6ZWsV9coquS6vSa4lPS7YTgZJvPFkydXgwT1jnrnmEGOD0
         VZRNnigdltebVaLvgy7BmeDhl2zHz0NOnh3YECqY0bQ8zxbjg+yqS86u45tSpg4SNbFJ
         i531HJz1y2MpI+9ou/F4HdRR3m1Tfatz3oeoTawYuEJp6/pzASTgK9DJo5cle8OQDXho
         MHYZw2yljK18Twes2A6V9VKnO5oJYhZVnl7kn3BmEJYtdolY/cTJf6ClzHqYsmQnNHL2
         9j5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780673393; x=1781278193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=mDX2hctU7zxxlLXbNIZ260X3V3pyTvVdkAPpGzkvpvODgVKfBBVLCQMKMKTfSEAm5G
         eGcIWJ2mAgylP8rtCMHjY7fD1nY8fLyE0lDtRO3N3U06OZb78TW1D4kedgCoQPwMXKgZ
         v+pVSN7Ild45XlMoSOYJskXXzKf+M9nuiuihuDXJ181/B/vCZmrHPiMJ7Gcz2YEdXhET
         3QvCzst6RsKSx22lKhy2gOlxEkvfyiedpdPntJy7pheJV4KX6pxt8LUX0zlkDY9Wq3vc
         PetrNQ7P9r3TncfkBgQAUqFjRUEUFCLCgwgDN2BbJCJy/OMlIQ1ogB/2ipCk+OBIGmiS
         l6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673393; x=1781278193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=sgjO9eIZaYwAqev5d4NK9Gp4ZDwe5qMaq5b8bUD/1eV5EnXuJ/nFxMumkih8rvVEva
         nKdTvFtinNUu3jWznIj6wTOIU+P4I4lX1l27ljkUy12+COPrOMOekwgmcsrSnjCyysPZ
         gNd5e9s467RWIOFHSVSf4ViYDK9JfkqVTlS+sMSybohzC2VudUwxIQy8ew1DexczZKCz
         6QAHWU7xKm82aDwfh1ca9HFIbl6OZo1Co/Mp41cOgVTilBPLiZgmTqW2uzreAOO7frPI
         l+JMTUl9I3HJg+OajIodMFY/u4XndLDd78wglSCRQcmFSckzOoFWx6gp/Ng5TW+3I+zl
         EmLA==
X-Forwarded-Encrypted: i=1; AFNElJ8U3RMryLFl1Aj1KdA+F0zlZ+AHlFYDsE1UDZVvqVEC7uT4y5IppIlyykb3yNw5BdjAL8y/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/C85M7oLnoj4eY17ysvdCfo947pVS/hET9PmrXRhOquDYLuMk
	O6ShbcR9mBadrxj/w7O93N8cfTh8Xm2Hc3/TDvyLzROiapfosmoL6O8AtVNjgg1KkNORfDtXnAY
	D4TMQkxFdMNc6uK/oIPAzLcNgOn65Xt27Y5AmFrMZ
X-Gm-Gg: Acq92OE7AQsccTMLhCzR4SRO7XBA/2w4JgUhB1v2E9b4Aw2oM/H+W/uMma4FY2D2UsL
	kZP6l/oKA1Y7AyN2euyY0XvTRy49gQ36ThHEidLOhLuIrIaNW94vn1JmAXi++Fro0hHjEfwUPY/
	Plux+ke1fxWVNTsqRVepezn5aCbYLH4fhER1/G8RBH9v/Uymhu8LgaLUx9EEKgrUEmkUmG9p7OX
	bjI1tMBehosm0F18tSDCoElNguZDNoJ/B9C4Fx+UVxGsbNVZw4E/J66s57d3ZclFt3jCaYM/a22
	B2sXbF62mf0gcgb4tXjlxbV4Cy4pnTgKciJZeLPmZHpsqrsiEuQ=
X-Received: by 2002:a05:690e:4848:b0:660:8e61:1a3a with SMTP id
 956f58d0204a3-66106e3f6aamr2683179d50.19.1780673392488; Fri, 05 Jun 2026
 08:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:29:12 +0200
X-Gm-Features: AVVi8CexkL34vp_i1CuA85Czs2clQeB-m5POHKFPZIkxmr9X1YgpCn5QeGEQ9Pc
Message-ID: <CAG_fn=WavwJakpE35nc+SC2pdhu7zAtS-NTGuzsnDo=84pX8zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow instrumentation
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=3Ddataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
>
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o :=3D y   (per-file)
>   KCOV_DATAFLOW :=3D y          (per-directory)
>
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y                                   +=3D -fsanitize-coverage=
=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y :=3D -fsanitize-coverage=3Ddataflow-args,dataflow-=
ret -g

Instead of adding debug info here, consider adding a dependency on
CONFIG_DEBUG_INFO.


>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export CFLAGS_KCOV_DATAFLOW :=3D $(kcov-dataflow-flags-y)
> +export RUSTFLAGS_KCOV_DATAFLOW :=3D -Cpasses=3Dsancov-module -Cllvm-args=
=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-dataflow=
-args -Cllvm-args=3D-sanitizer-coverage-dataflow-ret -Cdebuginfo=3D2

Ditto.
