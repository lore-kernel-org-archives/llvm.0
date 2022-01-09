Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E429CA
	for <llvm@lists.linux.dev>; Sun,  9 Jan 2022 09:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641719792; x=1673255792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7D0PM4OHDUmXxmeiLZy8Dsjc/ln6HgVX6arrmQ+DLg=;
  b=FPVKuxzjq0n8q1SA/moswG9k31CBvLC5kL2mxi8qGH1Z3tnEgpHLbyGU
   sYIs0PwqJA95ux1cVgcBUVLwUBTRfZ60iTub1uPUMAO8W1ZHvD8xxDr5i
   7JnsYHSNf0oOscGIuQxqQgRCxWpR05mVsxNOsKCawhaJ6d2PlborOlCDV
   dHQTPl6ZxKvY7OAWF5lUFvrIj8eC9d8G48qwI6xEV7PU9mzOzmlBSoGiJ
   n0lu8YHAK8tMXZP70RPjQdgMrtF/3eqQimULDfsb4ghLfvvBgS8yNdBwt
   6EhBRlS11532NeFiEm368rCQDiCio6rDHVuJfVC/R/HXDpYrJn7R6SKUy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10221"; a="242870845"
X-IronPort-AV: E=Sophos;i="5.88,274,1635231600"; 
   d="scan'208";a="242870845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 01:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,274,1635231600"; 
   d="scan'208";a="622376834"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Jan 2022 01:16:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6UJQ-0001UF-NC; Sun, 09 Jan 2022 09:16:28 +0000
Date: Sun, 9 Jan 2022 17:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>, Tony Luck <tony.luck@intel.com>
Subject: [intel-tdx:guest-upstream 25/33] arch/x86/mm/mem_encrypt.c:69:13:
 warning: no previous prototype for function 'mem_encrypt_init'
Message-ID: <202201091704.eZKOuCWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git guest-upstream
head:   ce71b1628ffd76a06c99780f94767aad8e44305e
commit: 6cff98f39a336faa10ace47660265207d2f7a605 [25/33] x86/mm/cpa: Add support for TDX shared memory
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220109/202201091704.eZKOuCWs-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/6cff98f39a336faa10ace47660265207d2f7a605
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-upstream
        git checkout 6cff98f39a336faa10ace47660265207d2f7a605
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/mm/mem_encrypt.c:69:13: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
   void __init mem_encrypt_init(void)
               ^
   arch/x86/mm/mem_encrypt.c:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init mem_encrypt_init(void)
   ^
   static 
   1 warning generated.


vim +/mem_encrypt_init +69 arch/x86/mm/mem_encrypt.c

c329da7c594493 Kirill A. Shutemov 2020-03-18  67  
c329da7c594493 Kirill A. Shutemov 2020-03-18  68  /* Architecture __weak replacement functions */
c329da7c594493 Kirill A. Shutemov 2020-03-18 @69  void __init mem_encrypt_init(void)
c329da7c594493 Kirill A. Shutemov 2020-03-18  70  {
c329da7c594493 Kirill A. Shutemov 2020-03-18  71  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
c329da7c594493 Kirill A. Shutemov 2020-03-18  72  		return;
c329da7c594493 Kirill A. Shutemov 2020-03-18  73  
c329da7c594493 Kirill A. Shutemov 2020-03-18  74  	/* Call into SWIOTLB to update the SWIOTLB DMA buffers */
c329da7c594493 Kirill A. Shutemov 2020-03-18  75  	swiotlb_update_mem_attributes();
c329da7c594493 Kirill A. Shutemov 2020-03-18  76  
c329da7c594493 Kirill A. Shutemov 2020-03-18  77  	print_mem_encrypt_feature_info();
c329da7c594493 Kirill A. Shutemov 2020-03-18  78  }
c329da7c594493 Kirill A. Shutemov 2020-03-18  79  

:::::: The code at line 69 was first introduced by commit
:::::: c329da7c594493b04b3edf8941dca27fedb214c7 x86: Move common memory encryption code to mem_encrypt.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
