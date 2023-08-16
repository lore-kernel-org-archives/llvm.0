Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42138440F;
	Wed, 16 Aug 2023 02:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692152198; x=1723688198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOnjRkSImAk3sLb2sJP+ZgKltOBE8aehRMj+DCgzQDE=;
  b=OOGFl90Ar1MjMW8bovJnp3OvaYMLib4xxcjxr+95RBCGbpxuY1LI+CNv
   4fir32EXPBcYJYoswOytek2LgvcYr0S6TqDtT/0I41YZK3CKkPh8bfPU3
   StXM/DI58Bk/AyxJtdM60Wbb7ekeDhSt0mK0/PmfFmtCBBw0aPTpJx04X
   XV5z496EbQmhn7Yy/No5uu8yBwCV3+RnXzuQcFfPvMdq3pri0MVBqq7gy
   ItVR05LK+NTaKOUmpWYZfDd2wmt0zY26mEnh6H8lGLdijZ53oDCeKvPDi
   clzTak3Pzmrhl4YihIByiowE7dNKMn/vCccE3tao1iKFJMV0ilqRbXoIm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458774371"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="458774371"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 19:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877584448"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2023 19:16:39 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW65L-0001Pb-0Y;
	Wed, 16 Aug 2023 02:16:35 +0000
Date: Wed, 16 Aug 2023 10:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.14a 48/51] kernel/rcu/tree_stall.h:11:10:
 fatal error: 'linux/rcu_notifier.h' file not found
Message-ID: <202308161021.xxxuCjro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.14a
head:   a90c4cbc91475bd5df35f712a954972fbfff40a1
commit: 815c9a53ab6b20e0dc90e733336151310a05cba2 [48/51] rcu: Add RCU CPU stall notifier
config: x86_64-randconfig-x004-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161021.xxxuCjro-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161021.xxxuCjro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161021.xxxuCjro-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5066:
>> kernel/rcu/tree_stall.h:11:10: fatal error: 'linux/rcu_notifier.h' file not found
   #include <linux/rcu_notifier.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +11 kernel/rcu/tree_stall.h

  > 11	#include <linux/rcu_notifier.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
