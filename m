Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF108173
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641808767; x=1673344767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jtxGF8+W87i7UvUUkf2/7RJIhcg8mD0uZbLWoozdIdA=;
  b=Ya1mMIydXGQaPJPThqhKfaO06Zo2vVr8SgiIE18Od7ELMOnKqlRcJX1m
   YbPF1FRf99js6J8uGcAigOPtVl0L19Yi3PaDF3PDMvS5VJKB60aBvshtl
   Ygv31JBEhZ2jBRksDrOHSDoHjPvqayHEuxkBJU5Xr4DtF7zMMjllWOZ1A
   6K/jwH8ZwiR5GnaLliQQazZLoxol7fIbSuuRMM+0OblXVi4SDY7fiHOgv
   qoTPc1kEpLhv6vxs4ArGehdkIG39VX7cr7SRL7/y37DLDgW9QZ/4ErQG5
   lf1CQRshzhPClYWDTHQF4VqSF90Km/hg4D2V5qQTylZB5KVqYvQ2PY7fb
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="329535826"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="329535826"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 01:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="472022254"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2022 01:59:25 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6rSX-0002lq-0F; Mon, 10 Jan 2022 09:59:25 +0000
Date: Mon, 10 Jan 2022 17:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v7 6/6] drm/amdgpu: add drm buddy support to amdgpu
Message-ID: <202201101727.lThEC1FU-lkp@intel.com>
References: <20220109141951.134432-6-Arunpravin.PaneerSelvam@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109141951.134432-6-Arunpravin.PaneerSelvam@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arunpravin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 5313fb2c779f74bc5083e9d3738d9b2c2ebe0aa4]

url:    https://github.com/0day-ci/linux/commits/Arunpravin/drm-move-the-buddy-allocator-from-i915-into-common-drm/20220109-222233
base:   5313fb2c779f74bc5083e9d3738d9b2c2ebe0aa4
config: riscv-randconfig-r042-20220109 (https://download.01.org/0day-ci/archive/20220110/202201101727.lThEC1FU-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/851f609d90fe77055b3c45169a1ddd469d5ae8ab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arunpravin/drm-move-the-buddy-allocator-from-i915-into-common-drm/20220109-222233
        git checkout 851f609d90fe77055b3c45169a1ddd469d5ae8ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_buddy.c:764:6: warning: no previous prototype for function 'drm_buddy_module_exit' [-Wmissing-prototypes]
   void drm_buddy_module_exit(void)
        ^
   drivers/gpu/drm/drm_buddy.c:764:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void drm_buddy_module_exit(void)
   ^
   static 
>> drivers/gpu/drm/drm_buddy.c:769:12: warning: no previous prototype for function 'drm_buddy_module_init' [-Wmissing-prototypes]
   int __init drm_buddy_module_init(void)
              ^
   drivers/gpu/drm/drm_buddy.c:769:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init drm_buddy_module_init(void)
   ^
   static 
   2 warnings generated.


vim +/drm_buddy_module_exit +764 drivers/gpu/drm/drm_buddy.c

47666a7da23e2e Arunpravin 2022-01-09  763  
47666a7da23e2e Arunpravin 2022-01-09 @764  void drm_buddy_module_exit(void)
47666a7da23e2e Arunpravin 2022-01-09  765  {
47666a7da23e2e Arunpravin 2022-01-09  766  	kmem_cache_destroy(slab_blocks);
47666a7da23e2e Arunpravin 2022-01-09  767  }
47666a7da23e2e Arunpravin 2022-01-09  768  
47666a7da23e2e Arunpravin 2022-01-09 @769  int __init drm_buddy_module_init(void)
47666a7da23e2e Arunpravin 2022-01-09  770  {
47666a7da23e2e Arunpravin 2022-01-09  771  	slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
47666a7da23e2e Arunpravin 2022-01-09  772  	if (!slab_blocks)
47666a7da23e2e Arunpravin 2022-01-09  773  		return -ENOMEM;
47666a7da23e2e Arunpravin 2022-01-09  774  
47666a7da23e2e Arunpravin 2022-01-09  775  	return 0;
47666a7da23e2e Arunpravin 2022-01-09  776  }
47666a7da23e2e Arunpravin 2022-01-09  777  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
