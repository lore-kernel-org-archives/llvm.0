Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994361;
	b=qmvbDvbafxX5ZjiosQo9BQdGfl/KTKlXekTeEQmnSONWi+wS0/ADNSD6v1DU+5/P0J16
	 oynJB1kXxHflE60haUz2eHEHZe5NbXnSAK2jt+D9qm3RDIIoOCz1zX/3DYB/PkepQs3x7
	 nfWLvB0lwQCHRkVn2BhED/iLTUR6VavY22+Lq4MU5FB0XsNVsOENUyK3XIJ405KQZLLML
	 qAG5xufnl+ePURpeSAo/Tgq9OpCq/LjHEY9GxH+mkrbjwdyYF+5Q2aL1vhLh44cRxJSix
	 ceYyBPhHZbswSBn26sDumvFxY54Nsr/DOqnm1mPranYBu/1DbkICg8ikBx86SozlAsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
	b=gRNfym58soOxRgMC0veEEaEk+WXX24sno/YK+1JfeDp//BW6ict+G6oTitZ3N+/F4UAc
	 nmMd+ZKh9aJ57MT7SaV9a/CRlOdIhUCFl+r1R3dsAM+OJMw70lYXvTEEOM4OrVHFzNGL1
	 jQ/mK9h5F+U6uvIJeI8zTMLdmE7PojcOm2O+YdQf20S4h2PU0dKyb7lQKhV1eOkLKbT8G
	 wkniK0GJQ05EkesvJU9dfdXFQo0EyhbCZSjtnotcS3EjgmsPdMcBZVGWjB2iQPWTb69/4
	 YoahP/0Zcz45bista1KnrIH0XX3BkVtBY8Tqrwu+ba+SP3dhou4aFuMZl7nULpdn8og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvrkufiv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE8606A330
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 19:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BE8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvrkufiv
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so311a12.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 11:46:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994359; cv=none;
        d=google.com; s=arc-20260327;
        b=YtGsX7An8MK79THbCWeNpMbRuc+MjOsVPaLMJpkA1stSxWgh4GY2t0DtTRkfsLRoYz
         B7IbCScJZT+k6GWNMSq+V7q7L9VCfrrOVgxBB2wGjNAi96pKQtkbu65rp6jkhn0Th6W2
         IDDXgFR6wp4KJbm3RzHliIc+5GbU+to8A+JYqe3eSyzDadVSVEPZfJIp5c71Z21+ZGED
         tFmHAJ7OVcnOGiT77m7pNmGMukj1UZ25AAVslzf7x73XXtWkbmcuurLDQd2gxh1w73wT
         IYKKhcnaewF2UB+os7ji/VlDARZ2J2TLsjjyduCTceCiM+92r/EO3XObwtECzkK371Cm
         MTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        fh=YV+GFsDfGL+XeKf72TN2Wzw7xleccRb3/A9DVMGkReQ=;
        b=bZR5ZlOIjCE5bvP8yBO8tFjNleVyWnVxj5cSTfPENvdHhVLH/uXNMZ9pzz2DhpYF+H
         HDlDPG7YFEmOyX/dI1r2b0lG8jtn4/ztUWajYhovn2+TZhZyFk+19Y+jVM6gf3BD61p+
         cMfBdoSIb2CRiMGaqn00lSPV807EKnbwtfAsJ5DPZKH6bj3AQHEaE9EGcwga3S11A+pm
         iY1mTowCeoUj9hnx+ysPd4Kq4Fm7Wmcc7Pf4oxCEN8x72/TbsVWQIjv2UUQ8UyFEmY6c
         bAG+JJAg9o5mIHs0iDcE0GUDT/S8Abq5fD6yyLtXamUZxPIFGokFGf02uS3DCT6g25Cy
         0kfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994359; x=1794599159; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        b=cvrkufivYrQO3b8feSGGQwVJ1UHE8uo/sUL1MHiVNxbbQqlPfhNVpQwpXzAp2/Lpg0
         Wt7Emj4UFdbo6G6s5p8MdOb7im71ix/lQUKwspPWL4x3/MWv0auu5jtQSn9y4Xs2qulK
         4fg254vPCeS/wQYSjaSkltpYD6pAyK35lwaHz1jwf11ik79ye3ZCYU9X9lBfe/moVnxl
         lMoWVOOvGCz3Ub7LGEB6oCiCNbVghVvbzj7yfI7H1gEtBapy7TZAJKFigDlwC9+pgfCY
         ShjcZp7m4VIKAVVoD6FNXIaDelcoQNZoq8xGCpqv9ANQh56OkzxFRcU5VkODRU8lKv6m
         2dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994359; x=1794599159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        b=Tz2Q2JrYwOr3HJBa+cihOHyTbOJIVTu9C25LerVIReIYmlsOAcavdzoosiPQdYSsUQ
         OUOsA0qUHB4S3mjm+JN+G60fb4N/m6n3347PSeE5YK0s8AhUQOOsfRiQ4eylcESkYsuG
         OpI5qO4Ky4DOvoGqrcteWn3CiPMYJLuzvGXd7jqQRBduQczAVwMwwRNxKJ7c5keOS82Q
         cRHQwGlFIyWPKZ1Lt7ajW9a1sC4NQ/SW7kVAtxjSaIl5FBvmrvlcEmBKsFvrAR5Rt+Sw
         uv6zxVGmBOj90WosjQUtysfI/CXHcH+qWI/lLZUscoEH86mmXHXNv4STS6zyT3RJzGGz
         u/yQ==
X-Forwarded-Encrypted: i=1; AL+hErFSiYkSH71mWlJkxNsZcAJ+eBW4s0EHFF6CZmIa43Mn5Jv7espFR/AgTXEE9m3ihbeshXyI@lists.linux.dev
X-Gm-Message-State: APuU4Z/Dy7+sv5kSCJxstxFeroj87wtNHJhjKyxt1WgydZyvW4sIrJoI
	zl00y98vdIMOWgYizXPjhUaZ0RMj2waP8P5zRtqJR2tCmn6MtGss6FhGmtod63eHCwBBzi1BbWR
	00nuni4+0N3gMFK/IP13hbZWEoadZepeCdSY4JKip
X-Gm-Gg: AYBFou0ZSqBJ7rY91HJaFaP9SCkMyvyirlMzQhFH4u7jkfkZrJwSRH8ahtafzVCmq5/
	++mQYF4nKzhDcYV1HDDjMKYlZLICzW/abkyI1sRUFx9KvEbkJnH/7QQNsNnWq7uI3NGCy69IgOW
	71ssOUtBvcfJOCL1UjBpJKkj1NVQfAvA/gdgT732prGoWUabl3+ayVMzIl6cY/wdX6G1oSTNCvr
	z7KM1YLPGRB9nemJpjw1rTruHy95E973ARTZfaUujOJhZXad4+LWbwGJTYjhL1ZwItVk+1EKGfj
	XXsFnxblOHJXn02h15Yy83/Hifp08Ne0x+dv821EFtvRK3UQf0J01+YFEArWuJdUHQVt5ud0l3s
	m5cOG/6/KISZIpJKwcof3LQbdAIjseA/KNJubfXEiuTh4jNn+nmMkN4/xnbFbUesKwPbJ
X-Received: by 2002:a05:6402:424c:10b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b6fad61dcfmr562a12.5.1793994358649; Fri, 06 Nov 2026 11:45:58
 -0800 (PST)
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
 <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 11:45:45 -0800
X-Gm-Features: AclHuK-y7Snn7fa_RHpKW_RqOSo_pYKXo3yMIDsQSg8EuPiGD_nqwOFftAAYja4
Message-ID: <CAF1bQ=SFw4GR3_HagE6k08ipFebgmxqE8UDJGmOQq9u3-0ZOnw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
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

Look good to me.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Fri, Nov 6, 2026 at 11:44=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > automatically passes -mllvm -sample-profile-use-profi whenever
> > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > inference algorithm (Profi) by default.
> >
> > However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> > flow-sensitive discriminators (FS-AFDO), and Profi has known issues wit=
h
> > FS-AFDO that degrade runtime performance compared to LLVM's original
> > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > solver (applyFlowInference) can hit pathological compile times (30+
> > minutes or hangs) on certain kernel control-flow graphs when profiles
> > drift slightly or when combined with GCOV [3].
> >
> > Pass -fno-sample-profile-use-profi to disable Profi and restore the
> > original profile propagation behavior that kernel AutoFDO was tested
> > with. Guard the flag with clang-min-version 210000 since it was
> > introduced in Clang 21 alongside the default change, whereas
> > CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> > used to probe for the flag because cc-option invokes Clang with -Werror
> > but without -fprofile-sample-use, causing Clang to fail the probe with
> > -Werror,-Wunused-command-line-argument.
> >
> > Although SampleProfileUseProfi currently defaults to false in the LLVM
> > backend and is only enabled by the Clang driver, explicitly pass
> > -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CL=
ANG
> > and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as we=
ll so
> > that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> > defaults change in the future. Unlike the Clang driver flag
> > -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> > -sample-profile-use-profi option was introduced in LLVM 14, which
> > predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no versio=
n
> > checks are needed for the Rust or linker flags.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> > Suggested-by: Rong Xu <xur@google.com>
> > Reviewed-by: Rong Xu <xur@google.com>
> > Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> > Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48=
ef25522aa17c2a71003 [1]
> > Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMA=
oWh-dqLHii3Nig@mail.gmail.com [2]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Maybe we can credit a few folks with reported by tags, to encourage to
> report issues upstream more in the future?
>
> Reported-by: Han Wang <nesthanwang@google.com>
> Reported-by: Yabin Cui <yabinc@google.com>
>
> > ---
> > v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b=
65fea2e1bafce6370@changeid
> >
> > Changes in v2:
> > - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAG=
S
> >   as well (Rong Xu, Nick Desaulniers)
> >
> >  scripts/Makefile.autofdo | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 57a3aba6ffc2..55fda66ad960 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -13,13 +13,16 @@ endif
> >  ifdef CLANG_AUTOFDO_PROFILE
> >    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -ffunction-sections
> >    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> > +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno=
-sample-profile-use-profi)
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_=
PROFILE) -Zfunction-sections=3Dy
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
> >  endif
> >
> >  ifdef CONFIG_LTO_CLANG_THIN
> >    ifdef CLANG_AUTOFDO_PROFILE
> >      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE=
)
> > +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
> >    endif
> >    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllv=
m=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
> >    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitti=
ng=3Dall,-plugin-opt=3D-split-machine-functions)
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
