Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B081FAF;
	Fri, 28 Jul 2023 06:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690525488; x=1722061488;
  h=date:from:cc:subject:message-id:mime-version;
  bh=R1234sSFCYtAqBc2xmIYNG5CtfD1ZllDHzdpvQAFCgM=;
  b=NnvQhNIe1Mz7QrEKNle+Hy1OsgyKmZgqGJukPRRVsgoq0mRt7YjUj4ta
   TnwlhdEnrbSGgQhwFG/t18RTdiA8aEBJeS23kayqdkx2i3lNZ9z6vpX0G
   LvVOx5EnCopKUhMO4SDcILpHv+oJHCIVVRFCMn07esortwIc0j9/2aJbe
   dE7fj/q2e9dp64OMWTyDWUr07Tmwnp6hvXmJHRelclOxaXGo6CgYTzPGP
   D/OpLBO4Q6BbSAzpyshd608K60leEI1Hgkxi3eP2RlfjIjvvwgH/8GU9O
   GtB5SHEcTatcxNGniegnS6redJmpO4jr/OolTsAj1a/CkduJyT96ms3/u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348121868"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="348121868"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 23:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797327229"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="797327229"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2023 23:24:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPGu4-0002wO-2p;
	Fri, 28 Jul 2023 06:24:44 +0000
Date: Fri, 28 Jul 2023 14:24:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [avpatel:riscv_vector_crypto_v4 19/41] ld.lld: error:
 vmlinux.a(fs/xfs/xfs_inode_item_recover.o):(function
 xlog_recover_inode_ra_pass2: .text+0xa0): relocation R_RISCV_HI20 out of
 range: 531295 is not in [-524288, 524287]; references 'xfs_inode_buf_ra_ops'
Message-ID: <202307281410.oDKxyv96-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor.dooley@microchip.com>

Hi Anup,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/avpatel/linux.git riscv_vector_crypto_v4
head:   a9087cb6e7e4c2d5148bf2e7c08c7cc705ec261a
commit: cd8ff4b4ec7499ad1a62ef1c09168c555b2f0e8d [19/41] RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-r035-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281410.oDKxyv96-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281410.oDKxyv96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281410.oDKxyv96-lkp@intel.com/

Note: the avpatel/riscv_vector_crypto_v4 HEAD a9087cb6e7e4c2d5148bf2e7c08c7cc705ec261a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/xfs/xfs_inode_item_recover.o):(function xlog_recover_inode_ra_pass2: .text+0xa0): relocation R_RISCV_HI20 out of range: 531295 is not in [-524288, 524287]; references 'xfs_inode_buf_ra_ops'
   >>> referenced by xfs_inode_item_recover.c:39 (fs/xfs/xfs_inode_item_recover.c:39)
   >>> defined in vmlinux.a(fs/xfs/libxfs/xfs_inode_buf.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_inode_item_recover.o):(function xlog_recover_inode_commit_pass2: .text+0xe0): relocation R_RISCV_HI20 out of range: 534652 is not in [-524288, 524287]; references '.LCPI1_0'
   >>> referenced by xfs_inode_item_recover.c:39 (fs/xfs/xfs_inode_item_recover.c:39)
   >>> defined in vmlinux.a(fs/xfs/xfs_inode_item_recover.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
