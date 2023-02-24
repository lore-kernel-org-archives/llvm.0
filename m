Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0497A320C;
	Fri, 24 Feb 2023 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677235670; x=1708771670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1y/02aIYB6ZrAywwUWUe9q6N1leva9/NTzcE6ByZ6Xs=;
  b=lowh+VIucjSw7aR1EtCNm8R8/jFbsCw0IyH+mQEH54YrvKj/gAIPU9yZ
   GWUu0ueB0Nl+dB3baRWnPayBNzq1+Xwwidbi3u3i8y5DkI9t6WajRnq77
   AQ2WH8z/+RDTvY+r6WueJIiTXYbM9pGda7FANVZUWJJw+IVP0ZaWfeqWW
   wnLXc0okUUNKCrzRp3oZhkKM7U4C6/S25tjqgCrYYGqKVz1RPPrTsyR/4
   QBfuzj9iNGpAPnhvzJRyaXKQ4+mmQfsSyfsyjqwH5PIWlPxSlTIXlbcaO
   6hzvi3FXtD3yTsFSXKqPCzboOwxnQkXNFP1bpQSypH5wVkrtiIVvTPahR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="321649806"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="321649806"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 02:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="705228977"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="705228977"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 02:47:47 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVVcA-0002LV-1x;
	Fri, 24 Feb 2023 10:47:46 +0000
Date: Fri, 24 Feb 2023 18:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 592/601]
 drivers/block/zram/zram_drv.c:1236:23: error: incompatible pointer types
 passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const
 atomic64_t *'
Message-ID: <202302241840.nwdXqE5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   9323c8b93d95807ac6be21e63514f5b6c6c4cbd8
commit: b7d89654a988a2a4e6181397b8d05690b5758508 [592/601] zram: show zsmalloc objs_moved stat in mm_stat
config: powerpc-buildonly-randconfig-r004-20230222 (https://download.01.org/0day-ci/archive/20230224/202302241840.nwdXqE5r-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/b7d89654a988a2a4e6181397b8d05690b5758508
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
        git checkout b7d89654a988a2a4e6181397b8d05690b5758508
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241840.nwdXqE5r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/zram/zram_drv.c:1236:23: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
                           (u64)atomic64_read(&pool_stats.objs_moved));
                                              ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   1 error generated.


vim +1236 drivers/block/zram/zram_drv.c

  1204	
  1205	static ssize_t mm_stat_show(struct device *dev,
  1206			struct device_attribute *attr, char *buf)
  1207	{
  1208		struct zram *zram = dev_to_zram(dev);
  1209		struct zs_pool_stats pool_stats;
  1210		u64 orig_size, mem_used = 0;
  1211		long max_used;
  1212		ssize_t ret;
  1213	
  1214		memset(&pool_stats, 0x00, sizeof(struct zs_pool_stats));
  1215	
  1216		down_read(&zram->init_lock);
  1217		if (init_done(zram)) {
  1218			mem_used = zs_get_total_pages(zram->mem_pool);
  1219			zs_pool_stats(zram->mem_pool, &pool_stats);
  1220		}
  1221	
  1222		orig_size = atomic64_read(&zram->stats.pages_stored);
  1223		max_used = atomic_long_read(&zram->stats.max_used_pages);
  1224	
  1225		ret = scnprintf(buf, PAGE_SIZE,
  1226				"%8llu %8llu %8llu %8lu %8ld %8llu %8lu %8llu %8llu %8llu\n",
  1227				orig_size << PAGE_SHIFT,
  1228				(u64)atomic64_read(&zram->stats.compr_data_size),
  1229				mem_used << PAGE_SHIFT,
  1230				zram->limit_pages << PAGE_SHIFT,
  1231				max_used << PAGE_SHIFT,
  1232				(u64)atomic64_read(&zram->stats.same_pages),
  1233				atomic_long_read(&pool_stats.pages_compacted),
  1234				(u64)atomic64_read(&zram->stats.huge_pages),
  1235				(u64)atomic64_read(&zram->stats.huge_pages_since),
> 1236				(u64)atomic64_read(&pool_stats.objs_moved));
  1237		up_read(&zram->init_lock);
  1238	
  1239		return ret;
  1240	}
  1241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
