Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F91375
	for <llvm@lists.linux.dev>; Sun, 10 Apr 2022 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649607318; x=1681143318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zk/Y4iUMfIBqmBjZuVQiE9xfOKHaflQOb3wFSGEoYyE=;
  b=CynF0yqqHCZRZmAcCrjxuTXL40wenYWYJsWcdIrzigxSkBQEc11pEHof
   3QmEuY0tShgot8XFIXX43xwqLP0Urum9gpQmi3u+QR/iy5WLvsbWKIUSa
   FOmaDhBrofJQjyJbXKTBpVQ/fZbGUA733BcKPR5AgwAoqbK7bX7l52F3e
   KqFPbhlTdeVwxzHVPWXhhJFHY3x+m66wtE6e5Y41bVegFg+uUzQuUp6qK
   WCDgiIzDolM/XJ4Z3tb0lEaJvEFezGV58nb00K6zdsc0YIMlxVYwN25NJ
   QgL1D9NJDuNiDfRGHRBUDKaFFY1KN58h5TyzwrDbeAZZL8JgRuctS6GnF
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242570836"
X-IronPort-AV: E=Sophos;i="5.90,249,1643702400"; 
   d="scan'208";a="242570836"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 09:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,249,1643702400"; 
   d="scan'208";a="610677974"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2022 09:15:11 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndaDW-0000wx-KN;
	Sun, 10 Apr 2022 16:15:10 +0000
Date: Mon, 11 Apr 2022 00:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zach O'Keefe <zokeefe@google.com>,
	Alex Shi <alex.shi@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	SeongJae Park <sj@kernel.org>, Song Liu <songliubraving@fb.com>,
	Vlastimil Babka <vbabka@suse.cz>, Yang Shi <shy828301@gmail.com>,
	Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Chris Kennelly <ckennelly@google.com>,
	Chris Zankel <chris@zankel.net>, Helge Deller <deller@gmx.de>,
	Hugh Dickins <hughd@google.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jens Axboe <axboe@kernel.dk>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Minchan Kim <minchan@kernel.org>,
	Patrick Xia <patrickx@google.com>
Subject: Re: [PATCH 05/12] mm/madvise: introduce MADV_COLLAPSE sync hugepage
 collapse
Message-ID: <202204110059.a0PLTrVC-lkp@intel.com>
References: <20220410135445.3897054-6-zokeefe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410135445.3897054-6-zokeefe@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zach,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-userspace-hugepage-collapse/20220410-215722
base:   https://github.com/hnaz/linux-mm master
config: mips-randconfig-r002-20220410 (https://download.01.org/0day-ci/archive/20220411/202204110059.a0PLTrVC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4f4775a3e4a722525787b2c309032810356473c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zach-O-Keefe/mm-userspace-hugepage-collapse/20220410-215722
        git checkout 4f4775a3e4a722525787b2c309032810356473c2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/madvise.c:62:7: error: use of undeclared identifier 'MADV_COLLAPSE'
           case MADV_COLLAPSE:
                ^
   mm/madvise.c:1055:7: error: use of undeclared identifier 'MADV_COLLAPSE'
           case MADV_COLLAPSE:
                ^
   2 errors generated.


vim +/MADV_COLLAPSE +62 mm/madvise.c

    44	
    45	/*
    46	 * Any behaviour which results in changes to the vma->vm_flags needs to
    47	 * take mmap_lock for writing. Others, which simply traverse vmas, need
    48	 * to only take it for reading.
    49	 */
    50	static int madvise_need_mmap_write(int behavior)
    51	{
    52		switch (behavior) {
    53		case MADV_REMOVE:
    54		case MADV_WILLNEED:
    55		case MADV_DONTNEED:
    56		case MADV_DONTNEED_LOCKED:
    57		case MADV_COLD:
    58		case MADV_PAGEOUT:
    59		case MADV_FREE:
    60		case MADV_POPULATE_READ:
    61		case MADV_POPULATE_WRITE:
  > 62		case MADV_COLLAPSE:
    63			return 0;
    64		default:
    65			/* be safe, default to 1. list exceptions explicitly */
    66			return 1;
    67		}
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
