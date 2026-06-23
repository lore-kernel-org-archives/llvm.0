Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7038F23F;
	Tue, 23 Jun 2026 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782188361; cv=none; b=DTPBCbDiiLiCRdufgRq3Q6Je7+bsN7UJn+Aiq2SDynZ366QUfa9xySzhZasHry6vEVJ9N6q9saDjzNjCO2CZkqQ7PXJTxsb1WDgXhtOER1UDlZ2pPBqefN4JPtEfv+sEDMjiTfjWp0YMiyC7Sfvypioz2iElP/A8fjwSRHTptDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782188361; c=relaxed/simple;
	bh=se/9KKDopHs/epNOdX6RhoUGgkciV1u4rlWIT0YUxcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PYsNO75oSpw0rLaISyA2Jz/OwsZfOTUtI0/lG3IyC8g2RA+ao9puKOE0YJH9dzF8iNy0VbeqOV0BmBzenCUTL7SkFA64YnZCTRDTtqL6B6AWUiT4Hgd1/WaP4/alcIlcg+jIfM36rXq5/WeFpQvELl9S/sjpNJ+cA06d7zTyC6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzvN+jm5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzvN+jm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782188358; x=1813724358;
  h=date:from:to:cc:subject:message-id;
  bh=se/9KKDopHs/epNOdX6RhoUGgkciV1u4rlWIT0YUxcU=;
  b=HzvN+jm5abWLwO405wtctacBcEEuPLcu3YYjmUslF8J8Xs8V0v4qHd7s
   AXT85c9glVHjI6tzu9AHoNSxg0tqRoreq35TIEXq0DaIato9zc5KR4oin
   WU45bu+bA15+9T7fpjIg65HQ4KWOvXfVgS/q/IY7ZuAVLu65iq8gKHjSe
   roCyAPppwpcuLAYokOaRYgf0kG/U0woi3qmtgxN9B/5xhMDQNv1OMtyOg
   ELh3yP7L9XINNrgwp1txsaOZdYElqgVdyUYI4pMaeBKaPSdblRwbWYzi3
   gydxKDzTZyXNq+9cs1Gjo3b/3zfIY4149uyS1nsjrp8APLt8av0AfRQ5h
   A==;
X-CSE-ConnectionGUID: 1834EWaGT9e1a9KXQGcQoQ==
X-CSE-MsgGUID: nDaYEdw8RJyhwVaVO8qIqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105717069"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="105717069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 21:19:15 -0700
X-CSE-ConnectionGUID: koFRAydSTsOgfjVvzSYklQ==
X-CSE-MsgGUID: gzap3UgESnaWT398EnObng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="279585959"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 21:19:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbsbP-000000002FH-1Q5a;
	Tue, 23 Jun 2026 04:19:11 +0000
Date: Tue, 23 Jun 2026 12:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 9/36]
 drivers/net/arcnet/com20020.c:73:2: error: call to undeclared function
 'TIME'; ISO C99 and later do not support implicit function declarations
Message-ID: <202606231221.UgUeeGJu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 27573170c5c905b0eb87738b380997cc16ab1bb3 [9/36] arcnet: Remove function timing code
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606231221.UgUeeGJu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231221.UgUeeGJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231221.UgUeeGJu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/arcnet/com20020.c:73:2: error: call to undeclared function 'TIME'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         TIME(dev, "insb", count,
         |         ^
>> drivers/net/arcnet/com20020.c:74:7: error: argument type 'void' is incomplete
      74 |              insb(ioaddr + COM20020_REG_RW_MEMDATA, buf, count));
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/io_64.h:249:14: note: expanded from macro 'insb'
     249 | #define insb insb
         |              ^
   drivers/net/arcnet/com20020.c:87:2: error: call to undeclared function 'TIME'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |         TIME(dev, "outsb", count,
         |         ^
   drivers/net/arcnet/com20020.c:88:7: error: argument type 'void' is incomplete
      88 |              outsb(ioaddr + COM20020_REG_RW_MEMDATA, buf, count));
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/io_64.h:243:15: note: expanded from macro 'outsb'
     243 | #define outsb outsb
         |               ^
   4 errors generated.


vim +/TIME +73 drivers/net/arcnet/com20020.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  61  
^1da177e4c3f415 Linus Torvalds     2005-04-16  62  static void com20020_copy_from_card(struct net_device *dev, int bufnum,
^1da177e4c3f415 Linus Torvalds     2005-04-16  63  				    int offset, void *buf, int count)
^1da177e4c3f415 Linus Torvalds     2005-04-16  64  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  65  	int ioaddr = dev->base_addr, ofs = 512 * bufnum + offset;
^1da177e4c3f415 Linus Torvalds     2005-04-16  66  
^1da177e4c3f415 Linus Torvalds     2005-04-16  67  	/* set up the address register */
e859db8ac490832 Ethan Nelson-Moore 2026-05-20  68  	outb((ofs >> 8) | RDDATAflag | AUTOINCflag,
e859db8ac490832 Ethan Nelson-Moore 2026-05-20  69  	     ioaddr + COM20020_REG_W_ADDR_HI);
e859db8ac490832 Ethan Nelson-Moore 2026-05-20  70  	outb(ofs & 0xff, ioaddr + COM20020_REG_W_ADDR_LO);
^1da177e4c3f415 Linus Torvalds     2005-04-16  71  
^1da177e4c3f415 Linus Torvalds     2005-04-16  72  	/* copy the data */
0fec65130b9f11a Joe Perches        2015-05-05 @73  	TIME(dev, "insb", count,
e859db8ac490832 Ethan Nelson-Moore 2026-05-20 @74  	     insb(ioaddr + COM20020_REG_RW_MEMDATA, buf, count));
^1da177e4c3f415 Linus Torvalds     2005-04-16  75  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  76  

:::::: The code at line 73 was first introduced by commit
:::::: 0fec65130b9f11a73d74f47025491f97f82ba070 arcnet: com20020: Use arcnet_<I/O> routines

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Michael Grzeschik <m.grzeschik@pengutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
