Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F52C9C
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639661045; x=1671197045;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/zTDyBjLrRa7/q1lBRomn9oAiTQVx42ViaOT3klYZ4s=;
  b=E+YJYF6bkFBGBZWmdCbeqU6O2hd5HR7zlgqIH4B0o09dkePW2zZ1hqkN
   iZPJ164YxQu3Wb5R49dCYic3dTX3ibkRMTxd5/2xDKwvr7aa6FGvhaPQu
   2EzkCeE/9nCCKURT3It5neny/PGGmlfTazDX8GscDhLeRv2GTE4CnfEJn
   aWcNCXZpWUHYPVe1jqLjZtSF2/qcXm8UYYlTVjggKYpyPj90OJiez+Cuj
   3isz1hm8lGqDjqeSQCpdBYfI51ap8qMaDj8UXBRMdyoYuns/jMKqdJePo
   hM9/G6F1Cr9i9g//u1sqJDmCWMMKAQxqQe6SMKW8kh1veq2QyWzxn0BZ5
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226771150"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="226771150"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 05:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="506281208"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 05:24:02 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxqjq-0003Ca-3h; Thu, 16 Dec 2021 13:24:02 +0000
Date: Thu, 16 Dec 2021 21:23:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [davidhildenbrand:cor_disable_irq 5/9] mm/memory.o: warning:
 objtool: __wp_page_copy()+0xbf5: unreachable instruction
Message-ID: <202112162130.vuIzeg5C-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>
CC: Andrea Arcangeli <aarcange@redhat.com>

tree:   git://github.com/davidhildenbrand/linux cor_disable_irq
head:   a082b9a0e2d8af4269bfb016270db0e7f0f3aa41
commit: e6e586614c24a37ec6ccfaa0afbe7e8d8f3eb901 [5/9] mm: support GUP-triggered unsharing via FAULT_FLAG_UNSHARE (!hugetlb)
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162130.vuIzeg5C-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/davidhildenbrand/linux/commit/e6e586614c24a37ec6ccfaa0afbe7e8d8f3eb901
        git remote add davidhildenbrand git://github.com/davidhildenbrand/linux
        git fetch --no-tags davidhildenbrand cor_disable_irq
        git checkout e6e586614c24a37ec6ccfaa0afbe7e8d8f3eb901
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/memory.o: warning: objtool: __wp_page_copy()+0xbf5: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
