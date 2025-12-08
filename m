Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08D17BCA;
	Mon,  8 Dec 2025 01:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158767; cv=none; b=EtmHOJtWWWklw+jUfKID9EgAPbBeLKErRnheiZQsdt4rN6o52hV3vI/nYdamPw+Y8J+LtMs8QvjuBY7HoSNgw7vbdkv4sIEgU9JlvTLAkZ6bkIgPITLLrlV4pOnSw6n2YZJvD0y0skC8oOyjCWOwo+VKZ3VIWpVmaawJbvTnRwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158767; c=relaxed/simple;
	bh=Kg9GRYVzoc7gGK3ZCChZv/V3hkzOrjaZaxDl3voEv2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W0GFWkq7byTkOIRiXGyeerpCJESY3r7f1WGrzp3bk6hkkf2o30lP8LiyRCRZRzsPiNXNDAa1INCP3JzPlAU9yOi89MUpblTdWaeHb9jwW1lJxFF6jnD0ibCoPOK6EY52/P6rN7MGyqb5ZlOd/3hoaZAiLmKcJSF+AQQyMHmB3Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMn+PWA1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMn+PWA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765158766; x=1796694766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kg9GRYVzoc7gGK3ZCChZv/V3hkzOrjaZaxDl3voEv2w=;
  b=UMn+PWA1CJfp1ROAQFjWUmBui74EhPIFEj7zFEkRtzkE+M1dWG28Yo+G
   qaXzfq5pDe2eaR6lnWLsJ7xJks0WgeBU86XRI0mpx8J9cvhS4apWov1qo
   jFW8+FZl4XDy6YxSaGUVNs0ZpY21OJZjvVA/EpwJ4Ootx24fIJBkOroz+
   elzd/5weW/FaWHFB8Awze1WP/RRWR3Jqv3UeBHHVSOj5Nzn5112Cv2jme
   6FCT8902bwzU5pGVPOHKY0uxr4kEN+fQi6Nz5oAGmZP9t2VV0fdLahCGi
   JuSAXOZQmAax5yHpACzlOStqw7V4Tz9wFXBRoYqXIQx88VD+PalE0u9Zo
   Q==;
X-CSE-ConnectionGUID: hJCRwjY3S0uwbxt1xWj1sA==
X-CSE-MsgGUID: cRr9VHP6Quakh+M0AN7ptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67148230"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67148230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 17:52:45 -0800
X-CSE-ConnectionGUID: 5JvneCOfQceLYOvXXvju2Q==
X-CSE-MsgGUID: CdxEcSvLTE6eIusq4LBQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="233180307"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2025 17:52:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSQQb-00000000JoL-0Btz;
	Mon, 08 Dec 2025 01:52:41 +0000
Date: Mon, 8 Dec 2025 09:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 1097/1101] fs/bcachefs/fs/check.c:113:36:
 error: initializer element is not a compile-time constant
Message-ID: <202512080923.m7uVKRta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e334d0d42eb60d4aae64c1d9a6374a054a0aac08
commit: 7df2fb43bb8830f27b55ca1820e397a7258e6141 [1097/1101] bcachefs: split out create_lostfound()
config: um-randconfig-002-20251208 (https://download.01.org/0day-ci/archive/20251208/202512080923.m7uVKRta-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e7ce77573b2fad126a367475cbe807c10826691)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080923.m7uVKRta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080923.m7uVKRta-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/fs/check.c:2:
   In file included from fs/bcachefs/bcachefs.h:202:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/bcachefs/fs/check.c:113:36: error: initializer element is not a compile-time constant
     113 | static struct qstr lostfound_str = QSTR("lost+found");
         |                                    ^
   include/linux/dcache.h:61:17: note: expanded from macro 'QSTR'
      61 | #define QSTR(n) QSTR_LEN(n, strlen(n))
         |                 ^
   include/linux/dcache.h:60:36: note: expanded from macro 'QSTR_LEN'
      60 | #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
         |                                    ^
   include/linux/dcache.h:59:26: note: expanded from macro 'QSTR_INIT'
      59 | #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
         |                          ^
   1 warning and 1 error generated.


vim +113 fs/bcachefs/fs/check.c

   112	
 > 113	static struct qstr lostfound_str = QSTR("lost+found");
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
