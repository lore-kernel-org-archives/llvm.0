Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846AE29CA
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639646937; x=1671182937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8Xe02CmurKlZgVHuJqNKmF3CkiPchp4egjDv7zpCBk=;
  b=kEZZZsDJFMxWEYjeensAGrkCcYWaatDAwmB1r9wWm3NJCu3NiEwBb6qW
   8HowXp+ErUtdrAIKdCxK/ppdt2tlnQ6QO1vjZINkmigHmzCn617uH0f/Z
   Wf3IVAWSoxs80yT64cntCa7DgwStQaFAueaikfzZHHNH1C+qit9TGa0bp
   vXL4su/iUgvM9hEjB4dc9k/JfRDoCsA/aB2cE6gPX1oToZaiuIjcgqBce
   vdnLOHCD4ew6C26JcymzT9/CoBc+kNzvpi5ITr9FNzk46gb0o2u7hwk75
   Du+G2PG1IB1s9jyncWQUG12Rhv70J53TBvzGx9MDNvJgxUYSXKriO2Neh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226730882"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="226730882"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 01:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="615088695"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 01:28:55 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxn4I-0002yZ-SK; Thu, 16 Dec 2021 09:28:54 +0000
Date: Thu, 16 Dec 2021 17:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [djwong-xfs:repair-symlink-swapext 322/325]
 fs/xfs/libxfs/xfs_symlink_remote.c:239:1: warning: no previous prototype for
 function 'xfs_symlink_remote_read'
Message-ID: <202112161727.ehXN074t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git repair-symlink-swapext
head:   851df07d9599471df909c4ff0e3cf33f4b9619f0
commit: b0cad080048a93ceeae93b51a0cab55c85c5a7ec [322/325] xfs: move remote symlink target read function to libxfs
config: riscv-randconfig-r042-20211216 (https://download.01.org/0day-ci/archive/20211216/202112161727.ehXN074t-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=b0cad080048a93ceeae93b51a0cab55c85c5a7ec
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs repair-symlink-swapext
        git checkout b0cad080048a93ceeae93b51a0cab55c85c5a7ec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_symlink_remote.c:28:1: warning: no previous prototype for function 'xfs_symlink_blocks' [-Wmissing-prototypes]
   xfs_symlink_blocks(
   ^
   fs/xfs/libxfs/xfs_symlink_remote.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   fs/xfs/libxfs/xfs_symlink_remote.c:38:1: warning: no previous prototype for function 'xfs_symlink_hdr_set' [-Wmissing-prototypes]
   xfs_symlink_hdr_set(
   ^
   fs/xfs/libxfs/xfs_symlink_remote.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   fs/xfs/libxfs/xfs_symlink_remote.c:68:1: warning: no previous prototype for function 'xfs_symlink_hdr_ok' [-Wmissing-prototypes]
   xfs_symlink_hdr_ok(
   ^
   fs/xfs/libxfs/xfs_symlink_remote.c:67:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool
   ^
   static 
   fs/xfs/libxfs/xfs_symlink_remote.c:167:1: warning: no previous prototype for function 'xfs_symlink_local_to_remote' [-Wmissing-prototypes]
   xfs_symlink_local_to_remote(
   ^
   fs/xfs/libxfs/xfs_symlink_remote.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   fs/xfs/libxfs/xfs_symlink_remote.c:206:1: warning: no previous prototype for function 'xfs_symlink_shortform_verify' [-Wmissing-prototypes]
   xfs_symlink_shortform_verify(
   ^
   fs/xfs/libxfs/xfs_symlink_remote.c:205:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   xfs_failaddr_t
   ^
   static 
>> fs/xfs/libxfs/xfs_symlink_remote.c:239:1: warning: no previous prototype for function 'xfs_symlink_remote_read' [-Wmissing-prototypes]
   xfs_symlink_remote_read(
   ^
   fs/xfs/libxfs/xfs_symlink_remote.c:238:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   6 warnings generated.


vim +/xfs_symlink_remote_read +239 fs/xfs/libxfs/xfs_symlink_remote.c

   236	
   237	/* Read a remote symlink target into the buffer. */
   238	int
 > 239	xfs_symlink_remote_read(

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
