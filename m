Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A28E156C0
	for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 20:48:35 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-62ff2764887so998576d6.1
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686862115; x=1689454115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVvK/Na1gzfD54zw3ZOXcU4ToR+ZUGcJvnZfZy+0SyA=;
        b=BYzNhG/2M13rrWc4SlMkHjcj84wfdb67wim4N9PJyVRKPtgNfq6FLAzFHAakbir6aG
         vo9e+j+8nnoh810rC5R9QTR1iPW9VJ/pxU3naoK2dHb29sSA6MTb84Ku1VCGIRA7XGW5
         IrejTrsPbwn89itbgLme/C+yC5XwFjrUMv/jqzN/F0FAw3X+eQ0MDy333M6EGEQSBcU1
         pA0tSk9xbOJIHFh1FDJ7XtCfVrupBx4LzSl3gqX2BNSLNe6spb6aSUQAkGL340PnuI9U
         8rv27Cz60Xxlx7i8w28IQHJtYIwZzWhaiVDCn08Jihq9TmgFabzkBi0LSJD0tWeDT5vd
         ucww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862115; x=1689454115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVvK/Na1gzfD54zw3ZOXcU4ToR+ZUGcJvnZfZy+0SyA=;
        b=Mf4CGNWVREzpjwWAb0zkdiYwou0Xe2iXy4EERWlaPPKNZashtccOGjeI+WCZfE8iK4
         b71986U9gpJzx+p37K9KznniLehb7bPncWdiLRQLyQGS3Fdfyk6pJFkFmmzgq4IYloA1
         dxeaI0G8B+nzj3wBcrLQXJefUDa/5gjzSEZrxXZuxsIiXd9CEpjc4v5q1osrYjj3a7YH
         HLXDHL7hrYET0ng5t2z89xHxYBqQGYAniNha/7deCsuRt91odnunuTKIrNQ3pPmrnZUI
         1uvMHMhoGd4U7portlgLIJBcbmJwBWhu0sl0CGfHIowL2VcZQZi3mcr8Zk1c69bZdhnQ
         xP4A==
X-Gm-Message-State: AC+VfDyjnnjIXJN3wgmnZLU4nMhJMjdAtrmHv+0xC22OBV3tK9GWckKz
	rrJU0xImyEz3aCEUurxDWMKDEpYbvqRjlepnMDHQEA==
X-Google-Smtp-Source: ACHHUZ4a6nnUds7xEqYAgpw0wxXpCLHo7IXs3V7u6TdWBAunKYjarCg+B9sPjNdQ2GTlBbC3TJ280TuXA1/SCGlak4Y=
X-Received: by 2002:a05:6214:5298:b0:62d:f170:f6b3 with SMTP id
 kj24-20020a056214529800b0062df170f6b3mr108262qvb.19.1686862114692; Thu, 15
 Jun 2023 13:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306151433.QKcn7ZNn-lkp@intel.com> <ZIr0hZV/jcpZkRq2@smile.fi.intel.com>
 <CAKwvOd=Fj51=m0EZznjOmkqeZy_5uDZ_Gyf-Pv=yd2=53Gb6Sw@mail.gmail.com>
In-Reply-To: <CAKwvOd=Fj51=m0EZznjOmkqeZy_5uDZ_Gyf-Pv=yd2=53Gb6Sw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Jun 2023 16:48:22 -0400
Message-ID: <CAKwvOd=uqfnyw2u=Nhm+Q0uGORjW9GB+pso6tb_HKGSU0rhZBQ@mail.gmail.com>
Subject: Re: lib/test_bitmap.c:920:2: error: call to '__compiletime_assert_239'
 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, Alexander Lobakin <alexandr.lobakin@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 3:52=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jun 15, 2023 at 7:22=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Jun 15, 2023 at 02:32:02PM +0800, kernel test robot wrote:
> > > Hi Alexander,
> > >
> > > FYI, the error/warning still remains.
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   b6dad5178ceaf23f369c3711062ce1f2afc33644
> > > commit: dc34d5036692c614eef23c1130ee42a201c316bf lib: test_bitmap: ad=
d compile-time optimization/evaluations assertions
> > > date:   12 months ago
> > > config: arm64-randconfig-r025-20230615 (https://download.01.org/0day-=
ci/archive/20230615/202306151433.QKcn7ZNn-lkp@intel.com/config)
>
> ^ randconfig
>
> > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.=
git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce (this is a W=3D1 build):
> > >         mkdir -p ~/bin
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm64 cross compiling tool for clang build
> > >         # apt-get install binutils-aarch64-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3Ddc34d5036692c614eef23c1130ee42a201c316bf
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout dc34d5036692c614eef23c1130ee42a201c316bf
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/mak=
e.cross W=3D1 O=3Dbuild_dir ARCH=3Darm64 olddefconfig
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/mak=
e.cross W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash lib/
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202306151433.QKcn7ZNn=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> >
> > >    888                /*
> > >    889                 * Equals to `unsigned long bitmap[1] =3D { GEN=
MASK(6, 5), }`.
> > >    890                 * Clang on s390 optimizes bitops at compile-ti=
me as intended, but at
> > >    891                 * the same time stops treating @bitmap and @bi=
topvar as compile-time
> > >    892                 * constants after regular test_bit() is execut=
ed, thus triggering the
> > >    893                 * build bugs below. So, call const_test_bit() =
there directly until
> > >    894                 * the compiler is fixed.
> > >    895                 */
> > >    896                bitmap_clear(bitmap, 0, BITS_PER_LONG);
> > >    897        #if defined(__s390__) && defined(__clang__)
> > >    898                if (!const_test_bit(7, bitmap))
> > >    899        #else
> > >    900                if (!test_bit(7, bitmap))
> > >    901        #endif
> >
> > Hmm... Reveals the bug in clang/arm64?
>
> Seems related to the config.  ARCH=3Darm64 defconfig +
> CONFIG_TEST_BITMAP=3Dy doesn't trigger this for me, but the randconfig
> does.  We'll bisect the config, and update the thread tracking this:
> https://github.com/ClangBuiltLinux/linux/issues/1874

KASAN and GCOV together seem to be tickling this.

>
> >
> > >    919                res =3D !test_bit(18, &bitopvar);
> > >  > 920                BUILD_BUG_ON(!__builtin_constant_p(res));
> > >    921                BUILD_BUG_ON(!res);
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
