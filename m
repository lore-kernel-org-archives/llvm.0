Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017ED214A60;
	Fri, 28 Mar 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156469; cv=none; b=epnPZFEpaP5YpGaATgNqr/FsRyuIx6rD2YO5Rjieyqkl1D1l+LF1gxVLSKMEIkJhVQHHg6MkHu3JF9DYrdJ2pwZ1oYhE7V2Toq6sKI2jZ/4OtgJcnARcinsUtKcrVP35ph0yF5CKv6yk33Arukm8Ro3ju18my3jEMrk5t3zaPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156469; c=relaxed/simple;
	bh=lA+gR+1W97YVj37Wt8iOp1re6Z0hZyRbDm0G/GoSsAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXGeGAPA8aO0/2FdrjgYHXTsT2g1issVuW1+/Qgdt4ZJ5JJaaU5mcwWWIRE3Q8SziDSxOdlrJpmdJUpOBzAkTXC/KxMYasAZffktCxnL6OPM5D7ElERQA4UAqBMuhUyQzoQfdlY3UTJ4dcr+QnZjxLmzFkUNRcYWhx3w1G4BnlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTrbWrQz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTrbWrQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743156468; x=1774692468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lA+gR+1W97YVj37Wt8iOp1re6Z0hZyRbDm0G/GoSsAo=;
  b=OTrbWrQz6Q7MhDfS0n4Cp+1nbOdSglWExqIHTVVqakTAUgf3QacrivyV
   Kcn/cdq/E+Oco3p1Nr9qBkue/KxUzoHpgKdLZeIVgz01Adw0e2/aktioi
   S6FirWnliIZMs4Dn9KehldNglS6Z+XPLrXO1swsMCPtaTmRI6y1GVb1wR
   P0Ld+b0ifZKjO0l1TMA77dZYVpjDtbAFEqEX48n5R0E5oo5R1AFMsLP9A
   +EKRjEfJ3U/SEcHji3S645G8DUXTn0CXUIlQC5q9kCvhNstnDXJuuvDmR
   adiWBa+lmiBC3t7asuc0EGDQSp6PjxLoGMCQkUg1v/NxQdl0B/41BBQ95
   A==;
X-CSE-ConnectionGUID: yIwFTt9oSOWMA5m61C4KtA==
X-CSE-MsgGUID: fy4BeUXxTEunfO1pXsYzCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44395770"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44395770"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:07:47 -0700
X-CSE-ConnectionGUID: 3JJ6q19CR2ORiXr3/9+Bbg==
X-CSE-MsgGUID: cQXoGUKOSvCHYwxMDbUCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125863199"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2025 03:07:46 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty6cg-0007LE-1E;
	Fri, 28 Mar 2025 10:07:36 +0000
Date: Fri, 28 Mar 2025 18:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/5] fs/f2fs/dir.c:370:35: error: use of
 undeclared identifier 'inode'
Message-ID: <202503281735.NGPfccfP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   221d9fea44a3b5a03030a89853dfb5e78a1cdc9f
commit: 221d9fea44a3b5a03030a89853dfb5e78a1cdc9f [5/5] f2fs: support to disable linear lookup fallback
config: hexagon-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281735.NGPfccfP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281735.NGPfccfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281735.NGPfccfP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/dir.c:370:35: error: use of undeclared identifier 'inode'
                   !sb_no_casefold_compat_fallback(inode->i_sb)) {
                                                   ^
   1 error generated.


vim +/inode +370 fs/f2fs/dir.c

   329	
   330	struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
   331						 const struct f2fs_filename *fname,
   332						 struct page **res_page)
   333	{
   334		unsigned long npages = dir_blocks(dir);
   335		struct f2fs_dir_entry *de = NULL;
   336		unsigned int max_depth;
   337		unsigned int level;
   338		bool use_hash = true;
   339	
   340		*res_page = NULL;
   341	
   342	#if IS_ENABLED(CONFIG_UNICODE)
   343	start_find_entry:
   344	#endif
   345		if (f2fs_has_inline_dentry(dir)) {
   346			de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
   347			goto out;
   348		}
   349	
   350		if (npages == 0)
   351			goto out;
   352	
   353		max_depth = F2FS_I(dir)->i_current_depth;
   354		if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
   355			f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
   356				  dir->i_ino, max_depth);
   357			max_depth = MAX_DIR_HASH_DEPTH;
   358			f2fs_i_depth_write(dir, max_depth);
   359		}
   360	
   361		for (level = 0; level < max_depth; level++) {
   362			de = find_in_level(dir, level, fname, res_page, use_hash);
   363			if (de || IS_ERR(*res_page))
   364				break;
   365		}
   366	
   367	out:
   368	#if IS_ENABLED(CONFIG_UNICODE)
   369		if (IS_CASEFOLDED(dir) && !de && use_hash &&
 > 370			!sb_no_casefold_compat_fallback(inode->i_sb)) {
   371			use_hash = false;
   372			goto start_find_entry;
   373		}
   374	#endif
   375		/* This is to increase the speed of f2fs_create */
   376		if (!de)
   377			F2FS_I(dir)->task = current;
   378		return de;
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
