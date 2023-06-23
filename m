Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79521AD2A
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 16:52:40 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6346da05fb8so446306d6.1
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687539159; x=1690131159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvDD70EfgKKb2T0PMEOiIeKl/5XEghNuRS0dwmrmHco=;
        b=Qy05BsLfj+WBYkdgrGWb9VBYQ5m+HxVaLFz5WcI7qfgagHahWVymgtmku3jMvC371S
         G53c+YlybCdhISIN+SdNRPQbH++Jov39YcYFhTAYyiO1JO4+PMeGo6ldpnmLjTfGo5VC
         ToBbbeP/7GUeZMPSGH3nQ9OsOGnB+PMZCYuKaCJ6RyT3qCHAEu17/cWtJq5rlYxc8n0Z
         yXRg8OMaHKL6QaD4oHE67UIKbkdhqcrDvFNVYmZvNvKHbw/hVVltyGJsWGRYH21eCUrU
         O+93tGccodGvME6XhBZkgoTOeyWL0zBu+JklecNtMzlx1MHYRq19+yLFmCxknN/bYHCw
         FgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687539159; x=1690131159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvDD70EfgKKb2T0PMEOiIeKl/5XEghNuRS0dwmrmHco=;
        b=BBBjpfL7kxIrI9ryTyv2oTB/5kjVMjFc9cfFbi+NCqyurVBJWB9aABXQIklse8B3fR
         hHVSolerDm2QEC4rUMXPLfdAE6fQACAaeaM4TbS6bKtUzkXGYy5R6lv2TAJlZDq1TA9A
         JrPVyKAasiAdHFj8WvIZrFicOLXm5qpW32+tNO1A1He01VI0r/VY2bKM6Fuj9gbYtuWH
         Rqo6LwAV7SA1grrCDk/drcfEo+bjEfQc/miX/AVu8UZ3iXt1fswMrnsVD+gtFeL/s/0G
         gmR/CjORCHoQMU3z+FX/3DzfxjDq5yvTI9qOy3OCw2j2t7Xs3xX6oJYgM5RYzTQt5LuI
         tG0g==
X-Gm-Message-State: AC+VfDx29ZQ6pZB13ScfxrE9I4zzvLbbqsmlfdWgk/6qgDrfGpLTRxJR
	jYFgKPlgygPiF3ErkGLUtDMelY1dX6xAEQbIZ2pOTg==
X-Google-Smtp-Source: ACHHUZ6s9WIYCreCT4T/wFXItf/JVraCr7eKtgc0c1aKOM7YNwMs2IdQ9w5aaTr8eYo53MeSlCH4fj5aI4/NFDzrSS0=
X-Received: by 2002:a05:6214:23ca:b0:625:83ab:8a42 with SMTP id
 hr10-20020a05621423ca00b0062583ab8a42mr24076302qvb.46.1687539159150; Fri, 23
 Jun 2023 09:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230623134351.1898379-1-kernel@xen0n.name> <20230623134351.1898379-10-kernel@xen0n.name>
In-Reply-To: <20230623134351.1898379-10-kernel@xen0n.name>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 09:52:28 -0700
Message-ID: <CAKwvOdmJmdB3sCviTFyjdN8DWe_C0ncspEhJsXs8dzY+OdA8HQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] LoongArch: Mark Clang LTO as working
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Rui <wangrui@loongson.cn>, 
	Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 6:44=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Confirmed working with QEMU system emulation.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Untested though.

> ---
>  arch/loongarch/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index c8e4f8b03c55..7c5d562b2623 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -51,6 +51,8 @@ config LOONGARCH
>         select ARCH_SUPPORTS_ACPI
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_HUGETLBFS
> +       select ARCH_SUPPORTS_LTO_CLANG
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_SUPPORTS_NUMA_BALANCING
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF
> --
> 2.40.0
>
>


--=20
Thanks,
~Nick Desaulniers
