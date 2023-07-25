Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561137C;
	Tue, 25 Jul 2023 01:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690248493; x=1721784493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MYsHssqbj3peXNN3thl5zwok4Zgz0DEOO12YzQwWfLw=;
  b=GCFoDcQkWchU+PrvDRpcJ6qxuvCcRxn26OsaBkTAXrsBi2hlaDehxJYQ
   o1hy8sVFYhwZcqyvvB5orN6xJ3nUlecN85pD+GDQTjwOmR2u+yxIGhCeK
   4CfyEUrAGNBrKsGqJ8qWfsknTTn+sSXSM1NLTmhZ0Eqo4gGxWEmVJc6xO
   560Ozqon76t8FWquDf5BBsMX7zchHM4oqWJiK4zmC2v/wVhCY/rCMQosi
   TpxgOVHD68Z9bSyfjQBSMWg8atyF6mYmv/vfq0oqCsxDsK4oJGi8sMAV0
   frL9vnJipFQAGyM0YpXxaCAjCXQX4Gq88aqvucIRk50OkvjDqz1qPdkWa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370261517"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="370261517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 18:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755528504"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="755528504"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Jul 2023 18:28:11 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO6qQ-000ABc-2H;
	Tue, 25 Jul 2023 01:28:10 +0000
Date: Tue, 25 Jul 2023 09:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Tao <rtoax@foxmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] samples/hw_breakpoint: Fix kernel BUG 'invalid opcode:
 0000'
Message-ID: <202307250926.06DQZjVe-lkp@intel.com>
References: <tencent_E626A858BED28C4E21C219780BC566015D0A@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E626A858BED28C4E21C219780BC566015D0A@qq.com>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master linus/master v6.5-rc3 next-20230724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/samples-hw_breakpoint-Fix-kernel-BUG-invalid-opcode-0000/20230724-185721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/tencent_E626A858BED28C4E21C219780BC566015D0A%40qq.com
patch subject: [PATCH] samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
config: x86_64-randconfig-r011-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250926.06DQZjVe-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250926.06DQZjVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250926.06DQZjVe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/hw_breakpoint/data_breakpoint.c:73:2: error: call to undeclared function '__symbol_put'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __symbol_put(ksym_name);
           ^
   samples/hw_breakpoint/data_breakpoint.c:73:2: note: did you mean '__symbol_get'?
   include/linux/module.h:301:7: note: '__symbol_get' declared here
   void *__symbol_get(const char *symbol);
         ^
   1 error generated.


vim +/__symbol_put +73 samples/hw_breakpoint/data_breakpoint.c

    69	
    70	static void __exit hw_break_module_exit(void)
    71	{
    72		unregister_wide_hw_breakpoint(sample_hbp);
  > 73		__symbol_put(ksym_name);
    74		printk(KERN_INFO "HW Breakpoint for %s write uninstalled\n", ksym_name);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
