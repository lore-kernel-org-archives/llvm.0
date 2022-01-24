Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626C29CA
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643035908; x=1674571908;
  h=date:from:cc:subject:message-id:mime-version;
  bh=31+gxgCfYnxpDopYxPfJBixcZmCFmTZcJUwzBjv0Mwg=;
  b=fWmNhOliJZeRyw25FCNEos+H44PuQw+rMcT/iUS9kxAgP6luGQa8D60q
   uuxvqoV/TTrzJEKnwwRkwwzRx0MEZhfBVnxLw2ZtiRwqcEjDhrdi5lvd0
   tsPLS24WDKHnCgdxqJCjoWg+U6069bgQJ0Fda0PPTZ+i2yTVatZrDOUx5
   kwatas9IT2RiYqLj3IJlaDkdPHrqlQy3xwfq5NIF3mHtl03Vk+Pr8PYqH
   r2inYW7aDHNsaQXnS46xhpiRCCb2OEsCOxkDG6H+4n8Q+efB6S8EpeZsm
   n9k92O4+GAd3C0DFpKkJlJ0dA7AvjPiExntfLVGQe3AwYW6SIYH+OHcYX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270496125"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="270496125"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 06:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="534250546"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2022 06:51:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nC0h8-000IUK-Ck; Mon, 24 Jan 2022 14:51:46 +0000
Date: Mon, 24 Jan 2022 22:51:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: mm/vmscan.o: warning: objtool: shrink_lruvec()+0x617: sibling call
 from callable instruction with modified stack frame
Message-ID: <202201242256.6dIy8aop-lkp@intel.com>
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
TO: Yang Shi <shy828301@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 20f9ba4f995247bb79e243741b8fdddbd76dd923 mm: migrate: make demotion knob depend on migration
date:   3 months ago
config: x86_64-randconfig-r016-20220124 (https://download.01.org/0day-ci/archive/20220124/202201242256.6dIy8aop-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=20f9ba4f995247bb79e243741b8fdddbd76dd923
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 20f9ba4f995247bb79e243741b8fdddbd76dd923
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec()+0x617: sibling call from callable instruction with modified stack frame

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
