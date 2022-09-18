Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599747F3
	for <llvm@lists.linux.dev>; Sun, 18 Sep 2022 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663502801; x=1695038801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P1mStzX+ZTxew+BXLijlEAs5OjjsBtuHqjjbrzUv5tk=;
  b=lox+I8VWyu6UeeFHmxlHhniLLyR0i1sfhdNKmmJdpyy0TD8bqziXuCVp
   ngUGJjhLzgfUYIRh5EQazFzzgKPBr/njuGuDgrBGTzu901Xiak/tbAQ8/
   YggmdsEx4iZdznbiP5v6ITdX7I96ovbHSRYhyGuesg38dpiFJtNpkIIIS
   1rfLtYdjbh4vkeae/NGq0bGhYbRfdEjmP0CIht57Stf3YJoXq8+SdmJQB
   YDGNdmjR/clnQ2iubcXqpSfyLgVXal0Swx2kI0WZe3pl3mrKOocDVD47G
   qcpNeHbjx2mhGnf0Z85WYqd5TSM7zAhU1frU4uI+EIAuXhrKoB8rRa6fJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="325512430"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="325512430"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 05:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="595771771"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Sep 2022 05:06:28 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZt48-0001A7-0N;
	Sun, 18 Sep 2022 12:06:28 +0000
Date: Sun, 18 Sep 2022 20:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Shen <shenjian15@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFCv8 PATCH net-next 54/55] treewide: use netdev_features_copy
 helpers
Message-ID: <202209181949.aWxvqPnW-lkp@intel.com>
References: <20220918094336.28958-55-shenjian15@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918094336.28958-55-shenjian15@huawei.com>

Hi Jian,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Shen/net-extend-the-type-of-netdev_features_t-to-bitmap/20220918-175512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 44a8535fb87c5503ce01121278ac3058eef701ec
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220918/202209181949.aWxvqPnW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ffa4c285bdcbd69824e5b38b1d3e98b905fc17d8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jian-Shen/net-extend-the-type-of-netdev_features_t-to-bitmap/20220918-175512
        git checkout ffa4c285bdcbd69824e5b38b1d3e98b905fc17d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/bonding/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/bonding/bond_main.c:38:
   In file included from include/linux/filter.h:20:
   In file included from include/linux/if_vlan.h:10:
   include/linux/netdevice.h:4949:6: warning: variable 'feature' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (classic_gso_type)
               ^~~~~~~~~~~~~~~~
   include/linux/netdevice.h:4955:22: note: uninitialized use occurs here
           return (*features & feature) == feature;
                               ^~~~~~~
   include/linux/netdevice.h:4949:2: note: remove the 'if' if its condition is always true
           if (classic_gso_type)
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:4927:27: note: initialize the variable 'feature' to silence this warning
           netdev_features_t feature;
                                    ^
                                     = 0
>> drivers/net/bonding/bond_main.c:1453:23: error: use of undeclared identifier 'xfrm_features'
           netdev_features_copy(xfrm_features, BOND_XFRM_FEATURES);
                                ^
   1 warning and 1 error generated.


vim +/xfrm_features +1453 drivers/net/bonding/bond_main.c

  1431	
  1432	static void bond_compute_features(struct bonding *bond)
  1433	{
  1434		unsigned int dst_release_flag = IFF_XMIT_DST_RELEASE |
  1435						IFF_XMIT_DST_RELEASE_PERM;
  1436		netdev_features_t vlan_features;
  1437		netdev_features_t enc_features;
  1438	#ifdef CONFIG_XFRM_OFFLOAD
  1439		netdev_features_t xfrm_features;
  1440	#endif /* CONFIG_XFRM_OFFLOAD */
  1441		netdev_features_t mpls_features;
  1442		struct net_device *bond_dev = bond->dev;
  1443		struct list_head *iter;
  1444		struct slave *slave;
  1445		unsigned short max_hard_header_len = ETH_HLEN;
  1446		unsigned int tso_max_size = TSO_MAX_SIZE;
  1447		u16 tso_max_segs = TSO_MAX_SEGS;
  1448	
  1449		if (!bond_has_slaves(bond))
  1450			goto done;
  1451		netdev_features_copy(vlan_features, BOND_VLAN_FEATURES);
  1452		netdev_features_copy(enc_features, BOND_ENC_FEATURES);
> 1453		netdev_features_copy(xfrm_features, BOND_XFRM_FEATURES);
  1454		netdev_features_copy(mpls_features, BOND_MPLS_FEATURES);
  1455		netdev_features_mask(vlan_features, NETIF_F_ALL_FOR_ALL);
  1456		netdev_features_mask(mpls_features, NETIF_F_ALL_FOR_ALL);
  1457	
  1458		bond_for_each_slave(bond, slave, iter) {
  1459			netdev_increment_features(&vlan_features, &vlan_features,
  1460						  &slave->dev->vlan_features,
  1461						  &BOND_VLAN_FEATURES);
  1462	
  1463			netdev_increment_features(&enc_features, &enc_features,
  1464						  &slave->dev->hw_enc_features,
  1465						  &BOND_ENC_FEATURES);
  1466	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
