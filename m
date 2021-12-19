Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFFB168
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639929157; x=1671465157;
  h=date:from:cc:subject:message-id:mime-version;
  bh=e7r6F/Y8KxCdVU5ANmxrX2i/2T938ji6bmf0CuzecE8=;
  b=ClVG6Ibt8SmgmrKkXelazZUNj2jZu/naqNeMQtgLCMxB5IMT64cYtpuo
   kEL84ATVQyG/NauhBl++sO4tFPmpVFnXucWNC4rSSbxcLetYAY0vQy+BG
   OIXjl4m70dyZcTNO+iq4qWd8xb0eseMbFLp4aXbuzMXypeDqkbiSj5hGP
   m2Lr/WYkkVOLjtleIQ4DgwmRNGp6R1HlQ8zJ5ZJZ+294CjgYVLEsmonSj
   fSAAPNfN2l9uQlKF1IHbnljiGp12X3/TWtfr+WUDVDc0iL5eIdwx2sDMt
   GeLg1D3X4psgTpm6fJNcVtt3y+NgFP0gwRcaUuVq0zvH+Ivke13YpoHMJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="220709512"
X-IronPort-AV: E=Sophos;i="5.88,218,1635231600"; 
   d="scan'208";a="220709512"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2021 07:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,218,1635231600"; 
   d="scan'208";a="465680030"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Dec 2021 07:52:35 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myyUF-00075J-6v; Sun, 19 Dec 2021 15:52:35 +0000
Date: Sun, 19 Dec 2021 23:52:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/locking/mutex.o: warning: objtool: ww_mutex_trylock()+0x158:
 unreachable instruction
Message-ID: <202112192354.gXB9f2AY-lkp@intel.com>
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
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: 12235da8c80a1f9909008e4ca6036d5772b81192 kernel/locking: Add context to ww_mutex_trylock()
date:   3 months ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211219/202112192354.gXB9f2AY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=12235da8c80a1f9909008e4ca6036d5772b81192
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 12235da8c80a1f9909008e4ca6036d5772b81192
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/locking/mutex.o: warning: objtool: ww_mutex_trylock()+0x158: unreachable instruction
--
>> kernel/locking/test-ww_mutex.o: warning: objtool: test_abba_work()+0x439: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
