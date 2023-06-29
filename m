Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606961FC8;
	Thu, 29 Jun 2023 05:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688015353; x=1719551353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y1Y6IIeTig5+GnBwvFQEyUgrgjt9zq6I4ZoWrWE/Jx0=;
  b=BezyJn5Eqr2xLc7hMF5Yf74UuQqn+MxL/27yGOdCuGHA1DvFC7Y609yU
   T+Uya8tsZUGI1aBnhjjDVedIQ28HEQGp3ARaJxmrmrZJT33oyKtNTui3t
   qK0v23ZDFWRPnkOTNtXZo/kXAHchJix911PaSR+J32VHqgJo5T+Yajhe8
   DFyT2LNG0niSp/U9OFtXi4LUJQnoS+g/zOykgA8HDkg+bvp8wOLMlNkYc
   Co5VHpIvVNUiK9U6JyXHSLbI8bFQVjR2lknac9+eyGPvIRneGnNo5MgVZ
   GF7AoOuvUMayNeffwtilhYT6SPyNuOwdDHdDKHvOGgR1ISdP8EEnkFTfE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="341607459"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="341607459"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 22:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="787254436"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="787254436"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2023 22:09:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEju1-000DqH-1i;
	Thu, 29 Jun 2023 05:09:09 +0000
Date: Thu, 29 Jun 2023 13:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:dpt_debug_2 2/6]
 drivers/gpu/drm/i915/display/intel_dpt.c:92:14: error: format specifies type
 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned
 int')
Message-ID: <202306291341.5XLYJC2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git dpt_debug_2
head:   1573b5144c0071b9c72796d530a5a18aa359ed94
commit: 5eeedbfbcc698af4c74b3bfabf7fae2a309ed466 [2/6] dpt debug
config: i386-randconfig-i004-20230628 (https://download.01.org/0day-ci/archive/20230629/202306291341.5XLYJC2w-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291341.5XLYJC2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291341.5XLYJC2w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dpt.c:92:14: error: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Werror,-Wformat]
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
   1 error generated.


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
