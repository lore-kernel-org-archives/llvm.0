Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA01EDA2B;
	Mon,  2 Feb 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023628; cv=none; b=JdtCn/ctIvSHsHu9zWgOfd2jC47wsOERImpnzqg4wfy1rW1ND3GFc+ypnqr4k4KvZoOhNQicdyvrA6ziMh9/dshg8c6A4k/b1FoR6V15gLu1Tk6/+9jSS/DOzgGN6FcmhO7p8/LFnMfjoblZmOEjoubUd2vKaCz61gW2Ad78XuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023628; c=relaxed/simple;
	bh=fe8P6IR5mqp4JT/AFXlQG++gb0CWRlhOy2x6hQBB6ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IC2Z3fLzRoLMC9AimK1uB9thmeNDFEDwqmC+FpW3YYqOuy+TwvcY2phd6clwnH8XOytQCc+pfZCloNbs6MXeu0TlS8CySoG02OO4nVL+b6d8Wb2PEhJ3wGyvVPdsvs0Q7e32mYt8hkYiHTjZ3ahc+N3BTQngBrwclCDaWxfUYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUmHR01E; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUmHR01E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770023625; x=1801559625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fe8P6IR5mqp4JT/AFXlQG++gb0CWRlhOy2x6hQBB6ww=;
  b=jUmHR01E0eFURoiGYq/jgwUT2whAVwyu10eRgDtElmYrr+Xg0bRo6O9d
   o3FgxEZ9mDbPL1n/kFz/7LNzLrx+sD+uDb5/Dum+j/ejuX79oxt2+F/TE
   rz9zln1PWTCkyEmJa3CKPv0ujXau1++inx7Gzf+1doFKSMIaOLf9JBoq+
   PqIuEGHnxd365m8K0kII9kpR4sBvM9zO3T3kPrJAW6mW99Wvy6tEr/YCO
   cU98CJrQGkj5b458Rl50MdYjadoGcxWRgXoVl7F2R3hCocGNSZYtTJHK8
   B4jLx5eOa1U54lFmPAKwaVyp7ER5TJ5Xl3EYsfK4WG6IH0hGxohE+hm24
   w==;
X-CSE-ConnectionGUID: BdVzODaCS+quFE2BY0DG6A==
X-CSE-MsgGUID: 0tNTWDUzR5mlZqKcLWqHpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71262511"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="71262511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 01:13:35 -0800
X-CSE-ConnectionGUID: YMTm/w0CTg6QNo8prAQTxw==
X-CSE-MsgGUID: 68Aa+fIRTPeFPvLPcayIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="209540721"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Feb 2026 01:13:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmpzv-00000000fNM-3R5B;
	Mon, 02 Feb 2026 09:13:31 +0000
Date: Mon, 2 Feb 2026 17:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 05/12] mm: thp: add reclaim and migration support for PUD
 THP
Message-ID: <202602021716.8bd0cxap-lkp@intel.com>
References: <20260202005451.774496-6-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202005451.774496-6-usamaarif642@gmail.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-PUD-THP-ptdesc-and-rmap-support/20260202-085725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260202005451.774496-6-usamaarif642%40gmail.com
patch subject: [RFC 05/12] mm: thp: add reclaim and migration support for PUD THP
config: powerpc-randconfig-002-20260202 (https://download.01.org/0day-ci/archive/20260202/202602021716.8bd0cxap-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021716.8bd0cxap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021716.8bd0cxap-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate.c:1867:8: error: call to undeclared function 'folio_test_pud_mappable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1867 |                         if (folio_test_pud_mappable(folio)) {
         |                             ^
   mm/migrate.c:1867:8: note: did you mean 'folio_test_pmd_mappable'?
   include/linux/huge_mm.h:625:20: note: 'folio_test_pmd_mappable' declared here
     625 | static inline bool folio_test_pmd_mappable(struct folio *folio)
         |                    ^
   1 error generated.


vim +/folio_test_pud_mappable +1867 mm/migrate.c

  1773	
  1774	/*
  1775	 * migrate_pages_batch() first unmaps folios in the from list as many as
  1776	 * possible, then move the unmapped folios.
  1777	 *
  1778	 * We only batch migration if mode == MIGRATE_ASYNC to avoid to wait a
  1779	 * lock or bit when we have locked more than one folio.  Which may cause
  1780	 * deadlock (e.g., for loop device).  So, if mode != MIGRATE_ASYNC, the
  1781	 * length of the from list must be <= 1.
  1782	 */
  1783	static int migrate_pages_batch(struct list_head *from,
  1784			new_folio_t get_new_folio, free_folio_t put_new_folio,
  1785			unsigned long private, enum migrate_mode mode, int reason,
  1786			struct list_head *ret_folios, struct list_head *split_folios,
  1787			struct migrate_pages_stats *stats, int nr_pass)
  1788	{
  1789		int retry = 1;
  1790		int thp_retry = 1;
  1791		int nr_failed = 0;
  1792		int nr_retry_pages = 0;
  1793		int pass = 0;
  1794		bool is_thp = false;
  1795		bool is_large = false;
  1796		struct folio *folio, *folio2, *dst = NULL;
  1797		int rc, rc_saved = 0, nr_pages;
  1798		LIST_HEAD(unmap_folios);
  1799		LIST_HEAD(dst_folios);
  1800		bool nosplit = (reason == MR_NUMA_MISPLACED);
  1801	
  1802		VM_WARN_ON_ONCE(mode != MIGRATE_ASYNC &&
  1803				!list_empty(from) && !list_is_singular(from));
  1804	
  1805		for (pass = 0; pass < nr_pass && retry; pass++) {
  1806			retry = 0;
  1807			thp_retry = 0;
  1808			nr_retry_pages = 0;
  1809	
  1810			list_for_each_entry_safe(folio, folio2, from, lru) {
  1811				is_large = folio_test_large(folio);
  1812				is_thp = folio_test_pmd_mappable(folio);
  1813				nr_pages = folio_nr_pages(folio);
  1814	
  1815				cond_resched();
  1816	
  1817				/*
  1818				 * The rare folio on the deferred split list should
  1819				 * be split now. It should not count as a failure:
  1820				 * but increment nr_failed because, without doing so,
  1821				 * migrate_pages() may report success with (split but
  1822				 * unmigrated) pages still on its fromlist; whereas it
  1823				 * always reports success when its fromlist is empty.
  1824				 * stats->nr_thp_failed should be increased too,
  1825				 * otherwise stats inconsistency will happen when
  1826				 * migrate_pages_batch is called via migrate_pages()
  1827				 * with MIGRATE_SYNC and MIGRATE_ASYNC.
  1828				 *
  1829				 * Only check it without removing it from the list.
  1830				 * Since the folio can be on deferred_split_scan()
  1831				 * local list and removing it can cause the local list
  1832				 * corruption. Folio split process below can handle it
  1833				 * with the help of folio_ref_freeze().
  1834				 *
  1835				 * nr_pages > 2 is needed to avoid checking order-1
  1836				 * page cache folios. They exist, in contrast to
  1837				 * non-existent order-1 anonymous folios, and do not
  1838				 * use _deferred_list.
  1839				 */
  1840				if (nr_pages > 2 &&
  1841				   !list_empty(&folio->_deferred_list) &&
  1842				   folio_test_partially_mapped(folio)) {
  1843					if (!try_split_folio(folio, split_folios, mode)) {
  1844						nr_failed++;
  1845						stats->nr_thp_failed += is_thp;
  1846						stats->nr_thp_split += is_thp;
  1847						stats->nr_split++;
  1848						continue;
  1849					}
  1850				}
  1851	
  1852				/*
  1853				 * Large folio migration might be unsupported or
  1854				 * the allocation might be failed so we should retry
  1855				 * on the same folio with the large folio split
  1856				 * to normal folios.
  1857				 *
  1858				 * Split folios are put in split_folios, and
  1859				 * we will migrate them after the rest of the
  1860				 * list is processed.
  1861				 */
  1862				/*
  1863				 * PUD-sized folios cannot be migrated directly,
  1864				 * but can be split. Try to split them first and
  1865				 * migrate the resulting smaller folios.
  1866				 */
> 1867				if (folio_test_pud_mappable(folio)) {
  1868					nr_failed++;
  1869					stats->nr_thp_failed++;
  1870					if (!try_split_folio(folio, split_folios, mode)) {
  1871						stats->nr_thp_split++;
  1872						stats->nr_split++;
  1873						continue;
  1874					}
  1875					stats->nr_failed_pages += nr_pages;
  1876					list_move_tail(&folio->lru, ret_folios);
  1877					continue;
  1878				}
  1879				if (!thp_migration_supported() && is_thp) {
  1880					nr_failed++;
  1881					stats->nr_thp_failed++;
  1882					if (!try_split_folio(folio, split_folios, mode)) {
  1883						stats->nr_thp_split++;
  1884						stats->nr_split++;
  1885						continue;
  1886					}
  1887					stats->nr_failed_pages += nr_pages;
  1888					list_move_tail(&folio->lru, ret_folios);
  1889					continue;
  1890				}
  1891	
  1892				/*
  1893				 * If we are holding the last folio reference, the folio
  1894				 * was freed from under us, so just drop our reference.
  1895				 */
  1896				if (likely(!page_has_movable_ops(&folio->page)) &&
  1897				    folio_ref_count(folio) == 1) {
  1898					folio_clear_active(folio);
  1899					folio_clear_unevictable(folio);
  1900					list_del(&folio->lru);
  1901					migrate_folio_done(folio, reason);
  1902					stats->nr_succeeded += nr_pages;
  1903					stats->nr_thp_succeeded += is_thp;
  1904					continue;
  1905				}
  1906	
  1907				rc = migrate_folio_unmap(get_new_folio, put_new_folio,
  1908						private, folio, &dst, mode, ret_folios);
  1909				/*
  1910				 * The rules are:
  1911				 *	0: folio will be put on unmap_folios list,
  1912				 *	   dst folio put on dst_folios list
  1913				 *	-EAGAIN: stay on the from list
  1914				 *	-ENOMEM: stay on the from list
  1915				 *	Other errno: put on ret_folios list
  1916				 */
  1917				switch(rc) {
  1918				case -ENOMEM:
  1919					/*
  1920					 * When memory is low, don't bother to try to migrate
  1921					 * other folios, move unmapped folios, then exit.
  1922					 */
  1923					nr_failed++;
  1924					stats->nr_thp_failed += is_thp;
  1925					/* Large folio NUMA faulting doesn't split to retry. */
  1926					if (is_large && !nosplit) {
  1927						int ret = try_split_folio(folio, split_folios, mode);
  1928	
  1929						if (!ret) {
  1930							stats->nr_thp_split += is_thp;
  1931							stats->nr_split++;
  1932							break;
  1933						} else if (reason == MR_LONGTERM_PIN &&
  1934							   ret == -EAGAIN) {
  1935							/*
  1936							 * Try again to split large folio to
  1937							 * mitigate the failure of longterm pinning.
  1938							 */
  1939							retry++;
  1940							thp_retry += is_thp;
  1941							nr_retry_pages += nr_pages;
  1942							/* Undo duplicated failure counting. */
  1943							nr_failed--;
  1944							stats->nr_thp_failed -= is_thp;
  1945							break;
  1946						}
  1947					}
  1948	
  1949					stats->nr_failed_pages += nr_pages + nr_retry_pages;
  1950					/* nr_failed isn't updated for not used */
  1951					stats->nr_thp_failed += thp_retry;
  1952					rc_saved = rc;
  1953					if (list_empty(&unmap_folios))
  1954						goto out;
  1955					else
  1956						goto move;
  1957				case -EAGAIN:
  1958					retry++;
  1959					thp_retry += is_thp;
  1960					nr_retry_pages += nr_pages;
  1961					break;
  1962				case 0:
  1963					list_move_tail(&folio->lru, &unmap_folios);
  1964					list_add_tail(&dst->lru, &dst_folios);
  1965					break;
  1966				default:
  1967					/*
  1968					 * Permanent failure (-EBUSY, etc.):
  1969					 * unlike -EAGAIN case, the failed folio is
  1970					 * removed from migration folio list and not
  1971					 * retried in the next outer loop.
  1972					 */
  1973					nr_failed++;
  1974					stats->nr_thp_failed += is_thp;
  1975					stats->nr_failed_pages += nr_pages;
  1976					break;
  1977				}
  1978			}
  1979		}
  1980		nr_failed += retry;
  1981		stats->nr_thp_failed += thp_retry;
  1982		stats->nr_failed_pages += nr_retry_pages;
  1983	move:
  1984		/* Flush TLBs for all unmapped folios */
  1985		try_to_unmap_flush();
  1986	
  1987		retry = 1;
  1988		for (pass = 0; pass < nr_pass && retry; pass++) {
  1989			retry = 0;
  1990			thp_retry = 0;
  1991			nr_retry_pages = 0;
  1992	
  1993			/* Move the unmapped folios */
  1994			migrate_folios_move(&unmap_folios, &dst_folios,
  1995					put_new_folio, private, mode, reason,
  1996					ret_folios, stats, &retry, &thp_retry,
  1997					&nr_failed, &nr_retry_pages);
  1998		}
  1999		nr_failed += retry;
  2000		stats->nr_thp_failed += thp_retry;
  2001		stats->nr_failed_pages += nr_retry_pages;
  2002	
  2003		rc = rc_saved ? : nr_failed;
  2004	out:
  2005		/* Cleanup remaining folios */
  2006		migrate_folios_undo(&unmap_folios, &dst_folios,
  2007				put_new_folio, private, ret_folios);
  2008	
  2009		return rc;
  2010	}
  2011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
