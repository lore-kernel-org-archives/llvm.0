Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E0AD29
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 16:40:41 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75d4dd6f012so226788485a.2
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686760840; x=1689352840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXimn/P/5sCJZ7fCJTZ8BSazPdQnTt6zyCupGqR8k5w=;
        b=OAoITSntNBYS+uJgf1ujmP2eeCLW9WF/FTefuiku8oybwrFBx+upKikf92RbfxXDE+
         LnYGDbG150ZKoTMWfmq3xvUFJt8/h0GeDKE4BfhS5mPt4LFm8IFdGz0371yuNV+Z/fKH
         BFj0AXE1/uumb9GBim7y91GR0ZrJp5EcO87efwp3wOhNFp8ZrMk82cAtVmQFn+3r6q/O
         Rg1fgvFf/yOlmVFHUa43o0hvV3WXx27jsfTzl4CuRT9dho1R5DLVFyrR9QiIkd9mP4Mt
         zzG27bxORvKu5rmKLtRzdL3zlEvwsqLHG5zaL7qJcVVUT6AFxL+ONDCwRBish4r8Ujgu
         EM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686760840; x=1689352840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXimn/P/5sCJZ7fCJTZ8BSazPdQnTt6zyCupGqR8k5w=;
        b=mIE1UQw6EiX0cEw/rESeYWMTk7N26qDKHqxYAfgQ/2qivpb8rmi+gRu1zA616/j9hr
         3Rv2BfWGTgDZq6mMdfjvuvFI9CXSw6w3SjXGUEzmk3nRygFywivfwdD3LmO8X4GOWmxe
         HzUKiwOg6tzYymFlgiYziKaqSNYwKTN4eZMG24Fg/iWS1RvOVNB90l3tZzz7BbQry56F
         7ZpCl9fMH+UX03apnbULoGnl+uTOq5uUI+DE/g98OAM6RXYVz+kXRgv5ze3K1p4Ofyqh
         mvVbKh5IfaJqyl69FLLIG/8fhlU1eyI7fTUump5FA7JpJRplQ0y7mrr4/HL8+AyboZlQ
         FbBA==
X-Gm-Message-State: AC+VfDxBU0wsAxhS7I2MNagW1/bhn3YyUs7dggXYeyfxgJAOJrHjdKIu
	uwCH/hdhLyQJB8QW4jnSpj0gER3w2BpR4XrVdrMvmw==
X-Google-Smtp-Source: ACHHUZ6nzw2pIHfANPy+oymiDmwVUSVPnDXJQ6OjIAJWySkyRIMjr8q00W31fdmz4ODSODxrNZYayP0uNr3Rvjbpr08=
X-Received: by 2002:a05:6214:e6e:b0:628:6abe:f06e with SMTP id
 jz14-20020a0562140e6e00b006286abef06emr17513666qvb.41.1686760840396; Wed, 14
 Jun 2023 09:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306110855.7TlBCIzI-lkp@intel.com> <CAHVXubhKstDeRDp8n-POR_eL0vh5DdHuWKHu7pN+X_j0rtG4Dw@mail.gmail.com>
In-Reply-To: <CAHVXubhKstDeRDp8n-POR_eL0vh5DdHuWKHu7pN+X_j0rtG4Dw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Jun 2023 12:40:28 -0400
Message-ID: <CAKwvOd=yg5GE8eF5bFY4t2S-0Od3smH9iRB+2Ctkg=+WXM97ig@mail.gmail.com>
Subject: Re: ld.lld: error: relocation R_RISCV_HI20 cannot be used against
 symbol 'misaligned_access_speed'; recompile with -fPIC
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 4:17=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> On Sun, Jun 11, 2023 at 2:11=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   022ce8862dff83c859089cd14bc4dca0733e2f90
> > commit: 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741 riscv: Fix relocatable=
 kernels with early alternatives using -fno-pie
> > date:   10 days ago
> > config: riscv-randconfig-r022-20230611 (https://download.01.org/0day-ci=
/archive/20230611/202306110855.7TlBCIzI-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.gi=
t ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=3D1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D8dc2a7e8027fbeca0c7df81d4c82e735a59b5741
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Driscv olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306110855.7TlBCIzI-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol=
 'misaligned_access_speed'; recompile with -fPIC
> >    >>> defined in vmlinux.a(arch/riscv/kernel/cpufeature.o)
> >    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
> >    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_pr=
obe_func) in archive vmlinux.a
> > --
> > >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symb=
ol 'misaligned_access_speed'; recompile with -fPIC
> >    >>> defined in vmlinux.a(arch/riscv/kernel/cpufeature.o)
> >    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
> >    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_pr=
obe_func) in archive vmlinux.a
> > --
> > >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol=
 'riscv_cbom_block_size'; recompile with -fPIC
> >    >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
> >    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
> >    >>>               arch/riscv/errata/thead/errata.o:(thead_errata_pat=
ch_func) in archive vmlinux.a
> > --
> > >> ld.lld: error: relocation R_RISCV_LO12_S cannot be used against symb=
ol 'riscv_cbom_block_size'; recompile with -fPIC
> >    >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
> >    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
> >    >>>               arch/riscv/errata/thead/errata.o:(thead_errata_pat=
ch_func) in archive vmlinux.a
> > --
> > >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol=
 '__per_cpu_offset'; recompile with -fPIC
> >    >>> defined in vmlinux.a(mm/percpu.o)
> >    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
> >    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_pr=
obe_func) in archive vmlinux.a
> > --
> > >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symb=
ol '__per_cpu_offset'; recompile with -fPIC
> >    >>> defined in vmlinux.a(mm/percpu.o)
> >    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
> >    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_pr=
obe_func) in archive vmlinux.a
> >
>
> So I looked into those errors, the config is basically =3D RELOCATABLE +
> MEDLOW - EARLY_ALTERNATIVES. Then errata/thead is not compiled as

Thanks for taking a look.  Shouldn't CONFIG_RELOCATABLE be setting
-fPIC? If so, why is LLD complaining about -fPIC not being used?

arch/riscv/Makefile sets -fPIE if CONFIG_RELOCATABLE =3D=3D y.

Is it possible that -fpie was dropped for these object files, or
-fno-pic or -fno-pie was added to the cflags for these object files
somehow?

I've filed
https://github.com/ClangBuiltLinux/linux/issues/1872
to track this.

> medany, which makes sense since we only need this code to be medany
> when EARLY_ALTERNATIVES is enabled (because the code would be executed
> with mmu off, which is not the case here).
>
> I can fix those errors by adding the medany flag, but I'm not sure
> actually we want to do that since we do not need it and gcc does not
> complain: any idea?
>
> Alex
>
>
>
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>


--=20
Thanks,
~Nick Desaulniers
