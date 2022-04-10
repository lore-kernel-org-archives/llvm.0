Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43F137A
	for <llvm@lists.linux.dev>; Sun, 10 Apr 2022 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649612900; x=1681148900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQpWhr3iY9RYZ/QQ7KsrLWIRBpUuvi7f5jvFQqObdc8=;
  b=VFL5mHU7vkEV68P+iSIVXQbSg9w5kxS0utJzgdSwYimpyBzOlN5RY6Vg
   62as8A1I1McF/gGEmqnNiZSubB2wVGyogn9YL8FtDvikexHNJQ+1he6K6
   GSF/bZA3rY4jrKGSoNte/5qkIhHPQtwOhrkUltKWrJaaZaHnIqlJNFjYh
   waGxh5vrLO2xpntZngmnVzD9omCxKUHa94qzoCqyRmTGtNf0ZNGVveGTO
   eVOQDcjIypXHh6bgxcSdFVTWCp5ODv2OPXGYpN6OrkXqqyP9OBcHdTOit
   dnkv40f/BJXjRpxS4tfaenT+z2y2Ktc7aIyjBJKsdWxhuTJDsUBPHSvau
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261424160"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="261424160"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 10:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="589506145"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Apr 2022 10:48:13 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndbfY-0000zz-Co;
	Sun, 10 Apr 2022 17:48:12 +0000
Date: Mon, 11 Apr 2022 01:47:10 +0800
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
Subject: Re: [PATCH 03/12] mm/khugepaged: make hugepage allocation
 context-specific
Message-ID: <202204110122.yKx76cVq-lkp@intel.com>
References: <20220410135445.3897054-4-zokeefe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410135445.3897054-4-zokeefe@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zach,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-userspace-hugepage-collapse/20220410-215722
base:   https://github.com/hnaz/linux-mm master
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220411/202204110122.yKx76cVq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93731be575c612b28ee4c7711ebab9e81960f213
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zach-O-Keefe/mm-userspace-hugepage-collapse/20220410-215722
        git checkout 93731be575c612b28ee4c7711ebab9e81960f213
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/khugepaged.c:1006:8: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           pmd_t pmde;
                 ^
>> mm/khugepaged.c:2339:18: error: incompatible function pointer types initializing 'struct page *(*)(struct collapse_control *, gfp_t, int)' (aka 'struct page *(*)(struct collapse_control *, unsigned int, int)') with an expression of type 'struct page *(*)(struct collapse_control *, gfp_t)' (aka 'struct page *(*)(struct collapse_control *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
                   .alloc_hpage = &khugepaged_alloc_page,
                                  ^~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +2339 mm/khugepaged.c

  2333	
  2334	static int khugepaged(void *none)
  2335	{
  2336		struct mm_slot *mm_slot;
  2337		struct collapse_control cc = {
  2338			.last_target_node = NUMA_NO_NODE,
> 2339			.alloc_hpage = &khugepaged_alloc_page,
  2340		};
  2341	
  2342		set_freezable();
  2343		set_user_nice(current, MAX_NICE);
  2344	
  2345		while (!kthread_should_stop()) {
  2346			khugepaged_do_scan(&cc);
  2347			khugepaged_wait_work();
  2348		}
  2349	
  2350		spin_lock(&khugepaged_mm_lock);
  2351		mm_slot = khugepaged_scan.mm_slot;
  2352		khugepaged_scan.mm_slot = NULL;
  2353		if (mm_slot)
  2354			collect_mm_slot(mm_slot);
  2355		spin_unlock(&khugepaged_mm_lock);
  2356		return 0;
  2357	}
  2358	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
