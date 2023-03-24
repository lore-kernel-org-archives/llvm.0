Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328A619B;
	Fri, 24 Mar 2023 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679677587; x=1711213587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+j8+8EH7v7igKDzkua05nEOfVDj8MT1Wy8xtLwKV2JQ=;
  b=WvRNR5allxNrN6aEV5oerqnsYXFOLgk9fWXsRf+XmlJ6NXaGEaSnVHT8
   kMrD/HWfAmA7CviFGEWeinw7pIz5kS39xjjGoauzuQ/ethTojp0A1PrGt
   DqFvDGLjeS/e8qqdYtHxXfVPU1945fyMzr7Tq6l3ijFj8M2a7HppxIzLC
   ikaBBM2m9Ve+NOWN1TR4fzaussZ4rvFJAb9w/iveTQeknKt6HmMLaYotR
   wrr9LeL45Lbb8wGWpPYQDDvVIp6RC8Y2SLW0x9IxBGIxPH1bMI02uIBaM
   gJw1nxruVYrzVMYhmTh/iVLZZjo+1ziWW7w7cwCjdjIlbsI6sdP2Imm4I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337334743"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="337334743"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 10:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012343600"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="1012343600"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 10:06:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfkrw-000FUg-1k;
	Fri, 24 Mar 2023 17:06:24 +0000
Date: Sat, 25 Mar 2023 01:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 12/20]
 arch/mips/mm/dma-noncoherent.c:63:11: error: type specifier missing,
 defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202303250032.EFuGiCmv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git dma-sync-rework
head:   9a711fbea373208c1eeb2fafb0c744bc23a79a43
commit: 4a04caf3aca03b0132be4519f2064ce6fc6a0f24 [12/20] mips: dma-mapping: split out cache operation logic
config: mips-randconfig-r005-20230323 (https://download.01.org/0day-ci/archive/20230325/202303250032.EFuGiCmv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=4a04caf3aca03b0132be4519f2064ce6fc6a0f24
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic dma-sync-rework
        git checkout 4a04caf3aca03b0132be4519f2064ce6fc6a0f24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250032.EFuGiCmv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/mm/dma-noncoherent.c:63:11: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
                   (void)(*cache_op)(unsigned long start, unsigned long size));
                           ^
                          int
   arch/mips/mm/dma-noncoherent.c:63:4: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
                   (void)(*cache_op)(unsigned long start, unsigned long size));
                    ^
                   int
>> arch/mips/mm/dma-noncoherent.c:63:9: error: function cannot return function type 'int (unsigned long, unsigned long)'
                   (void)(*cache_op)(unsigned long start, unsigned long size));
                         ^
>> arch/mips/mm/dma-noncoherent.c:64:1: error: expected identifier or '('
   {
   ^
   4 errors generated.


vim +/int +63 arch/mips/mm/dma-noncoherent.c

    56	
    57	/*
    58	 * A single sg entry may refer to multiple physically contiguous pages.  But
    59	 * we still need to process highmem pages individually.  If highmem is not
    60	 * configured then the bulk of this loop gets optimized out.
    61	 */
    62	static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
  > 63			(void)(*cache_op)(unsigned long start, unsigned long size));
  > 64	{
    65		struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
    66		unsigned long offset = paddr & ~PAGE_MASK;
    67		size_t left = size;
    68	
    69		do {
    70			size_t len = left;
    71			void *addr;
    72	
    73			if (PageHighMem(page)) {
    74				if (offset + len > PAGE_SIZE)
    75					len = PAGE_SIZE - offset;
    76			}
    77	
    78			addr = kmap_atomic(page);
    79			cache_op(addr + offset, len);
    80			kunmap_atomic(addr);
    81	
    82			offset = 0;
    83			page++;
    84			left -= len;
    85		} while (left);
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
