Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C364C83;
	Thu,  1 Jun 2023 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685590201; x=1717126201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bkwmBrcMfaAhfY2paDibkRrD8yfsaLON71JlWPE0NY=;
  b=T1+f4nHBC9IZrKzDEwd9Hfem0DkVIgsPDD154BVezXwvkwlUQ37ekEqC
   LpGSXj2PeK3E4MSBs98YqHoZTpzZeBM96BZbKdmLuUlTCh2lX8fHtf8Eh
   rnDNAIrLw15d+ZY4yi9ZB1P6g8MU3rBJlUqNsQakXVz/yynjZg1LaqCrL
   vvU1cO8BWta6TBXi/BRj3/xLGCHVvJdFciyNIydpyx0ENx/dcTxHReNKn
   2dI8l9Q6NprJGlypIvlN6wRn48SlMODyVtPsiLUV/Z/THXMYOX+O1AJOh
   0+h+h7hl3Lzm79LNtj/SFyn5Ig5E+40DHp+AnLkLZUOALjyOBJmkiPz4P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383705722"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383705722"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 20:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="772233250"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="772233250"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 May 2023 20:29:59 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Z0g-0001sR-2T;
	Thu, 01 Jun 2023 03:29:58 +0000
Date: Thu, 1 Jun 2023 11:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:large-block-next 13/31] block/bdev.c:455:15: warning: mixing
 declarations and code is incompatible with standards before C99
Message-ID: <202306011128.d5xJxSQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git large-block-next
head:   1e9b17615c8ad5829f88f54de36523f291a145cc
commit: fbc88e916be0dfe97615d765277253cd35cbf2eb [13/31] block: set mapping order for the block page cache in device_add_disk
config: powerpc-randconfig-r015-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011128.d5xJxSQm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=fbc88e916be0dfe97615d765277253cd35cbf2eb
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof large-block-next
        git checkout fbc88e916be0dfe97615d765277253cd35cbf2eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011128.d5xJxSQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bdev.c:455:15: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           unsigned int lbs = queue_logical_block_size(bdev->bd_queue);
                        ^
   1 warning generated.


vim +455 block/bdev.c

   449	
   450	void bdev_set_mapping_order(struct block_device *bdev)
   451	{
   452	#ifdef CONFIG_BUFFER_HEAD
   453		return;
   454	#endif
 > 455		unsigned int lbs = queue_logical_block_size(bdev->bd_queue);
   456		int order = ilog2(lbs) - PAGE_SHIFT;
   457	
   458		if (order > 0)
   459			mapping_set_min_folio_order(bdev->bd_inode->i_mapping,
   460						    order);
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
