Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ACA366
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 12:45:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmUDf-1oLBLp0NcH-00iS1t for <llvm@lists.linux.dev>; Fri, 08 Apr 2022
 14:45:32 +0200
Received: by mail-wm1-f47.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso7533388wma.0
        for <llvm@lists.linux.dev>; Fri, 08 Apr 2022 05:45:32 -0700 (PDT)
X-Gm-Message-State: AOAM533FA9h4VO2f4UeKA6F7BxE8okSabxsOBpnw5F/Hz6W6bO2f3Vam
	fVjwwghjtIDGlwHy+mQ/yao12IAJZwkgs6nbcsc=
X-Google-Smtp-Source: ABdhPJxps0BbqmqQapLlX3jbuXr3VTji/74gKNC23l150Hopu0GL33hA46x2VnYvSJ01+W8ylqjUTYUcGdzoO1ES9lI=
X-Received: by 2002:a05:600c:4ecc:b0:38e:354d:909 with SMTP id
 g12-20020a05600c4ecc00b0038e354d0909mr17232206wmq.33.1649421931666; Fri, 08
 Apr 2022 05:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202204081729.f4cgbHob-lkp@intel.com>
In-Reply-To: <202204081729.f4cgbHob-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Apr 2022 14:45:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EDu20VNze0r4F6VQ6uxqCYQGo-Dcta6THFqPuyJ81uw@mail.gmail.com>
Message-ID: <CAK8P3a2EDu20VNze0r4F6VQ6uxqCYQGo-Dcta6THFqPuyJ81uw@mail.gmail.com>
Subject: Re: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: implicit
 declaration of function 'LOCHNAGAR1_' is invalid in C99
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Shi <alexs@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XHiiz23qKIUziOAa2dtOXlOguKqayqb1gEN6ZUUR3754gy0C7ob
 0eQ3FXDyVAjn5dD/Unh1Tjil8z7rJ2Ex4ruoJf84B/PeNMY+qP0ufauogR+aBGNd/tlHJ2S
 6f7b92wwElNPRynTWk+xMxVAJYF4wysJVtROk9FLncsaxwLC48OES4SRQqYhbILl3bwVyrD
 Vd9lqCiDcZJ2f+WbXu4qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/gdxg0sFovw=:awVoiT3fFLpN3gt9gyVu88
 DRsEdiZ0aYsA8v81YztS1QDYweguZroD7x/of4/hKOJ9L1+wpfrLlkAZUK21VjnU7n2rBV8Gg
 3MPIZYmMdq0hCzm2uT1mFVyOschErUcNn/LbjuYwwseYvAMBwC9CtID/HqjqSwwdd8sj5Ksnx
 3H/Nxf5ZvSl4kIMh/mTaBM5eQzsk8qJDO/w7WFMPy0/csVZrzBbdsOVmzs07z6TYgll4lmRM7
 5sSAlJC8uh5xsdjVSRwGWhKVELerxD86hIGhWCLi6gCnrTwpa7kBv1MiYAzmPPOFqS4rN6JwW
 yDddre/7gkkRXcmjVgo1vxs341mlxeMBd1ekqkpWPlQ60GNO296qTi01v5hfO3KU8aFqkFdQS
 INYtMdrhsYnehG/Y7G7SYEdh3hYtzmCPkG8Krd8X93+FsabQHdch0W8LyWk/RjNPyfsnXV6xS
 2Ah+ODN6ZhtzPk2tiOdsNxONxZ8YLv2xdeZz5T28fln1btmnAWXiZ98HwIQx3/0Fq7bhrUkyv
 Dd60JxNtp+uJYtYJBAu8bU1aiB8TOEGQ3w7f8AQbNq+i0kg2RmddXG1BSt75C/EuxzJOXTb20
 Q3AuDiu4WUwp7axNZ3jIhoEU7WcuRg83jLgFe28Q2JpPwyauG9pQcZ7yUfA3mMa/pocIT8DHX
 4XyinE9H19Wfqg4IAR6h/CIM/VV1bAffg4m5/VCR1odN0zp6qrmP5eZ3sEnbQwXWaXj0=

On Fri, Apr 8, 2022 at 12:02 PM kernel test robot <lkp@intel.com> wrote:
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: pasting formed 'LOCHNAGAR1_(', an invalid preprocessing token
>    LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
>    ^
>    drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:2: note: expanded from macro 'LN1_PIN_GPIO'
>            LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
>            ^
>    drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:63: note: expanded from macro 'LN_PIN_GPIO'
>            .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
>                                                                         ^
> >> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: implicit declaration of function 'LOCHNAGAR1_' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

I have checked this one, and it looks like this is not a regression.
lkp flags it because the error
message changed: with --std=gnu89, the output was

rivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: implicit
declaration of function 'LOCHNAGAR1_' is invalid in C99
[-Werror,-Wimplicit-function-declaration]

The problem is unrelated to my patch, apparently the global macro named 'RES'
on this platform gets in the way, and removing it fixes the build:

--- a/arch/mips/include/asm/mach-rc32434/rb.h
+++ b/arch/mips/include/asm/mach-rc32434/rb.h
@@ -10,7 +10,6 @@
 #define REGBASE                0x18000000
 #define IDT434_REG_BASE ((volatile void *) KSEG1ADDR(REGBASE))
 #define UART0BASE      0x58000
-#define RST            (1 << 15)
 #define DEV0BASE       0x010000
 #define DEV0MASK       0x010004
 #define DEV0C          0x010008

        Arnd
