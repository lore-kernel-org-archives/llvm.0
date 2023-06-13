Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F616567E
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 08:17:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f8cc04c287so2479875e9.0
        for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 01:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686644225; x=1689236225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7QlNfAS35s5IEireeywT9BDZtDXaOwJcuTVGyEkAeI=;
        b=WulKdQxAXrxH+7PEV/Up9ciz+zGSeTlkGR3tmJo3i4TCjapz60sLnp9bZdtGT2gETq
         6EOZv+lIqkQyBNbkNkBULCMoHQGp7CqrEcrLeSZZhgBq/XhYX8hM//+JV/FmHc0zAA7I
         7XT6TIxc5PiBJLOhdVYjDaIeFSIKBqNhCm/F/MoChPnXegvv767f5cjSpn/5ARsQy69K
         MbepAqYhmKrM8kY7wJvrxRgtD/oPddTh4RwprwfSlV0siHkToL3+Ljrd5OXG4ZfXubXa
         EE+KKQ02et3CVShbjP4gQMl1Td70nApUMnbDoSzL/ZC1bL/oIBvkzANdkNyaMLb9ZDnm
         0WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644225; x=1689236225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7QlNfAS35s5IEireeywT9BDZtDXaOwJcuTVGyEkAeI=;
        b=bFNZdU1IoMixDZth4hmf7eHf7NK4VX+Sd4d+Pz7kB2/Yi6ftaTPm1chegaAvnELzGr
         TwcFdZGcnRvX898Y7bCjW4f9kfCOtlSU7V/ftLPvitnPIdM6mMrH9DQWgWRRJtzo1S2+
         AqM7KLQOypb9tm+gDF/czxQOHZXN8yalCa2WTKVxtv/jDBLo5s+FYcsfFhh9mGqFiikD
         WVomSko/ZwRSRIqbKP4wkHzcw3XNHR4JaZg89YOfD/Z0+B/W6LjSOFgAM8lT/6iNvgMk
         hrlrnaZhMgvaqWhE4nNZxS1oFPPzJPXfC7jj/0X314qAIF600iq99UoszWIdrfvaWpcH
         i5JA==
X-Gm-Message-State: AC+VfDwdkywctIupIEooAYCui10htEIyMZy8/GcBN2RXXRd2Dig7ISbn
	tSkihxERKyD0jKff/VuoqyPWexc6sytVX6hhjeYFFQ==
X-Google-Smtp-Source: ACHHUZ7VmXEbkSo06kH3PnaXfBgVtlxIDL8bZLrkOLf2u653hvOcOpBicst3nGcLYsyaJpXv2rjGxGR/0aBZpCkhIFM=
X-Received: by 2002:adf:e985:0:b0:30f:c1d6:61cf with SMTP id
 h5-20020adfe985000000b0030fc1d661cfmr4192511wrm.51.1686644225284; Tue, 13 Jun
 2023 01:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306110855.7TlBCIzI-lkp@intel.com>
In-Reply-To: <202306110855.7TlBCIzI-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 13 Jun 2023 10:16:54 +0200
Message-ID: <CAHVXubhKstDeRDp8n-POR_eL0vh5DdHuWKHu7pN+X_j0rtG4Dw@mail.gmail.com>
Subject: Re: ld.lld: error: relocation R_RISCV_HI20 cannot be used against
 symbol 'misaligned_access_speed'; recompile with -fPIC
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 2:11=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   022ce8862dff83c859089cd14bc4dca0733e2f90
> commit: 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741 riscv: Fix relocatable k=
ernels with early alternatives using -fno-pie
> date:   10 days ago
> config: riscv-randconfig-r022-20230611 (https://download.01.org/0day-ci/a=
rchive/20230611/202306110855.7TlBCIzI-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D8dc2a7e8027fbeca0c7df81d4c82e735a59b5741
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Driscv olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306110855.7TlBCIzI-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '=
misaligned_access_speed'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/riscv/kernel/cpufeature.o)
>    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
>    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_prob=
e_func) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol=
 'misaligned_access_speed'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/riscv/kernel/cpufeature.o)
>    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
>    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_prob=
e_func) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '=
riscv_cbom_block_size'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
>    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
>    >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch=
_func) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_RISCV_LO12_S cannot be used against symbol=
 'riscv_cbom_block_size'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
>    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
>    >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch=
_func) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '=
__per_cpu_offset'; recompile with -fPIC
>    >>> defined in vmlinux.a(mm/percpu.o)
>    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
>    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_prob=
e_func) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol=
 '__per_cpu_offset'; recompile with -fPIC
>    >>> defined in vmlinux.a(mm/percpu.o)
>    >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
>    >>>               arch/riscv/errata/thead/errata.o:(thead_feature_prob=
e_func) in archive vmlinux.a
>

So I looked into those errors, the config is basically =3D RELOCATABLE +
MEDLOW - EARLY_ALTERNATIVES. Then errata/thead is not compiled as
medany, which makes sense since we only need this code to be medany
when EARLY_ALTERNATIVES is enabled (because the code would be executed
with mmu off, which is not the case here).

I can fix those errors by adding the medany flag, but I'm not sure
actually we want to do that since we do not need it and gcc does not
complain: any idea?

Alex



> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
