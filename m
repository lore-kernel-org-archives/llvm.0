Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A339A210C
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 09:32:54 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nshx1-0004Sp-S5; Sun, 22 May 2022 11:32:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [linux-next:master 10411/13468] arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
Date: Sun, 22 May 2022 11:32:38 +0200
Message-ID: <1913172.usQuhbGJ8B@diego>
In-Reply-To: <202205220805.wrw5woEk-lkp@intel.com>
References: <202205220805.wrw5woEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 22. Mai 2022, 02:38:05 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
> commit: a35707c3d850dda0ceefb75b1b3bd191921d5765 [10411/13468] riscv: add memory-type errata for T-Head
> config: riscv-randconfig-r032-20220522 (https://download.01.org/0day-ci/archive/20220522/202205220805.wrw5woEk-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b369762beb70dfef22c7e793aed79b94d7dc0757)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a35707c3d850dda0ceefb75b1b3bd191921d5765
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout a35707c3d850dda0ceefb75b1b3bd191921d5765
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:29:
>    In file included from include/linux/pgtable.h:6:
>    In file included from arch/riscv/include/asm/pgtable.h:114:
> >> arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
>            ALT_THEAD_PMA(prot_val);
>            ^
>    arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
>            : "0"(_val),                                                    \

This should be fixed by the pending patch
"riscv: Fix ALT_THEAD_PMA's asm parameters" [0]


Heiko

[0] https://lore.kernel.org/all/20220518184529.454008-1-nathan@kernel.org/



