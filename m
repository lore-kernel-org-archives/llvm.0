Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4679713CF94;
	Wed, 17 Apr 2024 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713355928; cv=none; b=j3QhjOofhebhJQxIIL+FtCRpLwBr9eNnI/b7IsVruT8Qrvia0n+h4OlkZMK5rUACafgISC7m5IUjvWBulII7lXg03jEFgDkVzhqtjzXoHHS27AZQ1Qkg9/QHFIqptx67F1Pqn9XdoMGEfx4ibO3HQJX84BtZ5TMNk7wwDccf/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713355928; c=relaxed/simple;
	bh=HVGM/vNY7PYtVnQmD8jyKDH2p5PHUZUIoVtWDqGoHoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aVrtluOcLbEdTUBVP59c5R8TinDVJAZq7eRBLpO3M3zfCQwDkMj7orCUNtrKoa0EIVoY+CdZ/OAeRJF/5B81EWfcVtYj2+gLzW5PX/JmsKsm9S91CJByjMFV8UgXR4xP1odm+FSfiaiAbUHH7hR9YZHIfWdVDx7+8l9XPHmiUGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+yxlgJ0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+yxlgJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713355925; x=1744891925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVGM/vNY7PYtVnQmD8jyKDH2p5PHUZUIoVtWDqGoHoM=;
  b=U+yxlgJ01y0l4ObPuXuc6pM9fYj4J7AzRUDREZJSsK6YtR2ywgINN8Ps
   FJEYiQPd6YKsAkF2UJ6D1uB5nYmjXJOCI04mbiFW7LhH+luhkZZNiyDy6
   aNXPiB8o3o1sl3w9wMhfT58rMZ7i5Szp7jGqRZc2FH1JhDzHJd902GpN/
   CFjZSjewYaaxlSZ88EdGd5K5SIIHkSeMXLFzgPaFjjfwTOlYVvxtSjH4k
   wmJEbxdn6ZAlCAyLShWi0XXc5JCXdI1Vc/271GbiO3YiwdiXgLsh1hnDM
   jZmpfBaFfzeYFrdQYu9W2sAh3L1Za5Iv6vo98lJQw/EZ3nM8QOu5Uv0hm
   Q==;
X-CSE-ConnectionGUID: tswlDEjfRU6QT/+9EU60XA==
X-CSE-MsgGUID: VyITAUhlQnuFIoOJeNfS4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8703150"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8703150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:12:04 -0700
X-CSE-ConnectionGUID: OySB1uXFS5yl/a9deTnjnA==
X-CSE-MsgGUID: hekhT+lORLWA1dYcWloeRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="53553345"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2024 05:12:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx48u-0006YW-05;
	Wed, 17 Apr 2024 12:12:00 +0000
Date: Wed, 17 Apr 2024 20:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 3/9] fs/f2fs/data.c:2366:10: warning: variable 'index' set
 but not used
Message-ID: <202404172031.UJO1tq47-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   12f1bfe4b075fdc2ecab72bd06ba826e2d32dd70
commit: ab8856b2d7aa3c84ec04e0125e6615a2afc11f3b [3/9] f2fs: convert f2fs_mpage_readpages() to use folio
config: arm-randconfig-003-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172031.UJO1tq47-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404172031.UJO1tq47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172031.UJO1tq47-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/data.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/f2fs/data.c:2366:10: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2366 |         pgoff_t index;
         |                 ^
   2 warnings generated.


vim +/index +2366 fs/f2fs/data.c

  2340	
  2341	/*
  2342	 * This function was originally taken from fs/mpage.c, and customized for f2fs.
  2343	 * Major change was from block_size == page_size in f2fs by default.
  2344	 */
  2345	static int f2fs_mpage_readpages(struct inode *inode,
  2346			struct readahead_control *rac, struct folio *folio)
  2347	{
  2348		struct bio *bio = NULL;
  2349		sector_t last_block_in_bio = 0;
  2350		struct f2fs_map_blocks map;
  2351	#ifdef CONFIG_F2FS_FS_COMPRESSION
  2352		struct compress_ctx cc = {
  2353			.inode = inode,
  2354			.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
  2355			.cluster_size = F2FS_I(inode)->i_cluster_size,
  2356			.cluster_idx = NULL_CLUSTER,
  2357			.rpages = NULL,
  2358			.cpages = NULL,
  2359			.nr_rpages = 0,
  2360			.nr_cpages = 0,
  2361		};
  2362		pgoff_t nc_cluster_idx = NULL_CLUSTER;
  2363	#endif
  2364		unsigned nr_pages = rac ? readahead_count(rac) : 1;
  2365		unsigned max_nr_pages = nr_pages;
> 2366		pgoff_t index;
  2367		int ret = 0;
  2368	
  2369		map.m_pblk = 0;
  2370		map.m_lblk = 0;
  2371		map.m_len = 0;
  2372		map.m_flags = 0;
  2373		map.m_next_pgofs = NULL;
  2374		map.m_next_extent = NULL;
  2375		map.m_seg_type = NO_CHECK_TYPE;
  2376		map.m_may_create = false;
  2377	
  2378		for (; nr_pages; nr_pages--) {
  2379			if (rac) {
  2380				folio = readahead_folio(rac);
  2381				prefetchw(&folio->flags);
  2382			}
  2383	
  2384			index = folio_index(folio);
  2385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
