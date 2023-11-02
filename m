Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F76224D2;
	Thu,  2 Nov 2023 23:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WesDxXon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698967792; x=1730503792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DIQS84CVb0x5SQ4e3KNKtovKju7h4sTP0fFvMJcE8i0=;
  b=WesDxXondWGESqx2rvoKDKm3RcU2lePD3FYKMU/LXSEx6gljYVsSBfY3
   bH+67XVtCTd0O0KtoB5dM2JJqWan+zikMZp4qXn2S8fiwdx6/xcgyj363
   KwJ6MdC0Fz91anFPLPppBfQ6ry/j4NatATcAn5esIN77wgWPGmCCA6ff1
   c8Uo6QK5Kq9KBbl7pF2X87iRmAM1sitGjjRVnJ0cIghf+PYYx4khJZJ4E
   r8CzsHbptRfHNi26GmMljT7xGisk3Dsu4qWHzm1klILeEFdMwdch2vVd8
   bfZwO6/1LBlv8o9Fpw+Ln6tWiBLckJkqoNjMLm5t2ZM8H9yE0EZxpQ41+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10375320"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="10375320"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 16:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1092889542"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1092889542"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Nov 2023 16:29:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyh8C-00020C-2r;
	Thu, 02 Nov 2023 23:29:44 +0000
Date: Fri, 3 Nov 2023 07:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Adam Davis <eadavis@qq.com>, riel@surriel.com
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	eadavis@qq.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, mike.kravetz@oracle.com,
	muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
Message-ID: <202311030737.my9iglMI-lkp@intel.com>
References: <tencent_164A247533766D667C3D873798968236C409@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_164A247533766D667C3D873798968236C409@qq.com>

Hi Edward,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Adam-Davis/mm-hugetlb-fix-null-ptr-defer-in-hugetlb_vma_lock_write/20231103-003152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/tencent_164A247533766D667C3D873798968236C409%40qq.com
patch subject: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
config: um-defconfig (https://download.01.org/0day-ci/archive/20231103/202311030737.my9iglMI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030737.my9iglMI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030737.my9iglMI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:52:
   include/linux/hugetlb.h: In function '__vma_private_lock':
>> include/linux/hugetlb.h:1276:17: error: implicit declaration of function 'is_vma_resv_set' [-Werror=implicit-function-declaration]
    1276 |                 is_vma_resv_set(vma, HPAGE_RESV_OWNER);
         |                 ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/is_vma_resv_set +1276 include/linux/hugetlb.h

  1271	
  1272	#define HPAGE_RESV_OWNER    (1UL << 0)
  1273	static inline bool __vma_private_lock(struct vm_area_struct *vma)
  1274	{
  1275		return (!(vma->vm_flags & VM_MAYSHARE)) && vma->vm_private_data && 
> 1276			is_vma_resv_set(vma, HPAGE_RESV_OWNER);
  1277	}
  1278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
