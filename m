Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5A4B1E7A;
	Thu,  8 May 2025 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731438; cv=none; b=otocjy64W3nVq5l8fSHQdJiEZsFJSOstdKimi7E8+/jUADwyxdKTYOGTFq6t6ioPOlnlHlbDA6qZz5zY6Zcz8Piap4/i+KRP3AL63Ow/d1ql32mpS7oFysquNpYgFwcps341VLB+ssuumU1XAGVSIDtnYN4WQjPwP38uAXcrG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731438; c=relaxed/simple;
	bh=7AEmC9hhuo5/Nlx2W6TIzjPJiVMXVXpxOTCu5qQi46c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rx5UJVnGlkBYB0VzSU/zPuih0L7+PYoAznTvJhy1VXXRVKUfb3yRPtUGJae+zwWjv2U0ScoodJW+7lSfJGZvzhpVX0Mj6vlA9KVoUpAW/y5A7Sf3aiiMSIL7Ay+GUm9LqBazEY7th9vc0FSQbkfdppgaxof+yiiKS32IJR3EMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1y0beyG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1y0beyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746731437; x=1778267437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7AEmC9hhuo5/Nlx2W6TIzjPJiVMXVXpxOTCu5qQi46c=;
  b=C1y0beyGOdV7XVoo5nG5dW+i3UWmaUrIUCT2mpngWhzWQvKa9NqcvDIs
   1mHdI544eS19XmZYIbrkCqJ/HDXjT5ise5dg1pcOiB/N5NM9E0b69UpbQ
   k2LcOP6zr6+jpAQv31eNJ8jrjky+JBBIGl3d+etwVz6yHkD5HMoMad0qc
   cmm75grd00bEGfV6mOdte3XL9sJjYE47BMQUCAcf76JGt0RtR2yKkDZVb
   FmZo7rdU63+xt5QNAjXSe4/3JWlSdknp2cAtmBq8fxYVBJemlJFBivUzo
   ywIgZH8bkDN2zrtPGCCx5IJHMFVo2R2yMZ46prhzNii6b510nOw2TtwFQ
   Q==;
X-CSE-ConnectionGUID: VO1q4uNFRHqvrYmV5LBNaw==
X-CSE-MsgGUID: x/iC9e19QeuxUyW3XG+pQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48443527"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48443527"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:10:37 -0700
X-CSE-ConnectionGUID: JhfjSvC3TvuVmcJtuTvmeg==
X-CSE-MsgGUID: i7lGk/jMQyaqeDyJoBt4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136330501"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 12:10:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD6dd-000BIJ-0l;
	Thu, 08 May 2025 19:10:33 +0000
Date: Fri, 9 May 2025 03:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 3/9] fs/f2fs/f2fs.h:2100:50: error: passing
 'const struct folio *' to parameter of type 'struct folio *' discards
 qualifiers
Message-ID: <202505090256.TMKDR2XH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   2860d2a634860b83a27a71e5db3c2c416a59008a
commit: a14b19bd94199c525031bdc63821ab086f4c70bf [3/9] f2fs: introduce is_{meta,node}_folio
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505090256.TMKDR2XH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090256.TMKDR2XH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090256.TMKDR2XH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
>> fs/f2fs/f2fs.h:2100:50: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    2100 |         return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
         |                                                         ^~~~~
   fs/f2fs/f2fs.h:2023:60: note: passing argument to parameter 'folio' here
    2023 | static inline struct f2fs_sb_info *F2FS_F_SB(struct folio *folio)
         |                                                            ^
   fs/f2fs/f2fs.h:2105:50: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    2105 |         return folio->mapping == NODE_MAPPING(F2FS_F_SB(folio));
         |                                                         ^~~~~
   fs/f2fs/f2fs.h:2023:60: note: passing argument to parameter 'folio' here
    2023 | static inline struct f2fs_sb_info *F2FS_F_SB(struct folio *folio)
         |                                                            ^
   2 errors generated.


vim +2100 fs/f2fs/f2fs.h

  2097	
  2098	static inline bool is_meta_folio(const struct folio *folio)
  2099	{
> 2100		return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
  2101	}
  2102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
