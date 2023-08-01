Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED125170
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 20:15:43 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-794c5f5ae8aso1734961241.3
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 13:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690920942; x=1691525742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hCf0rN31ep3UEINmPnt3sk5ei3j7OOZmGmTZJY8rRE=;
        b=NoJHFB9vnxOqWtwdkwDMu7yIdblti+4fffnTPxEhrN0i16pJJrPHBeQPIEz6YO6Dfu
         CmebNKQuRLbsOjXsy2lviZfqbgKqt/0PaSaSXcekP0gDXy44NkYYZacUqxlqw95v/zy7
         mWM43akesLxa4bwEc/Y3X6xIlsEyXtCGhsaTKrYfmeCd11aDK1siHIOJ9SpPn9Z4jZ0Z
         Pm21TfJwofQqAVCIhHlzpnMKT+I4E3jnODiLhjQs5gifnuB0vK0I7uMv2nZOJ4RDoIRM
         /QbXAtc7fD2lBHUa2sAlYrzFkOhWhcqljRki02WcTHt7m75g95LOJta4zxbRvRpP62lN
         JfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690920942; x=1691525742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hCf0rN31ep3UEINmPnt3sk5ei3j7OOZmGmTZJY8rRE=;
        b=jpcEvSw1FuYGL5DxIDxMU585u8/g9ZdHi60zM3co5h2+GYPA3e2CujBLoYWOXd0CJC
         nOGzgueXW3Hog/oaEgesuSdWlP/b4s6n3aAgRUZEWUAEviQZywoO3zf3Cc0ydc1wiECL
         IbS3v5agUIkVQelciJkn5dS/oM9jBWyxDeJN1pLI5Pisl+CAm4ki1FXs6rZyuBVV0wUM
         xMgB9nmlPNXcFgVOj88zMip6nnCjkoSwMu0kCFw+ledNdndkvs6zhhlql6iqviAEqIQn
         L82mDtwIsRsKV94twRGd4gVOjkqDnT3Sbuwwic/HvJ1deHnqoLka9s++HjPE8HSamBrZ
         Rh/w==
X-Gm-Message-State: ABy/qLa5l9GHJ25hAE2YUHCt1hV6L8fUL4YwUE/idm1LgXcWr6/Qc238
	dGZKg7kMLDSXFJ1Heb2mcew5hZjBjqopZY7yWYGm2g==
X-Google-Smtp-Source: APBJJlHhVZfZ8ug1P+Z4G5AeLHChob4meMOAlbgMrnNiQ3+13OuuEyTteuBR1eVF2U+RWA4hVvI6FSYzpEOaosHSTnQ=
X-Received: by 2002:a67:fd96:0:b0:446:ff4f:bfff with SMTP id
 k22-20020a67fd96000000b00446ff4fbfffmr2948028vsq.28.1690920941898; Tue, 01
 Aug 2023 13:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307311111.jPEdYIJR-lkp@intel.com>
In-Reply-To: <202307311111.jPEdYIJR-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 13:15:30 -0700
Message-ID: <CAKwvOdmgunghdn9fpfXcz8O0+tDuK7GgNrKCUF+-7=nTHOp2nQ@mail.gmail.com>
Subject: Re: [stable:linux-4.19.y 2317/9999] lib/mpi/generic_mpih-mul2.c:49:24:
 error: invalid use of a cast in a inline asm context requiring an lvalue:
 remove the cast or build with -fheinous-gnu-extensions
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Fangrui Song <maskray@google.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2023 at 8:57=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Fangrui,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git linux-4.19.y
> head:   767049cead76cf699707290d5aeefb3e4d0d5b43
> commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fi=
x GCC_TOOLCHAIN_DIR prefix for Clang cross compilation

These aren't a result of Fangrui's change.  Fangrui's change probably
allows this config to mostly build, modulo the below error in
lib/mpi/generic_mpih-mul2.c.

> config: mips-randconfig-r036-20230731 (https://download.01.org/0day-ci/ar=
chive/20230731/202307311111.jPEdYIJR-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311111=
.jPEdYIJR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307311111.jPEdYIJR-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
> >> drivers/net/netdevsim/netdev.c:167:35: warning: unused variable 'nsim_=
switchdev_ops' [-Wunused-const-variable]
>      167 | static const struct switchdev_ops nsim_switchdev_ops =3D {
>          |                                   ^
>    1 warning generated.

^ fixed by
commit e58df56c8564 ("netdevsim: Implement ndo_get_port_parent_id()")
in v5.1-rc1 (this report is against 4.19.y)
Florian, does it make sense for the stable maintainers to cherry-pick
e58df56c8564 to 4.19.y in isolation?

> --
> >> lib/mpi/generic_mpih-mul2.c:49:24: error: invalid use of a cast in a i=
nline asm context requiring an lvalue: remove the cast or build with -fhein=
ous-gnu-extensions
>       49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_l=
imb);
>          |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~

Looks like randconfig found and outstanding issue. Filed:
https://github.com/ClangBuiltLinux/linux/issues/1898 to follow up+fix.

>    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>      652 |         : "=3Dl" ((USItype)(w0)), \
>          |                 ~~~~~~~~~~^~~
> >> lib/mpi/generic_mpih-mul2.c:49:3: error: invalid output constraint '=
=3Dh' in asm
>       49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_l=
imb);
>          |                 ^
>    lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>      653 |              "=3Dh" ((USItype)(w1)) \
>          |              ^
>    2 errors generated.
> --
>    lib/mpi/generic_mpih-mul3.c:49:24: error: invalid use of a cast in a i=
nline asm context requiring an lvalue: remove the cast or build with -fhein=
ous-gnu-extensions
>       49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_l=
imb);
>          |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>      652 |         : "=3Dl" ((USItype)(w0)), \
>          |                 ~~~~~~~~~~^~~
> >> lib/mpi/generic_mpih-mul3.c:49:3: error: invalid output constraint '=
=3Dh' in asm
>       49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_l=
imb);
>          |                 ^
>    lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>      653 |              "=3Dh" ((USItype)(w1)) \
>          |              ^
>    2 errors generated.
> --
> >> lib/mpi/mpih-div.c:142:20: error: invalid use of a cast in a inline as=
m context requiring an lvalue: remove the cast or build with -fheinous-gnu-=
extensions
>      142 |                                         umul_ppmm(n1, n0, d0, =
q);
>          |                                         ~~~~~~~~~~~~~~^~~~~~~~=
~~
>    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>      652 |         : "=3Dl" ((USItype)(w0)), \
>          |                 ~~~~~~~~~~^~~
> >> lib/mpi/mpih-div.c:142:6: error: invalid output constraint '=3Dh' in a=
sm
>      142 |                                         umul_ppmm(n1, n0, d0, =
q);
>          |                                         ^
>    lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>      653 |              "=3Dh" ((USItype)(w1)) \
>          |              ^
>    lib/mpi/mpih-div.c:205:20: error: invalid use of a cast in a inline as=
m context requiring an lvalue: remove the cast or build with -fheinous-gnu-=
extensions
>      205 |                                         umul_ppmm(n1, n0, d1, =
q);
>          |                                         ~~~~~~~~~~~~~~^~~~~~~~=
~~
>    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>      652 |         : "=3Dl" ((USItype)(w0)), \
>          |                 ~~~~~~~~~~^~~
>    lib/mpi/mpih-div.c:205:6: error: invalid output constraint '=3Dh' in a=
sm
>      205 |                                         umul_ppmm(n1, n0, d1, =
q);
>          |                                         ^
>    lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>      653 |              "=3Dh" ((USItype)(w1)) \
>          |              ^
>    4 errors generated.
> --
> >> lib/mpi/generic_mpih-mul1.c:50:24: error: invalid use of a cast in a i=
nline asm context requiring an lvalue: remove the cast or build with -fhein=
ous-gnu-extensions
>       50 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_l=
imb);
>          |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>      652 |         : "=3Dl" ((USItype)(w0)), \
>          |                 ~~~~~~~~~~^~~
> >> lib/mpi/generic_mpih-mul1.c:50:3: error: invalid output constraint '=
=3Dh' in asm
>       50 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_l=
imb);
>          |                 ^
>    lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>      653 |              "=3Dh" ((USItype)(w1)) \
>          |              ^
>    2 errors generated.
>
>
> vim +49 lib/mpi/generic_mpih-mul2.c
>
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  31
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  32  mpi_limb_t
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  33  mpihelp_addmul_1(mpi_ptr_t=
 res_ptr, mpi_ptr_t s1_ptr,
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  34            mpi_size_t s1_si=
ze, mpi_limb_t s2_limb)
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  35  {
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  36   mpi_limb_t cy_limb;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  37   mpi_size_t j;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  38   mpi_limb_t prod_high, pro=
d_low;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  39   mpi_limb_t x;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  40
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  41   /* The loop counter and i=
ndex J goes from -SIZE to -1.  This way
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  42    * the loop becomes faste=
r.  */
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  43   j =3D -s1_size;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  44   res_ptr -=3D j;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  45   s1_ptr -=3D j;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  46
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  47   cy_limb =3D 0;
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  48   do {
> cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31 @49           umul_ppmm(prod_hi=
gh, prod_low, s1_ptr[j], s2_limb);
>
> :::::: The code at line 49 was first introduced by commit
> :::::: cdec9cb5167ab1113ba9c58e395f664d9d3f9acb crypto: GnuPG based MPI l=
ib - source files (part 1)
>
> :::::: TO: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
> :::::: CC: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


--=20
Thanks,
~Nick Desaulniers
