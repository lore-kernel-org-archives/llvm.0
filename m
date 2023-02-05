Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31A15AC;
	Sun,  5 Feb 2023 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675593379; x=1707129379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGyQJhscA+Se1H9jpIzoQrA4F5+lqFvhEJVkv9AYppE=;
  b=lrCQl+eth5/3d3PPPhB34ykqa3TpklTep3MvAUgsugkg1fDaJH9M9dl/
   XsTQe6NicYBAK0EXxmNsqImODsL0D7BI7MfOIE29wAekIWrq1ab905ySS
   CxFQznvtMvLnmhBpGd6Wf40/So8rnYjnXjR064iDY9IcgEyF0NjaugFpg
   QqWYc5A3CWhK+zuRSIN0tUBRvLK5QPQRBsQMLj1Ds6vNwsvc110ipShgL
   Rpw+MebYrEmJaR5Ne/f+PfJ+5KNsafRQc3msVgAkaltjDwkNZN6/pRgQt
   JcNcoqFpez1+z5nDuudqRmt8JhgL7TKUvsFpRnGpo+G8PgPYXJVTJu8UV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="312691083"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="312691083"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 02:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="729734915"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="729734915"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2023 02:36:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOcNc-0001wm-22;
	Sun, 05 Feb 2023 10:36:16 +0000
Date: Sun, 5 Feb 2023 18:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 06/13] rtnetlink: bridge: mcast: Move MDB
 handlers out of bridge driver
Message-ID: <202302051820.pWDrttJj-lkp@intel.com>
References: <20230204170801.3897900-7-idosch@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204170801.3897900-7-idosch@nvidia.com>

Hi Ido,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ido-Schimmel/bridge-mcast-Use-correct-define-in-MDB-dump/20230205-011545
patch link:    https://lore.kernel.org/r/20230204170801.3897900-7-idosch%40nvidia.com
patch subject: [RFC PATCH net-next 06/13] rtnetlink: bridge: mcast: Move MDB handlers out of bridge driver
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230205/202302051820.pWDrttJj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dd1f784995f3efdbf26e2b2694a0cd1ca181d35e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ido-Schimmel/bridge-mcast-Use-correct-define-in-MDB-dump/20230205-011545
        git checkout dd1f784995f3efdbf26e2b2694a0cd1ca181d35e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/core/rtnetlink.c:6105:2: error: call to __compiletime_assert_651 declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(*ctx) != sizeof(cb->ctx)
           BUILD_BUG_ON(sizeof(*ctx) != sizeof(cb->ctx));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:339:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:20:1: note: expanded from here
   __compiletime_assert_651
   ^
   1 error generated.


vim +/error +6105 net/core/rtnetlink.c

  6096	
  6097	static int rtnl_mdb_dump(struct sk_buff *skb, struct netlink_callback *cb)
  6098	{
  6099		struct rtnl_mdb_dump_ctx *ctx = (void *)cb->ctx;
  6100		struct net *net = sock_net(skb->sk);
  6101		struct net_device *dev;
  6102		int idx, s_idx;
  6103		int err;
  6104	
> 6105		BUILD_BUG_ON(sizeof(*ctx) != sizeof(cb->ctx));
  6106	
  6107		if (cb->strict_check) {
  6108			err = rtnl_mdb_valid_dump_req(cb->nlh, cb->extack);
  6109			if (err)
  6110				return err;
  6111		}
  6112	
  6113		s_idx = ctx->idx;
  6114		idx = 0;
  6115	
  6116		for_each_netdev(net, dev) {
  6117			if (idx < s_idx)
  6118				goto skip;
  6119			if (!dev->netdev_ops->ndo_mdb_dump)
  6120				goto skip;
  6121	
  6122			err = dev->netdev_ops->ndo_mdb_dump(dev, skb, cb);
  6123			if (err == -EMSGSIZE)
  6124				goto out;
  6125			/* Moving on to next device, reset device's markers. */
  6126			memset(ctx->dev_markers, 0, sizeof(ctx->dev_markers));
  6127	skip:
  6128			idx++;
  6129		}
  6130	
  6131	out:
  6132		ctx->idx = idx;
  6133		return skb->len;
  6134	}
  6135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
