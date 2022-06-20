Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C37B
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 00:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655686397; x=1687222397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eSyhWoubqxOZgI663razC/xezSx5QTWdtR1Lli1ARrY=;
  b=K7xalG92vzq6a1062UC8yS4L9zw80OkzmGFvUNU6IGk9kT+WpbYLjPuN
   M1u6huk6cw2J6ZehZRYOcAW2BPh5szWQNyqDWlcBqL0UAjT1341Kn3Frb
   iD3018qkzb8/Y0hBEk/hR7MczFc1M+5T6OmEirsrAwf/yzbBZhqFqVSRq
   4MqslWiSvU+mJD1Wp3fpeN77aEhAVsabylABF7L3PHyGz7awLL2illh+8
   5ojPYmJZtTzJ27eXSkEB9wUnPgO8u3jaDbUb6Qqim5436vGbVvK+yz5ft
   OaSifQ3UqKTMT7YSiwClQMfyEBnnkwmgD+3qofC06yJWy6j3mV64U8LXz
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279825391"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="279825391"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 17:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="642862147"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jun 2022 17:53:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o35fH-000Rih-D7;
	Mon, 20 Jun 2022 00:53:15 +0000
Date: Mon, 20 Jun 2022 08:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/4] riscv: implement cache-management errata for T-Head
 SoCs
Message-ID: <202206200818.xjxUdFxv-lkp@intel.com>
References: <20220619203212.3604485-5-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619203212.3604485-5-heiko@sntech.de>

Hi Heiko,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220617]
[cannot apply to robh/for-next linus/master v5.19-rc2 v5.19-rc1 v5.18 v5.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/riscv-implement-Zicbom-based-CMO-instructions-the-t-head-variant/20220620-043420
base:    07dc787be2316e243a16a33d0a9b734cd9365bd3
config: riscv-randconfig-r042-20220620 (https://download.01.org/0day-ci/archive/20220620/202206200818.xjxUdFxv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/df19d619d986c028837235ac90ff3cdaf770bb10
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Stuebner/riscv-implement-Zicbom-based-CMO-instructions-the-t-head-variant/20220620-043420
        git checkout df19d619d986c028837235ac90ff3cdaf770bb10
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/dma-noncoherent.c:24:3: error: expected ')'
                   ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
                   ^
   arch/riscv/include/asm/errata_list.h:128:2: note: expanded from macro 'ALT_CMO_OP'
           __nops(6),                                                      \
           ^
   arch/riscv/mm/dma-noncoherent.c:27:3: error: expected ')'
                   ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
                   ^
   arch/riscv/include/asm/errata_list.h:128:2: note: expanded from macro 'ALT_CMO_OP'
           __nops(6),                                                      \
           ^
   arch/riscv/mm/dma-noncoherent.c:30:3: error: expected ')'
                   ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
                   ^
   arch/riscv/include/asm/errata_list.h:128:2: note: expanded from macro 'ALT_CMO_OP'
           __nops(6),                                                      \
           ^
   arch/riscv/mm/dma-noncoherent.c:47:3: error: expected ')'
                   ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
                   ^
   arch/riscv/include/asm/errata_list.h:128:2: note: expanded from macro 'ALT_CMO_OP'
           __nops(6),                                                      \
           ^
   arch/riscv/mm/dma-noncoherent.c:58:2: error: expected ')'
           ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
           ^
   arch/riscv/include/asm/errata_list.h:128:2: note: expanded from macro 'ALT_CMO_OP'
           __nops(6),                                                      \
           ^
   5 errors generated.


vim +24 arch/riscv/mm/dma-noncoherent.c

16051acb7ada26 Heiko Stuebner 2022-06-19  16  
16051acb7ada26 Heiko Stuebner 2022-06-19  17  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
16051acb7ada26 Heiko Stuebner 2022-06-19  18  			      enum dma_data_direction dir)
16051acb7ada26 Heiko Stuebner 2022-06-19  19  {
16051acb7ada26 Heiko Stuebner 2022-06-19  20  	void *vaddr = phys_to_virt(paddr);
16051acb7ada26 Heiko Stuebner 2022-06-19  21  
16051acb7ada26 Heiko Stuebner 2022-06-19  22  	switch (dir) {
16051acb7ada26 Heiko Stuebner 2022-06-19  23  	case DMA_TO_DEVICE:
16051acb7ada26 Heiko Stuebner 2022-06-19 @24  		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
16051acb7ada26 Heiko Stuebner 2022-06-19  25  		break;
16051acb7ada26 Heiko Stuebner 2022-06-19  26  	case DMA_FROM_DEVICE:
16051acb7ada26 Heiko Stuebner 2022-06-19  27  		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
16051acb7ada26 Heiko Stuebner 2022-06-19  28  		break;
16051acb7ada26 Heiko Stuebner 2022-06-19  29  	case DMA_BIDIRECTIONAL:
16051acb7ada26 Heiko Stuebner 2022-06-19  30  		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
16051acb7ada26 Heiko Stuebner 2022-06-19  31  		break;
16051acb7ada26 Heiko Stuebner 2022-06-19  32  	default:
16051acb7ada26 Heiko Stuebner 2022-06-19  33  		break;
16051acb7ada26 Heiko Stuebner 2022-06-19  34  	}
16051acb7ada26 Heiko Stuebner 2022-06-19  35  }
16051acb7ada26 Heiko Stuebner 2022-06-19  36  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
