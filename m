Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0467E9;
	Thu,  6 Apr 2023 02:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680749916; x=1712285916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3Z9sjVGEob/GoGVts3nOrJ90YUTU0Ho1Ex+8S/Ozyc=;
  b=fxC8lwBdqVLM0HDr+LkfC/+vd6GtKFvobtvyyxsjXB8qRzVTJ7SE2De2
   GxJG7wga11rsl7Yyj+Mjng+vAdUjDYK0lgVIrp16AJuE+/hLh5jbVv6Mt
   L/lqwfwpzR5VW7YOoe/Zo2BZ6RqUCGh70HH6rncW1zVuhQIjsSXIeX42J
   RbWPuLTE5/jrP+xTxPUXKf+FcMHpyg4ugw9q3x0U0LaQLxdqgRjNclJCK
   tSSCN3PCFGHlhsnVFSTi8x2xEHZRk1+Npkq2Zgi6Ax/gVL7vc/ikjbLy9
   VZ0NrYB8ya2wspHfb7kKEXhNS35Lb29SKwGw4S7hw/RUgZSiK8IAUwrsW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428912602"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="428912602"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 19:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719527475"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="719527475"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Apr 2023 19:58:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkFpZ-000Qzu-21;
	Thu, 06 Apr 2023 02:58:33 +0000
Date: Thu, 6 Apr 2023 10:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: dsa: replace
 NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
Message-ID: <202304061058.ZYSqgL8r-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
patch link:    https://lore.kernel.org/r/20230405165115.3744445-1-vladimir.oltean%40nxp.com
patch subject: [RFC PATCH net-next] net: dsa: replace NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
config: arm-randconfig-r023-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061058.ZYSqgL8r-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/4788a6c004ab7f7210b1d27777e733eab85db17e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
        git checkout 4788a6c004ab7f7210b1d27777e733eab85db17e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061058.ZYSqgL8r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/dsa/stubs.c:7:
>> include/net/dsa_stubs.h:33:2: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (dsa_stubs)
           ^~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dsa_stubs.h:38:9: note: uninitialized use occurs here
           return err;
                  ^~~
   include/net/dsa_stubs.h:33:2: note: remove the 'if' if its condition is always true
           if (dsa_stubs)
           ^~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/net/dsa_stubs.h:26:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +33 include/net/dsa_stubs.h

    21	
    22	static inline int dsa_master_hwtstamp_validate(struct net_device *dev,
    23						       const struct kernel_hwtstamp_config *config,
    24						       struct netlink_ext_ack *extack)
    25	{
    26		int err;
    27	
    28		if (!netdev_uses_dsa(dev))
    29			return 0;
    30	
    31		mutex_lock(&dsa_stubs_lock);
    32	
  > 33		if (dsa_stubs)
    34			err = dsa_stubs->master_hwtstamp_validate(dev, config, extack);
    35	
    36		mutex_unlock(&dsa_stubs_lock);
    37	
    38		return err;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
