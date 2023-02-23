Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589827460;
	Thu, 23 Feb 2023 19:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677181404; x=1708717404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YxKsKOdllrP32T/PjgMgP+3mui7JzcOLBcUyiOMCZOw=;
  b=hvHWo9ZjOYHetYw+xVh87y8z07W2TzJ6DOhypMqT2Hu48x91znJcfcbE
   VF0xjZtM4SJGzvrn02zBGrBOYMhJ//6WBc+2oo4Xa4TXQAZReJ96vO+7+
   PJFwoUnQogec72hnORwghbzlHhF8I7lkrYww4jCJGT7TA3VOVioyMJhUT
   oKV1IUnc1d4u2jKNWqt6t0vBuTjDDfdliF6wGqZoj5+q3RSfVw/xyyi+6
   PQwNOAfoyAC49OAD9oZ/hfqLZ8Lcp581gBUACg6EjmhQyLKOwBNzWKeBz
   Bv4AENFDsrgnzXGSkRIUHgQ4UbU09tDl1ls8x+icqhdpm+Li+ec9Cm63m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="395811920"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="395811920"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="796454851"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="796454851"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Feb 2023 11:43:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHUq-0001gV-1T;
	Thu, 23 Feb 2023 19:43:16 +0000
Date: Fri, 24 Feb 2023 03:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] drm/amd: Convert amdgpu to use suballocation
 helper.
Message-ID: <202302240302.5M3b5jUC-lkp@intel.com>
References: <20230223142531.8446-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223142531.8446-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-225547
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230223142531.8446-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 2/3] drm/amd: Convert amdgpu to use suballocation helper.
config: hexagon-randconfig-r045-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240302.5M3b5jUC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/566352490ef7a031bd23f9d6524057fd7b31330c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-225547
        git checkout 566352490ef7a031bd23f9d6524057fd7b31330c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240302.5M3b5jUC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_umoddi3" [drivers/gpu/drm/drm_suballoc_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
