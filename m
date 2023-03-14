Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF4E28EF;
	Tue, 14 Mar 2023 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678785211; x=1710321211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tLDxJMWw0FrWo/F+ZXIkpLxyaiQiBWIN3iYIqfBOqiU=;
  b=E+kGHi5bfNhBDj+D0zXzd8FFL4YqHmoyysw2XJaHGjb6hmDaWw7cydHi
   P6K9x8ZVUg3YYQb7hgdXwqowOs2yQYeRyg8OQ4PAUsN7gp587o63EUNXE
   2e3M/K1tmxX774U2qanzXaczOwF0zbPAY9bVX2LsFoL2zPzGftx8UThqp
   vwV5muAILpMhJLwWH22GfFDVzFQlXSMiaeeaS5BIkk0i1lvNQ6+pzhsQr
   2PBDNsnyUULrJmlZv5uorPPa7HY5Zki4xgSQKMn3cnUyj07o5NwzwsL2g
   K+/Q9wvk3DQIjyHKYkSbbv5w0g4/+KQGM5+s8nTXfKqGy9eq5mrHCKuvn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337397887"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="337397887"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789281024"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="789281024"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2023 02:13:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc0il-0006lF-1v;
	Tue, 14 Mar 2023 09:13:27 +0000
Date: Tue, 14 Mar 2023 17:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>
Subject: [song-md:md-next 15/18] drivers/md/md-cluster.c:425:42: error: use
 of undeclared identifier 'mddev'; did you mean 'mode'?
Message-ID: <202303141758.4EtLtIA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
head:   ec7246c9455e83f452055cec9c39bd54e72217a4
commit: 48b34bba06372e5f6645716b57394db28fa7260c [15/18] md: refactor md_wakeup_thread()
config: s390-randconfig-r032-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141758.4EtLtIA1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/commit/?id=48b34bba06372e5f6645716b57394db28fa7260c
        git remote add song-md git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git
        git fetch --no-tags song-md md-next
        git checkout 48b34bba06372e5f6645716b57394db28fa7260c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141758.4EtLtIA1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/md-cluster.c:425:42: error: use of undeclared identifier 'mddev'; did you mean 'mode'?
                           md_wakeup_thread(&cinfo->recv_thread, mddev);
                                                                 ^~~~~
                                                                 mode
   drivers/md/md-cluster.c:418:37: note: 'mode' declared here
   static void ack_bast(void *arg, int mode)
                                       ^
   1 error generated.


vim +425 drivers/md/md-cluster.c

   412	
   413	/*
   414	 * The BAST function for the ack lock resource
   415	 * This function wakes up the receive thread in
   416	 * order to receive and process the message.
   417	 */
   418	static void ack_bast(void *arg, int mode)
   419	{
   420		struct dlm_lock_resource *res = arg;
   421		struct md_cluster_info *cinfo = res->mddev->cluster_info;
   422	
   423		if (mode == DLM_LOCK_EX) {
   424			if (test_bit(MD_CLUSTER_ALREADY_IN_CLUSTER, &cinfo->state))
 > 425				md_wakeup_thread(&cinfo->recv_thread, mddev);
   426			else
   427				set_bit(MD_CLUSTER_PENDING_RECV_EVENT, &cinfo->state);
   428		}
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
