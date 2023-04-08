Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9C1841;
	Sat,  8 Apr 2023 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680942342; x=1712478342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1DRq7kqC2jvoWeSrbac6WuauaPY+WHIJ9UJQP2UEQE=;
  b=SqFK7SRklDCcNTrJV/YA5FpROH1xw8o95PKUTzjH7eco6/bz5eld1MAk
   zEakhrZbav9Y7i+Kc4fWC6Itc9SXsdqgr/vEIBdoWM9zT6syGBr4DyYJp
   5jHXnJ7ppsfVUjvfLSYvWlQlZL1LmXWoVg9gOMXqUlt7u8AYdsqpVlk49
   EXdughkLrYElc7WnCab+v2ycKgB1lE9D1QFIy1rT+7JJ86n0+C/RJ/SDQ
   ZX1Bhk1DX5GECZ4sAgKsJnly8HwkZc0K3E6KHoLk4ZLnqYzFnzlAF4fv1
   6vbigFE31Ij0RCeTRP4+N2XhvFgzcZJq0v6XKf0b7r1opQiMYIxDrKaP8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="343129450"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="343129450"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 01:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="687745246"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="687745246"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Apr 2023 01:25:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl3tD-000TWv-0B;
	Sat, 08 Apr 2023 08:25:39 +0000
Date: Sat, 8 Apr 2023 16:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4-dda 3/14]
 kernel/dma/swiotlb.c:218:6: warning: variable 'rc' is uninitialized when
 used here
Message-ID: <202304081641.C8lyXUZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4-dda
head:   bd34cfc6af2bd56b3f4bf2fe22aa6f293ae223cd
commit: 736345bba3e33ac9ea55c13f4dbfd765b70dffb1 [3/14] swiotlb: check set_memory_decrypted()'s return value
config: x86_64-randconfig-a003-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081641.C8lyXUZX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/736345bba3e33ac9ea55c13f4dbfd765b70dffb1
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4-dda
        git checkout 736345bba3e33ac9ea55c13f4dbfd765b70dffb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081641.C8lyXUZX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:218:6: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
           if (rc) {
               ^~
   kernel/dma/swiotlb.c:212:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   1 warning generated.


vim +/rc +218 kernel/dma/swiotlb.c

   201	
   202	/*
   203	 * Early SWIOTLB allocation may be too early to allow an architecture to
   204	 * perform the desired operations.  This function allows the architecture to
   205	 * call SWIOTLB when the operations are possible.  It needs to be called
   206	 * before the SWIOTLB memory is used.
   207	 */
   208	void __init swiotlb_update_mem_attributes(void)
   209	{
   210		struct io_tlb_mem *mem = &io_tlb_default_mem;
   211		unsigned long bytes;
   212		int rc;
   213	
   214		if (!mem->nslabs || mem->late_alloc)
   215			return;
   216		bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
   217		set_memory_decrypted((unsigned long)mem->vaddr, bytes >> PAGE_SHIFT);
 > 218		if (rc) {
   219			pr_err("Failed to decrypt swiotlb buffer (%d): disabling swiotlb!\n",
   220			       rc);
   221			mem->nslabs = 0;
   222			return;
   223		}
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
