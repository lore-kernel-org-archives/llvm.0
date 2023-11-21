Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AF17D9
	for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 00:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA7/MH64"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1f5da5df68eso1449348fac.2
        for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 16:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700527901; x=1701132701; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn9aLSeosG7l0BmT5llM/BGYPNtLICtF9m0AjdHG0XM=;
        b=NA7/MH64KxyMGRHUVvaA//rkM73XQ54kV3yx+PoqHMBm1RPKRN11/S/NZzu1lcrRWq
         MT8Bb7OsXZ5BLVQE8St8aBoEzfvHUKZVMgux21NFXzAGvmAS+FxeoUXuKIt21DTOdjPJ
         PKE0LlKpeeIUXK054DkRkd8U5Qbt91J8yuxlb9Gf9VZBLHpB0KJkK2hwtAMmr3Qk3VqD
         Jge6UrCrCfHi4D7Nmivok0OHsVhqeOsizqS1LXL+fM9Fbm5KB5nvQxADNGVLAhZRHMnp
         xa3wbgyA3+rVqQUOl7wPyX3drWWSlXlasw31CBCV7T0aye8etehVqvJluzL0xILfKK+k
         vJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700527901; x=1701132701;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pn9aLSeosG7l0BmT5llM/BGYPNtLICtF9m0AjdHG0XM=;
        b=LL/ZXxpAxxdJqdfaGSFR8kcNfZiZQ+DMHKqSUpLG0qgUYHNtZbFKsH0UU3FZw+5H/K
         sPVP3wnFtkaDvYrAnk+AXY9/x3oeMAaWXzrxEPic2oAL/KD5P+PxnmRrZWOmdKbqmrBc
         MQSFIXnmzlhMSiq7wyI+a1iAUTYXykEsCzmjSSzkYn3wggSmaKpSIpvh4VN28L8cK3gs
         SIw2pEsOle1lhyCzWQEiUyADIU42/Y7RLCEsOt1c0jn8+yY5HJn1onzTBP84uosf0rsj
         xBb9jh9IlVGB2+C3U8QAtPTntR+Z3HrlP3qnspAOIdd4+iFiwTnaaYdJBKKjfT3GkNuW
         qQxA==
X-Gm-Message-State: AOJu0YwYlyZS/Tn2YUiO5zAVx98kT6+vWRcMz08EFPCG+lbqoq4giJKD
	uyfFr+SqCG5WIL3SQnTvgkA=
X-Google-Smtp-Source: AGHT+IE+o49kLzCuw1FPClPjXT6ATg3hfgvXAS5obzWWtUpkGeQbWTToBNlZGXTLMvhqz0mk9VwJFQ==
X-Received: by 2002:a05:6871:a60a:b0:1f5:b60d:68ff with SMTP id we10-20020a056871a60a00b001f5b60d68ffmr10197694oab.14.1700527901134;
        Mon, 20 Nov 2023 16:51:41 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id n28-20020a056a000d5c00b006cbb80e4577sm723318pfv.210.2023.11.20.16.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 16:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 10:51:34 +1000
Message-Id: <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Masahiro Yamada" <masahiroy@kernel.org>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
X-Mailer: aerc 0.15.2
References: <20231120232332.4100288-1-masahiroy@kernel.org>
In-Reply-To: <20231120232332.4100288-1-masahiroy@kernel.org>

On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> crtsavres.o is linked to modules. However, as explained in commit
> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> and always-y"), 'make modules' does not build extra-y.
>
> For example, the following command fails:
>
>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3_def=
config modules
>     [snip]
>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file o=
r directory
>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell=
/spufs/spufs.ko] Error 1
>   make[2]: *** [Makefile:1844: modules] Error 2
>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __bui=
ld_one_by_one] Error 2
>   make: *** [Makefile:234: __sub-make] Error 2
>

Thanks. Is this the correct Fixes tag?

Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")

Hmm, looks like LLD might just do this now automatically for us
too without --save-restore-funcs (https://reviews.llvm.org/D79977).
But we probably still need it for older versions, so we still need
your patch.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/lib/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 51ad0397c17a..6eac63e79a89 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -45,7 +45,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+=3D error-injec=
t.o
>  # so it is only needed for modules, and only for older linkers which
>  # do not support --save-restore-funcs
>  ifndef CONFIG_LD_IS_BFD
> -extra-$(CONFIG_PPC64)	+=3D crtsavres.o
> +always-$(CONFIG_PPC64)	+=3D crtsavres.o
>  endif
> =20
>  obj-$(CONFIG_PPC_BOOK3S_64) +=3D copyuser_power7.o copypage_power7.o \

