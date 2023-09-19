Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA51B267
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 20:06:08 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6515d44b562so33876556d6.3
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695153967; x=1695758767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQnPY0z4taKHApL77Ffx1d50jLqp8wyhR11FZPBq+qk=;
        b=2E1HiAdlkLzElX+fm8bseLgmTXTHEIxLau9UhSwo0bMe21Plt5sgQehvYLZ4Jo4z91
         1xtPdAR2vOOBrTlz94el83lSTaL1OFaHrhcAmig/HPX6NEjBFadK0aYD49wiVoR/JtlS
         Jn6K2KoxFlELiuP4CoOhSC19b71Ya/aj/sWWrx/2EQr3jLZjPg9XBHkatcanJihAV5wA
         CqiIq1Vw8e5ojNb/VDj27WTQJGzZbE23bpE07+/IqVkxDX6dqqTs9J5rm1101yI24JMx
         6RDVnE7DezPoweu1Wplm5e/Kq5Vfz8X/vL975MihgpGHAhgkDSL30sYp2ye+6Z+PKQFp
         GL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695153967; x=1695758767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQnPY0z4taKHApL77Ffx1d50jLqp8wyhR11FZPBq+qk=;
        b=Lo2/C4/mQjydaOhS1lJinVFnaaJdVlZF6xEhCRzhvDK1P5uAPRltwJw6vCRM+hGCHh
         nnIkDe9xMT9sKhDhV8If1a/kxETIOpYRoDow/SwMgmRnHpkLnW4eKZkL2ygQnFqP34u2
         EZ5+pgILiqUtTkbvFBuKDprNbWKlUKbvMWPFKGkwXGecWJGgcMPR+BOH+KfR032D5l1v
         uhUOalLOIkjSXB+gRW4VIG6l2cg4ZK7qpJqRzQfgf51GANUVuw+mhKZ5Sn00/ZckD0z8
         SpGcWNabHd2mwpSvCTDg52gnJ5mpDTOYqbyewW0vGqLLC5zbDUFTWd+0seghid8PebWb
         YeDg==
X-Gm-Message-State: AOJu0Yz6laJ0oglxSobjhBVzjI1IUd5qvS779DiyUppq++ZUFBGUiq6m
	oei7w7a+DzspSDrqG22ypZAq/U93cy+lFeBEs0AI5g==
X-Google-Smtp-Source: AGHT+IGwcqVkGXd3Zf3N82ll6JyqL1rHSLbA5bxgmmbMggRlybY8gxv4W57FTpofp4S8SxPCW/NJEqRwqbRLF7XD53I=
X-Received: by 2002:a0c:e304:0:b0:658:4cae:b43a with SMTP id
 s4-20020a0ce304000000b006584caeb43amr217436qvl.4.1695153967060; Tue, 19 Sep
 2023 13:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309192257.IAbw1lnx-lkp@intel.com> <ZQm2W9r2a+cgeaEM@rli9-mobl>
In-Reply-To: <ZQm2W9r2a+cgeaEM@rli9-mobl>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Sep 2023 13:05:52 -0700
Message-ID: <CAKwvOdmUmLRMP0OUOJkPSKucn3NJTxz7uJGWfn83LX=gbZ-5Zw@mail.gmail.com>
Subject: Re: warning: unknown warning option '-Wrestrict'
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 7:56=E2=80=AFAM Philip Li <philip.li@intel.com> wro=
te:
>
> On Tue, Sep 19, 2023 at 10:40:57PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   2cf0f715623872823a72e451243bbf555d10d032
> > commit: feb843a469fb0ab00d2d23cfb9bcc379791011bb kbuild: add $(CLANG_FL=
AGS) to KBUILD_CPPFLAGS
> > date:   4 months ago
> > config: um-allnoconfig (https://download.01.org/0day-ci/archive/2023091=
9/202309192257.IAbw1lnx-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20230919/202309192257.IAbw1lnx-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309192257.IAbw1lnx-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
>
> Sorry for the false report. Kindly ignore this.

No worries, I just checked `make LLVM=3D1 arch=3Dum -j128 allnoconfig all`
and had no issue.

>
> >
> > >> warning: unknown warning option '-Wrestrict' [-Wunknown-warning-opti=
on]
> > >> warning: unknown warning option '-Wformat-overflow'; did you mean '-=
Wshift-overflow'? [-Wunknown-warning-option]
> > >> warning: unknown warning option '-Wformat-truncation' [-Wunknown-war=
ning-option]
> > >> warning: unknown warning option '-Wstringop-overflow'; did you mean =
'-Wshift-overflow'? [-Wunknown-warning-option]
> >    arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for =
function 'foo' [-Wmissing-prototypes]
> >       17 | void foo(void)
> >          |      ^
> >    arch/x86/um/user-offsets.c:17:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
> >       17 | void foo(void)
> >          | ^
> >          | static
> >    5 warnings generated.
> >    error: unknown warning option '-Wrestrict' [-Werror,-Wunknown-warnin=
g-option]
> >    error: unknown warning option '-Wformat-overflow'; did you mean '-Ws=
hift-overflow'? [-Werror,-Wunknown-warning-option]
> >    error: unknown warning option '-Wformat-truncation' [-Werror,-Wunkno=
wn-warning-option]
> >    error: unknown warning option '-Wstringop-overflow'; did you mean '-=
Wshift-overflow'? [-Werror,-Wunknown-warning-option]
> >    make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error=
 1
> >    error: unknown warning option '-Wrestrict' [-Werror,-Wunknown-warnin=
g-option]
> >    error: unknown warning option '-Wformat-overflow'; did you mean '-Ws=
hift-overflow'? [-Werror,-Wunknown-warning-option]
> >    error: unknown warning option '-Wformat-truncation' [-Werror,-Wunkno=
wn-warning-option]
> >    error: unknown warning option '-Wstringop-overflow'; did you mean '-=
Wshift-overflow'? [-Werror,-Wunknown-warning-option]
> >    make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-of=
fsets.s] Error 1
> >    make[2]: Target 'scripts/mod/' not remade because of errors.
> >    make[1]: *** [Makefile:1286: prepare0] Error 2
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:226: __sub-make] Error 2
> >    make: Target 'prepare' not remade because of errors.
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
>


--=20
Thanks,
~Nick Desaulniers
