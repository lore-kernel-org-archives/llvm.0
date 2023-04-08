Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83B1108;
	Sat,  8 Apr 2023 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680942942; x=1712478942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9vktp4z/eaqBeWyi58F6VjddRUwOIbTB9wfYx5xJzFg=;
  b=DvCzhzGZxubeRGZ+rX/TIkOfnd8qVX0HW0B3I6A2zU5LoCIV4cClk7I9
   X52uino+AxVVSWBNEt1+cCBpkmnv0/N/0qDfDUXhRxmxEuivQyFpnU9Qb
   qlGOdZ1EZYN4H8/czomwg81NqUPOetSh/U4TiYnPUTqoMRwpX3NWBZ2N9
   hvPDJo+YHAMVIPGKqRGLJ4DeeUtwxRR7aF1nAmuxZUB9eragcpe+Y1G1a
   kDAzSJa1V1Rj7Wk2cWZjkSSeUZBawlTeFqoYibRZ3fa0nqREaPkI87WPV
   Z6Crj7koDxel1ldVe9QEtD+gcmPvQnUzjZceSzlDQ7v+yyBxG02dwClmr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327216268"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="327216268"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 01:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="777063295"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="777063295"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2023 01:35:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl42t-000TXt-28;
	Sat, 08 Apr 2023 08:35:39 +0000
Date: Sat, 8 Apr 2023 16:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4-dda 2/13]
 kernel/dma/swiotlb.c:218:6: warning: variable 'rc' is uninitialized when
 used here
Message-ID: <202304081648.Ez8xz2eD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4-dda
head:   bb4b60cd5c9d32d52768dd6793aee1fd80d485e7
commit: 5f96005082ab0b64700bc56838cb283bd1404b5c [2/13] swiotlb: check set_memory_decrypted()'s return value
config: x86_64-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081648.Ez8xz2eD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/5f96005082ab0b64700bc56838cb283bd1404b5c
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4-dda
        git checkout 5f96005082ab0b64700bc56838cb283bd1404b5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081648.Ez8xz2eD-lkp@intel.com/

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
