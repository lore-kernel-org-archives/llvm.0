Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD42C82
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640005810; x=1671541810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4q+wbaPXL0X+akHl5q8XnxXTKXTiORmA6Vv9SNX7l8o=;
  b=m8JIUYGy5ZvyqoyNQzjRfhPzmgGtE2Gw+eooIdfD0mehCr497Udb4fjz
   sIqxj/I98EG48E7sPp7egJJ3WuFK9xhrg1QtYT0lp66bf+M/+U6/zkFr1
   eMa2AfVxo574cqtMA9ZTQ1Le1JzoFpYLS1dZ0fbCWVWcB5g3FWRtRcbMv
   /qjZJIz9Sr2A5x5jitA7dD1/IjnojoVJc+iwvUVbWK87EvmxtQs0T3/fs
   8LgebU0I2Qzo/uHt5XAz6VOx6bJ8Ebrr9Ipy3AN28tryVEPSGQww+Omd2
   ZPryue1BbV5scfG2if7aqcglLMQOoNMwVJO6Pm8FcPjErXgsVLKOyfWP0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="238903940"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="238903940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 05:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="684260280"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2021 05:10:07 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzIQY-0007mb-LU; Mon, 20 Dec 2021 13:10:06 +0000
Date: Mon, 20 Dec 2021 21:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 1/5] kernel/dma/swiotlb.c:176:11: warning:
 format specifies type 'unsigned long long' but the argument has type
 'phys_addr_t' (aka 'unsigned int')
Message-ID: <202112202102.zfnhbn2Q-lkp@intel.com>
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
head:   63cd06c67a2f46009da6e88ca46f9c7231ab8998
commit: f16dc95481e2ef2c385008f8b7bd382ea6919ee2 [1/5] swiotlb: Add swiotlb bounce buffer remap function for HV IVM
config: i386-randconfig-a001-20211219 (https://download.01.org/0day-ci/archive/20211220/202112202102.zfnhbn2Q-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 683cbc12b33e5c8dc8d29bf5ed79fbf45763aadd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=f16dc95481e2ef2c385008f8b7bd382ea6919ee2
        git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
        git fetch --no-tags hyperv hyperv-next
        git checkout f16dc95481e2ef2c385008f8b7bd382ea6919ee2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:176:11: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
                                  paddr, bytes);
                                  ^~~~~
   include/linux/printk.h:493:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +176 kernel/dma/swiotlb.c

   160	
   161	/*
   162	 * Remap swioltb memory in the unencrypted physical address space
   163	 * when swiotlb_unencrypted_base is set. (e.g. for Hyper-V AMD SEV-SNP
   164	 * Isolation VMs).
   165	 */
   166	static void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
   167	{
   168		void *vaddr = NULL;
   169	
   170		if (swiotlb_unencrypted_base) {
   171			phys_addr_t paddr = mem->start + swiotlb_unencrypted_base;
   172	
   173			vaddr = memremap(paddr, bytes, MEMREMAP_WB);
   174			if (!vaddr)
   175				pr_err("Failed to map the unencrypted memory %llx size %lx.\n",
 > 176				       paddr, bytes);
   177		}
   178	
   179		return vaddr;
   180	}
   181	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
