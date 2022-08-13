Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DE2916
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 21:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660427313; x=1691963313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KCw0isuF76AqNLdxwAD7Q1clW/CVm28nU3268cAc3+M=;
  b=WHvgBdOMjOQWLplHtYq7NX0E+B8rAlb8vMpB3/xvIHflOq/ApFMWABLk
   +RNa5dk6Cu1cmehynbY+XSWZUKD7hZqenrHjMAyOnOdRKfgtvpmq1k1VA
   tX60b8rUTmtbxzGrzav6dlUxfNh+WMOQrPIc98CNZUlPhEigAiJXkZHgP
   qnrWNfQKww9kLgMA0psjxFg2JaSgS0JPKH/6IOvwnHGsnRSmlS4U4svVl
   f7yVxnx/2pivJGNDdf4LEkzop+sJHtZwDV8/t4V36cRfxDNYZLwcSkI7C
   jRNnvxFuvOIyLZGZ2Jn84PTCPBDbwoNP33GeeC5Iue+CWIle1LiTgwVZJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="317756486"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="317756486"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 14:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="782286340"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Aug 2022 14:48:31 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMyze-00027C-2o;
	Sat, 13 Aug 2022 21:48:30 +0000
Date: Sun, 14 Aug 2022 05:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 4/7] mm: introduce a generic per-CPU RSS cache
Message-ID: <202208140529.0Zdvh37T-lkp@intel.com>
References: <20220728204511.56348-5-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728204511.56348-5-ryncsn@gmail.com>

Hi Kairui,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on kees/for-next/execve tip/x86/core tip/x86/mm akpm-mm/mm-everything linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/Replace-per-task-RSS-cache-with-per-CPU-RSS-cache/20220729-044735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 14b3f2d9ee8df3b6040f7e21f9fcd1d848938fd9
config: x86_64-randconfig-a002-20220801 (https://download.01.org/0day-ci/archive/20220814/202208140529.0Zdvh37T-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/12685794635d61c342fae66ad77865b4eeada2e7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kairui-Song/Replace-per-task-RSS-cache-with-per-CPU-RSS-cache/20220729-044735
        git checkout 12685794635d61c342fae66ad77865b4eeada2e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/memory.c:222:6: warning: left operand of comma operator has no effect [-Wunused-value]
               + atomic_long_read(&mm->rss_stat.count[MM_ANONPAGES]),
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memory.c:223:6: warning: expression result unused [-Wunused-value]
               + atomic_long_read(&mm->rss_stat.count[MM_SHMEMPAGES]);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memory.c:234:4: warning: variable 'update' is uninitialized when used here [-Wuninitialized]
                           update += READ_ONCE(per_cpu(cpu_rss_cache.count[i], cpu));
                           ^~~~~~
   mm/memory.c:219:18: note: initialize the variable 'update' to silence this warning
           long ret, update, sync_count;
                           ^
                            = 0
   3 warnings generated.


vim +222 mm/memory.c

   214	
   215	/* see comment for get_mm_counter */
   216	unsigned long get_mm_rss(struct mm_struct *mm)
   217	{
   218		int cpu;
   219		long ret, update, sync_count;
   220	
   221		ret = atomic_long_read(&mm->rss_stat.count[MM_FILEPAGES]),
 > 222		    + atomic_long_read(&mm->rss_stat.count[MM_ANONPAGES]),
 > 223		    + atomic_long_read(&mm->rss_stat.count[MM_SHMEMPAGES]);
   224	
   225		for_each_possible_cpu(cpu) {
   226			if (READ_ONCE(per_cpu(cpu_rss_cache.mm, cpu)) != mm)
   227				continue;
   228			sync_count = READ_ONCE(per_cpu(cpu_rss_cache.sync_count, cpu));
   229			/* see smp_mb in switch_pcp_rss_cache_no_irq */
   230			smp_rmb();
   231	
   232			/* Reads MM_FILEPAGES, MM_ANONPAGES, MM_SHMEMPAGES */
   233			for (int i = MM_FILEPAGES; i < MM_SWAPENTS; i++)
 > 234				update += READ_ONCE(per_cpu(cpu_rss_cache.count[i], cpu));
   235	
   236			/* same as above */
   237			smp_rmb();
   238			if (READ_ONCE(per_cpu(cpu_rss_cache.sync_count, cpu)) == sync_count &&
   239			    READ_ONCE(per_cpu(cpu_rss_cache.mm, cpu)) == mm)
   240				ret += update;
   241		}
   242	
   243		if (ret < 0)
   244			ret = 0;
   245	
   246		return ret;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
