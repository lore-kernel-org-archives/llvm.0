Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994273;
	b=EK0Mw+/I66BArCtZSlF4hsFn7AS2fU+7V6/b4w77tsj4lUJdabqZbNeIqxUFd9PnKNzR
	 JDRPR9V3D6SIt7ZRL07CYxr4+dJSU8TvTTsSQrN2wotg1EhpSiSLXBSA68jJGj4kkkFL1
	 jae803UBbWorBgtX03bsE2hJTns/aJMWVfqJ2zhylRlj/APy0AhWKk/5XUaJERXLWRTGu
	 LrejRHRZXFy+5fT97dOlfjw88CJYAnjErcEa6l6AbhTWzyOqxICK684x/1STMgSAt+3bP
	 StE+iXONGqx1MudZVTpMZlLoHBG02PUMyafMm9f1rAVVKLHmxKjon9D5BVqPc0qp/3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
	b=aPGn2nU1lCSJvoWc7esOVe41S9nUT53lOkGbeyOncXKFE2tIDlDR7njGEViPwkSUmnUW
	 Dy2MKubSfs6Y9qlLJPYRMnsNJ4dctMOAqyEhuJAYBovcmh8Rr8NkyUjtdT1O5MvrbSnj3
	 fND+GKk2+hE3+8FZJg74kEsKy2j0Ltrmsamcf5n2/qdDIIe59p3e680CAd0ArNkTd00Zv
	 U8xmdzrXj4+xILpYQ/FBIX4NcbtR0LzM+t66cul1FLWXo6j/xaVmwg9mYKMSRSugkPctL
	 8MC9+p3NG2RkOmQXs3OfsHEV8ierdjUQnCNsOVNvxJfeq9qwXc+qADrewAcC/J8aJLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=offMF8NT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E7606A32F
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 19:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13E7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=offMF8NT
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so1075288f8f.0
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 11:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994271; cv=none;
        d=google.com; s=arc-20260327;
        b=VT0qsf8bszFA7qPiyGozmO3W9TVG4IkhvnzRTKL3zplpS7ZN0X7x2AshgYSOvoez4a
         EQpxb1z38QWx2c5lgv/0WM98w6AspJpRorzBnIndSTcHh1ZpagMsDUKWXP1MoAL4f8NY
         cg79V3wkfKuqHn0A+YMGrOamDb/uu6/7OYfcja85Ymqlh8SNjPazY8LFUm9ymSMQKL6h
         8N/RTqb3rHyYj2faSu0XX7k2aURrenqS7KAz885kIcWR7Ls4i65rLR73Cu3s/t+ig0Sg
         fukWZeS7G5nHq6yyzTiIFPZN2hL9TeK4omjzyuiCnWLzr5WgDnkuNIiyh9p7uExR4vYT
         RerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        fh=oFX5aZNIyY+zXcI10Ia39nVDn1pbyJ2snRxhm3JRVJI=;
        b=nAWO3iZ0eXSO/NulOeM1bhAHh45LGTvS6lrWZ5wKF0tm0iYv4uh0rnhZ+9NA8EjvyJ
         OG8Bm8HBm60Er3iUDLFmA+dKNo4WWHMIh/TebLeW9+IM6vDltEdUXGO1P4JmWuEcXNb6
         AU9b8Re1e/DTaiwQKDbP9jcNDEM+1yyCre7BfviMG1QveP6tou4rPaR/ysadyu2IZ2vM
         Tdi9uwUGcS2aPfOngxec5MHWMtL7/CfhtrUg4COgKTStb6CeXq9Oz2n2Ri1wHyyxagFZ
         gazNc1YWTfQOpuaBPKgbZ47XrcCAIjCKAWhjpnV9HAHfJ4rLnG/NaaP3/phaqtdkEYB6
         wBGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994271; x=1794599071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=offMF8NTLU5jrq8Y2p2tg8leC+22gkV1N27Ua2iUeCdhPf2E90OgmelFmCXgAYGlr6
         LIGfm9KuFRYIuk2TfE3fcJnPiRt3kr+WTUOthNOGr/lxM5P6zBfBahDpgJXNegpajJwu
         OFoJEvu+C0tduHHwT4eMKDz9YCRZG8Ag6unWJEHvz6LG6cJTbJi+L6k12oS4o0Ptk2ZN
         e2ZQFpfQzEt3KpHgnetWnvawmgfWEWjLjKXDcH4MVW5Y3tydMBCbDeGK/fahwvCZMYa5
         Z+FRw712AL0jg/7m44e1M2RqdAH+DaSdyv+vACr89ipYMQXnYHKRQzbm+sAR/61IO5Lh
         vFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994271; x=1794599071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=sKE/thJmxJbM0XW7tx9UDrgUky8zyv2E+X59uudSkXwVo6F2YswRH2FJGvrXkS/9Yu
         1GUpirIfWYmaP6AFTkToGiMXER/TLn0uc1NcWrmjLG7OuJcZnAQC+LwA7oTS/mqMoXAp
         +LusTQi4f24PQ1NdDtMPYtZIStrGiFY86Sk6xGhh1wyasNRmSC7IqYeWlNCp4vQljjhl
         /jhoJF9rkVP7QH14qi8qGpK79bLxMmkb3IV+88B9Nz14z1kntW3QxHwdv+hlgojZhp+B
         /I/v432bsZGUeyG352KuwellvcTGMLoJ4OE2vPJNTNMMNuJ1p+A0VyDAlsQdsYPE7n2q
         /EhA==
X-Gm-Message-State: APuU4Z820p1JLEySsACBnRjKmm+IoCgO9QmaI9YPDws8VCqvkIdbOSdW
	eK5qz4qwq3ZCkupxGa8YFqkYgMNqpxZkSkU6EhEpQeruEV9XjN8NVSrxSGFV8FxawPcaFrxjmYm
	uI2BZM1NI4b4x2IqwdksqmMsJTY7npwql01H2N0o1
X-Gm-Gg: AYBFou0tD/bKbRgYyvpu5wqLMH9Ti8ymdGoJgsvwSb97wGsVgWZN6N1eSd5Q8xIUgxq
	L4696rzC6L4ODTfWhQp4uDtsua+ueVYJiCnT4ARgOR+DQrgTmrBP/vWq6HrxbiGp1HRNTfFxYeR
	r2/2kTDe4jbN2HPaL+t3CQvvz+O6Ln3MIDMExe2ICF1wZhXYdDCENTK8N5NYkKYkamtO0ggn/nT
	3SkSiXGy35zp7fLr4tCxAxRi2ecMIi8Lq+D+gJAkHDDGTH03WNL3OqKNwuyfo6k0+aQCO2TNKDu
	oBBBwYSGzIjuTXrujlut3zBLfyuObh7rn3RLSZ4C8Y2a2IOOkl2nCH+8A4hswB/odgDSNJbYcLn
	Z2a9v/sCT4UfK03Xg5aQYPEUJ68f5/7oy3GBhKmueMgZArQqsEnhKG7BxF8ON+t9P9hxoxMhylG
	Mfar9d0+VODuSSpftrrloys8UONXjUd3seJo/KuoSJCU0HT25dGag7S6bhvACCdb/1w7pVa4Nbu
	c8k9+vnGNn2VjRBjh7DAoYPAA0caK4EN6yMow==
X-Received: by 2002:a05:6000:18a6:b0:492:8dd4:baf8 with SMTP id
 ffacd0b85a97d-4928dd4bbe5mr7282358f8f.6.1793994270567; Fri, 06 Nov 2026
 11:44:30 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
In-Reply-To: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 11:44:18 -0800
X-Gm-Features: AclHuK9lc1j_hydZKjHRaIqC6GPhtItrfzxvxTIux1kraqJqkaT_i4EQKE6q_vU
Message-ID: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yabin Cui <yabinc@google.com>, 
	Han Wang <nesthanwang@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Snehasish Kumar <snehasishk@google.com>, stable@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> automatically passes -mllvm -sample-profile-use-profi whenever
> -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> inference algorithm (Profi) by default.
>
> However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
> FS-AFDO that degrade runtime performance compared to LLVM's original
> profile propagation algorithm. In addition, Profi's min-cost max-flow
> solver (applyFlowInference) can hit pathological compile times (30+
> minutes or hangs) on certain kernel control-flow graphs when profiles
> drift slightly or when combined with GCOV [3].
>
> Pass -fno-sample-profile-use-profi to disable Profi and restore the
> original profile propagation behavior that kernel AutoFDO was tested
> with. Guard the flag with clang-min-version 210000 since it was
> introduced in Clang 21 alongside the default change, whereas
> CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> used to probe for the flag because cc-option invokes Clang with -Werror
> but without -fprofile-sample-use, causing Clang to fail the probe with
> -Werror,-Wunused-command-line-argument.
>
> Although SampleProfileUseProfi currently defaults to false in the LLVM
> backend and is only enabled by the Clang driver, explicitly pass
> -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CLAN=
G
> and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as well=
 so
> that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> defaults change in the future. Unlike the Clang driver flag
> -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> -sample-profile-use-profi option was introduced in LLVM 14, which
> predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
> checks are needed for the Rust or linker flags.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Maybe we can credit a few folks with reported by tags, to encourage to
report issues upstream more in the future?

Reported-by: Han Wang <nesthanwang@google.com>
Reported-by: Yabin Cui <yabinc@google.com>

> ---
> v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65=
fea2e1bafce6370@changeid
>
> Changes in v2:
> - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
>   as well (Rong Xu, Nick Desaulniers)
>
>  scripts/Makefile.autofdo | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..55fda66ad960 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,13 +13,16 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
>  endif
>
>  ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_AUTOFDO_PROFILE
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
> +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
>    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
> --
> 2.56.0.455.g6c5a503b38-goog
>


--
Thanks,
~Nick Desaulniers
