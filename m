Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CD3AB27F
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790630; cv=pass; b=lCdGbq5d4WsQRoH85LxwLpv64o5ve/FrJWprd6hVBVUFBeBsig19vcX/Fq9VcbyiA28UqBNXD7Yqm9QWa9cr9iUMHz5O0snC4Fzs7jAOZtPogPhARM9ue5n1EnG/zzWsBZbC52fZbUgsYjrwJYqsLRCDRAxMTF5+VQp+aj6K128=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790630; c=relaxed/simple;
	bh=WPvWk5jQOFsRIWCA6Ydfa4nFq0ilXTV7ToIHXjwOqHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIsVRxq6QPrjLr/n7chB95zn26Amo0+7fKNV3mr6JO4Zaw4SLPmGeQ0w9woqTDhURgBnRuRDGMmv4fiP5yaQJvhaHksYx9Z+pkg06+aihhVOexLQPUGtZ9Z5Tip30pyt60J0Fi7Ste9wckMP4y4PVF4UAUmFvw2M9WoiDLM4i6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMFzacgk; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMFzacgk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso4581217a12.1
        for <llvm@lists.linux.dev>; Mon, 03 Aug 2026 13:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785790627; cv=none;
        d=google.com; s=arc-20260327;
        b=bspkg+4exK1Hlmk6QFF8yZm8cr9MBfFzD177hw4zbfmDZAHlbQyfB5TEYmVHAaJET8
         Or/m4D1R+C07wStSHyov7Ok8kWprf7cn47Fk4wu0V16kxxgKfZ8pM/Uwzc8Lc0W2XFGs
         ogvB5o976+dqFAF923IWfYcmUdSbcxRGrBREZ6EeLabKZkRCtOWktGLumABBAwNOooLj
         pL4SwjSXRKjZgxQhrqjzBEae3GqXf4WONVwLNa/viHU2XSbdunlbuJgn+5eyiRfQYKxc
         VH11uX8Ru5zdw1tDeCUssvarGInpP/KF34fJ0dveBRTl4cpat1bnMIozgx1dAvVfEHOY
         rk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        fh=mUpqBkrMpAN/8nfO9smmzB+0jhG9Amzl8MhQcZygeEs=;
        b=TmlXGQrxpEzRmDqjBhFykiBFDLbWdDzyZjDB34atl7ZGfz6p+tVihmrx8GS5u1sKeB
         YaKNEOsZHc89oIZY18DfotS/oeRQZNdvO3AtGRSMyR9UVi5Jpmbb3z5n26pBJwPO2qI8
         jAwEz+DqwUy8vjLURxRgf0dW2XzLAwdYyUsLD8dgsWP+OmapWVoMzM7Ge48pxIkGLM4O
         dGI6WK4qFfWkcEVsb4EdZ3p4IRkcgWbzwFKbAEHLoYj6+Hi/LPavS6hAdgKzE9L501/9
         /XJrnanK6zqApsMxOUOYg5xHnfyyrIjZdXwjwVF6QfCOEnkMf9tBhUjCK6nS0wDM9zrl
         1qog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790627; x=1786395427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        b=sMFzacgkT6A4QE2LSp7bFgXIdS3ktAPObQ4ib2iJMG6e3ylBcBNVVAHHDZqRA2jmuL
         IAbhEb28LQaEREP0aQDywIBirUMFi3SjcRf/2W6zfmzXrRNtCiqmDIuF3KqzQ5fO6A4J
         NgBPhN65SwkrJZXlibVgOLbipkxMzSRdlAAB2YH5xrl51Jv3Y+mzy3jMIGPSpwOp+lxM
         WgKHVKZaY384AYVQcincj/zaj0iTH331FYj6S5byAAtbhR0KpJBZbDYhCD99s+HgiZyd
         13xuVyRHv9c0xziWdSYE438qM26hTHK4V3J+HAgiG93AO2Jto4pcJpq4PuZF//owzalr
         9/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790627; x=1786395427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        b=B5n6LXnrr8ReHUda5Z3L86E9sZvUyU5H5kEXYh9BI5c6SJ10+SnlZEFqTC+JDD8lX+
         ou1AWi9CBv7pBD5Kza/y8WcY27zuSj+6C9vdSeGGfq4quKHkVzE15H/UGKBZPVVE1Ylc
         0E5haKHr5NretF/FH7x7maxEkavcBGqZvAAUiyyHpBbbAKcP8jogM3jOeS1v/JqpUl17
         qhQ8YCzHABbBBSLdTNzZTMzzf28HJlQB1CvLo4vPqBYkHxUdM1LuhR3Q8XvDSUzqWle/
         M1hFFM0tchqIxbd/RWjJe37lMwFj7msClPWdc2Zv9yt74U2VjfNsJhWG27XXF2bx4p0G
         //fw==
X-Forwarded-Encrypted: i=1; AHgh+RowjP5StNuhtA09ysggagBEQCLx8mRpunRm1M3SAZQ12dAc4zUBpYxKo0L9WfKU7V46CynM@lists.linux.dev
X-Gm-Message-State: AOJu0YyclHKU2Tqazzj5u+0Kgyw6me5wZoqmmxtCc5eq11QDlAaD11vX
	AKyV3XPTRhszn/Hjafig5aRlxkJxMePu9v/eStF9wPEjZ3buLqQEVXaOiFUDiicLKzEZwHzrdkc
	C8ivm8DesQfnHZRGcxYpA3cqRgfzLwHs=
X-Gm-Gg: AR+sD125v4y+amgeAi654SmO7eedqwGOcGXKtGyc/eLhWRRYimzkXu+dyqu4UxwvKkV
	5Q5nzx18kkUpaqhzTA7My+NZ4BqeBjP6QCjrU8YTVrotWp6qSH7WFz4xQN/d1N2ZrMHTf96TZcg
	HztsgdplWBW1n457Dci5yB8n535m64cNGVvRCjgCy6mOc3pYNzfiik6GrfgsqyJhABo+1Jnj/r2
	/sGIKbjVTmttB/YmqUszzyvJjIGBCV5F0v6Q5mroTOqTilXC6e6OybQ6iYO+dWtKgVIdF9T1Wun
	cNY2Dt87+iN4pGQR0mJ2VkyC1MbSac0lZz+X738KBkVwKLMvNj3GfT+WF5jKuq5hWVD1nP7UM10
	vk3k9FKEjEiWtCpvlFDZwqICe8/IW3vs=
X-Received: by 2002:a05:6402:538e:b0:698:6620:d988 with SMTP id
 4fb4d7f45d1cf-6a0a7ca9786mr9097514a12.15.1785790626968; Mon, 03 Aug 2026
 13:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 3 Aug 2026 22:56:54 +0200
X-Gm-Features: AUfX_mzrOfpDet5WZmR5E0-xCU3tYZzg7dOpIC85BfviGV_cxmbzrWshM8wU5MY
Message-ID: <CA+=Fv5SBitGj+c08Ymy3_JdeErKrRS_s5_RYgABjMraQUFg=Ww@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:08=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Register the clang target triple for alpha, and pass -Wa,-mev6 only when
> building with gcc.  That flag exists to stop gas emulating instructions
> the assembler thinks the target lacks; it is a gas-only option, and
> clang's integrated assembler does not emulate instructions in the first
> place, so nothing is needed there.
>
> With this, LLVM=3D1 (and LLVM_IAS=3D1) builds work.  Note that the alpha
> backend is not in upstream LLVM yet; it lives in
>
>   https://github.com/alphalinux-org/llvm-project
>
> and is a work in progress.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Makefile    | 8 +++++++-
>  scripts/Makefile.clang | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..54283705911f 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)    :=3D -mcpu=3Dev56=
 -mtune=3Dev6
>  cflags-y                               +=3D $(cpuflags-y)
>
>
> +KBUILD_CFLAGS +=3D $(cflags-y)
> +
>  # For TSUNAMI, we must have the assembler not emulate our instructions.
>  # The same is true for IRONGATE, POLARIS, PYXIS.
>  # BWX is most important, but we don't really want any emulation ever.
> -KBUILD_CFLAGS +=3D $(cflags-y) -Wa,-mev6
> +# Only gas emulates instructions the target does not implement, and only=
 gas
> +# understands -mev6; clang's integrated assembler never emulates.
> +ifdef CONFIG_CC_IS_GCC
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>

Hi Matt,

I agree with Nathan's suggestion to leave the
CLANG_TARGET_FLAGS_alpha entry out for now and add it separately when
the Alpha backend is being upstreamed to LLVM.

Could you send a v2 containing just the arch/alpha/Makefile change?

Since -Wa,-mev6 is an assembler-specific option, I think maybe the conditio=
n
should also test the assembler rather than the compiler?

ifdef CONFIG_AS_IS_GNU
KBUILD_CFLAGS +=3D -Wa,-mev6
endif

That preserves the option for both GCC and clang builds using GNU as,
including clang with LLVM_IAS=3D0, while omitting it for LLVM's integrated
assembler.

The revised Alpha Makefile patch can then go through the Alpha tree,
while the scripts/Makefile.clang change can wait until the backend is
available upstream.

Thanks,
Magnus
