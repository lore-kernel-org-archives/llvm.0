Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A645A635
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 02:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657249059; x=1688785059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GVsY9AY9TffAdZABFROe8l/VfJWEHMR67/Fkl9Hspw=;
  b=F+BoWTQ4cgraVF55etX1wnAV/yuyzACBQFB5TdESUSTeD4AuYydbLIJw
   OPJETDtEOnjX/u3RROjZ7kFb60tML212YSinjZj78L2tdpYDgwRnUgY1f
   i28G/f6CHa4ylLILIh2KnpHy0f4RlMVPTnX86IfRkmx27nCeEKv6WwCxV
   gOEqsLDqCprUjWfEiRfeAIlgb3ZyWQc6oU4+3vmHVKAkccUNR/joqlG4Z
   Kmfq2MYZnY6zyAflE0NzDQLOP+pB2/6cC7O3LnhUJMy3eGGSkfEDtECAy
   If5OdGmSuWDFGz/2G9ay7nUEV8KtrDnEmfTc8KR46NzDvfg7mURHaNmXR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348157722"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="348157722"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 19:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="621041997"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jul 2022 19:57:22 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9eBF-000MqY-9n;
	Fri, 08 Jul 2022 02:57:21 +0000
Date: Fri, 8 Jul 2022 10:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] arm64: run softirqs on the per-CPU IRQ stack
Message-ID: <202207081057.tTnVo798-lkp@intel.com>
References: <20220707110511.52129-2-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707110511.52129-2-zhengqi.arch@bytedance.com>

Hi Qi,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on next-20220707]
[cannot apply to linus/master v5.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/arm64-run-softirqs-on-the-per-CPU-IRQ-stack/20220707-190735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: arm64-buildonly-randconfig-r001-20220707 (https://download.01.org/0day-ci/archive/20220708/202207081057.tTnVo798-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7e4c2b77e107babc244e0f0e6568ed0af50f06b3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qi-Zheng/arm64-run-softirqs-on-the-per-CPU-IRQ-stack/20220707-190735
        git checkout 7e4c2b77e107babc244e0f0e6568ed0af50f06b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/irq.c:80:6: warning: no previous prototype for function 'do_softirq_own_stack' [-Wmissing-prototypes]
   void do_softirq_own_stack(void)
        ^
   arch/arm64/kernel/irq.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void do_softirq_own_stack(void)
   ^
   static 
   arch/arm64/kernel/irq.c:118:13: warning: no previous prototype for function 'init_IRQ' [-Wmissing-prototypes]
   void __init init_IRQ(void)
               ^
   arch/arm64/kernel/irq.c:118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_IRQ(void)
   ^
   static 
   2 warnings generated.


vim +/do_softirq_own_stack +80 arch/arm64/kernel/irq.c

    79	
  > 80	void do_softirq_own_stack(void)
    81	{
    82		call_on_irq_stack(NULL, ____do_softirq);
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
