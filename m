Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C5EA0
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 00:41:46 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-04.nifty.com with ESMTP id 2820bdRj016847
	for <llvm@lists.linux.dev>; Fri, 2 Sep 2022 09:37:40 +0900
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2820bAj5017817
	for <llvm@lists.linux.dev>; Fri, 2 Sep 2022 09:37:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2820bAj5017817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662079031;
	bh=VL1ksr7a5Sl3ERy4FVPxcqrYIg8n/ru3EfBCKVgbkN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=2jLyK933mlHNEVcoLqNB+tWIpLkUaZapy9+RziBEu7BksaGUaEBTeBoVcVEwWxSn7
	 +EfAylVuM/dZjO70sOtjgq5Yu+FAwmdvuzdid81sXHLbZvZkjOaMfUKNiIIlrA+byV
	 Zh1N/pYgSSKep3xbGpQo2S9EtXg3VF1U1jd5rrsft1jX3VvswSOiFPgNLUbG3NLdLe
	 32p3OI5D1dszHMyMn/1GC4B8PDzMxbobWjY4ZUR2SUAeuuldLhmedrv6SYPeyZZ2xG
	 nEv3N/54Ijpb7xrTBhn2Az6BjoN9OpJOyAAEIfhHU3ePH22d/9yFEhPnhwSqQDdQC1
	 t4RNYa879e8EQ==
X-Nifty-SrcIP: [209.85.160.42]
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11e9a7135easo1304233fac.6
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 17:37:10 -0700 (PDT)
X-Gm-Message-State: ACgBeo2s4tde/H7gJl6kXP2yNytpYvdCCsRbc8mPRefZ0B217YjJg9zu
	dJ8mhyiZk0IiaPt9yBL90Fa/lBrQanGkVQRYVts=
X-Google-Smtp-Source: AA6agR7oVTlrgwvCx4WHylDpq5DKuANRVqP1gYR9r3V8zsV3Wk9ZkqqEEaq9yuDlhmU6MqcOqniYH6vaa63dkipCyHU=
X-Received: by 2002:a05:6808:2099:b0:343:49f5:5300 with SMTP id
 s25-20020a056808209900b0034349f55300mr799407oiw.287.1662079029862; Thu, 01
 Sep 2022 17:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209020450.jH1ovepP-lkp@intel.com> <YxEoo8M++9tyaLOO@thelio-3990X>
In-Reply-To: <YxEoo8M++9tyaLOO@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 2 Sep 2022 09:36:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS9BtiQ8oSX+oOZ8Wewaed+p7Kj8kaObpVddBuR308Nww@mail.gmail.com>
Message-ID: <CAK7LNAS9BtiQ8oSX+oOZ8Wewaed+p7Kj8kaObpVddBuR308Nww@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
 references __vmnewmap
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 6:48 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> + Masahiro
>
> On Fri, Sep 02, 2022 at 04:41:09AM +0800, kernel test robot wrote:
> > CC: linux-kbuild@vger.kernel.org
> > TO: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Hi Masahiro,
> >
> > First bad commit (maybe != root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > head:   67c0e0cf21cd5065fba45a6a00dd252ae4b9417a
> > commit: 0b1de512cba77e11bdf0305264c56ab61b23b3e1 [18/19] kbuild: use obj-y instead extra-y for objects placed at the head
> > config: hexagon-randconfig-r041-20220831 (https://download.01.org/0day-ci/archive/20220902/202209020450.jH1ovepP-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=0b1de512cba77e11bdf0305264c56ab61b23b3e1
> >         git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> >         git fetch --no-tags masahiroy-kbuild kbuild
> >         git checkout 0b1de512cba77e11bdf0305264c56ab61b23b3e1
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151]; references __vmnewmap
> >    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> > --
> > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2313056 is not in [-2097152, 2097151]; references __vmsetvec
> >    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> > --
> > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152, 2097151]; references memset
> >    >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> >


Thanks for the forwarding.

This is not a regression.

The hexagon was already broken.

It is just that it was deemed to be a new breakage
due to slightly different error messages.


Compare the before/after.




[Before]


  LD      .tmp_vmlinux.kallsyms1
ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4):
relocation R_HEX_B22_PCREL out of range: 2313200 is not in [-2097152,
2097151]; references __vmnewmap
>>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)

ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x120):
relocation R_HEX_B22_PCREL out of range: 2313124 is not in [-2097152,
2097151]; references __vmnewmap
>>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)

ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x12c):
relocation R_HEX_B22_PCREL out of range: 2313072 is not in [-2097152,
2097151]; references __vmsetvec
>>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)

ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x160):
relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152,
2097151]; references memset
>>> defined in ./built-in.a(arch/hexagon/lib/memset.o)
make: *** [Makefile:1170: vmlinux] Error 1
make: Target '__all' not remade because of errors.




[After]

  LD      .tmp_vmlinux.kallsyms1
ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4):
relocation R_HEX_B22_PCREL out of range: 2313200 is not in [-2097152,
2097151]; references __vmnewmap
>>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)

ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x120):
relocation R_HEX_B22_PCREL out of range: 2313124 is not in [-2097152,
2097151]; references __vmnewmap
>>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)

ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c):
relocation R_HEX_B22_PCREL out of range: 2313072 is not in [-2097152,
2097151]; references __vmsetvec
>>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)

ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160):
relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152,
2097151]; references memset
>>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
make: *** [Makefile:1180: vmlinux] Error 1
make: Target '__all' not remade because of errors.























--
Best Regards
Masahiro Yamada
