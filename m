Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00E28982D;
	Thu, 10 Jul 2025 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131913; cv=none; b=gAF8FKhJwJ8DcxqZAvNi6n5+ToI3WmPTYRcNhlrlatN8vjZpCiyt5Joipg/srIVCtnLnJNwyvVD3QN3YopdDETcAVsom6q1hPQg7TGwVqWmjqOF6KwFmfmasUJKBuR5LNwSZh3odiHFUJp7JVR+UgrHNPPK6gnqEmWVfV8Wgv/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131913; c=relaxed/simple;
	bh=KCIJ9MRY/XQnVYRAuimMORPAQ2dSU6Y7v2W7uF7Vlj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hli3JJo9X0l8qnuEoRGgbLs/qw9y0LBVQjmseCj+7fOCZZCETTCR9olue+3MQfiINtBzPDGYG8QajMKwVOGz7dU8y/crhG0yLaPv4Vsgyb79YyIcgNv2qY+PtJQ5HR8kkiWZgKTqfeSlQDhh2mfilkXjojkhE7UVvPXlQhMYbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvZfvEoM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvZfvEoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752131912; x=1783667912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCIJ9MRY/XQnVYRAuimMORPAQ2dSU6Y7v2W7uF7Vlj0=;
  b=AvZfvEoMk15s00fYSAggdQ1D5WFgtPWDVUAVDZUB+L0LTNxuzZMaPatu
   T3q8Dyzx0V+m9brTowHFg7LcWzYCZj0g0OuqhtsKec/8XRWOOuBpSSeUf
   M7QPcCtkWmahDDLm1Sk48/6+LRXHH9NU7wPr89EGhQlKD+FOVswSx2Hxv
   qU5nAto6NG3N47ORdZ35dr7VdUCyrpQIB8ZRsiDsfzkZ13D8M0CJ39ZcO
   9+cpR7a8ou+1iOqtUoKW3yafvxuteGeWoRbsjmhy9l3RtkkcoCZ1hm7JI
   F1jpSUiobfXjorXabykq7eGSahvirHfiZCWb/FS4LJ06brAmR6LwzqFh1
   g==;
X-CSE-ConnectionGUID: jcy2BgdQRsq0Wd5oiba0Jw==
X-CSE-MsgGUID: knuTO2S5T8qQUkBSr7eV0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65854744"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65854744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:18:30 -0700
X-CSE-ConnectionGUID: VKfc2npuQ0ORH8regQGDbA==
X-CSE-MsgGUID: EG3YYGzMSFic7bgwKrMQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156727715"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2025 00:18:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZlY1-0004f1-1r;
	Thu, 10 Jul 2025 07:18:25 +0000
Date: Thu, 10 Jul 2025 15:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56: error: passing
 'const struct folio *' to parameter of type 'struct folio *' discards
 qualifiers
Message-ID: <202507101412.50ND2WEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   bc8610a18daa4a611d189374031fe1fa3c603423
commit: 9f506c758707749076b4ec2402007670c6f35558 [65/93] f2fs: Use a folio in f2fs_is_cp_guaranteed()
config: s390-randconfig-002-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101412.50ND2WEX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101412.50ND2WEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101412.50ND2WEX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
         |                                                                      ^~~~~
   include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
     527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
         |                                                                   ^
   1 error generated.


vim +58 fs/f2fs/data.c

    49	
    50	bool f2fs_is_cp_guaranteed(const struct page *page)
    51	{
    52		const struct folio *folio = page_folio(page);
    53		struct address_space *mapping = folio->mapping;
    54		struct inode *inode;
    55		struct f2fs_sb_info *sbi;
    56	
    57		if (fscrypt_is_bounce_folio(folio))
  > 58			return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
    59	
    60		inode = mapping->host;
    61		sbi = F2FS_I_SB(inode);
    62	
    63		if (inode->i_ino == F2FS_META_INO(sbi) ||
    64				inode->i_ino == F2FS_NODE_INO(sbi) ||
    65				S_ISDIR(inode->i_mode))
    66			return true;
    67	
    68		if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
    69				folio_test_f2fs_gcing(folio))
    70			return true;
    71		return false;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
