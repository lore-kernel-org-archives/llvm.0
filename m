Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86728751B;
	Tue, 24 Mar 2026 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330571; cv=none; b=ZhvyxIJEOYY1cXvvVXqh5mn+ojmKaO46Nt+nbBxOdMhILv1vMqlUA9CJCbkxVxpA4n66jcL3nePoYT/LZtgWSFpLvE5tBjVKnhBSqzVPxVY+r0PUj/AsnkW4ht/j5+Ba6Ow0k9hNNineJMWYQ4B7UOCoapMw5eXh/Q38bHo75VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330571; c=relaxed/simple;
	bh=XL0S8C++JzOf3hHJrpVNgoGjEGeEjRnHXY9siEs5taE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tiskm0XRL9D2Szv0L6qtPgiHL4KEqno9/rjgfK+QTkkX/N4tmnjz6m81lWiXbSRRrey0MrFuoW30N10rw8k9P+VjsXoU6JnyBOJ0sQKl82RgA74EEoqoh3yctMUBtq+lZgKU4MvCSILsqZcPOud7h610M6LDvUB2P4JT9UhPwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARwTmiFW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARwTmiFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774330570; x=1805866570;
  h=date:from:to:cc:subject:message-id;
  bh=XL0S8C++JzOf3hHJrpVNgoGjEGeEjRnHXY9siEs5taE=;
  b=ARwTmiFW2MzlnkZEtzjYx76ByiB5zUmosGXDVdbdna3HZOhPYTsXFInd
   j/kQgak2N8DiZVa56UT1NIv2sGqimENzt40PWM9wkMl2qMFPwrcwxcyec
   J8geIUhlUM8Q57IgGTmPn3rO3wyWRtQYYksi/H0iIeEJp4yL7jaS2CiBG
   wSWJcjvQdt4nfVTKGKNaP+sLRTotY8Obii4o+Mun90d/U0AuM/UQG7BlM
   5DMhzKQcw+CXulG+cQy2teyv2eCeQtkSc0VWuQUGnyFQ2V4E+A5QEiMF4
   +ToN0hgS7Zg1kU836ltT1yT/9pCClhLJmuDjl0YhTfgxBmxppig/utfwC
   A==;
X-CSE-ConnectionGUID: j7B9kCJkRcCgnsVi98IQrg==
X-CSE-MsgGUID: JYtxr2zTRRmvLVxaYRsLCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74359781"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74359781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:36:08 -0700
X-CSE-ConnectionGUID: qAgavyswTJGmiWngtGBuiQ==
X-CSE-MsgGUID: 6c7PwsCxRHaORiIoRBvllA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228321222"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2026 22:36:05 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4uQs-000000003vR-3q8y;
	Tue, 24 Mar 2026 05:36:02 +0000
Date: Tue, 24 Mar 2026 13:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yongpeng Yang <yangyongpeng@xiaomi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 2/13] fs/f2fs/node.h:425:42: error: passing
 'const struct folio *' to parameter of type 'struct folio *' discards
 qualifiers
Message-ID: <202603241355.hsXvXyz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   b559609da002e5c06340a56ff23ad93cac4f4f9a
commit: 819157dce25d2c894a6c24f04e418dc680477c2a [2/13] f2fs: refactor node footer flag setting related code
config: x86_64-randconfig-011-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241355.hsXvXyz1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241355.hsXvXyz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241355.hsXvXyz1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:31:
>> fs/f2fs/node.h:425:42: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     425 |         f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);
         |                                                 ^~~~~
   fs/f2fs/f2fs.h:3806:68: note: passing argument to parameter 'folio' here
    3806 | void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio);
         |                                                                    ^
   1 error generated.


vim +425 fs/f2fs/node.h

819157dce25d2c Yongpeng Yang           2026-03-18  419  
819157dce25d2c Yongpeng Yang           2026-03-18  420  static inline void set_mark(const struct folio *folio, bool mark, int type)
819157dce25d2c Yongpeng Yang           2026-03-18  421  {
819157dce25d2c Yongpeng Yang           2026-03-18  422  	__set_mark(folio, mark, type);
54c55c4e4fc7ec Weichao Guo             2018-03-09  423  
54c55c4e4fc7ec Weichao Guo             2018-03-09  424  #ifdef CONFIG_F2FS_CHECK_FS
e3f1b76d877c14 Matthew Wilcox (Oracle  2025-07-08 @425) 	f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);

:::::: The code at line 425 was first introduced by commit
:::::: e3f1b76d877c14897b4776fc5dd08af3c7751976 f2fs: Pass a folio to f2fs_inode_chksum_set()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
