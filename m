Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75072
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 16:04:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuDsZ-1mq4Fm0sGL-00uVZW for <llvm@lists.linux.dev>; Tue, 28 Sep 2021
 18:03:59 +0200
Received: by mail-wr1-f44.google.com with SMTP id i23so59021671wrb.2
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 09:03:59 -0700 (PDT)
X-Gm-Message-State: AOAM531jixDJvq97+/pLKZlZMYqn1EAB648hbkWwSgJB0t67cKfbp8+R
	JTKZvcGfylKjMB4f1MRqKs3ZPOGII1KKmDcW/oU=
X-Google-Smtp-Source: ABdhPJw+coVsYhAKlrQ8b/B+WK+KvNu4fWn5G6HVe+DPeBuINN0lX7+Ci9tC38wz5cxx9uuIJ0yoR8dy9/Ij5UWd+qg=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr994769wru.336.1632845038822;
 Tue, 28 Sep 2021 09:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210928154143.2106903-1-arnd@kernel.org> <20210928154143.2106903-2-arnd@kernel.org>
In-Reply-To: <20210928154143.2106903-2-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Sep 2021 18:03:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2mrVOXHzNKnLuHsdNCR3uVePE9W-Yn2CmW3nDpE8J7iA@mail.gmail.com>
Message-ID: <CAK8P3a2mrVOXHzNKnLuHsdNCR3uVePE9W-Yn2CmW3nDpE8J7iA@mail.gmail.com>
Subject: Re: [PATCH 01/14] ARM: RiscPC needs older gcc version
To: Russell King <linux@armlinux.org.uk>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+hGA8ruVKEMXKV3afokl2i8xAHGm3JyTCZn0K933htHdfstnLgl
 5h4N0pYHKOGFh8JoGUqn5jGHqvW09gYbVIoW7Xe4ATw6eZNqAh6xnza+ZBaARXrai4fjnn3
 F6nbnDpdutKkBBJAi8miq9AYd44irOvjQANNGisekwPIcc6tmbv+esHIVuSORuMhLllN5Xo
 gl83BalOUUue13B3+zy5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fpXearx9KVI=:dQJUV2kKTHier/MfEgQNgB
 G8kGy+zwYHCOgEznhR3MROZC1IaNxjDuPlQ5bQ166HsHH+AmqGdXEaMasqoiPBKeaUoytrGmE
 5iFPEBjWOR4uuCs6VrvgOJ30icfFbWezNg66eJmC8bfDE5pKZIX53DxRKUq5mBYV8U71AAb/1
 itELH3Fouvd4pmVLaDlz8UT5RiFPmwaygJoWu8IGXJKKFfIrWRJ/BWkZRi0NPA/hh8Aizhx/D
 mu+F2yDZE3MP3AdV0aecmmhIRNQ/rVuLfTPhV3aSWh84p5XdKXfZWqF8jPDBxchSzZRPvD4iv
 HWRzwGthNTtrPYVleOTQU4AeYgCmff5trW+bIapxaK2ErSHCYAq7LGIA5av/SwAQBnQCK2aS6
 Ki8gd4y0WRdxonH2okVCkCj2hXUFylQto7kS4IsycQveeXl/8UUdCsVnr+5mYXdWdZJZ4Zhgj
 A03Bq1zt2JYCT9UZH67wVZkY645PVH5g0RV87y38gpKHQK+pjVTmsQJYhN+OmixM2CG0Sgw0C
 +/ywq1GMdOr3crmIkKCdZMNUSzDx4avouL8VbxHuHzNOoPXGn8u4YI7wwIwVVsJ8hknPhwLxW
 hd9dUFKFXwt4O8I8vkLTbTx3bJQopZ8723A74mGcbIG7mVpiufjL1xw6woc2shQpMQVkIZyRE
 qbQNrFigLqa7HVz6Zcp0YfaezpTJQ7GcJdZSPnBrTLjdSKt6HfPOjyEACRyIcIlIjQA+72fJb
 d+FiZIC0qaOj3V53zPg1HVxE5H4xmodod2Gl6Q==

On Tue, Sep 28, 2021 at 5:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index fc196421b2ce..12a0bd4b315d 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -431,7 +431,7 @@ config ARCH_PXA
>
>  config ARCH_RPC
>         bool "RiscPC"
> -       depends on MMU

This line was a botched rebase, it obviously has to stay here.

      Arnd

> +       depends on !CC_IS_CLANG || GCC_VERSION < 90100
>         select ARCH_ACORN
>         select ARCH_MAY_HAVE_PC_FDC
>         select ARCH_SPARSEMEM_ENABLE
> --
> 2.29.2
>
