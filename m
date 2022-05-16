Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205CB139D
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652737614; x=1684273614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j4xjSha5UVOWHZknOHLGr1sRSmJRm39L+H8fkW5gfNQ=;
  b=JBqukCsgn8lbv6/NTKJcn7wD1uYyUc9d+uSoDwS24Iq1J7xxptSDzBB4
   Vqtg5rfRu1DyFOqNqsL0xx45KfwyuZEJEdkwXrReG5kunOC+a7IVj0VDN
   N55MqKuWFTC1Igh6bQDBQfYMVYE2qqEOHP+4/HslLqphYpdeKfTq83Hxa
   k2gMc5mELxd1XnCOW//MTs9aaq9LxjuD2wuOmLlxpzMSg2xSqi0ezl9lt
   L4ZS+Dhyt/z5wa+zkkKTI2li4P7rdHGADa6rNIgnCRzU9vgyhNofDlBLq
   4Z953W2Pb3l7vcgay+pJASbNZv8CZmdLLPWPwScn06kKi5saVr0SY05WG
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="296246714"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="296246714"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 14:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="741444404"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 May 2022 14:46:51 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqiYF-0000M5-8T;
	Mon, 16 May 2022 21:46:51 +0000
Date: Tue, 17 May 2022 05:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub =?utf-8?Q?Mat=C4=9Bna?= <matenajakub@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3 3/6] [PATCH 3/6] mm: add migration waiting and
 rmap locking to pagewalk
Message-ID: <202205170503.NtlPaLY6-lkp@intel.com>
References: <20220516125405.1675-4-matenajakub@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516125405.1675-4-matenajakub@gmail.com>

Hi "Jakub,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linux/master linus/master v5.18-rc7]
[cannot apply to next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Mat-na/Removing-limitations-of-merging-anonymous-VMAs/20220516-205637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
config: x86_64-buildonly-randconfig-r001-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170503.NtlPaLY6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9ba7cddd9f98f457552e5e427c68718c4603b6fd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jakub-Mat-na/Removing-limitations-of-merging-anonymous-VMAs/20220516-205637
        git checkout 9ba7cddd9f98f457552e5e427c68718c4603b6fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/pagewalk.c:104:52: warning: variable 'ptl' is uninitialized when used here [-Wuninitialized]
                   err = walk_pte_range_inner(pte, addr, end, walk, ptl, pmd);
                                                                    ^~~
   mm/pagewalk.c:97:17: note: initialize the variable 'ptl' to silence this warning
           spinlock_t *ptl;
                          ^
                           = NULL
   1 warning generated.


vim +/ptl +104 mm/pagewalk.c

    91	
    92	static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
    93				  struct mm_walk *walk)
    94	{
    95		pte_t *pte;
    96		int err = 0;
    97		spinlock_t *ptl;
    98	
    99		if (walk->flags & WALK_LOCK_RMAP)
   100			take_rmap_locks(walk->vma);
   101	
   102		if (walk->no_vma) {
   103			pte = pte_offset_map(pmd, addr);
 > 104			err = walk_pte_range_inner(pte, addr, end, walk, ptl, pmd);
   105			pte_unmap(pte);
   106		} else {
   107			pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
   108			err = walk_pte_range_inner(pte, addr, end, walk, ptl, pmd);
   109			pte_unmap_unlock(pte, ptl);
   110		}
   111	
   112		if (walk->flags & WALK_LOCK_RMAP)
   113			drop_rmap_locks(walk->vma);
   114	
   115		return err;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
