Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6DA20
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 21:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658956379; x=1690492379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJc/rY+H6mWEpjZOCYuB/wZU/zZ6wQtxR/IUmxdYdw8=;
  b=WJFcbh6kXiUD/SYioZ5AcTFmoQIV5eFpaFt6Ae3Qfi2H01/KuEbrSau7
   byJ40uw7q5XbecLafMhQy1nrdkTaFvNnJ3UtNSc5eHtWeflSUTuDzwguZ
   41I6FQpL9C3MnSqA04+Qd4EOvrKDdAytfmdb8qgkFMpuwXAnjGYrEoDeB
   2UFjzszZj1YrnImWWwvLrI+g9hlZ9I62OMklxKcFKjxF0UFRON6zDbiri
   FXaK+KX7hxM6ALi9DlbsBJ0qLB4XxImJMUEgcq55+WpWS32fXUjPFDCTY
   N89wM3p6T/H7eTKxglZKNXa+AsgDDirbcbC/CcSPDqXp+NhWS4gkYMt7y
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268114836"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="268114836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 14:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="742804666"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2022 14:12:55 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGoKt-00097K-0F;
	Wed, 27 Jul 2022 21:12:55 +0000
Date: Thu, 28 Jul 2022 05:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH] rcu: Display registers of self-detected stall as far as
 possible
Message-ID: <202207280520.yvgjXjJx-lkp@intel.com>
References: <20220727060929.1149-1-thunder.leizhen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727060929.1149-1-thunder.leizhen@huawei.com>

Hi Zhen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on paulmck-rcu/dev]
[also build test ERROR on linus/master v5.19-rc8 next-20220727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhen-Lei/rcu-Display-registers-of-self-detected-stall-as-far-as-possible/20220727-141107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220728/202207280520.yvgjXjJx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9f3fe5a0e46546db5bcfd1f33f12d87339e5de98
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhen-Lei/rcu-Display-registers-of-self-detected-stall-as-far-as-possible/20220727-141107
        git checkout 9f3fe5a0e46546db5bcfd1f33f12d87339e5de98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4641:
>> kernel/rcu/tree_stall.h:358:10: error: call to undeclared function 'get_irq_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   regs = get_irq_regs();
                          ^
>> kernel/rcu/tree_stall.h:358:8: error: incompatible integer to pointer conversion assigning to 'struct pt_regs *' from 'int' [-Wint-conversion]
                   regs = get_irq_regs();
                        ^ ~~~~~~~~~~~~~~
   2 errors generated.


vim +/get_irq_regs +358 kernel/rcu/tree_stall.h

   352	
   353	static void rcu_dump_cpu_task(int cpu)
   354	{
   355		if (cpu == smp_processor_id() && in_irq()) {
   356			struct pt_regs *regs;
   357	
 > 358			regs = get_irq_regs();
   359			if (regs) {
   360				show_regs(regs);
   361				return;
   362			}
   363		}
   364	
   365		dump_cpu_task(cpu);
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
