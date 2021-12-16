Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A82C9C
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639661706; x=1671197706;
  h=date:from:cc:subject:message-id:mime-version;
  bh=f3IXj0Zfke0C7kTqlImogMdG+9Hlwo1LqCxGvo/N+Ew=;
  b=ml8I4j1H5efN87ONTLhGE+FChmyuiSeuDe2ky65fvQES4bncLj965A+E
   FBoae173diZK4l0fE/BozRW3e3ubRIgSWm8ABtm9OUMUvE5HPJzl80DEr
   7vvlPu6VGdDB/Lcv9Ogdmwcgwv6dAXOBCBvKqhIg3v7wGTMiod/4lu2om
   uHgsjT2urstxaTxi2m0vrT32MG4b1LRpFVooO8ojsv0ko+tAn8NqzC4f/
   HW4FC6AnAkhJdDfQbHk6UnQ5vs4df5CtBOKyXxWfEiDQA4m1+UsjhWS4B
   SkmdnlCTuFhk0Aq7GHKAtOwoVPexTKbEEk/LGmUJ64Fzf95B98BvyLK49
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="237030801"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="237030801"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 05:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="615153462"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 05:35:04 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxquU-0003Db-UX; Thu, 16 Dec 2021 13:35:02 +0000
Date: Thu, 16 Dec 2021 21:34:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 284/300] fs/iomap/buffered-io.o:
 warning: objtool: iomap_dirty_range()+0x3eb: unreachable instruction
Message-ID: <202112162159.ZBckCs9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   57569114e72124aebbe2ad863138fe8c5d19e1c1
commit: 7ce91d85f50da47ca729f30c17d6db3883d71807 [284/300] iomap: set up for COWing around pages
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162159.ZBckCs9v-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=7ce91d85f50da47ca729f30c17d6db3883d71807
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 7ce91d85f50da47ca729f30c17d6db3883d71807
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/ fs/iomap/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.o: warning: objtool: iomap_dirty_range()+0x3eb: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
