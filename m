Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A47168
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 03:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639799016; x=1671335016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXptn5xPUR40U4QhdwFu1hawOnMsfvW05PjXCMVS+a4=;
  b=nztc9x8dY/lBXH9hvl1ZoY+IOhGxe1JCMhqGAfHVnQDZdBIJNm7uPVPa
   W0H5X5cqPwWVqFVS1Br0YeQ5y56G1zeKqT5Wbcl7lyiFn1+ThmLk0upVF
   WYmfvMnKwDZsdJB0DMsIk0MzLPna9TbXa7vfF77J2iZDCVrrdL0rVnyIF
   68KRBEyfHKrdIHlDzO3iNgRHno80KbMOPWUzQDNRBAUk0+36IZH7pzIUa
   KIzl8Mu1+wFILzoFEa/CtWr4H5lkqndBROZZMhT5OK60sXpVlPKmNAraG
   /xuDusyUQDGTYMuCSFzEvqggGajdODFCPKCtm/rejW15N6jqXfRwHncGG
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="264059599"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="264059599"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 19:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="507009626"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2021 19:43:31 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myQd9-0005Yw-9y; Sat, 18 Dec 2021 03:43:31 +0000
Date: Sat, 18 Dec 2021 11:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 1/5] kernel/dma/swiotlb.c:166:7: warning: no
 previous prototype for function 'swiotlb_mem_remap'
Message-ID: <202112181133.7Ki4aggA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   19fd7ca00201c0525452dcf5a490e4b01674ef4c
commit: 32be866293fe5355adbf91da1cd612f439fc71e5 [1/5] swiotlb: Add swiotlb bounce buffer remap function for HV IVM
config: x86_64-randconfig-r025-20211216 (https://download.01.org/0day-ci/archive/20211218/202112181133.7Ki4aggA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=32be866293fe5355adbf91da1cd612f439fc71e5
        git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
        git fetch --no-tags hyperv hyperv-next
        git checkout 32be866293fe5355adbf91da1cd612f439fc71e5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:166:7: warning: no previous prototype for function 'swiotlb_mem_remap' [-Wmissing-prototypes]
   void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
         ^
   kernel/dma/swiotlb.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
   ^
   static 
   1 warning generated.


vim +/swiotlb_mem_remap +166 kernel/dma/swiotlb.c

   160	
   161	/*
   162	 * Remap swioltb memory in the unencrypted physical address space
   163	 * when swiotlb_unencrypted_base is set. (e.g. for Hyper-V AMD SEV-SNP
   164	 * Isolation VMs).
   165	 */
 > 166	void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
   167	{
   168		void *vaddr = NULL;
   169	
   170		if (swiotlb_unencrypted_base) {
   171			phys_addr_t paddr = mem->start + swiotlb_unencrypted_base;
   172	
   173			vaddr = memremap(paddr, bytes, MEMREMAP_WB);
   174			if (!vaddr)
   175				pr_err("Failed to map the unencrypted memory %llx size %lx.\n",
   176				       paddr, bytes);
   177		}
   178	
   179		return vaddr;
   180	}
   181	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
