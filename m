Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B55337F
	for <llvm@lists.linux.dev>; Wed, 11 Sep 2024 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726088899; cv=none; b=MDgWHpPjC/yYcDsXN30CL9jL/OGESCiaLDyKHdermmHuAYMDpVMm3jlbUqEBrjT6CGvFbPhNNKSY1adRAreKwgaSS4g7aQvr7gk1O2UO31JjzaHgVRKaLUuM0/ylyQNprL2B5ZxSP5q65Fy+pe+6CPjjYIlYZcRATlLgHYR5rcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726088899; c=relaxed/simple;
	bh=8YzKnIPK6QOgVCe6EcsGGisdrK4u2VhErOce/JaY5Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWK7btQ77a61KzK/lv/R0aMQyNmujus5a/VvU7FvlEPCEDuRX5pGyYgXWmsLAFIrwtmCAVB66QeM8Kc628kUpRFqZjdV+XP/gGDRNHGC6/LfXwaBBwCLbcAKrVbPsx2CxEbyC9A2Rr8Ln+8lH/AxqxJ+bLsvl25qWf/WiaOf55Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg7aMl36; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg7aMl36"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d88edf1340so176240a91.1
        for <llvm@lists.linux.dev>; Wed, 11 Sep 2024 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726088897; x=1726693697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGFR71RW6ZEzotKUOgWaG2Cc/4HnhyZYAtkaXk64Pbs=;
        b=Mg7aMl36Pru5fB4D/NBm8yxQy03VJdzaEq6bQ9JSMdPOtjeKMINdDVvFcp7Cxb6C9Q
         HIBr8cjvBvoAKlkJFlGIks2he243XKfozUa2RIuamncGpU4wmHJdyVkia9qb4XYjYKMe
         693XwQVJ99fYr5h3Hh0fYtOXlOX8b9oxDhdniT7x0t+gLy6h0QKEfiYM6oF/9wJ5gDSH
         frLU1qBVNDLRgYys4lpHJx1NEBp8CBGVmPnzwWLJS0uRCehm/kJvl5M9Cxp4rIuMe4FK
         7vE8kn2WBGbq9iWHuw91TzEHz/dHaBLFmRu6Jbk2JIkXMF6iqgiORbgPkmBF8bgsnBCr
         liKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726088897; x=1726693697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGFR71RW6ZEzotKUOgWaG2Cc/4HnhyZYAtkaXk64Pbs=;
        b=L/AFA2MBnFo/uuJoLzkhJDJzAyrg+vdy7gBm9efFElnDSuWD/W2vXJkxdSfxYXjyh1
         vryA72NLX1B/Fpg3iESlN0Qc6XF+qI97Ftde9Fyd0BCBrh+WrH3VkopVoFAs5kjPE8da
         QrYAlrbE8WPTnRWkwgU1D730okrp8jb7NRy9u8fBYsKLb6Fv5qfvWJaIGdpHOR2VNUM1
         /95qPKpxxHA3DvteSJzkhd/DzZD/GxyOidqkgZA5GeZzFSApY+FjzNDLdafu+n1jvF55
         CK8Ek3GbGjL4uZGlI4Z1RBuEU2M3sUDoLNxO/YlwcbdY7M+Nj+A0Rn9xoiFzGpj+aqSj
         Nn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEiUOGaJ5eQsXJCrbTUEx0lpik4j304hOmZtBYkXiQpHvoq2L3C15x3dAl//idIb2dMtAd@lists.linux.dev
X-Gm-Message-State: AOJu0YyNmGRehESUw4/9kLxFUfYzMwatorxUAkUkWj9G/2SLM/2IeuJQ
	kluGg3tSnGyKrUe/Ng/8TOCx3kPK7lMy7mTEz2zRi8KIFTos/aahHD6Smfn/6ZttAec6ABCJrgX
	Ae0yGM5s+WACOy8x3OltTPL7FMYM=
X-Google-Smtp-Source: AGHT+IHnqafspbH4Q8lQh3k2OjnAE3WY2+DXLqTUo1EWoBZIL6eo11ZY1l+fgdQLm8Hal5U0+TBaV3HszitSTOCPLN0=
X-Received: by 2002:a17:90b:4c41:b0:2d8:e5a3:f6a5 with SMTP id
 98e67ed59e1d1-2db9ffbf9ffmr577756a91.13.1726088896956; Wed, 11 Sep 2024
 14:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911110401.598586-1-masahiroy@kernel.org> <20240911110401.598586-3-masahiroy@kernel.org>
In-Reply-To: <20240911110401.598586-3-masahiroy@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 11 Sep 2024 14:08:04 -0700
Message-ID: <CAEf4BzZ6kT6saDPO52P9p_MAR2XXRrrDX5r7xqDoLy3+y9rquQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] btf: require pahole 1.21+ for DEBUG_INFO_BTF with
 default DWARF version
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 4:04=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> As described in commit 42d9b379e3e1 ("lib/Kconfig.debug: Allow BTF +
> DWARF5 with pahole 1.21+"), the combination of CONFIG_DEBUG_INFO_BTF
> and CONFIG_DEBUG_INFO_DWARF5 requires pahole 1.21+.
>
> GCC 11+ and Clang 14+ default to DWARF 5 when the -g flag is passed.
> For the same reason, the combination of CONFIG_DEBUG_INFO_BTF and
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is also likely to require
> pahole 1.21+. (At least, it is uncertain whether the requirement is
> pahole 1.16+ or 1.21+.)
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Make sense

Acked-by: Andrii Nakryiko <andrii@kernel.org>

>  lib/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index eff408a88dfd..011a7abc68a8 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -380,7 +380,7 @@ config DEBUG_INFO_BTF
>         depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
>         depends on BPF_SYSCALL
>         depends on PAHOLE_VERSION >=3D 116
> -       depends on !DEBUG_INFO_DWARF5 || PAHOLE_VERSION >=3D 121
> +       depends on DEBUG_INFO_DWARF4 || PAHOLE_VERSION >=3D 121
>         # pahole uses elfutils, which does not have support for Hexagon r=
elocations
>         depends on !HEXAGON
>         help
> --
> 2.43.0
>
