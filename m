Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C752F2B
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 23:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660778863; x=1692314863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bF8RhQapM9aMltjQD5Fv7KZEqa5L4QRLLLTgNQOxoOc=;
  b=X/JRwJd6lcxODD/KJcLULFqpkTqt7mCIG0g4Rp1zEhwOvzAR3g82LC4m
   hu/+Af8DX8D7bBLV06vvX9dFgXDLBrKeJsKepUhYV9Li9qGqh4n3A96j9
   BP0s1z5PbJszKy2G6TmcwXNPeFUlriOJhKVtZNeVAYsAX8qb2FnZsIIB0
   PlCl7xuNd5jTs2iW+H7lf62tZ+kw7kaDwj36iHgY8vRHJwZXhNeTuOdQB
   THMrGtUGfRahLr1hRnoJJw0Fvg/ww/9oQr61XXayrlGHuaz6svIYt3ja+
   WHHqUKD8KT36kKkChODvR7JHuk6C24twNWj0JVuTrObzyZQfs9dsFWjX5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="378916499"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; 
   d="scan'208";a="378916499"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 16:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; 
   d="scan'208";a="636575820"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2022 16:27:41 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOSRo-0001TF-1g;
	Wed, 17 Aug 2022 23:27:40 +0000
Date: Thu, 18 Aug 2022 07:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: [rppt:crash-kernel/arm64-remap/v0.1 4/5] arch/arm64/mm/init.c:133:3:
 error: use of undeclared identifier 'crashkres_protection_possible'
Message-ID: <202208180702.BgAbSr7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git crash-kernel/arm64-remap/v0.1
head:   083629d699170f5a86078d0a7afbe647c3a571cb
commit: 3aaa4a222ab056611236c4c42499d24c8317bc96 [4/5] arm64/mm: remap crash kernel with base pages even if rodata_full disabled
config: arm64-randconfig-r034-20220818 (https://download.01.org/0day-ci/archive/20220818/202208180702.BgAbSr7d-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=3aaa4a222ab056611236c4c42499d24c8317bc96
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt crash-kernel/arm64-remap/v0.1
        git checkout 3aaa4a222ab056611236c4c42499d24c8317bc96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/mm/init.c:133:3: error: use of undeclared identifier 'crashkres_protection_possible'
                   crashkres_protection_possible = true;
                   ^
   arch/arm64/mm/init.c:151:2: error: use of undeclared identifier 'crashkres_protection_possible'
           crashkres_protection_possible = true;
           ^
   2 errors generated.


vim +/crashkres_protection_possible +133 arch/arm64/mm/init.c

   119	
   120	static unsigned long long __init
   121	reserve_remap_crashkernel(unsigned long long crash_base,
   122				  unsigned long long crash_size,
   123				  unsigned long long crash_max)
   124	{
   125		unsigned long long size;
   126	
   127		/*
   128		 * If linear map uses base pages or there is no ZONE_DMA/ZONE_DMA32
   129		 * the crashk_res will be mapped with PTEs in mmu::map_mem()
   130		 */
   131		if (can_set_direct_map() || IS_ENABLED(CONFIG_KFENCE) ||
   132		    !have_zone_dma()) {
 > 133			crashkres_protection_possible = true;
   134			return 0;
   135		}
   136	
   137		if (crash_base)
   138			return 0;
   139	
   140		size = ALIGN(crash_size, PUD_SIZE);
   141	
   142		crash_base = memblock_phys_alloc_range(size, PUD_SIZE, 0, crash_max);
   143		if (!crash_base)
   144			return 0;
   145	
   146		if (remap_crashkernel(crash_base, crash_size, size)) {
   147			memblock_phys_free(crash_base, size);
   148			return 0;
   149		}
   150	
   151		crashkres_protection_possible = true;
   152		memblock_phys_free(crash_base + crash_size, size - crash_size);
   153	
   154		return crash_base;
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
