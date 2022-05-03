Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C21F17E9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651564662; x=1683100662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FlRiKfqSuh1XLC0R5CGeqPCvXfdh8ord8M/oBzCMiss=;
  b=KjgaF+PY7CNYe886Ss6WUn01PhDCYqa4YetkV/hMZZe9UF6o7VJIVk5M
   4b2fN8DoTx0PqmrOT3mDwgf0iESrKEu4OLkn/b/RW7oPzU3CeGhyywvBj
   A/lGbuMh5F8/dq2X/3dAceuwxPHrJBVK7R+4M9rPXL0y9tSmK5zjDn7Hd
   dTjHZUOh+A438bllZYaqKoBfRY0LArhIKyn6JJyp5lKUNK90b5zfD4r21
   3mgveBVy/y0sZj0oBBiZG4eyukVhHOOVVYmrhhhdHw/sqKHKZOFmrRFUl
   1lA898ehexRtZ/naOA8N380KWMqe6QT1UOXPq2bsKyVW6gwWSgDJ+RjlJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="327966001"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
   d="scan'208";a="327966001"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 00:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
   d="scan'208";a="620259337"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 May 2022 00:57:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlnPT-000AGQ-Ig;
	Tue, 03 May 2022 07:57:27 +0000
Date: Tue, 3 May 2022 15:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [congwang:sk_data_ready 6/7]
 drivers/infiniband/sw/siw/siw_cm.c:80:20: error: incompatible function
 pointer types assigning to 'int (*)(struct sock *)' from 'void (struct sock
 *)'
Message-ID: <202205031550.1bsjlTlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git sk_data_ready
head:   88034d522dc85744321dba24fc073608055add77
commit: 40fdf7067e658744944a0eeeaf6371220a42b34a [6/7] net: make ->sk_data_ready() return int
config: riscv-randconfig-r036-20220501 (https://download.01.org/0day-ci/archive/20220503/202205031550.1bsjlTlO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/congwang/linux/commit/40fdf7067e658744944a0eeeaf6371220a42b34a
        git remote add congwang https://github.com/congwang/linux.git
        git fetch --no-tags congwang sk_data_ready
        git checkout 40fdf7067e658744944a0eeeaf6371220a42b34a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/infiniband/sw/siw/ net/smc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/infiniband/sw/siw/siw_cm.c:80:20: error: incompatible function pointer types assigning to 'int (*)(struct sock *)' from 'void (struct sock *)' [-Werror,-Wincompatible-function-pointer-types]
           sk->sk_data_ready = siw_qp_llp_data_ready;
                             ^ ~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/infiniband/sw/siw/siw_qp.c:93:5: error: conflicting types for 'siw_qp_llp_data_ready'
   int siw_qp_llp_data_ready(struct sock *sk)
       ^
   drivers/infiniband/sw/siw/siw.h:528:6: note: previous declaration is here
   void siw_qp_llp_data_ready(struct sock *sk);
        ^
   1 error generated.
--
>> net/smc/af_smc.c:762:39: error: incompatible function pointer types passing 'int (*)(struct sock *)' to parameter of type 'void (*)(struct sock *)' [-Werror,-Wincompatible-function-pointer-types]
           smc_fback_forward_wakeup(smc, clcsk, smc->clcsk_data_ready);
                                                ^~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c:724:17: note: passing argument to parameter 'clcsock_callback' here
                                        void (*clcsock_callback)(struct sock *sk))
                                               ^
>> net/smc/af_smc.c:819:24: error: incompatible function pointer types assigning to 'int (*)(struct sock *)' from 'void (struct sock *)' [-Werror,-Wincompatible-function-pointer-types]
                   clcsk->sk_data_ready = smc_fback_data_ready;
                                        ^ ~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +80 drivers/infiniband/sw/siw/siw_cm.c

6c52fdc244b5cc Bernard Metzler 2019-06-20  71  
6c52fdc244b5cc Bernard Metzler 2019-06-20  72  static void siw_qp_socket_assoc(struct siw_cep *cep, struct siw_qp *qp)
6c52fdc244b5cc Bernard Metzler 2019-06-20  73  {
6c52fdc244b5cc Bernard Metzler 2019-06-20  74  	struct socket *s = cep->sock;
6c52fdc244b5cc Bernard Metzler 2019-06-20  75  	struct sock *sk = s->sk;
6c52fdc244b5cc Bernard Metzler 2019-06-20  76  
6c52fdc244b5cc Bernard Metzler 2019-06-20  77  	write_lock_bh(&sk->sk_callback_lock);
6c52fdc244b5cc Bernard Metzler 2019-06-20  78  
6c52fdc244b5cc Bernard Metzler 2019-06-20  79  	qp->attrs.sk = s;
6c52fdc244b5cc Bernard Metzler 2019-06-20 @80  	sk->sk_data_ready = siw_qp_llp_data_ready;
6c52fdc244b5cc Bernard Metzler 2019-06-20  81  	sk->sk_write_space = siw_qp_llp_write_space;
6c52fdc244b5cc Bernard Metzler 2019-06-20  82  
6c52fdc244b5cc Bernard Metzler 2019-06-20  83  	write_unlock_bh(&sk->sk_callback_lock);
6c52fdc244b5cc Bernard Metzler 2019-06-20  84  }
6c52fdc244b5cc Bernard Metzler 2019-06-20  85  

:::::: The code at line 80 was first introduced by commit
:::::: 6c52fdc244b5ccc468006fd65a504d4ee33743c7 rdma/siw: connection management

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
