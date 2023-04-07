Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA674AFE7
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 22:08:48 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id s72so9232650pgs.9
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680905328; x=1683497328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE4clA/zmV0PUkJY1uud0kW2EphNtzmleAM6SAJljW4=;
        b=qAUsNHCEu28j/dILzeewcnEV6PUDezqN0jUDJ5qV2DDBHEJUuGjM/3L8E/oT92ECWj
         3sxqxpdx/ZSEb+l/NeAlPIv96VGVl7j97AHbvTrCMm6rSCHySnZ/g2Xz22ufxYRAVkfC
         VB8el/5eBRtu6Vto5oTAowqbOsCFjehTMzB0fK26vwzXSL0yLUhawxA+FQR3pptF45G7
         m6bXM7VPpttk02tDfIXdeEuiQqpOyW5OskmFf82kK9+bTz1G/6uhlo9guPrTvUeXE3Os
         JrbkdZIxYPZICo8n0X8MNqZxTRP0DyPLwNC5ZsinKWNXC66pjWZHuH6LEDR1d8fsblfb
         QuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680905328; x=1683497328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE4clA/zmV0PUkJY1uud0kW2EphNtzmleAM6SAJljW4=;
        b=wMU5W8e/5V22nvASJDo7vVagTpS9w0lbiIMzpHiiHUk+mQeSU1gkJQQxpsgVSL0ee/
         8kafJntJfIOMmQ975H8+X+CUd5JP58IdVxP40mjUgSvAhMewzySupXJFjdYrduMsk2VW
         4bqrYdAu3fmATm9j+pPj8pibYG1a0vFJfdabYz2IHFS0j6btgTWjRKspe4FmLAzld+/u
         Y3cMwIfHXL/q4zKcQ3CRsMQw9TxZX12ZaLIhhZtCuNREJl/Evdya8qFVg/LZwdMrq71y
         Lkl8QX7A61n58+HbnwSJ/eNMV24sDakBzk7bk8O6IWZmCpWa0jZ2iYk/juy6fcznx+MV
         hbPg==
X-Gm-Message-State: AAQBX9cWheGvWX63T9TQXpelO8/fgK9P63Vs7dV+dUaskpLvjtcnOep5
	3Lvl1DvifR+0aR4rTWafG9BaPCIEi/+PfCL1zchKdA==
X-Google-Smtp-Source: AKy350bUwV4nQde1SHpDwEawOdZshaDpbWH/FsosJiLS0PxYCG8vREbMha3/14KmCK92FrF2sFkoTRvK6aDXSxphbqs=
X-Received: by 2002:a65:5b43:0:b0:50f:5f89:2a9d with SMTP id
 y3-20020a655b43000000b0050f5f892a9dmr825531pgr.1.1680905327840; Fri, 07 Apr
 2023 15:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com> <20230407102721.14814-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20230407102721.14814-3-jiaxun.yang@flygoat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 15:08:36 -0700
Message-ID: <CAKwvOdn3DC=6nCW2Fj9A2RcEa-AHTYNveBzvLTxp7yh7N=AxgQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] MIPS: Add toolchain feature dependency for microMIPS smartMIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	tsbogend@alpha.franken.de, nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> microMIPS smartMIPS kernel can only be compiled if they are supported
> by toolchain.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index c52401c155a4..9e9de2b62f28 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2360,7 +2360,7 @@ config CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS
>           Select this if you want neither microMIPS nor SmartMIPS support
>
>  config CPU_HAS_SMARTMIPS
> -       depends on SYS_SUPPORTS_SMARTMIPS
> +       depends on SYS_SUPPORTS_SMARTMIPS && CC_HAS_SMARTMIPS
>         bool "SmartMIPS"
>         help
>           SmartMIPS is a extension of the MIPS32 architecture aimed at
> @@ -2372,7 +2372,7 @@ config CPU_HAS_SMARTMIPS
>           here.
>
>  config CPU_MICROMIPS
> -       depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
> +       depends on 32BIT && SYS_SUPPORTS_MICROMIPS && CC_HAS_MICROMIPS &&=
 !CPU_MIPSR6

^ greater than 80 chars (85 in total). Consider creating two "depends on" l=
ines.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>         bool "microMIPS"
>         help
>           When this option is enabled the kernel will be built using the
> --
> 2.39.2 (Apple Git-143)
>


--=20
Thanks,
~Nick Desaulniers
