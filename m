Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCE13FC2;
	Mon, 17 Apr 2023 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681736148; x=1713272148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pF9+Kl94+oacWUwoi0WXMK5+1XOyWxgP+MFF3wxoelQ=;
  b=IG3gDujsUP/F55cgmqBoiAXdjVl7NxujVI530DAjPvemDA0RpICFWPqB
   VOKNWeYAkGLhWKqnOrHtaz94t/7AF7QuHeBz7lrJ6YThFV+VQ7p+H3Ovt
   WiDgHbQYudYT0dy4cLw0lMe0kmtzfVxtjJ411VsvqQjim0iVdPirw7HLY
   OsUgM4reswcHf3Kw3L+Jw6u31Bv9OZwLgSlAtzJPjNG+jOns+T0sXvYjP
   xSOweZ5F8agRxxxbkn1mstHvi+k9uynSSsMuf7ASNY2uz6ae56LHEFdkI
   6HiKk+6WT7RjOKIX9lqzHdw7r9vOhw+KxXc1raXafZbJblYftveCTR5i0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="407777288"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="407777288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 05:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="690657893"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="690657893"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Apr 2023 05:55:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poOOW-000cMl-1P;
	Mon, 17 Apr 2023 12:55:44 +0000
Date: Mon, 17 Apr 2023 20:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Subject: [linux-next:master 10286/12016] arch/arm64/mm/fixmap.c:199:10:
 warning: variable 'bm_pudp' set but not used
Message-ID: <202304172004.r3IPh5Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3f2cd24819158bb70701c3549e586f9df9cee67
commit: b97547761b02cc95e0e6be827dc9ca9da8142761 [10286/12016] arm64: mm: move fixmap code to its own file
config: arm64-buildonly-randconfig-r004-20230416 (https://download.01.org/0day-ci/archive/20230417/202304172004.r3IPh5Ja-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b97547761b02cc95e0e6be827dc9ca9da8142761
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b97547761b02cc95e0e6be827dc9ca9da8142761
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172004.r3IPh5Ja-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/fixmap.c:199:10: warning: variable 'bm_pudp' set but not used [-Wunused-but-set-variable]
                   pud_t *bm_pudp;
                          ^
   1 warning generated.


vim +/bm_pudp +199 arch/arm64/mm/fixmap.c

   182	
   183	/*
   184	 * Copy the fixmap region into a new pgdir.
   185	 */
   186	void __init fixmap_copy(pgd_t *pgdir)
   187	{
   188		if (!READ_ONCE(pgd_val(*pgd_offset_pgd(pgdir, FIXADDR_TOT_START)))) {
   189			/*
   190			 * The fixmap falls in a separate pgd to the kernel, and doesn't
   191			 * live in the carveout for the swapper_pg_dir. We can simply
   192			 * re-use the existing dir for the fixmap.
   193			 */
   194			set_pgd(pgd_offset_pgd(pgdir, FIXADDR_TOT_START),
   195				READ_ONCE(*pgd_offset_k(FIXADDR_TOT_START)));
   196		} else if (CONFIG_PGTABLE_LEVELS > 3) {
   197			pgd_t *bm_pgdp;
   198			p4d_t *bm_p4dp;
 > 199			pud_t *bm_pudp;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
