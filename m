Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE34602
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645127945; x=1676663945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/dy5bFV0hFt5PA339JCU431TnB8St9YIJsJ095SE54=;
  b=OKLJG2k2ZLmkG6z8A0kanEytjHmDGjFNKa+ateshcAI4GAB70UXRmO2K
   CKv3ix+fR9FaNQj2tJgChyixMv5enTidi4Ok/9uu68F3/kb3lLIpVNPFT
   7cguxlN84J484noDBtWPZWkGOWu5OsRgZxcyw5OunxL8OmwlBXjjrEZsD
   2RPsJ3G61tU5tLUakoe7wLTAEjsIHKhAyDUQUIJ6o+xTosJGftpffMGrI
   sue0dKkUryEAK+dtLcpUeSrgy0MJ9+yRzo9VZ7S+5ZKrYiYWZaqeIk+Xv
   vN2uB4jM/bJsw1mJ00U1qEXJ536KalsX4WviVt99SvzeJpGtCa7G5DcLm
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="275555712"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="275555712"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 11:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="488646551"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Feb 2022 11:59:02 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKmvd-0000aO-W2; Thu, 17 Feb 2022 19:59:01 +0000
Date: Fri, 18 Feb 2022 03:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [ulfh-mmc:next 20/24] drivers/memstick/core/ms_block.c:158:6: error:
 implicit declaration of function 'bitmap_weight_eq'
Message-ID: <202202180327.nT5gZudK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   4b67100bafbb3f60e6eecf87631e4d400d9b6f17
commit: 5f8d171cd8a93ff425556e7fde5d59fefc677bf7 [20/24] memstick: replace bitmap_weight with bitmap_weight_eq where appropriate
config: hexagon-randconfig-r045-20220217 (https://download.01.org/0day-ci/archive/20220218/202202180327.nT5gZudK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?id=5f8d171cd8a93ff425556e7fde5d59fefc677bf7
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc next
        git checkout 5f8d171cd8a93ff425556e7fde5d59fefc677bf7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/memstick/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/memstick/core/ms_block.c:158:6: error: implicit declaration of function 'bitmap_weight_eq' [-Werror,-Wimplicit-function-declaration]
           if (bitmap_weight_eq(msb->used_blocks_bitmap, msb->block_count,
               ^
   drivers/memstick/core/ms_block.c:158:6: note: did you mean 'bitmap_weight'?
   include/linux/bitmap.h:399:28: note: 'bitmap_weight' declared here
   static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
                              ^
   1 error generated.


vim +/bitmap_weight_eq +158 drivers/memstick/core/ms_block.c

   145	
   146	/* Debug test to validate free block counts */
   147	static int msb_validate_used_block_bitmap(struct msb_data *msb)
   148	{
   149		int total_free_blocks = 0;
   150		int i;
   151	
   152		if (!debug)
   153			return 0;
   154	
   155		for (i = 0; i < msb->zone_count; i++)
   156			total_free_blocks += msb->free_block_count[i];
   157	
 > 158		if (bitmap_weight_eq(msb->used_blocks_bitmap, msb->block_count,
   159					msb->block_count - total_free_blocks))
   160			return 0;
   161	
   162		pr_err("BUG: free block counts don't match the bitmap");
   163		msb->read_only = true;
   164		return -EINVAL;
   165	}
   166	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
