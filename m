Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9C1B63
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 21:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644962230; x=1676498230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m6XSI0G98RPdQqcOvLzHw4i5erJFqqKLtNysZ8EGoWc=;
  b=CsFT9oahb3Hy1J/YOFApzrhwmzqydkeG4HEJ16++9vGZMdxuw2/sTgmP
   NrmmTCZ2HkSMjIZpN5aDNV8K7RaHrb6Up91KywTU6mC06lPCYsw5TmN0t
   5nzHaHiC4Kap7fj21P1FgF3tPgSeuBo1r1GRrye7dsyZXgojDI2vA8HpR
   w2hFjqlijjdylogoaczIhgJ93aLvup0KwsqgI4t8l6CQ/qIzAG+2QRV6Q
   AN3pnt+L2lkKGlW6icXSPdDPoCHNLLJDJx7+rStI502RL+bHB3HrNaZ5U
   iwx78/L2awM9Nx8Yk34Axrc3Vc3WN5Txpz+BMMNtxyYiJ6vsJeITacwgV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="237867147"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="237867147"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 13:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="497587232"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Feb 2022 13:57:08 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nK5oq-000A4q-6W; Tue, 15 Feb 2022 21:57:08 +0000
Date: Wed, 16 Feb 2022 05:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 9/43]
 fs/9p/vfs_inode.c:258:7: error: no member named 'wsize' in 'struct
 netfs_i_context'
Message-ID: <202202160504.GlQpVHFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-maple
head:   d40df0841e9f8de3713a19dd3f0ba283c860cb93
commit: 90870fcbed9794a03bee7aba8195e8c43e46e1dd [9/43] netfs: Add a netfs inode context
config: hexagon-randconfig-r034-20220214 (https://download.01.org/0day-ci/archive/20220216/202202160504.GlQpVHFc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/90870fcbed9794a03bee7aba8195e8c43e46e1dd
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout 90870fcbed9794a03bee7aba8195e8c43e46e1dd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/9p/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the ammarfaizi2-block/dhowells/linux-fs/netfs-maple HEAD d40df0841e9f8de3713a19dd3f0ba283c860cb93 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/9p/vfs_inode.c:258:7: error: no member named 'wsize' in 'struct netfs_i_context'
           ctx->wsize = 1024 * 1024;
           ~~~  ^
   1 error generated.


vim +258 fs/9p/vfs_inode.c

   249	
   250	/*
   251	 * Set parameters for the netfs library
   252	 */
   253	static void v9fs_set_netfs_context(struct inode *inode)
   254	{
   255		struct netfs_i_context *ctx = netfs_i_context(inode);
   256	
   257		netfs_i_context_init(inode, &v9fs_req_ops);
 > 258		ctx->wsize = 1024 * 1024;
   259	}
   260	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
