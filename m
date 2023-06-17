Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A061859;
	Sat, 17 Jun 2023 05:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686978378; x=1718514378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pK8jks8apAjOpLYCehVlKBgpc6mjyi1KBmgtB0Zm4V8=;
  b=FKVgrWe9iHB5BAYRSc3ExaHc9aFMqoppKee6loO7w4r8VCYlARB0RITY
   iRNmU1hRbQ48MZe/wY3x5vs6Xsb2EpVGfRxfD/y+I3ZRQS4JHRs5TxtPi
   7lN4QxFiI3AwODBs6/u58Gg69f/N7k2jKT4dcAkiCA3LQ/lDZ4SFOdO/T
   WecQvl88jPB9Q+YzoJ6BT4ZgKPtMYy2cKYo1lE9kIyYkodSBKRZ0cAg4M
   ltgJt7IFiI+v4wBol1KbhmWkC52zkM70YBzkzXoG3N7El8PBz2mVVKvKw
   RbYaWhtZd98UVa88IfcWqG19YZ6BvvToYCPfL3T7X0O18v0Rev8iMv60W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="362776195"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="362776195"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 22:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="778388870"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="778388870"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2023 22:06:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAO8d-0002JA-22;
	Sat, 17 Jun 2023 05:06:15 +0000
Date: Sat, 17 Jun 2023 13:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9443/10326] mm/pagewalk.c:261:12: warning: stack
 frame size (2144) exceeds limit (2048) in 'walk_pgd_range'
Message-ID: <202306171343.1IeyGfuO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: 0dfcf1e2873372f51dd86a7cfabc1b8bbf776269 [9443/10326] mm/pagewalk: walk_pte_range() allow for pte_offset_map()
config: riscv-buildonly-randconfig-r001-20230615 (https://download.01.org/0day-ci/archive/20230617/202306171343.1IeyGfuO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171343.1IeyGfuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171343.1IeyGfuO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pagewalk.c:261:12: warning: stack frame size (2144) exceeds limit (2048) in 'walk_pgd_range' [-Wframe-larger-than]
   static int walk_pgd_range(unsigned long addr, unsigned long end,
              ^
   1 warning generated.


vim +/walk_pgd_range +261 mm/pagewalk.c

c2febafc67734a Kirill A. Shutemov 2017-03-09  260  
fafaa4264eba49 Naoya Horiguchi    2015-02-11 @261  static int walk_pgd_range(unsigned long addr, unsigned long end,
fafaa4264eba49 Naoya Horiguchi    2015-02-11  262  			  struct mm_walk *walk)
fafaa4264eba49 Naoya Horiguchi    2015-02-11  263  {
fafaa4264eba49 Naoya Horiguchi    2015-02-11  264  	pgd_t *pgd;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  265  	unsigned long next;
7b86ac3371b70c Christoph Hellwig  2019-08-28  266  	const struct mm_walk_ops *ops = walk->ops;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  267  	int err = 0;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  268  
e47690d756a760 Steven Price       2020-02-03  269  	if (walk->pgd)
e47690d756a760 Steven Price       2020-02-03  270  		pgd = walk->pgd + pgd_index(addr);
e47690d756a760 Steven Price       2020-02-03  271  	else
fafaa4264eba49 Naoya Horiguchi    2015-02-11  272  		pgd = pgd_offset(walk->mm, addr);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  273  	do {
fafaa4264eba49 Naoya Horiguchi    2015-02-11  274  		next = pgd_addr_end(addr, end);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  275  		if (pgd_none_or_clear_bad(pgd)) {
7b86ac3371b70c Christoph Hellwig  2019-08-28  276  			if (ops->pte_hole)
b7a16c7ad790d0 Steven Price       2020-02-03  277  				err = ops->pte_hole(addr, next, 0, walk);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  278  			if (err)
fafaa4264eba49 Naoya Horiguchi    2015-02-11  279  				break;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  280  			continue;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  281  		}
3afc423632a194 Steven Price       2020-02-03  282  		if (ops->pgd_entry) {
3afc423632a194 Steven Price       2020-02-03  283  			err = ops->pgd_entry(pgd, addr, next, walk);
3afc423632a194 Steven Price       2020-02-03  284  			if (err)
3afc423632a194 Steven Price       2020-02-03  285  				break;
3afc423632a194 Steven Price       2020-02-03  286  		}
e17eae2b839937 Christophe Leroy   2021-06-28  287  		if (is_hugepd(__hugepd(pgd_val(*pgd))))
e17eae2b839937 Christophe Leroy   2021-06-28  288  			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
e17eae2b839937 Christophe Leroy   2021-06-28  289  		else if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
c2febafc67734a Kirill A. Shutemov 2017-03-09  290  			err = walk_p4d_range(pgd, addr, next, walk);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  291  		if (err)
fafaa4264eba49 Naoya Horiguchi    2015-02-11  292  			break;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  293  	} while (pgd++, addr = next, addr != end);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  294  
fafaa4264eba49 Naoya Horiguchi    2015-02-11  295  	return err;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  296  }
fafaa4264eba49 Naoya Horiguchi    2015-02-11  297  

:::::: The code at line 261 was first introduced by commit
:::::: fafaa4264eba49fd10695c193a82760558d093f4 pagewalk: improve vma handling

:::::: TO: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
