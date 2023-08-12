Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E941861;
	Sat, 12 Aug 2023 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691836036; x=1723372036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A8GEGbiPLdALZV2Smdzky+ph/86krYV09WRHGvddmto=;
  b=XG4hjHn4/aL8tSLbzBV7ZROO9UcZ83jKg7rl1xbl0ZaznR9X718Bco3C
   eGOkBT8Z+OHzEqJlAu5vS+gO6cWz+mrOypvz/z1Gt8M2YavLLD7JUHTEo
   dwPKib667ZWVHZ5/lom8n9sTQTrNjcG7+W3WEks1ujUhkbWKq7fytG0fg
   HGacFZ1KR4BwTYZmFNSKnIKwTU/oRAshYsKOJjAQ2qhqzwTYcRC6dZyVj
   3vjk30Bnx9qrm6m1qTLo58zvCbD/8b4D+dFml0AO6rYVJ/U7WB+y7yoEa
   N5iWNPX0rBdAtY5DmQ6TIcOYyiZpaIrXLTTNpa6H8bxho+4GJjZA0qdG/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371824624"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="371824624"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 03:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="736015247"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="736015247"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2023 03:27:12 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUlpv-0008V8-0E;
	Sat, 12 Aug 2023 10:27:11 +0000
Date: Sat, 12 Aug 2023 18:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Cannot find symbol for section 4: .text.phys_mem_access_prot_allowed.
Message-ID: <202308121810.APAJIBxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8de32cc060ba3f63171aaa0e8764d22d8c37978
commit: 99b619b37ae151dc0fcdffcae48b5a5ad90ebde8 mips: provide unxlate_dev_mem_ptr() in asm/io.h
date:   9 weeks ago
config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308121810.APAJIBxn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121810.APAJIBxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121810.APAJIBxn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 4: .text.phys_mem_access_prot_allowed.
   drivers/char/mem.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
