Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC25380;
	Fri,  7 Apr 2023 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680876245; x=1712412245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ZpNeIRWAtQNsCeB1CoRHTg3ws6c5Srn8z/AMh8Cm2Y=;
  b=VIMoPbpnkYJZfqCdpM3JC/1ohu85yFcDwDQkc8STpzQSMBaUEvKT4Zvj
   9CyRvrSSEP3Vgcld7Rgejj0Dk3i8g3o+FLOeKp2nu0x8/2CJcMtNgoXby
   1x1uO3Smyl1Zz8xqOmVENHrzM/bQgd7pUOa6qDOXs7FMdRWZMd90nxeLa
   3f8vankoaBFVb7DHSIjhUEdBz5FZCJhg2NlB+OC2IschymJ5c6N+7jj+8
   EgmYlWQgn9pYTi+eVJ1lxhdJL4UiQAk4SJAJqnrvJ/AXnDq6jN8pVbpcN
   wAP7iLXwgh2MGCFYdMbV7Rg2AAWlR/YBjQ1ICrTG/MVrnbFrg2AnnA+k4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="408122545"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="408122545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 07:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637713486"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637713486"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 07:03:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkmgt-000SZP-1Z;
	Fri, 07 Apr 2023 14:03:47 +0000
Date: Fri, 7 Apr 2023 22:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: introduce defer free for cma
Message-ID: <202304072120.1qQfF86Z-lkp@intel.com>
References: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-introduce-defer-free-for-cma/20230407-184459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1680864131-4675-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] mm: introduce defer free for cma
config: i386-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072120.1qQfF86Z-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7abee7e8d17803e68bfff3de73df6a1dff270ff6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhaoyang-huang/mm-introduce-defer-free-for-cma/20230407-184459
        git checkout 7abee7e8d17803e68bfff3de73df6a1dff270ff6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072120.1qQfF86Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.c:165:19: warning: operator '<<' has lower precedence than '-'; '-' will be evaluated first [-Wshift-op-parentheses]
           val = cma->count - (u64)used << cma->order_per_bit;
                 ~~~~~~~~~~~^~~~~~~~~~~ ~~
   mm/cma.c:165:19: note: place parentheses around the '-' expression to silence this warning
           val = cma->count - (u64)used << cma->order_per_bit;
                            ^
                 (                     )
   mm/cma.c:157:22: warning: unused function 'cma_free_get' [-Wunused-function]
   static unsigned long cma_free_get(struct cma *cma)
                        ^
   2 warnings generated.


vim +165 mm/cma.c

   156	
   157	static unsigned long cma_free_get(struct cma *cma)
   158	{
   159		unsigned long used;
   160		unsigned long val;
   161	
   162		spin_lock_irq(&cma->lock);
   163		/* pages counter is smaller than sizeof(int) */
   164		used = bitmap_weight(cma->bitmap, (int)cma_bitmap_maxno(cma));
 > 165		val = cma->count - (u64)used << cma->order_per_bit;
   166		spin_unlock_irq(&cma->lock);
   167	
   168		return val;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
