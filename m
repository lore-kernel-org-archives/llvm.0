Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF41615D
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646310235; x=1677846235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YlWiPlnQT/J4CWX3oOcwnxjiyCoPKF45JgGeKXxefBw=;
  b=XCagCtpyoWYvw7DHDcDXwkyoJJvMRbqE1LgR+Hew4Pn2Djk0myZSNa6H
   R+I2X4ZJUV4rIis6WQhY+sJ5HETN+ETxmC7PJtlwRTp60dqWP1Uj5op89
   b9DaYRLnoucfDTeyC7+1fyAqw6VIKtbUn4Ikxltf9zaZ3zjN4rXaUyHr9
   Tqcz3IpR7hvGghZNb+VSH7S3PzWMm9rZHYZq06AsPRHO4ICIdZKATh847
   gK4S9SZZEBjuXuwpww57Re7WXPDHTboWR6Ky1KYPMwai5JtdkK1nbSImO
   y9DDpVI8XU05gn6wPSj7dpJUXYcLgI/6lmVUSHlnMZ46VgVUSiHhBo7jU
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="252486258"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="252486258"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 04:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="511412803"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Mar 2022 04:23:52 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPkUq-0000UP-34; Thu, 03 Mar 2022 12:23:52 +0000
Date: Thu, 3 Mar 2022 20:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [netfilter-nf-next:master 9/12]
 net/netfilter/nf_conntrack_core.c:670:19: error: no member named 'ecache' in
 'struct nf_conntrack_net'
Message-ID: <202203032033.frsNjH8R-lkp@intel.com>
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
commit: 3ad61edaa5ac46811b4ea07a994428ead31e7468 [9/12] netfilter: conntrack: remove the percpu dying list
config: riscv-randconfig-r042-20220303 (https://download.01.org/0day-ci/archive/20220303/202203032033.frsNjH8R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git/commit/?id=3ad61edaa5ac46811b4ea07a994428ead31e7468
        git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git
        git fetch --no-tags netfilter-nf-next master
        git checkout 3ad61edaa5ac46811b4ea07a994428ead31e7468
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/netfilter/nf_conntrack_core.c:670:19: error: no member named 'ecache' in 'struct nf_conntrack_net'
           spin_lock(&cnet->ecache.dying_lock);
                      ~~~~  ^
   net/netfilter/nf_conntrack_core.c:672:13: error: no member named 'ecache' in 'struct nf_conntrack_net'
                                    &cnet->ecache.dying_list);
                                     ~~~~  ^
   net/netfilter/nf_conntrack_core.c:673:21: error: no member named 'ecache' in 'struct nf_conntrack_net'
           spin_unlock(&cnet->ecache.dying_lock);
                        ~~~~  ^
   3 errors generated.


vim +670 net/netfilter/nf_conntrack_core.c

dd7669a92c6066 Pablo Neira Ayuso 2009-06-13  665  
38a419ee4e646c Florian Westphal  2022-02-24  666  static void nf_ct_add_to_ecache_list(struct nf_conn *ct)
38a419ee4e646c Florian Westphal  2022-02-24  667  {
38a419ee4e646c Florian Westphal  2022-02-24  668  	struct nf_conntrack_net *cnet = nf_ct_pernet(nf_ct_net(ct));
38a419ee4e646c Florian Westphal  2022-02-24  669  
38a419ee4e646c Florian Westphal  2022-02-24 @670  	spin_lock(&cnet->ecache.dying_lock);
38a419ee4e646c Florian Westphal  2022-02-24  671  	hlist_nulls_add_head_rcu(&ct->tuplehash[IP_CT_DIR_ORIGINAL].hnnode,
38a419ee4e646c Florian Westphal  2022-02-24  672  				 &cnet->ecache.dying_list);
38a419ee4e646c Florian Westphal  2022-02-24  673  	spin_unlock(&cnet->ecache.dying_lock);
38a419ee4e646c Florian Westphal  2022-02-24  674  }
38a419ee4e646c Florian Westphal  2022-02-24  675  

:::::: The code at line 670 was first introduced by commit
:::::: 38a419ee4e646c1a6427f98717ad0bfac9762607 netfilter: ecache: use dedicated list for event redelivery

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
