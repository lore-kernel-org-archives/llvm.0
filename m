Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC062CA7
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660237630; x=1691773630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hECvO7Fdc4M8tAdkGpZzwdSY9HXo0T7T/J/5VkraXNo=;
  b=LHxJJv/ALeb78YSsc02lFx3Xl1gLGa4n1i+YvabGQRP2McYw1iuP/8mj
   0Kjby0nnuBj5ve6ZdoW/MR14wWfzZvtuF9GhB4g8WAeKKWFZn18njCipF
   DQqmRQ/CzNEaWFpKlzYKblU8wG4i5aA2xhqsINT/PABipFlggFB3aC6+C
   ndgGV5gft+U2KtO8R3O9uhxcaBxUImA8Sb1fu7hf1cJiFHK7dLC4LXq6h
   xQ1Ak5loLshjbX8aZH6ZMNvvLfQn4MrjXnhiDTTZiJpCCvTHMcYeSfn0t
   /IouEJNrHCC1IXWwh8yuLtpUWhNLi1VCqSph/JXAjpdA7GpQPXv7Wnfdj
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="355411375"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="355411375"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 10:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="638590021"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2022 10:06:57 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMBe5-0000Qx-0E;
	Thu, 11 Aug 2022 17:06:57 +0000
Date: Fri, 12 Aug 2022 01:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH 1/2] sched: Avoid placing RT threads on cores
 handling long softirqs
Message-ID: <202208120033.qCqng8xp-lkp@intel.com>
References: <20220811015758.3001641-2-jstultz@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811015758.3001641-2-jstultz@google.com>

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v5.19 next-20220811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/Softirq-rt-Optimizations/20220811-100030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 8648f92a66a323ed01903d2cbb248cdbe2f312d9
config: arm64-randconfig-r002-20220810 (https://download.01.org/0day-ci/archive/20220812/202208120033.qCqng8xp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3fceb870d95188903796394cbe5fd2493ee872c6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Stultz/Softirq-rt-Optimizations/20220811-100030
        git checkout 3fceb870d95188903796394cbe5fd2493ee872c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:1634:6: warning: no previous prototype for function 'rt_task_fits_capacity_and_may_preempt' [-Wmissing-prototypes]
   bool rt_task_fits_capacity_and_may_preempt(struct task_struct *p, int cpu)
        ^
   kernel/sched/rt.c:1634:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool rt_task_fits_capacity_and_may_preempt(struct task_struct *p, int cpu)
   ^
   static 
   1 warning generated.


vim +/rt_task_fits_capacity_and_may_preempt +1634 kernel/sched/rt.c

  1633	
> 1634	bool rt_task_fits_capacity_and_may_preempt(struct task_struct *p, int cpu)
  1635	{
  1636		return task_may_preempt(p, cpu) && rt_task_fits_capacity(p, cpu);
  1637	}
  1638	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
