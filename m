Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC31DE3B7;
	Sat, 11 Oct 2025 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760154011; cv=none; b=klgX5IU2yFqnl9u5tMpLosLk0VpG2E1jM2lVJOdcV3qzjc1OccFm/AdQ9/1GzsoZvCNvOVW/lFIFmh4iKRdfhDXRIloLsRTTc69qSB7VGcpmqARsg7off6oyTe+WJz0nl02Eaog7FwmswgTQXGfpRRFkTdFjusNMoodQShkCoE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760154011; c=relaxed/simple;
	bh=7mCzyjL+Xaiazdoh5gJUUZKnqWu7Ztzw+tgv/EgZT4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNpQJMgo/qiMqJRv6asJucgYxZBQ30O27pxpkjOS7I8/3R2ecCimdUlhGcUUmVC9WtuvS7HVKQxH5Z8/vBmmyPsi2OgxNSfV1r/9k+hn9OSY1z/M0hkhtxK7p8PzA50DzD+izIOHJovvDSkn7W/W4e8jR//bL8aiVr0m9Ol3ayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpXF/lrC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpXF/lrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760154010; x=1791690010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7mCzyjL+Xaiazdoh5gJUUZKnqWu7Ztzw+tgv/EgZT4s=;
  b=dpXF/lrCNrQe7LGkd1edD1kwDS234MbVZJjaKBVEcCAmM/E3v13GWiur
   BZDAPCpZ4jWhGN3uxKolLSMcF8gtQxqp3MfxYhQlA91DFTYQHcW4bLfUZ
   B4XEV928keaLI0JO+HGVr2oLH/dfFWMRDkFn4K9dSC1ZrtOhzW566JiJB
   vgodcWBPedhldIa63ll6wN9me1Gk1F/QhCFoxmu6JSy8p4YrM2AddnQi7
   MLf1aIuXUaCsX1XrlyVNKLY75P/SDC4QVwzshOBYoEt/ljrahbhIhvqHE
   j6ueCBcXoovxZ0jhTyjt/C3Jop7qO+nkdJlQ7b8h+6ptgGRvratshk9hj
   Q==;
X-CSE-ConnectionGUID: Zc8N7phzR/yNZVMMU0Xmvw==
X-CSE-MsgGUID: J103ePB8Rly7HRDquqEfZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73476867"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73476867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 20:40:09 -0700
X-CSE-ConnectionGUID: sJXRp9iSQAGb+vj89FYDEQ==
X-CSE-MsgGUID: iM3DC+vCT+ynEtLyC2YahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180236752"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 20:40:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7QSh-0003UV-1o;
	Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daeho Jeong <daehojeong@google.com>
Subject: Re: [PATCH] f2fs: revert summary entry count from 2048 to 512 in
 16kb block support
Message-ID: <202510111112.Z3YnKrkU-lkp@intel.com>
References: <20251007180819.3858285-1-daeho43@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007180819.3858285-1-daeho43@gmail.com>

Hi Daeho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daeho-Jeong/f2fs-revert-summary-entry-count-from-2048-to-512-in-16kb-block-support/20251010-093707
base:   v6.17
patch link:    https://lore.kernel.org/r/20251007180819.3858285-1-daeho43%40gmail.com
patch subject: [PATCH] f2fs: revert summary entry count from 2048 to 512 in 16kb block support
config: riscv-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111112.Z3YnKrkU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111112.Z3YnKrkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111112.Z3YnKrkU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/gc.c:1862:3: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    1862 |                 }
         |                 ^
   1 warning generated.


vim +1862 fs/f2fs/gc.c

  1718	
  1719	static int do_garbage_collect(struct f2fs_sb_info *sbi,
  1720					unsigned int start_segno,
  1721					struct gc_inode_list *gc_list, int gc_type,
  1722					bool force_migrate, bool one_time)
  1723	{
  1724		struct blk_plug plug;
  1725		unsigned int segno = start_segno;
  1726		unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
  1727		unsigned int sec_end_segno;
  1728		int seg_freed = 0, migrated = 0;
  1729		unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
  1730							SUM_TYPE_DATA : SUM_TYPE_NODE;
  1731		unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
  1732		int submitted = 0, sum_blk_cnt;
  1733	
  1734		if (__is_large_section(sbi)) {
  1735			sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
  1736	
  1737			/*
  1738			 * zone-capacity can be less than zone-size in zoned devices,
  1739			 * resulting in less than expected usable segments in the zone,
  1740			 * calculate the end segno in the zone which can be garbage
  1741			 * collected
  1742			 */
  1743			if (f2fs_sb_has_blkzoned(sbi))
  1744				sec_end_segno -= SEGS_PER_SEC(sbi) -
  1745						f2fs_usable_segs_in_sec(sbi);
  1746	
  1747			if (gc_type == BG_GC || one_time) {
  1748				unsigned int window_granularity =
  1749					sbi->migration_window_granularity;
  1750	
  1751				if (f2fs_sb_has_blkzoned(sbi) &&
  1752						!has_enough_free_blocks(sbi,
  1753						sbi->gc_thread->boost_zoned_gc_percent))
  1754					window_granularity *=
  1755						sbi->gc_thread->boost_gc_multiple;
  1756	
  1757				end_segno = start_segno + window_granularity;
  1758			}
  1759	
  1760			if (end_segno > sec_end_segno)
  1761				end_segno = sec_end_segno;
  1762		}
  1763	
  1764		sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
  1765	
  1766		segno = rounddown(segno, SUMS_PER_BLOCK);
  1767		sum_blk_cnt = (end_segno - segno + SUMS_PER_BLOCK - 1) / SUMS_PER_BLOCK;
  1768		/* readahead multi ssa blocks those have contiguous address */
  1769		if (__is_large_section(sbi))
  1770			f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
  1771						sum_blk_cnt, META_SSA, true);
  1772	
  1773		/* reference all summary page */
  1774		while (segno < end_segno) {
  1775			struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno);
  1776	
  1777			segno += SUMS_PER_BLOCK;
  1778			if (IS_ERR(sum_folio)) {
  1779				int err = PTR_ERR(sum_folio);
  1780	
  1781				end_segno = segno - SUMS_PER_BLOCK;
  1782				segno = rounddown(start_segno, SUMS_PER_BLOCK);
  1783				while (segno < end_segno) {
  1784					sum_folio = filemap_get_folio(META_MAPPING(sbi),
  1785							GET_SUM_BLOCK(sbi, segno));
  1786					folio_put_refs(sum_folio, 2);
  1787					segno += SUMS_PER_BLOCK;
  1788				}
  1789				return err;
  1790			}
  1791			folio_unlock(sum_folio);
  1792		}
  1793	
  1794		blk_start_plug(&plug);
  1795	
  1796		segno = start_segno;
  1797		while (segno < end_segno) {
  1798			unsigned int cur_segno;
  1799			/* find segment summary of victim */
  1800			struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
  1801						GET_SUM_BLOCK(sbi, segno));
  1802			unsigned int block_end_segno = rounddown(segno, SUMS_PER_BLOCK)
  1803							+ SUMS_PER_BLOCK;
  1804	
  1805			if (block_end_segno > end_segno)
  1806				block_end_segno = end_segno;
  1807	
  1808			if (!folio_test_uptodate(sum_folio) ||
  1809			    unlikely(f2fs_cp_error(sbi)))
  1810				goto next_block;
  1811	
  1812			for (cur_segno = segno; cur_segno < block_end_segno;
  1813					cur_segno++) {
  1814				struct f2fs_summary_block *sum;
  1815	
  1816				if (get_valid_blocks(sbi, cur_segno, false) == 0)
  1817					goto freed;
  1818				if (gc_type == BG_GC && __is_large_section(sbi) &&
  1819						migrated >= sbi->migration_granularity)
  1820					goto skip;
  1821	
  1822				sum = SUM_BLK_PAGE_ADDR(sum_folio, cur_segno);
  1823				if (type != GET_SUM_TYPE((&sum->footer))) {
  1824					f2fs_err(sbi, "Inconsistent segment (%u) type "
  1825							"[%d, %d] in SSA and SIT",
  1826							cur_segno, type,
  1827							GET_SUM_TYPE((&sum->footer)));
  1828					f2fs_stop_checkpoint(sbi, false,
  1829						STOP_CP_REASON_CORRUPTED_SUMMARY);
  1830					goto skip;
  1831				}
  1832	
  1833				/*
  1834				 * this is to avoid deadlock:
  1835				 * - lock_page(sum_page)     - f2fs_replace_block
  1836				 *  - check_valid_map()        - down_write(sentry_lock)
  1837				 *   - down_read(sentry_lock) - change_curseg()
  1838				 *                              - lock_page(sum_page)
  1839				 */
  1840				if (type == SUM_TYPE_NODE)
  1841					submitted += gc_node_segment(sbi, sum->entries,
  1842							cur_segno, gc_type);
  1843				else
  1844					submitted += gc_data_segment(sbi, sum->entries,
  1845							gc_list, cur_segno,
  1846							gc_type, force_migrate);
  1847	
  1848				stat_inc_gc_seg_count(sbi, data_type, gc_type);
  1849				sbi->gc_reclaimed_segs[sbi->gc_mode]++;
  1850				migrated++;
  1851	
  1852	freed:
  1853				if (gc_type == FG_GC &&
  1854					get_valid_blocks(sbi, cur_segno, false) == 0)
  1855					seg_freed++;
  1856	
  1857				if (__is_large_section(sbi))
  1858					sbi->next_victim_seg[gc_type] =
  1859						(cur_segno + 1 < sec_end_segno) ?
  1860							cur_segno + 1 : NULL_SEGNO;
  1861	skip:
> 1862			}
  1863	next_block:
  1864			folio_put_refs(sum_folio, 2);
  1865			segno = block_end_segno;
  1866		}
  1867	
  1868		if (submitted)
  1869			f2fs_submit_merged_write(sbi, data_type);
  1870	
  1871		blk_finish_plug(&plug);
  1872	
  1873		if (migrated)
  1874			stat_inc_gc_sec_count(sbi, data_type, gc_type);
  1875	
  1876		return seg_freed;
  1877	}
  1878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
