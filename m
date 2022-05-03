Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAF17CA
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 03:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651549165; x=1683085165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bm3wq1RQ1EtaQbHFbwUdTch2JEYUfKgOUJlFtYc51W4=;
  b=PAiO02+3DopyKpsr6R9MqMWTXcSB8WPyx7+jcDkaJ0yz4JLWB62UvfIO
   GTxUWXdDslXXMZrUXY2SDdCSawtXfStJP/XsOY0K443PEQEY05aUNTgQE
   nHp66gHV3/GqQk9HCP+ZSbHjM/HpcL7+l/2xP4qeRBk4uDhRHtByF1ffQ
   4CFeEdhLnJdhyabAGYFt32Q2l5jehVJ187iYB867T7Zt2peVLhw35oRXQ
   L66uOLDYqF4vbrvjYBGZVMBqu/wCP1WfNSt807mvwRDtVRlOWIqybCKd/
   vYWvDOoOli8mYLgugzfWlwg8rgrun5DiJgLds16k9axiJLjSmPVGYMSxt
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="264980579"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
   d="scan'208";a="264980579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 20:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; 
   d="scan'208";a="536178027"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 May 2022 20:39:15 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nljNb-000A7j-2R;
	Tue, 03 May 2022 03:39:15 +0000
Date: Tue, 3 May 2022 11:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zach O'Keefe <zokeefe@google.com>,
	Alex Shi <alex.shi@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, SeongJae Park <sj@kernel.org>,
	Song Liu <songliubraving@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
	Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org
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
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jens Axboe <axboe@kernel.dk>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4 04/13] mm/khugepaged: make hugepage allocation
 context-specific
Message-ID: <202205031117.A41ue1TS-lkp@intel.com>
References: <20220502181714.3483177-5-zokeefe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502181714.3483177-5-zokeefe@google.com>

Hi Zach,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220502]
[cannot apply to hnaz-mm/master rostedt-trace/for-next deller-parisc/for-next arnd-asm-generic/master linus/master v5.18-rc5 v5.18-rc4 v5.18-rc3 v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-khugepaged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
base:    9f9b9a2972eb8dcaad09d826c5c6d7488eaca3e6
config: x86_64-randconfig-a011-20220502 (https://download.01.org/0day-ci/archive/20220503/202205031117.A41ue1TS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0d006aeaf99be94a0dcb727cb6540195f13fd9c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zach-O-Keefe/mm-khugepaged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
        git checkout 0d006aeaf99be94a0dcb727cb6540195f13fd9c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:1091:29: warning: incompatible integer to pointer conversion passing 'gfp_t' (aka 'unsigned int') to parameter of type 'struct page **' [-Wint-conversion]
           if (!khugepaged_alloc_page(gfp, node, cc))
                                      ^~~
   mm/khugepaged.c:949:49: note: passing argument to parameter 'hpage' here
   static bool khugepaged_alloc_page(struct page **hpage, gfp_t gfp, int node)
                                                   ^
>> mm/khugepaged.c:1091:40: warning: incompatible pointer to integer conversion passing 'struct collapse_control *' to parameter of type 'int' [-Wint-conversion]
           if (!khugepaged_alloc_page(gfp, node, cc))
                                                 ^~
   mm/khugepaged.c:949:71: note: passing argument to parameter 'node' here
   static bool khugepaged_alloc_page(struct page **hpage, gfp_t gfp, int node)
                                                                         ^
   2 warnings generated.


vim +1091 mm/khugepaged.c

  1074	
  1075	static int alloc_charge_hpage(struct mm_struct *mm, struct collapse_control *cc)
  1076	{
  1077	#ifdef CONFIG_NUMA
  1078		const struct cpumask *cpumask;
  1079	#endif
  1080		gfp_t gfp = alloc_hugepage_khugepaged_gfpmask() | __GFP_THISNODE;
  1081		int node = khugepaged_find_target_node(cc);
  1082	
  1083	#ifdef CONFIG_NUMA
  1084		/* sched to specified node before huge page memory copy */
  1085		if (task_node(current) != node) {
  1086			cpumask = cpumask_of_node(node);
  1087			if (!cpumask_empty(cpumask))
  1088				set_cpus_allowed_ptr(current, cpumask);
  1089		}
  1090	#endif
> 1091		if (!khugepaged_alloc_page(gfp, node, cc))
  1092			return SCAN_ALLOC_HUGE_PAGE_FAIL;
  1093		if (unlikely(mem_cgroup_charge(page_folio(cc->hpage), mm, gfp)))
  1094			return SCAN_CGROUP_CHARGE_FAIL;
  1095		count_memcg_page_event(cc->hpage, THP_COLLAPSE_ALLOC);
  1096		return SCAN_SUCCEED;
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
