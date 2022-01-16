Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1B173
	for <llvm@lists.linux.dev>; Sun, 16 Jan 2022 21:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642368917; x=1673904917;
  h=date:from:cc:subject:message-id:mime-version;
  bh=aQilIhJ29tOTlV39dGdnpK5hC/4L8RIax2hot3HP160=;
  b=mVERDzPiJvYVI9i0vyrvktbN5JMLs55n7dCp9MD7EK12OAHxqhOmxTU+
   h/q2DBXYWDDKEr8xybQFss7iQ5rEa25D/x1WS9tW4h/JAzhsBqEgPEtZ4
   HOfao7JgV5ByTw4h4TP2j2mYYNhYXvMF+THZoCvfyAuWujGBUJsWIWfeI
   9WFBfx1yIAIopbj3c/WA+UWVLq9V5VTSO5mEzj6JO35BxC5dtYUQIXjMo
   zc7sBHPr1TQmqzmTAVdTmSjlT2uJfrg7DbT80C4TcLzG9wLdlsLWhrw1t
   29FlXyalvxNUL6jnuydYYtULTsxx4/4+EQlsH67Pazp2Dtm5NvTojnMXa
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="231873701"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="231873701"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 13:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="517185143"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jan 2022 13:35:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9DBC-000B0G-Va; Sun, 16 Jan 2022 21:35:14 +0000
Date: Mon, 17 Jan 2022 05:34:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: assignment to symbol init_pg_end does not converge
Message-ID: <202201170516.u8Ixa8dF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79e06c4c4950be2abd8ca5d2428a8c915aa62c24
commit: fb08a1908cb119a4585611d91461ab6d27756b14 dax: simplify the dax_device <-> gendisk association
date:   6 weeks ago
config: arm64-randconfig-r026-20220116 (https://download.01.org/0day-ci/archive/20220117/202201170516.u8Ixa8dF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a3175c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb08a1908cb119a4585611d91461ab6d27756b14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fb08a1908cb119a4585611d91461ab6d27756b14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol init_pg_end does not converge

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
