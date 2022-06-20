Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D83651
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655721289; x=1687257289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TEXGFS9mwiCk/RdnSXnlola2s7v3zNZiPNGFXC38NVA=;
  b=l2TpWH1PDRwJUGg51e1hVn1cJgv40YCf7O6yKeCYHKX3GaLtLK01MSyT
   e+vY2tPRjm4+YcDCePXc4YQV8E2j9J48389qG6aODtUnCGN16DUNDGFaa
   7iKLtbSRTGorumwrhY5xRJ+oJolt8sZ7sxQH9p1RkLlqPlc04qB8vKRha
   8qR8icDZoYiSwO9YM4rtTfWZuCBGB68zL+tT0Ae8bgWnw+w9pVnI80MTE
   SuQE/FcoTcDYFwZBFNlK6Ai7LrwebmaVZwUGbpkRB/N77WY6xVJJn0OaU
   fgYJrYwMwfRiwJ7zAyNDzyHA2w2CmWYCdTEb09QY3FHZ/uJo7zF2BAJkd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279910770"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="279910770"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 03:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="591119720"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 03:34:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3Ek2-000Sfv-RJ;
	Mon, 20 Jun 2022 10:34:46 +0000
Date: Mon, 20 Jun 2022 18:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 2/5] userfaultfd: introduce access-likely mode for
 copy/wp operations
Message-ID: <202206201856.LMF3y588-lkp@intel.com>
References: <20220619233449.181323-3-namit@vmware.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619233449.181323-3-namit@vmware.com>

Hi Nadav,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[cannot apply to shuah-kselftest/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nadav-Amit/userfaultfd-support-access-write-hints/20220620-150942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-buildonly-randconfig-r001-20220620 (https://download.01.org/0day-ci/archive/20220620/202206201856.LMF3y588-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ad1b8120bf00d273f9c786fe63c5c1fbcd7ff43c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nadav-Amit/userfaultfd-support-access-write-hints/20220620-150942
        git checkout ad1b8120bf00d273f9c786fe63c5c1fbcd7ff43c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/userfaultfd.c:700:23: warning: parameter 'uffd_flags' set but not used [-Wunused-but-set-parameter]
                          uffd_flags_t uffd_flags)
                                       ^
   mm/userfaultfd.c:711:23: warning: parameter 'uffd_flags' set but not used [-Wunused-but-set-parameter]
                          uffd_flags_t uffd_flags)
                                       ^
   2 warnings generated.


vim +/uffd_flags +700 mm/userfaultfd.c

c1a4de99fada21 Andrea Arcangeli 2015-09-04  697  
c1a4de99fada21 Andrea Arcangeli 2015-09-04  698  ssize_t mfill_zeropage(struct mm_struct *dst_mm, unsigned long start,
0b36999093ff22 Nadav Amit       2022-06-19  699  		       unsigned long len, atomic_t *mmap_changing,
0b36999093ff22 Nadav Amit       2022-06-19 @700  		       uffd_flags_t uffd_flags)
c1a4de99fada21 Andrea Arcangeli 2015-09-04  701  {
ad1b8120bf00d2 Nadav Amit       2022-06-19  702  	/* There is no cost for setting the access bit of a zeropage */
ad1b8120bf00d2 Nadav Amit       2022-06-19  703  	uffd_flags |= UFFD_FLAGS_ACCESS_LIKELY;
ad1b8120bf00d2 Nadav Amit       2022-06-19  704  
f619147104c8ea Axel Rasmussen   2021-05-04  705  	return __mcopy_atomic(dst_mm, start, 0, len, MCOPY_ATOMIC_ZEROPAGE,
f619147104c8ea Axel Rasmussen   2021-05-04  706  			      mmap_changing, 0);
f619147104c8ea Axel Rasmussen   2021-05-04  707  }
f619147104c8ea Axel Rasmussen   2021-05-04  708  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
