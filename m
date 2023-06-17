Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8210EF;
	Sat, 17 Jun 2023 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687043696; x=1718579696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2bL+iWlu5e7NMwRoRMHh5xY6fXWt7J5kq9mFeKoHsQ=;
  b=UNhis25s2DVhDM/0lKv6Y2y16MsTgNznBBbab+evI9AURaP1y2pTNp+V
   R4UhF8ivj3I+TNQHHThABIMdU8LTHllYlIsiVbqeZcy/uz1HHGtnsi9zX
   PukCYODxIJY/XrsBTh7OUXPZD+t8mPgV9xrhEhcPokslwzPase3kr99v8
   fYpBWQQ/yW41r5gYeC9Kd/K1ErMR1IqksQAUKU3N7FFCHeTB2NBz26GqI
   HklTJOu9QlGrVvQpAYpOheHw+HfES1rR5RmtE5AtQgCmE4Exl0XKP3nmW
   AWMomvC6/XKX/oqS17mtcj0xudaZ5EaXoVs8m1JfyndsoI+TDCOzUjGHV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="423089215"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="423089215"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 16:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="960021124"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="960021124"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2023 16:14:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAf89-0003Cc-1R;
	Sat, 17 Jun 2023 23:14:53 +0000
Date: Sun, 18 Jun 2023 07:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 14/17]
 net/mpls/af_mpls.c:1422:20: error: use of undeclared identifier 'mpls_table'
Message-ID: <202306180747.FAOtFvdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: 21228baedf71a454dde0e4d62f4686d99a2c7f28 [14/17] sysctl: Add size to the regsiter_net_sysctl function
config: i386-randconfig-r003-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180747.FAOtFvdi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180747.FAOtFvdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180747.FAOtFvdi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/mpls/af_mpls.c:1422:20: error: use of undeclared identifier 'mpls_table'
                                              ARRAY_SIZE(mpls_table));
                                                         ^
>> net/mpls/af_mpls.c:1422:20: error: use of undeclared identifier 'mpls_table'
>> net/mpls/af_mpls.c:1422:20: error: use of undeclared identifier 'mpls_table'
   3 errors generated.


vim +/mpls_table +1422 net/mpls/af_mpls.c

  1397	
  1398	static int mpls_dev_sysctl_register(struct net_device *dev,
  1399					    struct mpls_dev *mdev)
  1400	{
  1401		char path[sizeof("net/mpls/conf/") + IFNAMSIZ];
  1402		struct net *net = dev_net(dev);
  1403		struct ctl_table *table;
  1404		int i;
  1405	
  1406		table = kmemdup(&mpls_dev_table, sizeof(mpls_dev_table), GFP_KERNEL);
  1407		if (!table)
  1408			goto out;
  1409	
  1410		/* Table data contains only offsets relative to the base of
  1411		 * the mdev at this point, so make them absolute.
  1412		 */
  1413		for (i = 0; i < ARRAY_SIZE(mpls_dev_table); i++) {
  1414			table[i].data = (char *)mdev + (uintptr_t)table[i].data;
  1415			table[i].extra1 = mdev;
  1416			table[i].extra2 = net;
  1417		}
  1418	
  1419		snprintf(path, sizeof(path), "net/mpls/conf/%s", dev->name);
  1420	
  1421		mdev->sysctl = register_net_sysctl(net, path, table,
> 1422						   ARRAY_SIZE(mpls_table));
  1423		if (!mdev->sysctl)
  1424			goto free;
  1425	
  1426		mpls_netconf_notify_devconf(net, RTM_NEWNETCONF, NETCONFA_ALL, mdev);
  1427		return 0;
  1428	
  1429	free:
  1430		kfree(table);
  1431	out:
  1432		mdev->sysctl = NULL;
  1433		return -ENOBUFS;
  1434	}
  1435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
