Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15C6D18;
	Tue,  4 Jul 2023 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688487241; x=1720023241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R8g1bwf5c8d/A4CHf60RuC/ImvuRfeDIvX+0Z0/qH3U=;
  b=EbU0FkwptdeZIzySSINKeeZ0Sz/Ir26jrl5Gsp3cSOdYAhlkhEUhEM7b
   nmq/23uOhG6+M/QYzH5I7693SXXhvsU0Zyx/GsA9bbY3nQhPvLDdeq810
   kVeXbZfodFfLqA89vYdw9HZsq3BGcMUpk6ThQXxx7Wfn+esDCchqzx7dt
   LQtpdKSIXj6y2KWg6cHOJ7L0ZlNgEeJTJ2nUhcZUDcbIIpb6DTHcf1IAI
   uV/E7BFkmCI9KAiXqXheAVf8M+1tWRaT6oUOROp87Lu8EzGB5miCGHhAD
   EI1lbzV6wykBymzTftm6ZW6TdYF2rCnlhGcRPE2eQ+YfnreOFvxFM3XsG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360631608"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360631608"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="832212766"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="832212766"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2023 09:13:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGif9-000IMT-09;
	Tue, 04 Jul 2023 16:13:59 +0000
Date: Wed, 5 Jul 2023 00:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: memory-failure: add missing set_mce_nospec() for
 memory_failure()
Message-ID: <202307050036.KEckskkD-lkp@intel.com>
References: <20230704121948.1331846-1-linmiaohe@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704121948.1331846-1-linmiaohe@huawei.com>

Hi Miaohe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Miaohe-Lin/mm-memory-failure-add-missing-set_mce_nospec-for-memory_failure/20230704-202035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230704121948.1331846-1-linmiaohe%40huawei.com
patch subject: [RFC PATCH] mm: memory-failure: add missing set_mce_nospec() for memory_failure()
config: arm64-randconfig-r003-20230704 (https://download.01.org/0day-ci/archive/20230705/202307050036.KEckskkD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050036.KEckskkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050036.KEckskkD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory-failure.c:2406:9: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                     ^            ~
   mm/memory-failure.c:2406:9: note: add parentheses after the '!' to evaluate the bitwise operator first
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                     ^                             
         |                                      (                            )
   mm/memory-failure.c:2406:9: note: add parentheses around left hand side expression to silence this warning
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                     ^           
         |                                     (           )
   1 warning generated.


vim +2406 mm/memory-failure.c

  2387	
  2388	static void memory_failure_work_func(struct work_struct *work)
  2389	{
  2390		struct memory_failure_cpu *mf_cpu;
  2391		struct memory_failure_entry entry = { 0, };
  2392		unsigned long proc_flags;
  2393		int gotten;
  2394	
  2395		mf_cpu = container_of(work, struct memory_failure_cpu, work);
  2396		for (;;) {
  2397			spin_lock_irqsave(&mf_cpu->lock, proc_flags);
  2398			gotten = kfifo_get(&mf_cpu->fifo, &entry);
  2399			spin_unlock_irqrestore(&mf_cpu->lock, proc_flags);
  2400			if (!gotten)
  2401				break;
  2402			if (entry.flags & MF_SOFT_OFFLINE)
  2403				soft_offline_page(entry.pfn, entry.flags);
  2404			else
  2405				if (!memory_failure(entry.pfn, entry.flags))
> 2406					if (!entry.flags & MF_SW_SIMULATED)
  2407						set_mce_nospec(entry.pfn);
  2408		}
  2409	}
  2410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
