Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BFC28F93E;
	Fri, 27 Jun 2025 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066700; cv=none; b=Tes9e20PqA/rCNOBKy9WqQb6idCxgQg597yEFU/8/L73tznF3xXgdrpA+cTpi9Uaa1E379saS1Q/3hKqASdxKu3oM8EXz0S2DWkgnfM+asFjEk8SjpFxkIFumXfATbd/OinW8HlD1spTRPAsoySJmNRztCOXNyzVLEyrtW7F2gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066700; c=relaxed/simple;
	bh=crZ0VF8govhT9f8bIibvZSyeak3ch1QESt9i70iUlQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6b9GtXGZMyv7Eu/Sq07jNyi/WZqMPNtvHS6rYO39adx3T3Dw8gGpTqFdFsqD/DsZ0Z+0Xox2kOU7EcHvnaWfJ9rtfZcmXCyxLkdjTmR/oFReX57ItAHu8HlybexW4eha97ynlCHTijzMQaRB0rPQ/qHdttBqMXenwoEfFmMBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxCe2IWu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxCe2IWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751066698; x=1782602698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=crZ0VF8govhT9f8bIibvZSyeak3ch1QESt9i70iUlQw=;
  b=ZxCe2IWupcLfrrrasGArbVvtf1iPgx0vSNCWARTsv3oHbPRUgICfOCRD
   iNth7idLvTbgFlAo4xBRG3cd8FQqiNtv9LUow0qpQG8nezOD9UoreI6FG
   42zLrV59JL8FrhD4QJxZP/ORuU/cTgty55Z6sCXbNdPi3pbyBBAI2yImg
   IVeeY9CNYWMPb/nFSoOjtGf9yhqznQLwAyPkgR69PGZZJOwBSKos9UPdt
   EEjToDusNFUvjLrgQYl68ziAq3VKCZBNBi5KL3d1Nr278u5ggEmPu9MG8
   BAnCPjsJQKUgGyu6SktWpfS+OAl4pcNUNKX1impn+B0eddn+E/REejl/1
   g==;
X-CSE-ConnectionGUID: zJps+hOCTQiUd7Hi79UaOA==
X-CSE-MsgGUID: 8f2EQ4LHT1SO6+Kc+DKsLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52616425"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="52616425"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 16:24:57 -0700
X-CSE-ConnectionGUID: n52RMRYLRxKIduHhINNF7g==
X-CSE-MsgGUID: L+TNXTkSTXOmpzwCLSEx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="158652710"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 16:24:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVIRB-000Wbi-15;
	Fri, 27 Jun 2025 23:24:53 +0000
Date: Sat, 28 Jun 2025 07:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <jth@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 7/9] btrfs: lower auto-reclaim message log level
Message-ID: <202506280733.ut2JoUtS-lkp@intel.com>
References: <20250627091914.100715-8-jth@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627091914.100715-8-jth@kernel.org>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250626]
[cannot apply to kdave/for-next v6.16-rc3 v6.16-rc2 v6.16-rc1 linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-do-not-select-metadata-BG-as-finish-target/20250627-172551
base:   next-20250626
patch link:    https://lore.kernel.org/r/20250627091914.100715-8-jth%40kernel.org
patch subject: [PATCH RFC 7/9] btrfs: lower auto-reclaim message log level
config: x86_64-buildonly-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280733.ut2JoUtS-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280733.ut2JoUtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280733.ut2JoUtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/block-group.c:1846:7: warning: variable 'zone_unusable' set but not used [-Wunused-but-set-variable]
    1846 |                 u64 zone_unusable;
         |                     ^
   1 warning generated.


vim +/zone_unusable +1846 fs/btrfs/block-group.c

81531225e5bd50c Boris Burkov       2022-10-13  1803  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1804  void btrfs_reclaim_bgs_work(struct work_struct *work)
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1805  {
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1806  	struct btrfs_fs_info *fs_info =
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1807  		container_of(work, struct btrfs_fs_info, reclaim_bgs_work);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1808  	struct btrfs_block_group *bg;
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1809  	struct btrfs_space_info *space_info;
4eb4e85c4f81849 Boris Burkov       2024-06-07  1810  	LIST_HEAD(retry_list);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1811  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1812  	if (!test_bit(BTRFS_FS_OPEN, &fs_info->flags))
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1813  		return;
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1814  
2f12741f81af638 Josef Bacik        2022-07-15  1815  	if (btrfs_fs_closing(fs_info))
2f12741f81af638 Josef Bacik        2022-07-15  1816  		return;
2f12741f81af638 Josef Bacik        2022-07-15  1817  
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1818  	if (!btrfs_should_reclaim(fs_info))
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1819  		return;
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1820  
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  1821  	sb_start_write(fs_info->sb);
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  1822  
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  1823  	if (!btrfs_exclop_start(fs_info, BTRFS_EXCLOP_BALANCE)) {
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  1824  		sb_end_write(fs_info->sb);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1825  		return;
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  1826  	}
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1827  
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1828  	/*
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1829  	 * Long running balances can keep us blocked here for eternity, so
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1830  	 * simply skip reclaim if we're unable to get the mutex.
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1831  	 */
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1832  	if (!mutex_trylock(&fs_info->reclaim_bgs_lock)) {
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1833  		btrfs_exclop_finish(fs_info);
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  1834  		sb_end_write(fs_info->sb);
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1835  		return;
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1836  	}
9cc0b837e14ae91 Johannes Thumshirn 2021-07-06  1837  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1838  	spin_lock(&fs_info->unused_bgs_lock);
2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1839  	/*
2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1840  	 * Sort happens under lock because we can't simply splice it and sort.
2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1841  	 * The block groups might still be in use and reachable via bg_list,
2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1842  	 * and their presence in the reclaim_bgs list must be preserved.
2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1843  	 */
2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1844  	list_sort(NULL, &fs_info->reclaim_bgs, reclaim_bgs_cmp);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1845  	while (!list_empty(&fs_info->reclaim_bgs)) {
5f93e776c6734ce Johannes Thumshirn 2021-06-29 @1846  		u64 zone_unusable;
ba5d06440cae63e Filipe Manana      2025-02-24  1847  		u64 used;
620768704326c9a Filipe Manana      2025-02-24  1848  		u64 reserved;
1cea5cf0e664290 Filipe Manana      2021-06-21  1849  		int ret = 0;
1cea5cf0e664290 Filipe Manana      2021-06-21  1850  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1851  		bg = list_first_entry(&fs_info->reclaim_bgs,
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1852  				      struct btrfs_block_group,
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1853  				      bg_list);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1854  		list_del_init(&bg->bg_list);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1855  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1856  		space_info = bg->space_info;
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1857  		spin_unlock(&fs_info->unused_bgs_lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1858  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1859  		/* Don't race with allocators so take the groups_sem */
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1860  		down_write(&space_info->groups_sem);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1861  
f5ff64ccf7bb727 Boris Burkov       2024-02-02  1862  		spin_lock(&space_info->lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1863  		spin_lock(&bg->lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1864  		if (bg->reserved || bg->pinned || bg->ro) {
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1865  			/*
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1866  			 * We want to bail if we made new allocations or have
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1867  			 * outstanding allocations in this block group.  We do
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1868  			 * the ro check in case balance is currently acting on
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1869  			 * this block group.
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1870  			 */
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1871  			spin_unlock(&bg->lock);
f5ff64ccf7bb727 Boris Burkov       2024-02-02  1872  			spin_unlock(&space_info->lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1873  			up_write(&space_info->groups_sem);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1874  			goto next;
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1875  		}
cc4804bfd6392bc Boris Burkov       2022-10-13  1876  		if (bg->used == 0) {
cc4804bfd6392bc Boris Burkov       2022-10-13  1877  			/*
cc4804bfd6392bc Boris Burkov       2022-10-13  1878  			 * It is possible that we trigger relocation on a block
cc4804bfd6392bc Boris Burkov       2022-10-13  1879  			 * group as its extents are deleted and it first goes
cc4804bfd6392bc Boris Burkov       2022-10-13  1880  			 * below the threshold, then shortly after goes empty.
cc4804bfd6392bc Boris Burkov       2022-10-13  1881  			 *
cc4804bfd6392bc Boris Burkov       2022-10-13  1882  			 * In this case, relocating it does delete it, but has
cc4804bfd6392bc Boris Burkov       2022-10-13  1883  			 * some overhead in relocation specific metadata, looking
cc4804bfd6392bc Boris Burkov       2022-10-13  1884  			 * for the non-existent extents and running some extra
cc4804bfd6392bc Boris Burkov       2022-10-13  1885  			 * transactions, which we can avoid by using one of the
cc4804bfd6392bc Boris Burkov       2022-10-13  1886  			 * other mechanisms for dealing with empty block groups.
cc4804bfd6392bc Boris Burkov       2022-10-13  1887  			 */
cc4804bfd6392bc Boris Burkov       2022-10-13  1888  			if (!btrfs_test_opt(fs_info, DISCARD_ASYNC))
cc4804bfd6392bc Boris Burkov       2022-10-13  1889  				btrfs_mark_bg_unused(bg);
cc4804bfd6392bc Boris Burkov       2022-10-13  1890  			spin_unlock(&bg->lock);
f5ff64ccf7bb727 Boris Burkov       2024-02-02  1891  			spin_unlock(&space_info->lock);
cc4804bfd6392bc Boris Burkov       2022-10-13  1892  			up_write(&space_info->groups_sem);
cc4804bfd6392bc Boris Burkov       2022-10-13  1893  			goto next;
81531225e5bd50c Boris Burkov       2022-10-13  1894  
81531225e5bd50c Boris Burkov       2022-10-13  1895  		}
81531225e5bd50c Boris Burkov       2022-10-13  1896  		/*
81531225e5bd50c Boris Burkov       2022-10-13  1897  		 * The block group might no longer meet the reclaim condition by
81531225e5bd50c Boris Burkov       2022-10-13  1898  		 * the time we get around to reclaiming it, so to avoid
81531225e5bd50c Boris Burkov       2022-10-13  1899  		 * reclaiming overly full block_groups, skip reclaiming them.
81531225e5bd50c Boris Burkov       2022-10-13  1900  		 *
81531225e5bd50c Boris Burkov       2022-10-13  1901  		 * Since the decision making process also depends on the amount
81531225e5bd50c Boris Burkov       2022-10-13  1902  		 * being freed, pass in a fake giant value to skip that extra
81531225e5bd50c Boris Burkov       2022-10-13  1903  		 * check, which is more meaningful when adding to the list in
81531225e5bd50c Boris Burkov       2022-10-13  1904  		 * the first place.
81531225e5bd50c Boris Burkov       2022-10-13  1905  		 */
81531225e5bd50c Boris Burkov       2022-10-13  1906  		if (!should_reclaim_block_group(bg, bg->length)) {
81531225e5bd50c Boris Burkov       2022-10-13  1907  			spin_unlock(&bg->lock);
f5ff64ccf7bb727 Boris Burkov       2024-02-02  1908  			spin_unlock(&space_info->lock);
81531225e5bd50c Boris Burkov       2022-10-13  1909  			up_write(&space_info->groups_sem);
81531225e5bd50c Boris Burkov       2022-10-13  1910  			goto next;
cc4804bfd6392bc Boris Burkov       2022-10-13  1911  		}
1283b8c125a83bf Filipe Manana      2025-02-21  1912  
1283b8c125a83bf Filipe Manana      2025-02-21  1913  		/*
1283b8c125a83bf Filipe Manana      2025-02-21  1914  		 * Cache the zone_unusable value before turning the block group
1283b8c125a83bf Filipe Manana      2025-02-21  1915  		 * to read only. As soon as the block group is read only it's
1283b8c125a83bf Filipe Manana      2025-02-21  1916  		 * zone_unusable value gets moved to the block group's read-only
1283b8c125a83bf Filipe Manana      2025-02-21  1917  		 * bytes and isn't available for calculations anymore. We also
1283b8c125a83bf Filipe Manana      2025-02-21  1918  		 * cache it before unlocking the block group, to prevent races
1283b8c125a83bf Filipe Manana      2025-02-21  1919  		 * (reports from KCSAN and such tools) with tasks updating it.
1283b8c125a83bf Filipe Manana      2025-02-21  1920  		 */
1283b8c125a83bf Filipe Manana      2025-02-21  1921  		zone_unusable = bg->zone_unusable;
1283b8c125a83bf Filipe Manana      2025-02-21  1922  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1923  		spin_unlock(&bg->lock);
f5ff64ccf7bb727 Boris Burkov       2024-02-02  1924  		spin_unlock(&space_info->lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1925  
93463ff7b54626f Naohiro Aota       2023-06-06  1926  		/*
93463ff7b54626f Naohiro Aota       2023-06-06  1927  		 * Get out fast, in case we're read-only or unmounting the
93463ff7b54626f Naohiro Aota       2023-06-06  1928  		 * filesystem. It is OK to drop block groups from the list even
93463ff7b54626f Naohiro Aota       2023-06-06  1929  		 * for the read-only case. As we did sb_start_write(),
93463ff7b54626f Naohiro Aota       2023-06-06  1930  		 * "mount -o remount,ro" won't happen and read-only filesystem
93463ff7b54626f Naohiro Aota       2023-06-06  1931  		 * means it is forced read-only due to a fatal error. So, it
93463ff7b54626f Naohiro Aota       2023-06-06  1932  		 * never gets back to read-write to let us reclaim again.
93463ff7b54626f Naohiro Aota       2023-06-06  1933  		 */
93463ff7b54626f Naohiro Aota       2023-06-06  1934  		if (btrfs_need_cleaner_sleep(fs_info)) {
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1935  			up_write(&space_info->groups_sem);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1936  			goto next;
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1937  		}
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1938  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1939  		ret = inc_block_group_ro(bg, 0);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1940  		up_write(&space_info->groups_sem);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1941  		if (ret < 0)
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1942  			goto next;
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1943  
ba5d06440cae63e Filipe Manana      2025-02-24  1944  		/*
620768704326c9a Filipe Manana      2025-02-24  1945  		 * The amount of bytes reclaimed corresponds to the sum of the
620768704326c9a Filipe Manana      2025-02-24  1946  		 * "used" and "reserved" counters. We have set the block group
620768704326c9a Filipe Manana      2025-02-24  1947  		 * to RO above, which prevents reservations from happening but
620768704326c9a Filipe Manana      2025-02-24  1948  		 * we may have existing reservations for which allocation has
620768704326c9a Filipe Manana      2025-02-24  1949  		 * not yet been done - btrfs_update_block_group() was not yet
620768704326c9a Filipe Manana      2025-02-24  1950  		 * called, which is where we will transfer a reserved extent's
620768704326c9a Filipe Manana      2025-02-24  1951  		 * size from the "reserved" counter to the "used" counter - this
620768704326c9a Filipe Manana      2025-02-24  1952  		 * happens when running delayed references. When we relocate the
620768704326c9a Filipe Manana      2025-02-24  1953  		 * chunk below, relocation first flushes dellaloc, waits for
620768704326c9a Filipe Manana      2025-02-24  1954  		 * ordered extent completion (which is where we create delayed
620768704326c9a Filipe Manana      2025-02-24  1955  		 * references for data extents) and commits the current
620768704326c9a Filipe Manana      2025-02-24  1956  		 * transaction (which runs delayed references), and only after
620768704326c9a Filipe Manana      2025-02-24  1957  		 * it does the actual work to move extents out of the block
620768704326c9a Filipe Manana      2025-02-24  1958  		 * group. So the reported amount of reclaimed bytes is
620768704326c9a Filipe Manana      2025-02-24  1959  		 * effectively the sum of the 'used' and 'reserved' counters.
ba5d06440cae63e Filipe Manana      2025-02-24  1960  		 */
ba5d06440cae63e Filipe Manana      2025-02-24  1961  		spin_lock(&bg->lock);
ba5d06440cae63e Filipe Manana      2025-02-24  1962  		used = bg->used;
620768704326c9a Filipe Manana      2025-02-24  1963  		reserved = bg->reserved;
ba5d06440cae63e Filipe Manana      2025-02-24  1964  		spin_unlock(&bg->lock);
ba5d06440cae63e Filipe Manana      2025-02-24  1965  
3ba0572b72b1363 Johannes Thumshirn 2025-06-27  1966  		btrfs_debug(fs_info,
620768704326c9a Filipe Manana      2025-02-24  1967  	"reclaiming chunk %llu with %llu%% used %llu%% reserved %llu%% unusable",
95cd356ca23c380 Johannes Thumshirn 2023-02-21  1968  				bg->start,
ba5d06440cae63e Filipe Manana      2025-02-24  1969  				div64_u64(used * 100, bg->length),
620768704326c9a Filipe Manana      2025-02-24  1970  				div64_u64(reserved * 100, bg->length),
5f93e776c6734ce Johannes Thumshirn 2021-06-29  1971  				div64_u64(zone_unusable * 100, bg->length));
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1972  		trace_btrfs_reclaim_block_group(bg);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1973  		ret = btrfs_relocate_chunk(fs_info, bg->start);
74944c873602a3e Josef Bacik        2022-07-25  1974  		if (ret) {
74944c873602a3e Josef Bacik        2022-07-25  1975  			btrfs_dec_block_group_ro(bg);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1976  			btrfs_err(fs_info, "error relocating chunk %llu",
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1977  				  bg->start);
ba5d06440cae63e Filipe Manana      2025-02-24  1978  			used = 0;
620768704326c9a Filipe Manana      2025-02-24  1979  			reserved = 0;
243192b6764990e Boris Burkov       2024-01-25  1980  			spin_lock(&space_info->lock);
243192b6764990e Boris Burkov       2024-01-25  1981  			space_info->reclaim_errors++;
813d4c642251649 Boris Burkov       2024-02-14  1982  			if (READ_ONCE(space_info->periodic_reclaim))
813d4c642251649 Boris Burkov       2024-02-14  1983  				space_info->periodic_reclaim_ready = false;
243192b6764990e Boris Burkov       2024-01-25  1984  			spin_unlock(&space_info->lock);
74944c873602a3e Josef Bacik        2022-07-25  1985  		}
243192b6764990e Boris Burkov       2024-01-25  1986  		spin_lock(&space_info->lock);
243192b6764990e Boris Burkov       2024-01-25  1987  		space_info->reclaim_count++;
ba5d06440cae63e Filipe Manana      2025-02-24  1988  		space_info->reclaim_bytes += used;
620768704326c9a Filipe Manana      2025-02-24  1989  		space_info->reclaim_bytes += reserved;
243192b6764990e Boris Burkov       2024-01-25  1990  		spin_unlock(&space_info->lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1991  
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  1992  next:
0497dfba98c00ed Boris Burkov       2025-03-05  1993  		if (ret && !READ_ONCE(space_info->periodic_reclaim))
0497dfba98c00ed Boris Burkov       2025-03-05  1994  			btrfs_link_bg_list(bg, &retry_list);
1cea5cf0e664290 Filipe Manana      2021-06-21  1995  		btrfs_put_block_group(bg);
3ed01616bad6c7e Naohiro Aota       2023-06-06  1996  
3ed01616bad6c7e Naohiro Aota       2023-06-06  1997  		mutex_unlock(&fs_info->reclaim_bgs_lock);
3ed01616bad6c7e Naohiro Aota       2023-06-06  1998  		/*
3ed01616bad6c7e Naohiro Aota       2023-06-06  1999  		 * Reclaiming all the block groups in the list can take really
3ed01616bad6c7e Naohiro Aota       2023-06-06  2000  		 * long.  Prioritize cleaning up unused block groups.
3ed01616bad6c7e Naohiro Aota       2023-06-06  2001  		 */
3ed01616bad6c7e Naohiro Aota       2023-06-06  2002  		btrfs_delete_unused_bgs(fs_info);
3ed01616bad6c7e Naohiro Aota       2023-06-06  2003  		/*
3ed01616bad6c7e Naohiro Aota       2023-06-06  2004  		 * If we are interrupted by a balance, we can just bail out. The
3ed01616bad6c7e Naohiro Aota       2023-06-06  2005  		 * cleaner thread restart again if necessary.
3ed01616bad6c7e Naohiro Aota       2023-06-06  2006  		 */
3ed01616bad6c7e Naohiro Aota       2023-06-06  2007  		if (!mutex_trylock(&fs_info->reclaim_bgs_lock))
3ed01616bad6c7e Naohiro Aota       2023-06-06  2008  			goto end;
d96b34248c2f4ea Filipe Manana      2021-11-22  2009  		spin_lock(&fs_info->unused_bgs_lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  2010  	}
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  2011  	spin_unlock(&fs_info->unused_bgs_lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  2012  	mutex_unlock(&fs_info->reclaim_bgs_lock);
3ed01616bad6c7e Naohiro Aota       2023-06-06  2013  end:
4eb4e85c4f81849 Boris Burkov       2024-06-07  2014  	spin_lock(&fs_info->unused_bgs_lock);
4eb4e85c4f81849 Boris Burkov       2024-06-07  2015  	list_splice_tail(&retry_list, &fs_info->reclaim_bgs);
4eb4e85c4f81849 Boris Burkov       2024-06-07  2016  	spin_unlock(&fs_info->unused_bgs_lock);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  2017  	btrfs_exclop_finish(fs_info);
ca5e4ea0beaec8b Naohiro Aota       2022-02-18  2018  	sb_end_write(fs_info->sb);
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  2019  }
18bb8bbf13c1839 Johannes Thumshirn 2021-04-19  2020  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
