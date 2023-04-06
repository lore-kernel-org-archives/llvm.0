Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D841F7E6;
	Thu,  6 Apr 2023 04:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680755438; x=1712291438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KObXP0jg/K5TzP3B4KEdsdO1716jA8VF7KP//Pl/vQs=;
  b=hQJZleURuVpGkjkBtKpYRM5OkDL2XBmLo9y4HzuD9cMMZ+9HpZ3ZO9Sg
   BUZLcFJq7AKvEfQASXvEwnfKxqc10g8DrKiOPgXzH3TVlqO9+lZ63Nr+p
   9stdPweU5TTDCd3u8HRjfIAyvdD8DqzYOayMCTkdVn1dI9fzywq35CJTz
   8KifG1PAR5hxtYu7nKuqyxmeHuCBB2XxreV4K8gzeojGf0j1HSI6dcTK4
   Sx6uDqN1J04dbs9glgw3aHi+q2LAUF3Ieg3JZwXN9HUbJxKOnenxHp+uo
   PatWEyJrndCesL1P+J7CCbNkwP00/eAZViVGt+8o1MfBtRPgRkTt2nejM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370471302"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="370471302"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 21:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756225888"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="756225888"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2023 21:30:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkHGe-000R2v-1Z;
	Thu, 06 Apr 2023 04:30:36 +0000
Date: Thu, 6 Apr 2023 12:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: dsa: replace
 NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
Message-ID: <202304061254.dcuhkOKf-lkp@intel.com>
References: <20230405165115.3744445-1-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405165115.3744445-1-vladimir.oltean@nxp.com>

Hi Vladimir,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
patch link:    https://lore.kernel.org/r/20230405165115.3744445-1-vladimir.oltean%40nxp.com
patch subject: [RFC PATCH net-next] net: dsa: replace NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20230406/202304061254.dcuhkOKf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4788a6c004ab7f7210b1d27777e733eab85db17e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
        git checkout 4788a6c004ab7f7210b1d27777e733eab85db17e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs// net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061254.dcuhkOKf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/dev_ioctl.c:276:55: error: too many arguments to function call, expected 2, have 3
           err = dsa_master_hwtstamp_validate(dev, &kernel_cfg, &extack);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~~~
   include/net/dsa_stubs.h:43:19: note: 'dsa_master_hwtstamp_validate' declared here
   static inline int dsa_master_hwtstamp_validate(struct net_device *dev,
                     ^
   1 error generated.


vim +276 net/core/dev_ioctl.c

   259	
   260	static int dev_set_hwtstamp(struct net_device *dev, struct ifreq *ifr)
   261	{
   262		struct kernel_hwtstamp_config kernel_cfg;
   263		struct netlink_ext_ack extack = {};
   264		struct hwtstamp_config cfg;
   265		int err;
   266	
   267		if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
   268			return -EFAULT;
   269	
   270		hwtstamp_config_to_kernel(&kernel_cfg, &cfg);
   271	
   272		err = net_hwtstamp_validate(&kernel_cfg);
   273		if (err)
   274			return err;
   275	
 > 276		err = dsa_master_hwtstamp_validate(dev, &kernel_cfg, &extack);
   277		if (err) {
   278			if (extack._msg)
   279				netdev_err(dev, "%s\n", extack._msg);
   280			return err;
   281		}
   282	
   283		return dev_eth_ioctl(dev, ifr, SIOCSHWTSTAMP);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
