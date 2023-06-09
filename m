Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E819E52;
	Fri,  9 Jun 2023 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686331938; x=1717867938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BnDa81DfppJJVdcH9M+l/jwSFNt8uZQhJ+cfthCWq6Y=;
  b=Bh9C02bJOLsokZ0Wdpf5d5WUawnQ7yfKyFBzusFQnIy+6mtftg5ARYIT
   rzY8omXwMGFPP0tRI4aqtuHpnFX9u+JQgsdDH6eCIeHaKvUL8xtFa27Dj
   w+Gs/gr2dpBmhnltzxK07Q1Yc3GFDj6gZYZCIdFu6B2IdBbJJ/7+7piDM
   o7SyV6FtzDjpnh+b9tSws4wiHXbr64tLwkabOUdoGhYt4uNWIiXblXqYa
   K+40Pwu4ZhCRDy//p1H/xQaw7jODaP/Q5ZslfOQOu/in19IqBMTTgPC0t
   fN67CdIdYb2u8XGssvODA9Tkp8cb2p2/hdQnj+MhXflabjObqRhYH07x8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360134414"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="360134414"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 10:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="740244321"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="740244321"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Jun 2023 10:31:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7fxZ-0009GA-1x;
	Fri, 09 Jun 2023 17:31:37 +0000
Date: Sat, 10 Jun 2023 01:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v8 06/10] netdev: expose DPLL pin
 handle for netdevice
Message-ID: <202306100118.qy6qTOoZ-lkp@intel.com>
References: <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>

Hi Arkadiusz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue net-next/main net/main linus/master v6.4-rc5]
[cannot apply to next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/dpll-documentation-on-DPLL-subsystem-interface/20230609-202453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230609121853.3607724-7-arkadiusz.kubalewski%40intel.com
patch subject: [Intel-wired-lan] [RFC PATCH v8 06/10] netdev: expose DPLL pin handle for netdevice
config: riscv-buildonly-randconfig-r003-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100118.qy6qTOoZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch tnguy-next-queue dev-queue
        git checkout tnguy-next-queue/dev-queue
        b4 shazam https://lore.kernel.org/r/20230609121853.3607724-7-arkadiusz.kubalewski@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100118.qy6qTOoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/rtnetlink.c:1059:11: error: no member named 'dpll_pin' in 'struct net_device'
    1059 |         if (dev->dpll_pin)
         |             ~~~  ^
   net/core/rtnetlink.c:1060:41: error: no member named 'dpll_pin' in 'struct net_device'
    1060 |                 size += dpll_msg_pin_handle_size(dev->dpll_pin);
         |                                                  ~~~  ^
   net/core/rtnetlink.c:1793:11: error: no member named 'dpll_pin' in 'struct net_device'
    1793 |         if (dev->dpll_pin) {
         |             ~~~  ^
   net/core/rtnetlink.c:1794:43: error: no member named 'dpll_pin' in 'struct net_device'
    1794 |                 ret = dpll_msg_add_pin_handle(skb, dev->dpll_pin);
         |                                                    ~~~  ^
   4 errors generated.


vim +1059 net/core/rtnetlink.c

  1054	
  1055	static size_t rtnl_dpll_pin_size(const struct net_device *dev)
  1056	{
  1057		size_t size = nla_total_size(0); /* nest IFLA_DPLL_PIN */
  1058	
> 1059		if (dev->dpll_pin)
  1060			size += dpll_msg_pin_handle_size(dev->dpll_pin);
  1061	
  1062		return size;
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
