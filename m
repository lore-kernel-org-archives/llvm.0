Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AB453BE;
	Sat, 28 Jan 2023 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674910533; x=1706446533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7+wdWSXsUxi7RKygs6WakxZwyfWOcCTwrp4PBOCIfg=;
  b=EZt0rrn8JJISn57k0mrIK7/l+Uu8VeL8zJJSbEZse6Pf7dFAa1XhyZ+P
   YKJKxMCcGmcoCrV4JSvnPO4PoqhF5HmnBJuIviOuBeiSXtdwYdZwWhSXP
   BLCC2ZBnACpBHeXKfW2fIpQiFg7TWy8JC1AeS9q8GWcsUYygZQqSb0LcG
   jaL+C+xWemZFwaQME9C4FUulGqeH+p/1bkolbcu7bqx0ZiIch9aHtIukg
   FfBCiV4jVuXN7v3txwtfczfS55S8/hdm9Owx4rw36qX/aCol9GPzqLRFX
   z+l8j7wy3yTBSyFMxGp86WV27pB5NeMITnUBw6diU+2p5dRny+j+CKcdu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328574892"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="328574892"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 04:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992375547"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992375547"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 04:55:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLkjw-0000en-2J;
	Sat, 28 Jan 2023 12:55:28 +0000
Date: Sat, 28 Jan 2023 20:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 167/506] include/linux/hugetlb.h:1193:9: error:
 implicit declaration of function 'page_count' is invalid in C99
Message-ID: <202301282035.M6wJfQhs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ede43f2956cc25e387a5e225324104f22e715908
commit: 6c096b0425160233d2a8c3ec3f3d82dae5c37678 [167/506] mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230128/202301282035.M6wJfQhs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=6c096b0425160233d2a8c3ec3f3d82dae5c37678
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 6c096b0425160233d2a8c3ec3f3d82dae5c37678
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/infiniband/core/ drivers/net/ethernet/mellanox/mlx5/core/ fs/cifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the akpm-mm/mm-unstable HEAD ede43f2956cc25e387a5e225324104f22e715908 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/core/umem_odp.c:41:
>> include/linux/hugetlb.h:1193:9: error: implicit declaration of function 'page_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return page_count(virt_to_page(pte)) > 1;
                  ^
   In file included from drivers/infiniband/core/umem_odp.c:43:
   In file included from include/linux/hmm.h:12:
   In file included from include/linux/mm.h:25:
>> include/linux/page_ref.h:92:19: error: static declaration of 'page_count' follows non-static declaration
   static inline int page_count(const struct page *page)
                     ^
   include/linux/hugetlb.h:1193:9: note: previous implicit declaration is here
           return page_count(virt_to_page(pte)) > 1;
                  ^
   2 errors generated.


vim +/page_count +1193 include/linux/hugetlb.h

  1189	
  1190	#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
  1191	static inline bool hugetlb_pmd_shared(pte_t *pte)
  1192	{
> 1193		return page_count(virt_to_page(pte)) > 1;
  1194	}
  1195	#else
  1196	static inline bool hugetlb_pmd_shared(pte_t *pte)
  1197	{
  1198		return false;
  1199	}
  1200	#endif
  1201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
