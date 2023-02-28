Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC29459
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 19:42:28 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id u20so6510247pfm.7
        for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677613348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1+1Obj0n84DVZopavvNSOG4SsRgdMGD6WVHa50zJHI=;
        b=TyCz/cmY+U/EUkQqnLksFu6c2Exip03sCm6cBbm6jE5hS77YAt+AsEHWR/XUSo0j6S
         6yt5aSjr2gt9gUuLMIx82ZWNHfd2WgRS8PQZvu/SbNybCcUJB4I/5R9QeOhZaz2JSK6f
         yBFhOiyyTXLaS6BZ/+ZelI1d722ZZjnUnNfo3o2E8L6ks4+xLaZQ8ARcW1xtoYUn2tX2
         UvDLlDRMvzSnLPH7oyL442XscNIGnCnsz48KYj/0ZsWIAGIKr3lnJ+WWw98SPBfpmhhR
         0l5/xlwDJuMo/cgTcX5QSijzkHuEyAx/ra+rCnPG5cc39PNNYCIsMCvvwMEZJv+1XvUp
         mptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677613348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1+1Obj0n84DVZopavvNSOG4SsRgdMGD6WVHa50zJHI=;
        b=uoD/6FBMtR4Kgvn/L5yaNTKMYKhUjvAnbXPqAtwsjXNibrousvQCnU3mAR/7rGFIL+
         ys71H8x+V4aA9ZgHpq6cGxFHKrC1LRLIh3soI9s4LOrpFoh7+HrivLl0rVfdSUgVq0c8
         0Qw0cVJzJeltKAUu5ksal5HGfoqKgMqq2aD2zyUS2hZk0zm8FJ5EL8Im3jFhS0mg7YLt
         WGVdpE/h/3ll/AljtzMafr7aBZKMQZTSmXL2wDzszJZVwSB1bmGsnS0LBzUVTWhpHL8x
         ZVBHQ2Ehi+Yfe+phzpp+/u0W2yDA3m/ZozQjgLPyDiNyZYliccQEXKQfGU4y+J1mrOHe
         4uig==
X-Gm-Message-State: AO0yUKVO1COTVCeNCirQhHhl1Bv32pVlQt8PpNpdZO/COipzEIFEMEtH
	jIbiKWbOIgD/s7wD8i739ecXgCljijObE9OM4kWwKQ==
X-Google-Smtp-Source: AK7set/VelgnWNTVSoSQ8B0CqE9bheG1PPFErdPpsNVtbPtXYLyL4kyCx5Ar7OZM++ldTyudw6+GINe9ZLR8bLbjc2c=
X-Received: by 2002:a05:6a00:3247:b0:593:dcf6:acc2 with SMTP id
 bn7-20020a056a00324700b00593dcf6acc2mr1496156pfb.1.1677613347408; Tue, 28 Feb
 2023 11:42:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 28 Feb 2023 11:42:15 -0800
Message-ID: <CAKwvOdkxA0kgH3rafvZtQCuKq88ee8ur=BfEPaQvK6GmwV77kg@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: Workaround clang inline compat branch issue
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, tsbogend@alpha.franken.de, nathan@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 11:35=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
>
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
>
> Fix boot on boston board.
>
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> v2: Add Link tag to LLVM bug
> v3: Docuement issue link in Kconfig as well
> ---
>  arch/mips/Kconfig           | 4 ++++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 37072e15b263..c8b878aa690f 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3206,6 +3206,10 @@ config CC_HAS_MNO_BRANCH_LIKELY
>         def_bool y
>         depends on $(cc-option,-mno-branch-likely)
>
> +# https://github.com/llvm/llvm-project/issues/61045
> +config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> +       def_bool y if CC_IS_CLANG
> +
>  menu "Power management options"
>
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 336ac9b65235..2e99450f4228 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -336,7 +336,7 @@ symbol              =3D       value
>   */
>  #ifdef CONFIG_WAR_R10000_LLSC
>  # define SC_BEQZ       beqzl
> -#elif MIPS_ISA_REV >=3D 6
> +#elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_RE=
V >=3D 6
>  # define SC_BEQZ       beqzc
>  #else
>  # define SC_BEQZ       beqz
> --
> 2.37.1 (Apple Git-137.1)
>
>


--=20
Thanks,
~Nick Desaulniers
