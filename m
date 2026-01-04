Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A61DF985;
	Sun,  4 Jan 2026 05:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506225; cv=none; b=Eh8tdU8kfu+vzR0ry7Y3ubTqF7zCq3FQfhOcr8smZZSXDgguWHtyLbVDsXDR9aMLlFvlwtQ0MzA1hB1zgwRl+mGnO0ZPXxuwYwaqu1HOO5Gu1eqD8Y9XRNq3L08AYjP2NmMQ/uTrE/Ikl0cdhSoCPaktJbHCgMtfr0i5U8VXbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506225; c=relaxed/simple;
	bh=Hh7Bm5wXYDjBRU3I2k7OCElVnOBJlMHEC1HhrY3NEBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tV+hw8givKCcvF0EZbb6ox71QuF7IafbIvvhIb3JiNe6RcBpkJC5pyMezug6OeTY6GyidPwhyoJKo56eZQKLnmPN1QZv6iSM5FJ9yB16y83C8PhZ98mulUGVsVRxW8STWSrHOgB30URTs13QwMOuJURZdwKnsDL4BdR+yDK3cqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIDcckvg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIDcckvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767506223; x=1799042223;
  h=date:from:to:cc:subject:message-id;
  bh=Hh7Bm5wXYDjBRU3I2k7OCElVnOBJlMHEC1HhrY3NEBs=;
  b=oIDcckvgsxmRPJl5b5Bbu1dXxQkmZ4Oci9i1fheHTepxKOKWQctNFjtU
   P61Ma1kOjchHtefOI91j8QS+KM9Etx42nm4zKagSkfBii0fbOqJtTBSpN
   yoBhRBEDQJBD0566iz9AbqrJUmAtdeJOUnpNswUyJxfSSjscjJIAi1EoV
   UXLdH0RGEU3hNhK1iqFO3qtE5xPkoZbZjwh3mk3et5am0Ue46vGOrlsml
   c2W3rVKSWDmygMAhmR0aeiAtrInIBAUwFdhQsP3dtSI2QV5bcW74Z+MUW
   J2SXkI0siaLQhCEai8nO8ndAvxqLHFagqb/PxsYT4iJKFrr+HGAJSkIwj
   A==;
X-CSE-ConnectionGUID: v+IghrCzSyGhMRq6LdYgng==
X-CSE-MsgGUID: msQOxBaLRj2cqxPzChEIKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80286797"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="80286797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 21:57:02 -0800
X-CSE-ConnectionGUID: ohFU4H4TQhCpDYITlu0Vnw==
X-CSE-MsgGUID: ihYmbPtESBezQj34QDJtfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="206602777"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2026 21:57:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcH6o-000000000Oj-3lqv;
	Sun, 04 Jan 2026 05:56:58 +0000
Date: Sun, 04 Jan 2026 13:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trondmy-nfs-2.6:testing 26/35] fs/nfs/write.c:2049:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202601041331.pbHo7TSH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   bf5a9581839ebeebbd3bd004a174fea9afa19dcb
commit: 3533434037066b610d50e7bd36f3525ace296928 [26/35] NFS: Fix a deadlock involving nfs_release_folio()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260104/202601041331.pbHo7TSH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601041331.pbHo7TSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601041331.pbHo7TSH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/write.c:2049:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2049 |         if (folio_clear_dirty_for_io(folio)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/write.c:2056:9: note: uninitialized use occurs here
    2056 |         return ret;
         |                ^~~
   fs/nfs/write.c:2049:2: note: remove the 'if' if its condition is always true
    2049 |         if (folio_clear_dirty_for_io(folio)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2050 |                 trace_nfs_writeback_folio_reclaim(inode, range_start, len);
    2051 |                 ret = nfs_writepage_locked(folio, &wbc);
    2052 |                 trace_nfs_writeback_folio_reclaim_done(inode, range_start, len,
    2053 |                                                        ret);
    2054 |         } else
         |           ~~~~
    2055 |                 nfs_commit_inode(inode, 0);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/write.c:2045:9: note: initialize the variable 'ret' to silence this warning
    2045 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +2049 fs/nfs/write.c

  2026	
  2027	/**
  2028	 * nfs_wb_folio_reclaim - Write back all requests on one page
  2029	 * @inode: pointer to page
  2030	 * @folio: pointer to folio
  2031	 *
  2032	 * Assumes that the folio has been locked by the caller
  2033	 */
  2034	int nfs_wb_folio_reclaim(struct inode *inode, struct folio *folio)
  2035	{
  2036		loff_t range_start = folio_pos(folio);
  2037		size_t len = folio_size(folio);
  2038		struct writeback_control wbc = {
  2039			.sync_mode = WB_SYNC_ALL,
  2040			.nr_to_write = 0,
  2041			.range_start = range_start,
  2042			.range_end = range_start + len - 1,
  2043			.for_sync = 1,
  2044		};
  2045		int ret;
  2046	
  2047		if (folio_test_writeback(folio))
  2048			return -EBUSY;
> 2049		if (folio_clear_dirty_for_io(folio)) {
  2050			trace_nfs_writeback_folio_reclaim(inode, range_start, len);
  2051			ret = nfs_writepage_locked(folio, &wbc);
  2052			trace_nfs_writeback_folio_reclaim_done(inode, range_start, len,
  2053							       ret);
  2054		} else
  2055			nfs_commit_inode(inode, 0);
  2056		return ret;
  2057	}
  2058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
