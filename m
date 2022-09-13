Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE41FCC
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 02:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663037868; x=1694573868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igZFmcra99pSCHBocBFCevoqU/tRbp9DHblEw52maIg=;
  b=lMAtYudtLEEtSNLlHVoMERQ9t9wCfLDfB5iVkSe7X5Qh/pupd4Mc7ZoJ
   ficZUO+LqD7dBiRGYwgVz1K4xkob4hYwfi6PLx0wEJVYeIHaZLYcl0Ysq
   n9F78Z9afZk19gXt8ehbFNSbpgxIWV9jTvx/bVlKRo60KgdPL2JmNF2Sv
   lAbiqXb6zfBmbuAY/GbFOirHEXwOyaV3FgyqKoq3S6I4eTmKDONID+IfG
   +hjK5b4dyYQ59CHpvRCmS9asrb/OxF6XwoM2snaAkrQYUJLorOsy4hGIF
   HeD+F7PLXbM9luwLwEtM97ICm0vRTO0zebcPGgxs4FtF5v5zOvo9thDVw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="299360745"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="299360745"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 19:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="567414232"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 19:57:41 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXw7I-00038F-37;
	Tue, 13 Sep 2022 02:57:40 +0000
Date: Tue, 13 Sep 2022 10:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [intel-tdx:guest-hardening-rebased 13/39]
 arch/x86/coco/tdx/tdx.c:531:15: warning: no previous prototype for function
 'tdx_mmio_readq'
Message-ID: <202209131030.eVPnwS0j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

FYI, the error/warning still remains.

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   1f71e25a309e1f46dadb7c65e4383c3690dcd3be
commit: 0cf382195475412201e134e2925bb276445a8460 [13/39] x86/tdx: Enable direct iomap MMIO optimizations
config: x86_64-randconfig-r025-20220912 (https://download.01.org/0day-ci/archive/20220913/202209131030.eVPnwS0j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/0cf382195475412201e134e2925bb276445a8460
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-hardening-rebased
        git checkout 0cf382195475412201e134e2925bb276445a8460
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c:298:14: warning: no previous prototype for function 'tdx_write_msr' [-Wmissing-prototypes]
   void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
                ^
   arch/x86/coco/tdx/tdx.c:298:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
   ^
   static 
>> arch/x86/coco/tdx/tdx.c:531:15: warning: no previous prototype for function 'tdx_mmio_readq' [-Wmissing-prototypes]
   unsigned long tdx_mmio_readq(void __iomem* addr)
                 ^
   arch/x86/coco/tdx/tdx.c:531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long tdx_mmio_readq(void __iomem* addr)
   ^
   static 
   2 warnings generated.


vim +/tdx_mmio_readq +531 arch/x86/coco/tdx/tdx.c

   530	
 > 531	unsigned long tdx_mmio_readq(void __iomem* addr)
   532	{
   533		unsigned long val;
   534	
   535		if (tdx_virt_mmio(8, false, (unsigned long)addr, &val))
   536			return 0xffffffffffffffff;
   537		return val;
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
