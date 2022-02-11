Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F647D
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644574360; x=1676110360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6JVRlnUPIgo89MVFvwAVoplyYztYEv8R/ryAaiGIro=;
  b=l16WUYcET0nLiMf9s0J4oLB9wo3+TLgGvPgekdVnZ/O7uBYkHf1/dywC
   pdWpkv4RQKKwlxvIP2z7FYnASzXefpEUQ3CAvm9rUiCzAnglVtryifC72
   ccPtLiWBzDF5CronXIGlfUcqKxmXR4UQG9jdywHC4t4uTssWQsRSVpib4
   9ESpdiK0P//FtprQaU1YZkHanfrqJ4T/NFVeVL76VBh9O9L9Bc2xGqiZn
   1bbW4OZvTLnEU6wz/nBao18ZEbmg6roGiwKw38TJt4oRA/mAX9sy34a/S
   GUIvyeOxHC2pIv1R1dzCcAWXddry6iAk2djCFiZx/R1tShZqSTSYBa9yE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="312987159"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="312987159"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 02:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="568997477"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Feb 2022 02:12:38 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nISur-0004Qf-VP; Fri, 11 Feb 2022 10:12:37 +0000
Date: Fri, 11 Feb 2022 18:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 34/35] ld.lld:
 error: undefined symbol: xa_store_range
Message-ID: <202202111814.4NEkwCTo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-maple
head:   429e2bb6fb190f390ed23afc0d2308e877c43be5
commit: e9340673baaf1ff587aed3391aa411cf554bc42e [34/35] netfs: Slice a writeback from a dirty region
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220211/202202111814.4NEkwCTo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e9340673baaf1ff587aed3391aa411cf554bc42e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout e9340673baaf1ff587aed3391aa411cf554bc42e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xa_store_range
   >>> referenced by flush.c:204 (fs/netfs/flush.c:204)
   >>>               netfs/flush.o:(netfs_flush_get_pages) in archive fs/built-in.a
   >>> referenced by flush.c:232 (fs/netfs/flush.c:232)
   >>>               netfs/flush.o:(netfs_flush_get_pages) in archive fs/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
