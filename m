Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265411184
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 22:18:06 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7658430eb5dso574311985a.2
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689632285; x=1692224285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0nRdgPIxPY9h+6ob+XM6W1276R2kR6LVZcGXL+V7xQ=;
        b=S2DUQ4oHtpsxG9NzvglBSXoaL0mMF9/6onvQd/rprjmlG4A110LPmzn4x57zH0j4cv
         wFWOxPjsT2lIU8hdbOFj3MGp5vBHpoX3t8W8HEYf1fa1CITtlCYQcwLKVT4Tqsna8QDZ
         8340z+Kj7hkU3dhoASUDr/BUPdCoMdHYrAEczd9KlNCVDnpltv3fJ79lLNQjbWdVFV4g
         2Tvg/nH3szhBjxkSgyRhS2p/GyCUatgbxGzdowZL9DcLBVeX7XtXZxByu3UBoLuFKSe2
         ifwLSg9wA1quMluShQUZhz9yBq3IbJ+f1GrQvRpXlTbRmqohIoF8P78eABb2veT4GnRD
         KAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689632285; x=1692224285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0nRdgPIxPY9h+6ob+XM6W1276R2kR6LVZcGXL+V7xQ=;
        b=Dx2nUk9m6tX1jk6VqMG54tJmR+PDV2yCqI6oOIx3M5hdZ4EhtrwpIoBMPkwfsa5BNZ
         nU8EaWkQz8OZThW6iW2bcxfIJ8+UtKyKt+Zu5aIzoqfylvNYLvBpotZlPpkdSDPOI9rY
         0psPPLmjCpZEgZebxIClfIvUxVfUkmU94LfSuevgnu9HOobgngpzuY5xJECBVefgOu7y
         WaZ/Ox0ZPkR8FprFgiCFvjJXnH6ihV5FA4beprt5II9SSGvISHK/1U7kNiYSSNmYj75g
         YiFDlt5YKEO5YEQXy7oxUpYZ2ZZkbpPl4IhoYS4ODvmYlY24UDHYp47G9iaisx9FlL99
         SISw==
X-Gm-Message-State: ABy/qLaz8pBBUdWCA1AfCiv2W1ADLrlnJof9eno9bnHfYFCaV+t+oWJ6
	gj0jfLSEmsJIb3d0PKoN5ITPRLEAyBkqIQPLwefbfg==
X-Google-Smtp-Source: APBJJlHLjslVGLXCTSMLhtM9+72/787CaZvR5j2s8OxhxBKqBWudKCsp5r2ZmQyeVGJ+ejaoxMp6fyzM26CzICuIjK4=
X-Received: by 2002:a05:620a:410:b0:766:fd2c:fca1 with SMTP id
 16-20020a05620a041000b00766fd2cfca1mr16751394qkp.75.1689632285573; Mon, 17
 Jul 2023 15:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230717220435.57640-1-yury.norov@gmail.com>
In-Reply-To: <20230717220435.57640-1-yury.norov@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Jul 2023 15:17:54 -0700
Message-ID: <CAKwvOdnOBYvLfv9+1pZ6medrPS0+V1yZ8tcSbW466Rqxv+qSng@mail.gmail.com>
Subject: Re: [PATCH v2] lib/bitmap: workaround const_eval test build failure
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Alexander Lobakin <alexandr.lobakin@intel.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 3:04=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> When building with Clang, and when KASAN and GCOV_PROFILE_ALL are both
> enabled, the test fails to build [1]:
>
> >> lib/test_bitmap.c:920:2: error: call to '__compiletime_assert_239' dec=
lared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(re=
s)
>            BUILD_BUG_ON(!__builtin_constant_p(res));
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_=
ON_MSG'
>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                        ^
>    include/linux/compiler_types.h:352:2: note: expanded from macro 'compi=
letime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __C=
OUNTER__)
>            ^
>    include/linux/compiler_types.h:340:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:333:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:185:1: note: expanded from here
>    __compiletime_assert_239
>
> Originally it was attributed to s390, which now looks seemingly wrong. Th=
e
> issue is not related to bitmap code itself, but it breaks build for a giv=
en
> configuration.
>
> Disabling the const_eval test under that config may potentially hide othe=
r
> bugs. Instead, workaround it by disabling GCOV for the test_bitmap unless
> the compiler will get fixed.
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/1874
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307171254.yFcH97ej-lkp@i=
ntel.com/
> Fixes: dc34d5036692 ("lib: test_bitmap: add compile-time optimization/eva=
luations assertions")
> Co-developed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Thanks for the patch.  I hope to see if this is fixable in the
compiler soon, so that we can replace this with a compiler version
check should this be fixable (and then fixed) in the compiler.  For
now, we will track this in the above github link.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  lib/Makefile      | 6 ++++++
>  lib/test_bitmap.c | 8 ++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/lib/Makefile b/lib/Makefile
> index 42d307ade225..1ffae65bb7ee 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -82,7 +82,13 @@ obj-$(CONFIG_TEST_STATIC_KEYS) +=3D test_static_key_ba=
se.o
>  obj-$(CONFIG_TEST_DYNAMIC_DEBUG) +=3D test_dynamic_debug.o
>  obj-$(CONFIG_TEST_PRINTF) +=3D test_printf.o
>  obj-$(CONFIG_TEST_SCANF) +=3D test_scanf.o
> +
>  obj-$(CONFIG_TEST_BITMAP) +=3D test_bitmap.o
> +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_KASAN),yy)
> +# FIXME: Clang breaks test_bitmap_const_eval when KASAN and GCOV are ena=
bled
> +GCOV_PROFILE_test_bitmap.o :=3D n
> +endif
> +
>  obj-$(CONFIG_TEST_UUID) +=3D test_uuid.o
>  obj-$(CONFIG_TEST_XARRAY) +=3D test_xarray.o
>  obj-$(CONFIG_TEST_MAPLE_TREE) +=3D test_maple_tree.o
> diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> index 187f5b2db4cf..4a678de9c350 100644
> --- a/lib/test_bitmap.c
> +++ b/lib/test_bitmap.c
> @@ -1161,6 +1161,10 @@ static void __init test_bitmap_print_buf(void)
>         }
>  }
>
> +/*
> + * FIXME: Clang breaks compile-time evaluations when KASAN and GCOV are =
enabled.
> + * To workaround it, GCOV is force-disabled in Makefile for this configu=
ration.
> + */
>  static void __init test_bitmap_const_eval(void)
>  {
>         DECLARE_BITMAP(bitmap, BITS_PER_LONG);
> @@ -1186,11 +1190,7 @@ static void __init test_bitmap_const_eval(void)
>          * the compiler is fixed.
>          */
>         bitmap_clear(bitmap, 0, BITS_PER_LONG);
> -#if defined(__s390__) && defined(__clang__)
> -       if (!const_test_bit(7, bitmap))
> -#else
>         if (!test_bit(7, bitmap))
> -#endif
>                 bitmap_set(bitmap, 5, 2);
>
>         /* Equals to `unsigned long bitopvar =3D BIT(20)` */
> --
> 2.39.2
>
>


--=20
Thanks,
~Nick Desaulniers
