Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F59B38BF69;
	Wed, 19 Aug 2026 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787101932; cv=none; b=GfDY5XiDDi4tAmIcxH58BsevplpocMABdgOwcKd/UBMtg0EwNxLBg2SgmCNaMWQUGt/UnhFnQI6JN9u3j/krDap4WCoWBEfeiUwo/RpjNHmnhH0PWs9um4a5cvM8jo0JIXn8JGxVA29MI0OG/90Y0iSDXfdViH3/dV1hSqw+bBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787101932; c=relaxed/simple;
	bh=0nKWSLzU2mejXrdPy3Hh1s0eX5r610iTw5Imr7vQeGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ujDJSW0jtYWNXuee7Uc6qEDQzTzsN5nWCmIQuhv5o3uHux79LA+iccbvGB702icKJrdVAZ7iomauWjZU79WsowZTmBTWsWy/GNYeRaFv3mjab7POYkdxC3EFM1+vvpPDIoqkpdlgGY2/eKJNp7kK37sJm1HIGU979HUBjnQBuMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJMP+n1D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJMP+n1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787101930; x=1818637930;
  h=date:from:to:cc:subject:message-id;
  bh=0nKWSLzU2mejXrdPy3Hh1s0eX5r610iTw5Imr7vQeGA=;
  b=SJMP+n1DjXVQnjv2f0VN7DRYBc90jqVsQufrT8OBM8Ahdh0auRDEt3Pv
   8TgzrzjHk76/TRavyyNi8M0rTmeEyO07AOyL7Lxg2AkEWQAw1pgy36Hhd
   0TyHmAv01tLRLsUNEaNoTXb813FH0Ufu5mCeA2UoQZQGIvsqgzBznubtZ
   BQycAMrvbXeYpexG2+V8Yzc1iIJZSrbII3H60SJin1sBkcKd75QQ0/ay7
   YKlvdTiXQ3oCap+iUmk37U2qgUuWdtOjb8ugcBdS8LDkHzDSah3GO2OVS
   RTZ6fsuCZB6ecvFzmNU5AzkDxzBwwKW8LuTXf2amGATkhI+eSRvhC2BiG
   w==;
X-CSE-ConnectionGUID: i38QF/q8S3i9SIVXlZvDSA==
X-CSE-MsgGUID: jN8Sq6XiQp+cZR8TBL/gbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87367265"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87367265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 18:12:10 -0700
X-CSE-ConnectionGUID: NsfMHffqTwySFcSX9F6hGQ==
X-CSE-MsgGUID: 1bijJAfQRCKt8vRim3IuGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259205411"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 18:12:07 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwUqb-000000007L3-1O11;
	Wed, 19 Aug 2026 01:12:05 +0000
Date: Wed, 19 Aug 2026 03:11:29 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 8/13] fs/f2fs/data.c:61:23: warning:
 variable 'sbi' set but not used
Message-ID: <202608190320.yN1NeKmO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: f93483387c4c8dd531a818f52e740c1049d00de1 [8/13] f2fs: cache: use node cache
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260819/202608190320.yN1NeKmO-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190320.yN1NeKmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190320.yN1NeKmO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/data.c:61:23: warning: variable 'sbi' set but not used [-Wunused-but-set-variable]
      61 |         struct f2fs_sb_info *sbi;
         |                              ^
   1 warning generated.


vim +/sbi +61 fs/f2fs/data.c

f543805fcd60f3 Chao Yu                 2019-12-04  56  
d6966e7ed280ca Matthew Wilcox (Oracle  2025-07-08  57) bool f2fs_is_cp_guaranteed(const struct folio *folio)
36951b38d13ac7 Chao Yu                 2016-11-16  58  {
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  59) 	struct address_space *mapping = folio->mapping;
36951b38d13ac7 Chao Yu                 2016-11-16  60  	struct inode *inode;
36951b38d13ac7 Chao Yu                 2016-11-16 @61  	struct f2fs_sb_info *sbi;
36951b38d13ac7 Chao Yu                 2016-11-16  62  
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  63) 	if (fscrypt_is_bounce_folio(folio))
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  64) 		return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
36951b38d13ac7 Chao Yu                 2016-11-16  65  
36951b38d13ac7 Chao Yu                 2016-11-16  66  	inode = mapping->host;
36951b38d13ac7 Chao Yu                 2016-11-16  67  	sbi = F2FS_I_SB(inode);
36951b38d13ac7 Chao Yu                 2016-11-16  68  
f93483387c4c8d Chao Yu                 2026-08-18  69  	if (S_ISDIR(inode->i_mode))
b763f3bedc2da2 Chao Yu                 2021-04-28  70  		return true;
b763f3bedc2da2 Chao Yu                 2021-04-28  71  
3db1de0e582c35 Daeho Jeong             2022-04-28  72  	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  73) 			folio_test_f2fs_gcing(folio))
36951b38d13ac7 Chao Yu                 2016-11-16  74  		return true;
36951b38d13ac7 Chao Yu                 2016-11-16  75  	return false;
36951b38d13ac7 Chao Yu                 2016-11-16  76  }
36951b38d13ac7 Chao Yu                 2016-11-16  77  

:::::: The code at line 61 was first introduced by commit
:::::: 36951b38d13ac7cce9fcf89e0e01c22ed0d05688 f2fs: don't wait writeback for datas during checkpoint

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
