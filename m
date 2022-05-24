Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6EA21
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653405196; x=1684941196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jg1seA0b2qfEGPEhi40Q5NR3xfGQVSWmwk8f0MnVPS0=;
  b=GlA2uXeeHOWgiDGAqxaxIcLyPHAH81onSJjEhEWmrg9idlOcJ7gOzHjV
   slLBaHGAX1pwdVEh9k7t/C+COFqEn03S4elyEldyEa3GVSThDQLvWEVwe
   7aiJcKfCsCukOU+bm0cwXDM80RHY8To2g+RMrelYa5KzvqN1lb946DTun
   7aSqKqyr73mbj0PTMZ7Eu80uUAGGMTQuFXJrsAnWUIB3gAWaD1eAk5DYw
   6/3ZoJUjRI0R+dl60zNEV7mNBDnhcgRnhwcD4dlD8sFDoFZglWp2rBQIy
   13N+F2YZ3Dus7S9b4kKK/KYrs5PSBDhTNzfi2hsL86WDNaUe5UcUElOUc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="271131769"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="271131769"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 08:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="577926540"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 May 2022 08:13:13 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntWDg-0002AY-C8;
	Tue, 24 May 2022 15:13:12 +0000
Date: Tue, 24 May 2022 23:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: hezhongkun <hezhongkun.hzk@bytedance.com>, hannes@cmpxchg.org,
	mhocko@kernel.org, roman.gushchin@linux.dev
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, lizefan.x@bytedance.com,
	Hezhongkun <hezhongkun.hzk@bytedance.com>
Subject: Re: [PATCH] mm: memcontrol: add the mempolicy interface for cgroup
 v2.
Message-ID: <202205242316.8f8rvh3s-lkp@intel.com>
References: <20220524103638.473-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524103638.473-1-hezhongkun.hzk@bytedance.com>

Hi hezhongkun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18 next-20220524]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/hezhongkun/mm-memcontrol-add-the-mempolicy-interface-for-cgroup-v2/20220524-183922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 143a6252e1b8ab424b4b293512a97cca7295c182
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220524/202205242316.8f8rvh3s-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6adb0a02c27c8811bee9783451ee25155baf490e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review hezhongkun/mm-memcontrol-add-the-mempolicy-interface-for-cgroup-v2/20220524-183922
        git checkout 6adb0a02c27c8811bee9783451ee25155baf490e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:179:19: warning: no previous prototype for function 'get_cgrp_or_task_policy' [-Wmissing-prototypes]
   struct mempolicy *get_cgrp_or_task_policy(struct task_struct *p)
                     ^
   mm/mempolicy.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct mempolicy *get_cgrp_or_task_policy(struct task_struct *p)
   ^
   static 
   1 warning generated.


vim +/get_cgrp_or_task_policy +179 mm/mempolicy.c

   178	
 > 179	struct mempolicy *get_cgrp_or_task_policy(struct task_struct *p)
   180	{
   181		struct mempolicy *pol;
   182		struct mem_cgroup *memcg = mem_cgroup_from_task(p);
   183	
   184		pol = (memcg && memcg->mempolicy) ? memcg->mempolicy : get_task_policy(p);
   185		return pol;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
