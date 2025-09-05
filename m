Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D514E2F2;
	Fri,  5 Sep 2025 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757038951; cv=none; b=pvGV+5vDpvFlGf2KkQqJ52p5FxTDzRgbc1ZqKOsy84xuUgnGarDqtobh1vBNwzSkAA0Ex+YO4cYgE+zraerng/J0ZM0vuCztFguiWdSVu0otoJ1w6zYEXYdVef+3qElvuZssbOsPNeV/ZFIQLuDIHI7TsEq10YHczqNUguaMch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757038951; c=relaxed/simple;
	bh=knywOHehCDlqFUogdERVd6NewBksJlhHBTn2QlOem8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUHwPi0a+CAVmWVvCP4mt6T05vRkqFdRaqyMlHF9QnfUf+Rp43v+iacD4qLw8LKSBlVnvIF1kLL0sXgKEZLOixei9xkKVyGK7Xy4ZveF9HsQYgxOX32Umw4twtqMjpiN/RCnnf9cvn/Jk+frrEiF+lLFTVLIE9o37kPl0xD1kHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cke/BzB9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cke/BzB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757038950; x=1788574950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=knywOHehCDlqFUogdERVd6NewBksJlhHBTn2QlOem8M=;
  b=Cke/BzB9433n1vDqW4Xis/4gDivpLk81Mwu21k+EWe8hcqvYPwtNcidL
   28FSwupIvOtdPOiMhKFqdyXFqlPbKtBnJlSXn62NgJSyiYE7TMbTd6P6C
   tj52675HcNO3krZDgM+O8oO1lGsFYrecm1n0JIEc8A+fJwLNoV/SVBe74
   sofLFKuwzfJhOXdvP5e1dGVMD0XVZsly2YVHH9JxzLlfGnLZr7Ov05okg
   qYIuCMtvHtzpKRZSrNdv/3usiiJx2WbYIgsT3z7jmVGLSsU93BanEDqnV
   eHM8LWZg3oWdq/ZEGGpc2uCSWTSYmMI+zKBuq/Dw7NeKhM2vavp2XA4Xh
   A==;
X-CSE-ConnectionGUID: OCgXJcxiQ5WTOu9jDNg8wQ==
X-CSE-MsgGUID: QdeW01PvRTm3jojgRoU8+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="46963308"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="46963308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 19:22:29 -0700
X-CSE-ConnectionGUID: 0Rn253ScSgGj44TT3Nko8Q==
X-CSE-MsgGUID: RDlGAhGKTQKFQYOoztrlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="171941816"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2025 19:22:27 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuM5C-00067b-26;
	Fri, 05 Sep 2025 02:21:56 +0000
Date: Fri, 5 Sep 2025 10:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [linux-next:master 6089/6355]
 include/linux/highmem-internal.h:86:39: error: passing 'const struct folio
 *' to parameter of type 'struct folio *' discards qualifiers
Message-ID: <202509051023.d6AUXYH1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ac65880ebca1b68495bd8704263b26c050ac010
commit: 598ad57d4b4687c7cbb9fc8af954143d250b03ae [6089/6355] mm: constify highmem related functions for improved const-correctness
config: i386-buildonly-randconfig-002-20250905 (https://download.01.org/0day-ci/archive/20250905/202509051023.d6AUXYH1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051023.d6AUXYH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051023.d6AUXYH1-lkp@intel.com/

Note: the linux-next/master HEAD 4ac65880ebca1b68495bd8704263b26c050ac010 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:14:
>> include/linux/highmem-internal.h:86:39: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      86 |         const struct page *page = folio_page(folio, offset / PAGE_SIZE);
         |                                              ^~~~~
   include/linux/page-flags.h:319:53: note: passing argument to parameter 'folio' here
     319 | static inline struct page *folio_page(struct folio *folio, unsigned long n)
         |                                                     ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2013769869
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=2013769869
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2013769869
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2013769869
   make: Target 'prepare' not remade because of errors.


vim +86 include/linux/highmem-internal.h

    83	
    84	static inline void *kmap_local_folio(const struct folio *folio, size_t offset)
    85	{
  > 86		const struct page *page = folio_page(folio, offset / PAGE_SIZE);
    87		return __kmap_local_page_prot(page, kmap_prot) + offset % PAGE_SIZE;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
