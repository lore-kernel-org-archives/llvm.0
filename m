Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDB7C;
	Sat,  4 Feb 2023 04:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675484377; x=1707020377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ub2y09XIMC4WoA2lWzYWJ2iYlFRJhtJ59oX2WN+Plu4=;
  b=QkQ6W/zNh/XAyMUunwUuVqcy1p6shoW7LEdq2ado9VTM9Z8V7LeySZqb
   fxydoM86BqoK6rnp1awYEJqCi72zo4wEqO8HESFziG3vJJTdVnx5zLeYf
   IBWCrvWGdbR01Q0mzftF2dD+9VsvY3D7lb1wkD4QC19l6BejL9ibWI1b+
   9kNjagx2lQYCt8Edd0TizxEl2yNVZsJqDuu1HMq7ySsh1Sk0UgcOejzyE
   T1CAX9j9cgVKFPIGCJBx/GpJE1qqqFjagwfd5tkzKEjfv/Ug0GmGUQOmU
   AOkfaO4brmTOIsEfpCuhY5rW1sM4LBX/RiM3enf7q1gQi6Q1kdNALzABM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356261291"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="356261291"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 20:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="667851224"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="667851224"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2023 20:19:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOA1S-00011v-1y;
	Sat, 04 Feb 2023 04:19:30 +0000
Date: Sat, 4 Feb 2023 12:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: shrinkers: fix deadlock in shrinker debugfs
Message-ID: <202302041214.WxGi7fZz-lkp@intel.com>
References: <20230202105612.64641-1-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202105612.64641-1-zhengqi.arch@bytedance.com>

Hi Qi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-shrinkers-fix-deadlock-in-shrinker-debugfs/20230202-185741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230202105612.64641-1-zhengqi.arch%40bytedance.com
patch subject: [PATCH] mm: shrinkers: fix deadlock in shrinker debugfs
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230204/202302041214.WxGi7fZz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5098626b7cc998b46d6c90bbf757a013a63785b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qi-Zheng/mm-shrinkers-fix-deadlock-in-shrinker-debugfs/20230202-185741
        git checkout 5098626b7cc998b46d6c90bbf757a013a63785b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:13:
>> include/linux/shrinker.h:120:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +120 include/linux/shrinker.h

5035ebc644aec9 Roman Gushchin 2022-05-31  107  
5035ebc644aec9 Roman Gushchin 2022-05-31  108  #ifdef CONFIG_SHRINKER_DEBUG
5035ebc644aec9 Roman Gushchin 2022-05-31  109  extern int shrinker_debugfs_add(struct shrinker *shrinker);
5098626b7cc998 Qi Zheng       2023-02-02  110  extern struct dentry *shrinker_debugfs_remove(struct shrinker *shrinker);
e33c267ab70de4 Roman Gushchin 2022-05-31  111  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
e33c267ab70de4 Roman Gushchin 2022-05-31  112  						  const char *fmt, ...);
5035ebc644aec9 Roman Gushchin 2022-05-31  113  #else /* CONFIG_SHRINKER_DEBUG */
5035ebc644aec9 Roman Gushchin 2022-05-31  114  static inline int shrinker_debugfs_add(struct shrinker *shrinker)
5035ebc644aec9 Roman Gushchin 2022-05-31  115  {
5035ebc644aec9 Roman Gushchin 2022-05-31  116  	return 0;
5035ebc644aec9 Roman Gushchin 2022-05-31  117  }
5098626b7cc998 Qi Zheng       2023-02-02  118  static inline struct dentry *shrinker_debugfs_remove(struct shrinker *shrinker)
5035ebc644aec9 Roman Gushchin 2022-05-31  119  {
5035ebc644aec9 Roman Gushchin 2022-05-31 @120  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
