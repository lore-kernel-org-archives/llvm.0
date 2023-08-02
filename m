Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259E46B2;
	Wed,  2 Aug 2023 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690962022; x=1722498022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tfQVuMvrxH+9LI52GE0UrSaDvhLk8CHIMkXq4vGrFsk=;
  b=diCYh934hc3vR8XDkVY8PqLQ3TtrWRDG1ryFEnpxFAw7jXZQLgXSjUGM
   lvPIO4lJkIamR5HlfotAMCidVga24qaFwL8yS5YK5aFLLuCV6pRmBFTNP
   QZ9uy0EmBvMrTwfE/KQR0xnK5lJ0ARQ+QezdGsMPxEM/9LCdSG6c9RNjB
   AOugZXNbWsxoHezTztVLXxkAHoPcrRI4Pq7yL/ybXnpqf3lPVxq1fMeLB
   Mi4XXzMgaoP6uu/MXzODWE3dilW9nx1ogmZ77cNZ8B4SFL3QbgkIcbRuo
   j9EAVs0WG76Lu04AdR5Z2DtJwQs0ZFb86XeHLIDiPXGJx/zrnopGsVJUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359550847"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="359550847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 00:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722771426"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="722771426"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Aug 2023 00:40:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR6Sw-00010F-0K;
	Wed, 02 Aug 2023 07:40:18 +0000
Date: Wed, 2 Aug 2023 15:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
Message-ID: <202308021505.FG8g7tZG-lkp@intel.com>
References: <20230801182132.1058707-8-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801182132.1058707-8-miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvmem-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230801182132.1058707-8-miquel.raynal%40bootlin.com
patch subject: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
config: x86_64-randconfig-x005-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021505.FG8g7tZG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021505.FG8g7tZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021505.FG8g7tZG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:2264:1: warning: unused label 'del_cells' [-Wunused-label]
   del_cells:
   ^~~~~~~~~~
   1 warning generated.


vim +/del_cells +2264 drivers/nvmem/core.c

  2261	
  2262		return 0;
  2263	
> 2264	del_cells:
  2265		nvmem_device_remove_all_cells(nvmem);
  2266	put_layout:
  2267		nvmem_layout_put(nvmem->layout);
  2268		return ret;
  2269	}
  2270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
