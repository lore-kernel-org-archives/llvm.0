Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3E12F5D
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646305315; x=1677841315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3r8Ib7tswZuhTlRizACNTSXhPpUNhhBtSN6IXXbiwM=;
  b=RaPKC97vJYPD5blDwPuI7YoeXEUNU+MmCEmUF1hND9bh0gXa7T+3D7Yb
   6/RgnOxayjkAW3cQmy4PFeGXIRxIVeJwFts0WzANoSOtz/TrV0tk2l5G9
   yoJAC4sYkoJOPFGhyNDqIJPc4UgYyf7IBNYTQEvZeX8rajB0F1zQPhPGv
   uPP+G54yvx2MtBqIuLuaTuLMILhOS0i6YmX9wUl0QKVgTa9vVQLA+3VQI
   UaGwk2GLCRoM+F54JZ6X7Qf9b3CXHDBoDRxLszVXFfDkkDXHMQE0JyoUQ
   rFyIyL+clIpV8W6gLncwZ/Q2x9bQAY6D33J3DmbTG8kCBP2IUxglY3aRO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237154524"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="237154524"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535785161"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 03:01:51 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPjDS-0000Pw-EN; Thu, 03 Mar 2022 11:01:50 +0000
Date: Thu, 3 Mar 2022 19:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [netfilter-nf-next:master 4/12]
 net/netfilter/nf_conntrack_netlink.c:3885:2: error: implicit declaration of
 function 'nf_conntrack_register_notifier'
Message-ID: <202203031802.iTj8Fo1p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git master
head:   25485ffb54ac073e82957218404e303469477c2f
commit: e999c34a878887e8413b6f728b929d668e191888 [4/12] netfilter: ctnetlink: make ecache event cb global again
config: riscv-randconfig-r042-20220303 (https://download.01.org/0day-ci/archive/20220303/202203031802.iTj8Fo1p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git/commit/?id=e999c34a878887e8413b6f728b929d668e191888
        git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git
        git fetch --no-tags netfilter-nf-next master
        git checkout e999c34a878887e8413b6f728b929d668e191888
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/netfilter/nf_conntrack_netlink.c:3885:2: error: implicit declaration of function 'nf_conntrack_register_notifier' [-Werror,-Wimplicit-function-declaration]
           nf_conntrack_register_notifier(&ctnl_notifier);
           ^
   net/netfilter/nf_conntrack_netlink.c:3885:2: note: did you mean 'netlink_register_notifier'?
   include/linux/netlink.h:151:5: note: 'netlink_register_notifier' declared here
   int netlink_register_notifier(struct notifier_block *nb);
       ^
>> net/netfilter/nf_conntrack_netlink.c:3885:34: error: use of undeclared identifier 'ctnl_notifier'; did you mean 'rtnl_notify'?
           nf_conntrack_register_notifier(&ctnl_notifier);
                                           ^~~~~~~~~~~~~
                                           rtnl_notify
   include/linux/rtnetlink.h:14:13: note: 'rtnl_notify' declared here
   extern void rtnl_notify(struct sk_buff *skb, struct net *net, u32 pid,
               ^
   2 errors generated.


vim +/nf_conntrack_register_notifier +3885 net/netfilter/nf_conntrack_netlink.c

  3866	
  3867	static int __init ctnetlink_init(void)
  3868	{
  3869		int ret;
  3870	
  3871		BUILD_BUG_ON(sizeof(struct ctnetlink_list_dump_ctx) > sizeof_field(struct netlink_callback, ctx));
  3872	
  3873		ret = nfnetlink_subsys_register(&ctnl_subsys);
  3874		if (ret < 0) {
  3875			pr_err("ctnetlink_init: cannot register with nfnetlink.\n");
  3876			goto err_out;
  3877		}
  3878	
  3879		ret = nfnetlink_subsys_register(&ctnl_exp_subsys);
  3880		if (ret < 0) {
  3881			pr_err("ctnetlink_init: cannot register exp with nfnetlink.\n");
  3882			goto err_unreg_subsys;
  3883		}
  3884	
> 3885		nf_conntrack_register_notifier(&ctnl_notifier);
  3886	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
