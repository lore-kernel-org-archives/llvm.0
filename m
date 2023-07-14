Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823A13715;
	Fri, 14 Jul 2023 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689346138; x=1720882138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d88QW4/iUOtbgQyAOrNaiwvC+pVgLwIODoX7T3xmE+s=;
  b=IzoyESPK7cETFNPqCyr1cf6NpR8PbwLG9RYhrecouTW5+JXWEpQyjoxR
   qW4mTm9WA2uswryhMY1KxhipwXyattXG0f/Iw6XBXTAgf8i3lSgH8S4FV
   8RxgipC1bZboucIL5Fbw3Qr8WVVZlLSJotQfk4hIwhW+gBY//v9fGddWj
   SPAW6DsyeoG9VqLh57weG2r3gcXyWoqFDebJgOHgJrjUYdWemfjf303WS
   KWWr5XIey0LAvgAiq+j40PO/xZBLf+LeAD2pDGMCIGgS1BbogUd0mTh3V
   ocVgauov/M5lWl18UV/AqbfhDVL78o5DQGGOiTbzq2jpZWwiJk7EAGEAo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="365529973"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="365529973"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 07:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="812461751"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="812461751"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2023 07:48:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKK61-0007Vt-0I;
	Fri, 14 Jul 2023 14:48:37 +0000
Date: Fri, 14 Jul 2023 22:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 45/198] error[E0063]: missing field
 `set_deadline` in initializer of `dma_fence_ops`
Message-ID: <202307142220.AB8JXffs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   c2bbe7fe79da5dff6da45eb1d4a5a582db740429
commit: 0a1228b0e0dba46904e868c3bd12276c308e28b6 [45/198] rust: dma_fence: Add DMA Fence abstraction
config: x86_64-randconfig-x002-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142220.AB8JXffs-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142220.AB8JXffs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142220.AB8JXffs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `set_deadline` in initializer of `dma_fence_ops`
   --> rust/kernel/dma_fence.rs:288:45
   |
   288 |     const VTABLE: bindings::dma_fence_ops = bindings::dma_fence_ops {
   |                                             ^^^^^^^^^^^^^^^^^^^^^^^ missing `set_deadline`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
