Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3657F
	for <llvm@lists.linux.dev>; Sat,  7 May 2022 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651931566; x=1683467566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hcW3bxB9BNwR2j6I9hqm7xruIxTlHtcZ5M6fanEvKkA=;
  b=Zdl96xVZH9scTOv6tuJuHUZjqJrFVF+5JnpPgWfdWupbTBjeuSwc6VLA
   uZbnJwNPNq8IWv6p1Zjxr/JbvoL/J/X8mKcROrCFGlcl1Ad/qPfJ9UCmT
   LFTbp7q4YEfbreYONv3J01X8jaa2/n/uLYu8YVTEtbsUlOAEAw27bI1Yb
   1XkHXVsKckhkyJurvXODlj/kB6ioNJj/wYSwFPTw2tJ21n0jOegx2s7y3
   to1QQhxps9bS/KKdo1uyhrpgivej+HSKMKGaiZ9lHa9fGxanQ2OZb1eQi
   mnFocWZzR1m1Ba4j3wAS8ANc3TwqVcw71Wrue3rcLSKNhslWa6oyNoaKB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10340"; a="268606993"
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; 
   d="scan'208";a="268606993"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2022 06:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; 
   d="scan'208";a="695608332"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 May 2022 06:52:45 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nnKrU-000Ecp-7q;
	Sat, 07 May 2022 13:52:44 +0000
Date: Sat, 7 May 2022 21:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [norov:bitmap-cocci 15/15] kernel/sched/topology.c:2002:45: error:
 too many arguments to function call, expected single argument 'srcp', have 2
 arguments
Message-ID: <202205072127.9RxAaefa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-cocci
head:   3175a64928a804328d3f9a87af8bfda683539bee
commit: 3175a64928a804328d3f9a87af8bfda683539bee [15/15] sched/topology: replace cpumask_weight() with cpumask_weight_eq where appropriate
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220507/202205072127.9RxAaefa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/3175a64928a804328d3f9a87af8bfda683539bee
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov bitmap-cocci
        git checkout 3175a64928a804328d3f9a87af8bfda683539bee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:89:
>> kernel/sched/topology.c:2002:45: error: too many arguments to function call, expected single argument 'srcp', have 2 arguments
           if (!cpumask_weight(cpumask_of_node(node), 1))
                ~~~~~~~~~~~~~~                        ^
   include/linux/cpumask.h:573:28: note: 'cpumask_weight' declared here
   static inline unsigned int cpumask_weight(const struct cpumask *srcp)
                              ^
   1 error generated.


vim +/srcp +2002 kernel/sched/topology.c

  1989	
  1990	/*
  1991	 * Call with hotplug lock held
  1992	 */
  1993	void sched_update_numa(int cpu, bool online)
  1994	{
  1995		int node;
  1996	
  1997		node = cpu_to_node(cpu);
  1998		/*
  1999		 * Scheduler NUMA topology is updated when the first CPU of a
  2000		 * node is onlined or the last CPU of a node is offlined.
  2001		 */
> 2002		if (!cpumask_weight(cpumask_of_node(node), 1))
  2003			return;
  2004	
  2005		sched_reset_numa();
  2006		sched_init_numa(online ? NUMA_NO_NODE : node);
  2007	}
  2008	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
