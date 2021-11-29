Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05A68
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 21:24:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="296887412"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="296887412"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 13:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="476848144"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2021 13:24:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mro8J-000CLx-RO; Mon, 29 Nov 2021 21:24:19 +0000
Date: Tue, 30 Nov 2021 05:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH net] net: ipv6: make fib6_nh_init properly clean
 after itself on error
Message-ID: <202111300529.K2YL6F1D-lkp@intel.com>
References: <20211129141151.490533-1-razor@blackwall.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129141151.490533-1-razor@blackwall.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Nikolay,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Nikolay-Aleksandrov/net-ipv6-make-fib6_nh_init-properly-clean-after-itself-on-error/20211130-001132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 2191b1dfef7d45f44b5008d2148676d9f2c82874
config: i386-randconfig-r002-20211128 (https://download.01.org/0day-ci/archive/20211130/202111300529.K2YL6F1D-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2db1685345b4a1aecadba0a8197c79f5e49da8ec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nikolay-Aleksandrov/net-ipv6-make-fib6_nh_init-properly-clean-after-itself-on-error/20211130-001132
        git checkout 2db1685345b4a1aecadba0a8197c79f5e49da8ec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/nexthop.c:2570:1: warning: unused label 'out' [-Wunused-label]
   out:
   ^~~~
   1 warning generated.


vim +/out +2570 net/ipv4/nexthop.c

597cfe4fc3390a David Ahern         2019-05-24  2544  
53010f991a9f5e David Ahern         2019-05-24  2545  static int nh_create_ipv6(struct net *net,  struct nexthop *nh,
53010f991a9f5e David Ahern         2019-05-24  2546  			  struct nh_info *nhi, struct nh_config *cfg,
53010f991a9f5e David Ahern         2019-05-24  2547  			  struct netlink_ext_ack *extack)
53010f991a9f5e David Ahern         2019-05-24  2548  {
53010f991a9f5e David Ahern         2019-05-24  2549  	struct fib6_nh *fib6_nh = &nhi->fib6_nh;
53010f991a9f5e David Ahern         2019-05-24  2550  	struct fib6_config fib6_cfg = {
53010f991a9f5e David Ahern         2019-05-24  2551  		.fc_table = l3mdev_fib_table(cfg->dev),
53010f991a9f5e David Ahern         2019-05-24  2552  		.fc_ifindex = cfg->nh_ifindex,
53010f991a9f5e David Ahern         2019-05-24  2553  		.fc_gateway = cfg->gw.ipv6,
53010f991a9f5e David Ahern         2019-05-24  2554  		.fc_flags = cfg->nh_flags,
9aca491e0dccf8 Ryoga Saito         2021-09-02  2555  		.fc_nlinfo = cfg->nlinfo,
b513bd035f4044 David Ahern         2019-05-24  2556  		.fc_encap = cfg->nh_encap,
b513bd035f4044 David Ahern         2019-05-24  2557  		.fc_encap_type = cfg->nh_encap_type,
38428d68719c45 Roopa Prabhu        2020-05-21  2558  		.fc_is_fdb = cfg->nh_fdb,
53010f991a9f5e David Ahern         2019-05-24  2559  	};
6f43e5252833f3 Colin Ian King      2019-05-30  2560  	int err;
53010f991a9f5e David Ahern         2019-05-24  2561  
53010f991a9f5e David Ahern         2019-05-24  2562  	if (!ipv6_addr_any(&cfg->gw.ipv6))
53010f991a9f5e David Ahern         2019-05-24  2563  		fib6_cfg.fc_flags |= RTF_GATEWAY;
53010f991a9f5e David Ahern         2019-05-24  2564  
53010f991a9f5e David Ahern         2019-05-24  2565  	/* sets nh_dev if successful */
53010f991a9f5e David Ahern         2019-05-24  2566  	err = ipv6_stub->fib6_nh_init(net, fib6_nh, &fib6_cfg, GFP_KERNEL,
53010f991a9f5e David Ahern         2019-05-24  2567  				      extack);
2db1685345b4a1 Nikolay Aleksandrov 2021-11-29  2568  	if (!err)
53010f991a9f5e David Ahern         2019-05-24  2569  		nh->nh_flags = fib6_nh->fib_nh_flags;
1c743127cc54b1 Nikolay Aleksandrov 2021-11-23 @2570  out:
53010f991a9f5e David Ahern         2019-05-24  2571  	return err;
53010f991a9f5e David Ahern         2019-05-24  2572  }
53010f991a9f5e David Ahern         2019-05-24  2573  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
