Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160391DDC2;
	Wed, 21 Jun 2023 18:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687372283; x=1718908283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfZV5Ip9584RpmiuEphRKpt7DdbJbjAeaEZE7KmdUHk=;
  b=eievdNTf51ooFdmPcTcjSlUhCgpNnLDDpJT6dYpH98boe6Q4y88kQpuY
   QVNwYmEXOfdDeTrKyIyNyjPeOIinIyhmoYszr6X7zG0lV/xURdZLQrSod
   3fBgPVtQIUEMzyWiTr+Yd4kcOyOuEQgVSN2nPwxDAGeufwXC4sHTtm6B7
   3LaT6Wk4KfnaKNkqsNnqlpX350yP0CAbZYWqFTAOESzWSWVG2DZ7bk7iS
   WRYKBnzI1kL+Zn9dY6Gn7fhxhn33/1ZZqJNO81PuCzm4jay+KnDf6Cvv1
   HZOyyzBKWAkQ2RdvYjBY6/qSFl7DyqCw8vkVLDFYDGgz9IX+B5WxXO45f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359131869"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="359131869"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 11:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="838723061"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="838723061"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 11:31:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC2br-00071N-0P;
	Wed, 21 Jun 2023 18:31:15 +0000
Date: Thu, 22 Jun 2023 02:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:dpt_debug_2 2/3]
 drivers/gpu/drm/i915/display/intel_dpt.c:92:14: warning: format specifies
 type 'unsigned long long' but the argument has type 'dma_addr_t' (aka
 'unsigned int')
Message-ID: <202306220217.ngXJHivB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git dpt_debug_2
head:   2f46ac9af5a093e6b0363752c07692d34672ff3a
commit: 5eeedbfbcc698af4c74b3bfabf7fae2a309ed466 [2/3] dpt debug
config: i386-randconfig-i014-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220217.ngXJHivB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220217.ngXJHivB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220217.ngXJHivB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dpt.c:92:14: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                           dpt, i++, page_to_phys(page));
                                     ^~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:469:46: note: expanded from macro 'drm_err'
           __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
                                                ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:456:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                  ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   arch/x86/include/asm/io.h:159:31: note: expanded from macro 'page_to_phys'
   #define page_to_phys(page)    ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +92 drivers/gpu/drm/i915/display/intel_dpt.c

    82	
    83	static void intel_dpt_debug(struct i915_address_space *vm)
    84	{
    85		struct i915_dpt *dpt = i915_vm_to_dpt(vm);
    86		struct page *page;
    87		struct sgt_iter iter;
    88		int i = 0;
    89	
    90		for_each_sgt_page(page, iter, dpt->obj->mm.pages)
    91			drm_err(&vm->i915->drm, "dpt %p [%d] physical address 0x%llx\n",
  > 92				dpt, i++, page_to_phys(page));
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
