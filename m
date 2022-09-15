Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3348A2F2C
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663231735; x=1694767735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uoL7vPP/8IYWKJEIB6NT3rcZUmqFkwcUehGM01X78hE=;
  b=LJ7vXTH9JzrkQx8W+SKU7kX9Y9ri9QNmd8Txnc8DSt8hPwHGkP4sABjy
   +y+ZnuDG/6r4Jj76v+XUEF0IKooMGlXvU5puyGn1dLkKMOiq4uvfjVTZ/
   fFh0SOb898uFx4SyTedk9O/3G2dq2RwYFFszhUb72FMNTKCXm0DIN+VA6
   T+M8a1YjmkjHCsN9GyV2GwfFi+sU/Jcbtp9g7v9DMsE9pbRhkHrnD/sRr
   bNBd+sSBZJ+uSoa3sM3tbYuWrn+pXtisKs8IvAkQpyHqoCpj3BRmTLs9m
   Z7XUCkG1mwigxTihnk7f6ytD3GqWYki9t9SMjXRCe0G/kAKywdJkC31Hj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="362616121"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="362616121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 01:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="945866412"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2022 01:48:44 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYkY8-0000EV-0q;
	Thu, 15 Sep 2022 08:48:44 +0000
Date: Thu, 15 Sep 2022 16:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dmytro Shytyi <dmytro@shytyi.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH mptcp-next v5 09/10] These 2 functions are from
 protocol.c. Cannot import as not in protocol.h. Should I leave them like
 this? Or add prototypes in protocol.h and reuse?
Message-ID: <202209151626.VZ5h5x1b-lkp@intel.com>
References: <20220914113151.9898-9-dmytro@shytyi.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914113151.9898-9-dmytro@shytyi.net>

Hi Dmytro,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on mptcp/export]
[cannot apply to shuah-kselftest/next linus/master v6.0-rc5 next-20220914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmytro-Shytyi/mptcp-Fast-Open-Mechanism/20220914-193501
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: hexagon-randconfig-r041-20220914 (https://download.01.org/0day-ci/archive/20220915/202209151626.VZ5h5x1b-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8efc8a6079aac0b3fc91ec3b2400717265d82657
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmytro-Shytyi/mptcp-Fast-Open-Mechanism/20220914-193501
        git checkout 8efc8a6079aac0b3fc91ec3b2400717265d82657
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/mptcp/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/mptcp/fastopen.c:108:6: warning: variable 'reclaimable' set but not used [-Wunused-but-set-variable]
           int reclaimable;
               ^
   1 warning generated.


vim +/reclaimable +108 net/mptcp/fastopen.c

   104	
   105	static void mptcp_rmem_uncharge(struct sock *sk, int size)
   106	{
   107		struct mptcp_sock *msk = mptcp_sk(sk);
 > 108		int reclaimable;
   109	
   110		msk->rmem_fwd_alloc += size;
   111		reclaimable = msk->rmem_fwd_alloc - sk_unused_reserved_mem(sk);
   112	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
