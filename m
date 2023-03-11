Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AFC7B;
	Sat, 11 Mar 2023 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678566068; x=1710102068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4jOOpvL1F6T48/D/lE3/KCvZCzCNz8pmZKc/suVL8Y=;
  b=UPHlhMUpABQi/rq5B01HT2HyXU7T4bKoj06Um+ITa2JCQo7qfPk036IB
   rFVuedHYGIwARUZhFEUy3pew5QQW9HrZntDgsG7uKUEnMnejNfOU7HBp9
   8NS2s/sBmTJOSW8xt1avsCqlDLkhH+la4M+mJUQnAr2eoaNqO2m1wDxdT
   1N9FfU2KfFpEd+5+VCKoAJe7rSDyxe+F2tSUcKrS12Z1+8VD88EggnFA1
   pJHlPr2tusSsBUgb2EvGZFL1065nSzl/OucbnSm0+4LQ09pkBmGL9pZDP
   fR9VPiC0IL8vvhWYZswriV57Od7LPXjVWBCp3KttghPqAn2NmGrw9WMRp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="401803203"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="401803203"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 12:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="708396095"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="708396095"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Mar 2023 12:21:01 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb5i8-0004mz-38;
	Sat, 11 Mar 2023 20:21:00 +0000
Date: Sun, 12 Mar 2023 04:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:dpt_debug 4/4]
 drivers/gpu/drm/i915/display/intel_dpt.c:92:14: warning: format specifies
 type 'unsigned long long' but the argument has type 'dma_addr_t' (aka
 'unsigned int')
Message-ID: <202303120405.hj8Locfa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git dpt_debug
head:   93b6968da31ee411cedc83b08b625e06525ca566
commit: 93b6968da31ee411cedc83b08b625e06525ca566 [4/4] dpt debug
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230312/202303120405.hj8Locfa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/vsyrjala/linux/commit/93b6968da31ee411cedc83b08b625e06525ca566
        git remote add vsyrjala https://github.com/vsyrjala/linux.git
        git fetch --no-tags vsyrjala dpt_debug
        git checkout 93b6968da31ee411cedc83b08b625e06525ca566
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120405.hj8Locfa-lkp@intel.com/

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
https://github.com/intel/lkp-tests
