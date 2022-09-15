Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6444C7F
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663273305; x=1694809305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/IN5Z64xHDzc/NxRXebAl53hk26nqW5LKb2zmLPqRXE=;
  b=a/3tqMRJgnQQFw5UTUPBUNnjCg1UCG34RtN4yznhLOzoDU+fkkZyrpC7
   pArG4nx5oCftCCTTKeMvryUrWDa6VwowLr3kE3yKFkPG48o5awIb9zIY7
   PX0gr+EWnUAH/SSTHcbU1W4Ou5s7Y0qtbSE9n6hk6pn5ofsJVX5iT36Js
   8ZKUQP4uu5ZLSHlet2sn37zFtZ9qpksZ+DYV6JMSYld73YCZkIKFJZosF
   V1tK82iPtGFTlxwewKnjMnRlxWd1d3lAz+ZgF00n4qa7jhs4Sek7w6bA9
   pPAYgxBB1LzoOa9i7INm/VVyFCr9ccSXGHHVLrlyTX4uPRSmpiO+ZqCq6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299654325"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="299654325"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 13:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="862479751"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2022 13:21:44 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYvMl-0000xj-1b;
	Thu, 15 Sep 2022 20:21:43 +0000
Date: Fri, 16 Sep 2022 04:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7268/7393] ld.lld: error: undefined symbol:
 hugetlb_vma_lock_release
Message-ID: <202209160402.TZRsdQUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ce5d01e7011b32600656bf90a626b1e51fb192a
commit: d56100904028e33cd44660e7b17c1738edafad14 [7268/7393] hugetlb: use new vma_lock for pmd sharing synchronization
config: arm64-buildonly-randconfig-r004-20220915 (https://download.01.org/0day-ci/archive/20220916/202209160402.TZRsdQUp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5279e11f063db6a0cc87ccf9e0e1c7b1b31aa7cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d56100904028e33cd44660e7b17c1738edafad14
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d56100904028e33cd44660e7b17c1738edafad14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 6ce5d01e7011b32600656bf90a626b1e51fb192a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hugetlb_vma_lock_release
   >>> referenced by inode.c
   >>>               hugetlbfs/inode.o:(remove_inode_hugepages) in archive fs/built-in.a
   >>> referenced by inode.c
   >>>               hugetlbfs/inode.o:(remove_inode_hugepages) in archive fs/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
