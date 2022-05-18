Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020046A1
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 22:38:32 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id a23so4169095ljd.9
        for <llvm@lists.linux.dev>; Wed, 18 May 2022 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gdFSEosSAzTBXsu35THTpPMw3mGz0j3zFfiuE2MhAY=;
        b=DBCDYEj9O79QGw1FqBTNKBN+UG/9b8MI+aWVV/QwexN4gbJ2Amb3SPW+GCbUY5i3+N
         SgYOwJHat25fpLjb6YVNE2HgjKIRAfAC09GzTJhO8vnLvQa+7yhkGDObb4amXFRV1Kyw
         +Cw+laGn/BdFpRqa7l8fZp9kbEtzow+apOaSmIEp4/S+6l/SK6aCTFPHQwQDhWe9mY8D
         Md2X1lcXvFI6DY3j8QVa0t7FPC9yHcAdGEwIxC/cjgZaMcT4mRr41hc6BU9r2FO8zojX
         nsum4g2gea72U9JYJVhZdK/3nJIIKkAH8NO3jVj8DR+RTBDjtSlKAdY0KKnyeWNDnBaA
         NVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gdFSEosSAzTBXsu35THTpPMw3mGz0j3zFfiuE2MhAY=;
        b=0DNVJWk7LOx9EFGDYm22vLJkMwqPDTsVXV1ezYWSjoOODvYftkn0fKiCAejrbQhxXv
         sldLWgWZwrIXxuYGJ39l5u0n49vEp/UcpybCFl2s4SGTO4RfMWPD07WRtn0rzHATkwTe
         fJohWmOYm6YWKFiFWhStHDX+jCd1RKZ+EkBYeIVcDO+zHRyhLQLesngPf5bfa7TtlhJ9
         w3U5oeGlC8L3Ak5HShzYr3Hr7ZRLlbeJdid1P9dqOFN1vJgvQdVzBIOmCmyt/gvrBUGt
         4n5WHL8RBL+B3ArLfObU/z4OWu6x/zl8DSvaXWIxHn+j7gCQSEOsGRRZsVk4b8KZxvx1
         Dbhg==
X-Gm-Message-State: AOAM531ccBrXf3yeD5L6L2nfYsyLhsJ5TvBAjwD6D/AkR9bHcRGLdpHn
	7JtYjlk6BKaHOy3cRmh5LHCzg9EO+MnztfckvPF4Vw==
X-Google-Smtp-Source: ABdhPJxIvkMHr6Wdqc9RtIs7R9Iciobl7SAFqpROG3q5kajc4MrpS/iRKSLKPONXjr32ZMmvkbRxQg1q/DnFVMkdTfY=
X-Received: by 2002:a2e:a7c8:0:b0:24f:700a:4df5 with SMTP id
 x8-20020a2ea7c8000000b0024f700a4df5mr916472ljp.472.1652913510399; Wed, 18 May
 2022 15:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220516210954.1660716-5-ndesaulniers@google.com> <202205180917.RNpZaxIl-lkp@intel.com>
In-Reply-To: <202205180917.RNpZaxIl-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 May 2022 15:38:18 -0700
Message-ID: <CAKwvOdmkd2PxvMUZA=A-72eATGDZkqDj--Bv1W+Xt_K_LWdROA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: pass -march= only to compiler
To: David Spickett <david.spickett@linaro.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lore thread, for context:
https://lore.kernel.org/llvm/20220516210954.1660716-1-ndesaulniers@google.com/

On Tue, May 17, 2022 at 6:26 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Nick,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on 0ac824f379fba2c2b17b75fd5ada69cd68c66348]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Desaulniers/pass-march-only-to-compiler/20220517-051756
> base:   0ac824f379fba2c2b17b75fd5ada69cd68c66348
> config: arm-randconfig-r026-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180917.RNpZaxIl-lkp@intel.com/config)

^ looks like this is a THUMB2 build.

> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/intel-lab-lkp/linux/commit/6da98100eed87e4316be5ec584fe415134f25a3e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Nick-Desaulniers/pass-march-only-to-compiler/20220517-051756
>         git checkout 6da98100eed87e4316be5ec584fe415134f25a3e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/arm/crypto/poly1305-core.S:16:1: error: target does not support ARM mode
>    .code 32
>    ^

It looks like arch/arm/crypto/poly1305-core.S has a preprocessor guard
for __thumb2__.

My change changes the command line from:

from:
$(CC) ... -march=armv7-m ...
to:
$(CC ... -Wa,-march=armv7-m ...

(where ... contains `-mthumb -Wa,-mthumb` for BOTH).

$ arm-linux-gnueabi-gcc -march=armv7-m -mthumb -dM -E - < /dev/null | grep thumb
#define __thumb2__ 1
#define __thumb__ 1
$ arm-linux-gnueabi-gcc -Wa,-march=armv7-m -mthumb -dM -E - <
/dev/null | grep thumb
#define __thumb__ 1
$ clang --target=arm-linux-gnueabi -march=armv7-m -mthumb -dM -E - <
/dev/null | grep thumb
#define __thumb2__ 1
#define __thumb__ 1
$ clang --target=arm-linux-gnueabi -Wa,-march=armv7-m -mthumb -dM -E -
< /dev/null | grep thumb
#define __thumb__ 1
$

(so it seems that the preprocessor definition of `__thumb2__` is
dependent on `-march=`, not `-Wa,-march=`).

David, we might have a very subtle bug in clang:

$ clang --target=arm-linux-gnueabi -mthumb -Wa,-mthumb -march=armv7-m
-Wa,-march=armv7-m -x assembler-with-cpp
-Wunused-command-line-argument - < /dev/null -dM -E
<prints a bunch of preprocessor defines, but no instance of
-Wunused-command-line-argument>
$ clang --target=arm-linux-gnueabi -mthumb -Wa,-mthumb -march=armv7-m
-Wa,-march=armv7-m -x assembler-with-cpp
-Wunused-command-line-argument - < /dev/null -dM -c
clang-15: warning: argument unused during compilation:
'-march=armv7-m' [-Wunused-command-line-argument]

That seems weird because -c vs -E have different behaviors regarding
-Wunused-command-line-argument, and it seems like for `-x
assembler-with-cpp` that the -march= flag without -Wa, prefix *is*
expected to control the behavior of certain preprocessor defines like
`__thumb2__`.

Perhaps a more straightforward test case:
```asm
@ x.S
@ clang --target=arm-linux-gnueabi -mthumb -Wa,-mthumb -march=armv7-m \
@   -Wa,-march=armv7-m -Wunused-command-line-argument x.S -c
.syntax unified
.text
foo:
  movs r0, #__thumb2__
```

$ clang --target=arm-linux-gnueabi -mthumb -Wa,-mthumb -march=armv7-m
-Wa,-march=armv7-m -Wunused-command-line-argument x.S -c
clang-15: warning: argument unused during compilation:
'-march=armv7-m' [-Wunused-command-line-argument]

$ llvm-objdump -dr x.o | tail -n 2
00000000 <foo>:
       0: 01 20        movs r0, #1

Obviously that warning about `-Wunused-command-line-argument` is
incorrect; the value of `__thumb2__` comes from the preprocessor and
is controlled by `-march=armv7-m`. It can't be simultaneously "unused"
and used to define particular preprocessor directives.

Using the above command line invocation without `-march=armv7-m`
produces the assembler-time failure:
/tmp/x-03ab60.s:10:3: error: unsupported relocation on symbol
  movs r0, #__thumb2__
  ^
because __thumb2__ is not defined.

(perhaps `#ifundef __thumb2__ #error "oops" #endif` would be simpler yet).


>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>


--
Thanks,
~Nick Desaulniers
