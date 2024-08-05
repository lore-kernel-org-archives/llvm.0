Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D815B13A;
	Mon,  5 Aug 2024 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875194; cv=none; b=CphcHxKmXymJYWLSLH+eiF4Yrv5oftjS62deqGzp7zLBjSWnpkU8DHYxmotnVBWKFoI3uMvvcdqiPpeO4JoAmeFUSVfQtEvUcjq4eHiPX1IEUe/38xNp7eprRi1BUmKv1gOQVEsC7gYw8amnp+FEZf3aQR1MbPNXpFoFsgtPulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875194; c=relaxed/simple;
	bh=BCnTuSC9p2IWv5rMIARWPkLXKThute9xZgNVD2bYizk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJGs7s++K/cro3ElzHMI0rJ49hDPPW+6rGabnxg3S5kaurSzLv/ZNdfH0nm0hw65HtgS/wj2k7hprgS0uxT1y5YvORoohNBo4VGyuzUC/zyZV6ZErw3E0cXnyOXKrsHbvAfr9qky3Rfwuw+LfA7jZ5T8NdOyOd6CqMdeVnrfA/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKs0YpCn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKs0YpCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722875192; x=1754411192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BCnTuSC9p2IWv5rMIARWPkLXKThute9xZgNVD2bYizk=;
  b=kKs0YpCnTNkNo9xthP7jSwyMAVB/YfccrK5o4+hoiuTEHhijVWlXgkHO
   IFHfHwcWb+rFslXQmpYHYKwC4+Usb48X5U4HDwNQiFPYTLs3N1rj7HC1e
   SFex8k96c6+kSBpzXGGL+Whlwft43L68q3fq1qHFS7YKaGIsOXQ8d9n8+
   bRwKMJuYPV790z2T2HgOfBj0+of4BMsh2jEqbm+FxdBRKYl6t4J/A0xQk
   AuFDIg7rsg9xcURkQDDURoXiPnsBaMtH5jcJjdOk2GUDKt6uzEVhGDZ/4
   tX3XHVzo5XHDCSewpX27BFxpJzthJZX2VighRYVhOr6dnDyiCBX5nSQAO
   g==;
X-CSE-ConnectionGUID: u2oKcHdPTEm7DX6DzMMEAg==
X-CSE-MsgGUID: XzDqWaYUTp63FBGiKqvGrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24715463"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="24715463"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 09:23:30 -0700
X-CSE-ConnectionGUID: vZ7I1il0STel7KYFnYmzNA==
X-CSE-MsgGUID: B2SOLHnyRVK1kz1fPT+rxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56152062"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Aug 2024 09:23:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb0UJ-00038c-15;
	Mon, 05 Aug 2024 16:23:17 +0000
Date: Tue, 6 Aug 2024 00:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 442/442] drivers/crypto/bcm/util.c:477:3:
 error: field designator 'read' does not refer to any field in type 'const
 struct file_operations'
Message-ID: <202408060048.V7h6LtsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449894f5917ad62cb4083d1df948f4f5c92a01da
commit: 51036f9719aad90aa0e0ca1aa9443e6ce79c0fd2 [442/442] fs: finally remove ->read() and ->write() from file_operations
config: arm-randconfig-003-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060048.V7h6LtsK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060048.V7h6LtsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060048.V7h6LtsK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/bcm/util.c:8:
   In file included from drivers/crypto/bcm/cipher.h:11:
   In file included from include/linux/mailbox/brcm-message.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/crypto/bcm/util.c:477:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
     477 |         .read = spu_debugfs_read,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +477 drivers/crypto/bcm/util.c

9d12ba86f818aa Rob Rice 2017-02-03  473  
9d12ba86f818aa Rob Rice 2017-02-03  474  static const struct file_operations spu_debugfs_stats = {
9d12ba86f818aa Rob Rice 2017-02-03  475  	.owner = THIS_MODULE,
9d12ba86f818aa Rob Rice 2017-02-03  476  	.open = simple_open,
9d12ba86f818aa Rob Rice 2017-02-03 @477  	.read = spu_debugfs_read,
9d12ba86f818aa Rob Rice 2017-02-03  478  };
9d12ba86f818aa Rob Rice 2017-02-03  479  

:::::: The code at line 477 was first introduced by commit
:::::: 9d12ba86f818aa9cfe9f01b750336aa441f2ffa2 crypto: brcm - Add Broadcom SPU driver

:::::: TO: Rob Rice <rob.rice@broadcom.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
