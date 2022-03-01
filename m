Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF4179
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 12:32:45 +0000 (UTC)
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K7GP72Cv4z67nSs;
	Tue,  1 Mar 2022 20:13:31 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 13:14:36 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 1 Mar
 2022 12:14:35 +0000
Date: Tue, 1 Mar 2022 12:14:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
	<linux-arm-kernel@lists.infradead.org>, <arm@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>
Subject: Re: [soc:arm/soc 6/8]
 arch/arm/mach-pxa/include/mach/uncompress.h:62:6: error: expected
 expression
Message-ID: <20220301121434.00003287@Huawei.com>
In-Reply-To: <202203010702.6TRDNN1H-lkp@intel.com>
References: <202203010702.6TRDNN1H-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml711-chm.china.huawei.com (10.201.108.62) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected

On Tue, 1 Mar 2022 07:33:39 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/soc
> head:   e6e6479c27aa22d11ff7109125dd5ec9ef276de8
> commit: 28f74201e37ccf3063e359bfe346b09400af9bab [6/8] ARM: pxa: remove Intel Imote2 and Stargate 2 boards
> config: arm-colibri_pxa300_defconfig (https://download.01.org/0day-ci/archive/20220301/202203010702.6TRDNN1H-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=28f74201e37ccf3063e359bfe346b09400af9bab
>         git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>         git fetch --no-tags soc arm/soc
>         git checkout 28f74201e37ccf3063e359bfe346b09400af9bab
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Sorry!

> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm/boot/compressed/misc.c:29:
> >> arch/arm/mach-pxa/include/mach/uncompress.h:62:6: error: expected expression  
>                || machine_is_cm_x300() || machine_is_balloon3())

I messed up a rebase so there is a stray || on the line above this

Arnd, new version or are you fine to tidy that up?

Thanks,

Jonathan

>                ^
>    arch/arm/boot/compressed/misc.c:126:17: warning: no previous prototype for function '__div0' [-Wmissing-prototypes]
>    asmlinkage void __div0(void)
>                    ^
>    arch/arm/boot/compressed/misc.c:126:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    asmlinkage void __div0(void)
>               ^
>               static 
>    arch/arm/boot/compressed/misc.c:133:6: warning: no previous prototype for function '__stack_chk_fail' [-Wmissing-prototypes]
>    void __stack_chk_fail(void)
>         ^
>    arch/arm/boot/compressed/misc.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void __stack_chk_fail(void)
>    ^
>    static 
>    arch/arm/boot/compressed/misc.c:142:1: warning: no previous prototype for function 'decompress_kernel' [-Wmissing-prototypes]
>    decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
>    ^
>    arch/arm/boot/compressed/misc.c:141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void
>    ^
>    static 
>    arch/arm/boot/compressed/misc.c:164:6: warning: no previous prototype for function 'fortify_panic' [-Wmissing-prototypes]
>    void fortify_panic(const char *name)
>         ^
>    arch/arm/boot/compressed/misc.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void fortify_panic(const char *name)
>    ^
>    static 
>    4 warnings and 1 error generated.
> 
> 
> vim +62 arch/arm/mach-pxa/include/mach/uncompress.h
> 
> ^1da177e4c3f41 include/asm-arm/arch-pxa/uncompress.h       Linus Torvalds    2005-04-16  53  
> 6d3dfe4a314147 include/asm-arm/arch-pxa/uncompress.h       Eric Miao         2008-06-02  54  static inline void arch_decomp_setup(void)
> 6d3dfe4a314147 include/asm-arm/arch-pxa/uncompress.h       Eric Miao         2008-06-02  55  {
> 2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  56  	/* initialize to default */
> 2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  57  	uart_base = FFUART_BASE;
> 2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  58  	uart_shift = 2;
> 2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  59  	uart_is_pxa = 1;
> 2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  60  
> 28f74201e37ccf arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2022-02-27  61  	if (machine_is_littleton() ||  machine_is_csb726() ||
> 2a23ec3679d84a arch/arm/mach-pxa/include/mach/uncompress.h Jonathan McDowell 2009-07-04 @62  	    || machine_is_cm_x300() || machine_is_balloon3())
> 
> :::::: The code at line 62 was first introduced by commit
> :::::: 2a23ec3679d84ac243add761fa3d3872cf6dcb11 [ARM] pxa: balloon3 (http://balloonboard.org/) base machine support
> 
> :::::: TO: Jonathan McDowell <noodles@earth.li>
> :::::: CC: Eric Miao <eric.y.miao@gmail.com>
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

