Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F62F2C
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 22:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644273300; x=1675809300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fB30TGozDnNwkvmCJtIs1n+CB+ujhtjdyI6F+aPuKJU=;
  b=E7OnYxjfHBG00DQVX9WXRzdVoPzwJsPzPvj1Z4Pnhc2yl1b4AwHgne+P
   AOXcF9RI+2VFQDjMy5V0RFd7weuuQ3t4YARvsBqnMWn/Ex4iwYGslb1iq
   7/c5DBkrR33L757rZDe7mtV2aww4qsNyKVzmT9Sjkbi14eBR+qv0J7Ug2
   7dviGMQ6yAnkVw+vL0y0UNaietN7XyV/WetC3Wg5Cny1ctb55qoKAEb4D
   Kw/nklMfYGR/BlFVx0dFZdN4GDYDchIsvi1tzUhUxc7Z7YSgDf/N7/xq/
   erucHFWfTbW7oD6nqUdPQ5qc5gn+PrKXc0wrwhMM3WwW/L4/Krp7YgQF3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="236227196"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="236227196"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 14:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="540316265"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2022 14:34:57 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHCb2-000135-NS; Mon, 07 Feb 2022 22:34:56 +0000
Date: Tue, 8 Feb 2022 06:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 08/11] ipmr: introduce ipmr_net_exit_batch()
Message-ID: <202202080620.vPGy8XEF-lkp@intel.com>
References: <20220207171756.1304544-9-eric.dumazet@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207171756.1304544-9-eric.dumazet@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Eric,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Eric-Dumazet/net-speedup-netns-dismantles/20220208-013735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git ff62433883b3ab753a78954ecf46e2c514f5c407
config: x86_64-randconfig-r003-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080620.vPGy8XEF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4a23446f3f1d4d348348210ec16e5e5372177b48
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Eric-Dumazet/net-speedup-netns-dismantles/20220208-013735
        git checkout 4a23446f3f1d4d348348210ec16e5e5372177b48
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/ipv4/ipmr.c:269:2: error: implicit declaration of function 'ASSERT_RNTL' [-Werror,-Wimplicit-function-declaration]
           ASSERT_RNTL();
           ^
   1 error generated.


vim +/ASSERT_RNTL +269 net/ipv4/ipmr.c

   264	
   265	static void __net_exit ipmr_rules_exit(struct net *net)
   266	{
   267		struct mr_table *mrt, *next;
   268	
 > 269		ASSERT_RNTL();
   270		list_for_each_entry_safe(mrt, next, &net->ipv4.mr_tables, list) {
   271			list_del(&mrt->list);
   272			ipmr_free_table(mrt);
   273		}
   274		fib_rules_unregister(net->ipv4.mr_rules_ops);
   275	}
   276	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
