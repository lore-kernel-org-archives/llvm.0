Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24E5CAB
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646150833; x=1677686833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kg3KWMKuLiwWLgwdzI8SfRtxCQr6NA+ACkIohhgeRk=;
  b=MUn4vXIdCxzEWAAXXQ7NFBemL0tCsi00UEL2GorqkP4wshNBM/FIbnYu
   PpcsPwEP/J2Zc3L9e+1K76YBV1wEprKu3oi0n2syXqNNJrtx3mq6tvAlb
   tpkFbdMBBPIpXVq5XK0tjbuqMcgcVpjENZT3VVHk0BrX8KDE3e86hIA0Z
   +mephpDCfXwWBJHbaTDtZi8wUaAcMqHKdNoeri7DfqCNdmigTws/sdoKz
   CsTjlJrbuK9Yt3ar8HPPo9cKYZbfnprPGrA3aHbbh4aTafq9G2nRss19V
   kGEPNhaASBh6fDUcfqgRjEcFFrUB4Kv2dg1smEyDEv0Dw6zgedzi/HV1o
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277831675"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="277831675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 08:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="685769017"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2022 08:06:31 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP51D-0000fd-73; Tue, 01 Mar 2022 16:06:31 +0000
Date: Wed, 2 Mar 2022 00:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dust Li <dust.li@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 1/7] net/smc: add sysctl interface for SMC
Message-ID: <202203012329.Hks6HNdS-lkp@intel.com>
References: <20220301094402.14992-2-dust.li@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301094402.14992-2-dust.li@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dust,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Dust-Li/net-smc-some-datapath-performance-optimizations/20220301-174523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git f2b77012ddd5b2532d262f100be3394ceae3ea59
config: riscv-randconfig-r042-20220301 (https://download.01.org/0day-ci/archive/20220301/202203012329.Hks6HNdS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/884ea36cd0b9e8ff0290ffc4628736caa5eeac4e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dust-Li/net-smc-some-datapath-performance-optimizations/20220301-174523
        git checkout 884ea36cd0b9e8ff0290ffc4628736caa5eeac4e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from net/smc/smc_sysctl.c:17:
>> net/smc/smc_sysctl.h:23:5: warning: no previous prototype for function 'smc_sysctl_init' [-Wmissing-prototypes]
   int smc_sysctl_init(void)
       ^
   net/smc/smc_sysctl.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smc_sysctl_init(void)
   ^
   static 
>> net/smc/smc_sysctl.h:28:6: warning: no previous prototype for function 'smc_sysctl_exit' [-Wmissing-prototypes]
   void smc_sysctl_exit(void) { }
        ^
   net/smc/smc_sysctl.h:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void smc_sysctl_exit(void) { }
   ^
   static 
>> net/smc/smc_sysctl.c:39:11: error: no member named 'smc_hdr' in 'struct netns_smc'
           net->smc.smc_hdr = register_net_sysctl(net, "net/smc", table);
           ~~~~~~~~ ^
   net/smc/smc_sysctl.c:40:16: error: no member named 'smc_hdr' in 'struct netns_smc'
           if (!net->smc.smc_hdr)
                ~~~~~~~~ ^
   net/smc/smc_sysctl.c:54:39: error: no member named 'smc_hdr' in 'struct netns_smc'
           unregister_net_sysctl_table(net->smc.smc_hdr);
                                       ~~~~~~~~ ^
>> net/smc/smc_sysctl.c:62:5: warning: attribute declaration must precede definition [-Wignored-attributes]
   int __init smc_sysctl_init(void)
       ^
   include/linux/init.h:50:17: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline __nocfi
                           ^
   include/linux/compiler_attributes.h:276:56: note: expanded from macro '__section'
   #define __section(section)              __attribute__((__section__(section)))
                                                          ^
   net/smc/smc_sysctl.h:23:5: note: previous definition is here
   int smc_sysctl_init(void)
       ^
>> net/smc/smc_sysctl.c:62:5: warning: attribute declaration must precede definition [-Wignored-attributes]
   int __init smc_sysctl_init(void)
       ^
   include/linux/init.h:50:41: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline __nocfi
                                                   ^
   include/linux/compiler_attributes.h:81:56: note: expanded from macro '__cold'
   #define __cold                          __attribute__((__cold__))
                                                          ^
   net/smc/smc_sysctl.h:23:5: note: previous definition is here
   int smc_sysctl_init(void)
       ^
>> net/smc/smc_sysctl.c:62:5: warning: attribute declaration must precede definition [-Wignored-attributes]
   int __init smc_sysctl_init(void)
       ^
   include/linux/init.h:50:84: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline __nocfi
                                                                                              ^
   include/linux/compiler-clang.h:69:33: note: expanded from macro '__nocfi'
   #define __nocfi         __attribute__((__no_sanitize__("cfi")))
                                          ^
   net/smc/smc_sysctl.h:23:5: note: previous definition is here
   int smc_sysctl_init(void)
       ^
>> net/smc/smc_sysctl.c:62:12: error: redefinition of 'smc_sysctl_init'
   int __init smc_sysctl_init(void)
              ^
   net/smc/smc_sysctl.h:23:5: note: previous definition is here
   int smc_sysctl_init(void)
       ^
>> net/smc/smc_sysctl.c:67:6: error: redefinition of 'smc_sysctl_exit'
   void smc_sysctl_exit(void)
        ^
   net/smc/smc_sysctl.h:28:6: note: previous definition is here
   void smc_sysctl_exit(void) { }
        ^
   5 warnings and 5 errors generated.
--
   In file included from net/smc/af_smc.c:54:
>> net/smc/smc_sysctl.h:23:5: warning: no previous prototype for function 'smc_sysctl_init' [-Wmissing-prototypes]
   int smc_sysctl_init(void)
       ^
   net/smc/smc_sysctl.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smc_sysctl_init(void)
   ^
   static 
>> net/smc/smc_sysctl.h:28:6: warning: no previous prototype for function 'smc_sysctl_exit' [-Wmissing-prototypes]
   void smc_sysctl_exit(void) { }
        ^
   net/smc/smc_sysctl.h:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void smc_sysctl_exit(void) { }
   ^
   static 
   2 warnings generated.


vim +39 net/smc/smc_sysctl.c

    22	
    23	static __net_init int smc_sysctl_init_net(struct net *net)
    24	{
    25		struct ctl_table *table;
    26	
    27		table = smc_table;
    28		if (!net_eq(net, &init_net)) {
    29			int i;
    30	
    31			table = kmemdup(table, sizeof(smc_table), GFP_KERNEL);
    32			if (!table)
    33				goto err_alloc;
    34	
    35			for (i = 0; i < ARRAY_SIZE(smc_table) - 1; i++)
    36				table[i].data += (void *)net - (void *)&init_net;
    37		}
    38	
  > 39		net->smc.smc_hdr = register_net_sysctl(net, "net/smc", table);
    40		if (!net->smc.smc_hdr)
    41			goto err_reg;
    42	
    43		return 0;
    44	
    45	err_reg:
    46		if (!net_eq(net, &init_net))
    47			kfree(table);
    48	err_alloc:
    49		return -ENOMEM;
    50	}
    51	
    52	static __net_exit void smc_sysctl_exit_net(struct net *net)
    53	{
    54		unregister_net_sysctl_table(net->smc.smc_hdr);
    55	}
    56	
    57	static struct pernet_operations smc_sysctl_ops __net_initdata = {
    58		.init = smc_sysctl_init_net,
    59		.exit = smc_sysctl_exit_net,
    60	};
    61	
  > 62	int __init smc_sysctl_init(void)
    63	{
    64		return register_pernet_subsys(&smc_sysctl_ops);
    65	}
    66	
  > 67	void smc_sysctl_exit(void)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
