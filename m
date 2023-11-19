Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49618025;
	Sun, 19 Nov 2023 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Td1RhZHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700414253; x=1731950253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igcMldysTVGl1y8s8TC+y1OfHKfCsOgrqwqcbHqBR3g=;
  b=Td1RhZHIw3KVJBrzLDGsFvdvMiNFL2EO2qT8njeNgebardEZ1KqmHinu
   fBFLvaNrKj5fBhx7LHAzr6ZMR4Rvpg1xvzsPUjeVIbSVo0E9NyzDycj5r
   IntfGUL1M2uXtzeHYbnj9eOv5Htt9Lb5qho8ZoVL7p34DsT4kl2EcIgKk
   wwKtmX74+b4h//IiZ81ehuh4KOqlhr5tBAplraKkfYqC+bTdkm4If1PWL
   gpR2pTdO+nv+pMG/SqIXHQnHxp6tzq/5dKWB8Zph9agAeLqcKQY8UrxGU
   pbfkduUh1jLc0vrG4bzWMfNfP3H5WzpzwfLdDfCyBvLzZ9+ddZPQs10dC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455818232"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="455818232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 09:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="14382602"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2023 09:17:31 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4lQG-0005Lv-36;
	Sun, 19 Nov 2023 17:17:28 +0000
Date: Mon, 20 Nov 2023 01:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1547/1905] buffer.c:undefined reference to
 `__muloti4'
Message-ID: <202311200111.5uQ2ARYV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eff99d8edbed7918317331ebd1e365d8e955d65e
commit: 393146754bcfd9b718d088430041c7f300a4d210 [1547/1905] buffer: fix grow_buffers() for block size > PAGE_SIZE
config: s390-randconfig-002-20231119 (https://download.01.org/0day-ci/archive/20231120/202311200111.5uQ2ARYV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200111.5uQ2ARYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200111.5uQ2ARYV-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: fs/buffer.o: in function `bdev_getblk':
>> buffer.c:(.text+0x256c): undefined reference to `__muloti4'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
