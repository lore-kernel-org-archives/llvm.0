Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A54EBE;
	Tue, 25 Oct 2022 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666695732; x=1698231732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B8rWwYma1/qh89TjIoRYQ4SxLHM6+OdzeFw8tAPSGeI=;
  b=S5n8j1ZImsLVbytWMMbNbpJKxIcpn31t3Pxm5qKXLbDg2LwsvOKyAKaz
   cJrxiu7ObysgV84W1uxRZ+iZktTu+ev15luD4D1B6+cOcFBIpFuKIVlLM
   NkfBskm5CcqbNv3MaimoQUr2Im4ipC+Efq/M752vS6EyyMpo8J9JW/xep
   wZfqcmJarfiDwEqyjRQz/NCdlgtvr0N1rnF2tUM10jgcmu+FExhISgWQi
   kgpJ5DqO5GjbmNDDxwcEWkrgTdChBEOz5zs6dCHVfArPAKkrqRsjtEG2H
   MFLoEiyiXh28tT0/8vg3SvdK5OBZKFzc+G3Sur1nxOIu8fn9qUTrwdkmF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306375646"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="gz'50?scan'50,208,50";a="306375646"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 04:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="664870415"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="gz'50?scan'50,208,50";a="664870415"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Oct 2022 04:02:09 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onHhA-0006CK-1D;
	Tue, 25 Oct 2022 11:02:08 +0000
Date: Tue, 25 Oct 2022 19:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gautam Menghani <gautammenghani201@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3067/3190] mm/khugepaged.c:1729:7: warning:
 variable 'index' is used uninitialized whenever 'if' condition is true
Message-ID: <202210251946.eT92YAhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="wysyqVdeORtFaeLI"
Content-Disposition: inline


--wysyqVdeORtFaeLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   89bf6e28373beef9577fa71f996a5f73a569617c
commit: eae5270d3322f7838ced159e7e59be606f5db8e9 [3067/3190] mm/khugepaged: add tracepoint to collapse_file()
config: s390-randconfig-r004-20221024 (attached as .config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=eae5270d3322f7838ced159e7e59be606f5db8e9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout eae5270d3322f7838ced159e7e59be606f5db8e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (!xas_nomem(&xas, GFP_KERNEL)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:2063:47: note: uninitialized use occurs here
           trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem,
                                                        ^~~~~
   mm/khugepaged.c:1729:3: note: remove the 'if' if its condition is always false
                   if (!xas_nomem(&xas, GFP_KERNEL)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1716:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (result != SCAN_SUCCEED)
               ^~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:2063:47: note: uninitialized use occurs here
           trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem,
                                                        ^~~~~
   mm/khugepaged.c:1716:2: note: remove the 'if' if its condition is always false
           if (result != SCAN_SUCCEED)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1705:15: note: initialize the variable 'index' to silence this warning
           pgoff_t index, end = start + HPAGE_PMD_NR;
                        ^
                         = 0
>> mm/khugepaged.c:1729:7: warning: variable 'nr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (!xas_nomem(&xas, GFP_KERNEL)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:2064:15: note: uninitialized use occurs here
                   addr, file, nr, result);
                               ^~
   mm/khugepaged.c:1729:3: note: remove the 'if' if its condition is always false
                   if (!xas_nomem(&xas, GFP_KERNEL)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1716:6: warning: variable 'nr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (result != SCAN_SUCCEED)
               ^~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:2064:15: note: uninitialized use occurs here
                   addr, file, nr, result);
                               ^~
   mm/khugepaged.c:1716:2: note: remove the 'if' if its condition is always false
           if (result != SCAN_SUCCEED)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1710:8: note: initialize the variable 'nr' to silence this warning
           int nr;
                 ^
                  = 0
   4 warnings generated.


vim +1729 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1674  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1675  /**
99cb0dbd47a15d Song Liu                2019-09-23  1676   * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1677   *
336e6b53d99ae3 Alex Shi                2020-12-14  1678   * @mm: process address space where collapse happens
34488399fa08fa Zach O'Keefe            2022-09-22  1679   * @addr: virtual collapse start address
336e6b53d99ae3 Alex Shi                2020-12-14  1680   * @file: file that collapse on
336e6b53d99ae3 Alex Shi                2020-12-14  1681   * @start: collapse start address
9710a78ab2aed0 Zach O'Keefe            2022-07-06  1682   * @cc: collapse context and scratchpad
336e6b53d99ae3 Alex Shi                2020-12-14  1683   *
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1684   * Basic scheme is simple, details are more complex:
87c460a0bded56 Hugh Dickins            2018-11-30  1685   *  - allocate and lock a new huge page;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1686   *  - scan page cache replacing old pages with the new one
99cb0dbd47a15d Song Liu                2019-09-23  1687   *    + swap/gup in pages if necessary;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1688   *    + fill in gaps;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1689   *    + keep old pages around in case rollback is required;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1690   *  - if replacing succeeds:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1691   *    + copy data over;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1692   *    + free old pages;
87c460a0bded56 Hugh Dickins            2018-11-30  1693   *    + unlock huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1694   *  - if replacing failed;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1695   *    + put all pages back and unfreeze them;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1696   *    + restore gaps in the page cache;
87c460a0bded56 Hugh Dickins            2018-11-30  1697   *    + unlock and free huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1698   */
34488399fa08fa Zach O'Keefe            2022-09-22  1699  static int collapse_file(struct mm_struct *mm, unsigned long addr,
579c571e2efdb8 Song Liu                2019-09-23  1700  			 struct file *file, pgoff_t start,
34488399fa08fa Zach O'Keefe            2022-09-22  1701  			 struct collapse_control *cc)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1702  {
579c571e2efdb8 Song Liu                2019-09-23  1703  	struct address_space *mapping = file->f_mapping;
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1704  	struct page *hpage;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1705  	pgoff_t index, end = start + HPAGE_PMD_NR;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1706  	LIST_HEAD(pagelist);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1707  	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1708  	int nr_none = 0, result = SCAN_SUCCEED;
99cb0dbd47a15d Song Liu                2019-09-23  1709  	bool is_shmem = shmem_file(file);
bf9ecead53c89d Muchun Song             2021-02-24  1710  	int nr;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1711  
99cb0dbd47a15d Song Liu                2019-09-23  1712  	VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1713  	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1714  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1715  	result = alloc_charge_hpage(&hpage, mm, cc);
9710a78ab2aed0 Zach O'Keefe            2022-07-06  1716  	if (result != SCAN_SUCCEED)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1717  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1718  
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1719) 	/*
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1720) 	 * Ensure we have slots for all the pages in the range.  This is
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1721) 	 * almost certainly a no-op because most of the pages must be present
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1722) 	 */
95feeabb77149f Hugh Dickins            2018-11-30  1723  	do {
95feeabb77149f Hugh Dickins            2018-11-30  1724  		xas_lock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1725  		xas_create_range(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1726  		if (!xas_error(&xas))
95feeabb77149f Hugh Dickins            2018-11-30  1727  			break;
95feeabb77149f Hugh Dickins            2018-11-30  1728  		xas_unlock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30 @1729  		if (!xas_nomem(&xas, GFP_KERNEL)) {
95feeabb77149f Hugh Dickins            2018-11-30  1730  			result = SCAN_FAIL;
95feeabb77149f Hugh Dickins            2018-11-30  1731  			goto out;
95feeabb77149f Hugh Dickins            2018-11-30  1732  		}
95feeabb77149f Hugh Dickins            2018-11-30  1733  	} while (1);
95feeabb77149f Hugh Dickins            2018-11-30  1734  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1735  	__SetPageLocked(hpage);
99cb0dbd47a15d Song Liu                2019-09-23  1736  	if (is_shmem)
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1737  		__SetPageSwapBacked(hpage);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1738  	hpage->index = start;
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1739  	hpage->mapping = mapping;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1740  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1741  	/*
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1742  	 * At this point the hpage is locked and not up-to-date.
87c460a0bded56 Hugh Dickins            2018-11-30  1743  	 * It's safe to insert it into the page cache, because nobody would
87c460a0bded56 Hugh Dickins            2018-11-30  1744  	 * be able to map it or use it in another way until we unlock it.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1745  	 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1746  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1747  	xas_set(&xas, start);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1748  	for (index = start; index < end; index++) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1749  		struct page *page = xas_next(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1750  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1751  		VM_BUG_ON(index != xas.xa_index);
99cb0dbd47a15d Song Liu                2019-09-23  1752  		if (is_shmem) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1753  			if (!page) {
701270fa193aad Hugh Dickins            2018-11-30  1754  				/*
99cb0dbd47a15d Song Liu                2019-09-23  1755  				 * Stop if extent has been truncated or
99cb0dbd47a15d Song Liu                2019-09-23  1756  				 * hole-punched, and is now completely
99cb0dbd47a15d Song Liu                2019-09-23  1757  				 * empty.
701270fa193aad Hugh Dickins            2018-11-30  1758  				 */
701270fa193aad Hugh Dickins            2018-11-30  1759  				if (index == start) {
701270fa193aad Hugh Dickins            2018-11-30  1760  					if (!xas_next_entry(&xas, end - 1)) {
701270fa193aad Hugh Dickins            2018-11-30  1761  						result = SCAN_TRUNCATED;
042a30824871fa Hugh Dickins            2018-11-30  1762  						goto xa_locked;
701270fa193aad Hugh Dickins            2018-11-30  1763  					}
701270fa193aad Hugh Dickins            2018-11-30  1764  					xas_set(&xas, index);
701270fa193aad Hugh Dickins            2018-11-30  1765  				}
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1766  				if (!shmem_charge(mapping->host, 1)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1767  					result = SCAN_FAIL;
042a30824871fa Hugh Dickins            2018-11-30  1768  					goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1769  				}
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1770  				xas_store(&xas, hpage);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1771  				nr_none++;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1772  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1773  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1774  
3159f943aafdba Matthew Wilcox          2017-11-03  1775  			if (xa_is_value(page) || !PageUptodate(page)) {
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1776) 				struct folio *folio;
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1777) 
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1778  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1779  				/* swap in or instantiate fallocated page */
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1780) 				if (shmem_get_folio(mapping->host, index,
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1781) 						&folio, SGP_NOALLOC)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1782  					result = SCAN_FAIL;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1783  					goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1784  				}
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1785) 				page = folio_file_page(folio, index);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1786  			} else if (trylock_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1787  				get_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1788  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1789  			} else {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1790  				result = SCAN_PAGE_LOCK;
042a30824871fa Hugh Dickins            2018-11-30  1791  				goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1792  			}
99cb0dbd47a15d Song Liu                2019-09-23  1793  		} else {	/* !is_shmem */
99cb0dbd47a15d Song Liu                2019-09-23  1794  			if (!page || xa_is_value(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  1795  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  1796  				page_cache_sync_readahead(mapping, &file->f_ra,
99cb0dbd47a15d Song Liu                2019-09-23  1797  							  file, index,
e5a59d308f52bb David Howells           2020-09-04  1798  							  end - index);
99cb0dbd47a15d Song Liu                2019-09-23  1799  				/* drain pagevecs to help isolate_lru_page() */
99cb0dbd47a15d Song Liu                2019-09-23  1800  				lru_add_drain();
99cb0dbd47a15d Song Liu                2019-09-23  1801  				page = find_lock_page(mapping, index);
99cb0dbd47a15d Song Liu                2019-09-23  1802  				if (unlikely(page == NULL)) {
99cb0dbd47a15d Song Liu                2019-09-23  1803  					result = SCAN_FAIL;
99cb0dbd47a15d Song Liu                2019-09-23  1804  					goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  1805  				}
75f360696ce9d8 Song Liu                2019-11-30  1806  			} else if (PageDirty(page)) {
75f360696ce9d8 Song Liu                2019-11-30  1807  				/*
75f360696ce9d8 Song Liu                2019-11-30  1808  				 * khugepaged only works on read-only fd,
75f360696ce9d8 Song Liu                2019-11-30  1809  				 * so this page is dirty because it hasn't
75f360696ce9d8 Song Liu                2019-11-30  1810  				 * been flushed since first write. There
75f360696ce9d8 Song Liu                2019-11-30  1811  				 * won't be new dirty pages.
75f360696ce9d8 Song Liu                2019-11-30  1812  				 *
75f360696ce9d8 Song Liu                2019-11-30  1813  				 * Trigger async flush here and hope the
75f360696ce9d8 Song Liu                2019-11-30  1814  				 * writeback is done when khugepaged
75f360696ce9d8 Song Liu                2019-11-30  1815  				 * revisits this page.
75f360696ce9d8 Song Liu                2019-11-30  1816  				 *
75f360696ce9d8 Song Liu                2019-11-30  1817  				 * This is a one-off situation. We are not
75f360696ce9d8 Song Liu                2019-11-30  1818  				 * forcing writeback in loop.
75f360696ce9d8 Song Liu                2019-11-30  1819  				 */
75f360696ce9d8 Song Liu                2019-11-30  1820  				xas_unlock_irq(&xas);
75f360696ce9d8 Song Liu                2019-11-30  1821  				filemap_flush(mapping);
75f360696ce9d8 Song Liu                2019-11-30  1822  				result = SCAN_FAIL;
75f360696ce9d8 Song Liu                2019-11-30  1823  				goto xa_unlocked;
74c42e1baacf20 Rongwei Wang            2021-10-28  1824  			} else if (PageWriteback(page)) {
74c42e1baacf20 Rongwei Wang            2021-10-28  1825  				xas_unlock_irq(&xas);
74c42e1baacf20 Rongwei Wang            2021-10-28  1826  				result = SCAN_FAIL;
74c42e1baacf20 Rongwei Wang            2021-10-28  1827  				goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  1828  			} else if (trylock_page(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  1829  				get_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  1830  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  1831  			} else {
99cb0dbd47a15d Song Liu                2019-09-23  1832  				result = SCAN_PAGE_LOCK;
99cb0dbd47a15d Song Liu                2019-09-23  1833  				goto xa_locked;
99cb0dbd47a15d Song Liu                2019-09-23  1834  			}
99cb0dbd47a15d Song Liu                2019-09-23  1835  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1836  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1837  		/*
b93b016313b3ba Matthew Wilcox          2018-04-10  1838  		 * The page must be locked, so we can drop the i_pages lock
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1839  		 * without racing with truncate.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1840  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1841  		VM_BUG_ON_PAGE(!PageLocked(page), page);
4655e5e5f38726 Song Liu                2019-11-15  1842  
4655e5e5f38726 Song Liu                2019-11-15  1843  		/* make sure the page is up to date */
4655e5e5f38726 Song Liu                2019-11-15  1844  		if (unlikely(!PageUptodate(page))) {
4655e5e5f38726 Song Liu                2019-11-15  1845  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  1846  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  1847  		}
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1848  
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1849  		/*
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1850  		 * If file was truncated then extended, or hole-punched, before
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1851  		 * we locked the first page, then a THP might be there already.
58ac9a8993a13e Zach O'Keefe            2022-09-22  1852  		 * This will be discovered on the first iteration.
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1853  		 */
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1854  		if (PageTransCompound(page)) {
58ac9a8993a13e Zach O'Keefe            2022-09-22  1855  			struct page *head = compound_head(page);
58ac9a8993a13e Zach O'Keefe            2022-09-22  1856  
58ac9a8993a13e Zach O'Keefe            2022-09-22  1857  			result = compound_order(head) == HPAGE_PMD_ORDER &&
58ac9a8993a13e Zach O'Keefe            2022-09-22  1858  					head->index == start
58ac9a8993a13e Zach O'Keefe            2022-09-22  1859  					/* Maybe PMD-mapped */
58ac9a8993a13e Zach O'Keefe            2022-09-22  1860  					? SCAN_PTE_MAPPED_HUGEPAGE
58ac9a8993a13e Zach O'Keefe            2022-09-22  1861  					: SCAN_PAGE_COMPOUND;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1862  			goto out_unlock;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  1863  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1864  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1865  		if (page_mapping(page) != mapping) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1866  			result = SCAN_TRUNCATED;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1867  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1868  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1869  
74c42e1baacf20 Rongwei Wang            2021-10-28  1870  		if (!is_shmem && (PageDirty(page) ||
74c42e1baacf20 Rongwei Wang            2021-10-28  1871  				  PageWriteback(page))) {
4655e5e5f38726 Song Liu                2019-11-15  1872  			/*
4655e5e5f38726 Song Liu                2019-11-15  1873  			 * khugepaged only works on read-only fd, so this
4655e5e5f38726 Song Liu                2019-11-15  1874  			 * page is dirty because it hasn't been flushed
4655e5e5f38726 Song Liu                2019-11-15  1875  			 * since first write.
4655e5e5f38726 Song Liu                2019-11-15  1876  			 */
4655e5e5f38726 Song Liu                2019-11-15  1877  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  1878  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  1879  		}
4655e5e5f38726 Song Liu                2019-11-15  1880  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1881  		if (isolate_lru_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1882  			result = SCAN_DEL_PAGE_LRU;
042a30824871fa Hugh Dickins            2018-11-30  1883  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1884  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1885  
99cb0dbd47a15d Song Liu                2019-09-23  1886  		if (page_has_private(page) &&
99cb0dbd47a15d Song Liu                2019-09-23  1887  		    !try_to_release_page(page, GFP_KERNEL)) {
99cb0dbd47a15d Song Liu                2019-09-23  1888  			result = SCAN_PAGE_HAS_PRIVATE;
2f33a706027c94 Hugh Dickins            2020-05-27  1889  			putback_lru_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  1890  			goto out_unlock;
99cb0dbd47a15d Song Liu                2019-09-23  1891  		}
99cb0dbd47a15d Song Liu                2019-09-23  1892  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1893  		if (page_mapped(page))
869f7ee6f64773 Matthew Wilcox (Oracle  2022-02-15  1894) 			try_to_unmap(page_folio(page),
869f7ee6f64773 Matthew Wilcox (Oracle  2022-02-15  1895) 					TTU_IGNORE_MLOCK | TTU_BATCH_FLUSH);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1896  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1897  		xas_lock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1898  		xas_set(&xas, index);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1899  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1900  		VM_BUG_ON_PAGE(page != xas_load(&xas), page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1901  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1902  		/*
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1903  		 * The page is expected to have page_count() == 3:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1904  		 *  - we hold a pin on it;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1905  		 *  - one reference from page cache;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1906  		 *  - one from isolate_lru_page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1907  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1908  		if (!page_ref_freeze(page, 3)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1909  			result = SCAN_PAGE_COUNT;
042a30824871fa Hugh Dickins            2018-11-30  1910  			xas_unlock_irq(&xas);
042a30824871fa Hugh Dickins            2018-11-30  1911  			putback_lru_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1912  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1913  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1914  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1915  		/*
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1916  		 * Add the page to the list to be able to undo the collapse if
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1917  		 * something go wrong.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1918  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1919  		list_add_tail(&page->lru, &pagelist);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1920  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1921  		/* Finally, replace with the new page. */
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1922  		xas_store(&xas, hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1923  		continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1924  out_unlock:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1925  		unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1926  		put_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1927  		goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1928  	}
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1929  	nr = thp_nr_pages(hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1930  
99cb0dbd47a15d Song Liu                2019-09-23  1931  	if (is_shmem)
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1932  		__mod_lruvec_page_state(hpage, NR_SHMEM_THPS, nr);
09d91cda0e8207 Song Liu                2019-09-23  1933  	else {
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1934  		__mod_lruvec_page_state(hpage, NR_FILE_THPS, nr);
09d91cda0e8207 Song Liu                2019-09-23  1935  		filemap_nr_thps_inc(mapping);
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1936  		/*
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1937  		 * Paired with smp_mb() in do_dentry_open() to ensure
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1938  		 * i_writecount is up to date and the update to nr_thps is
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1939  		 * visible. Ensures the page cache will be truncated if the
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1940  		 * file is opened writable.
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1941  		 */
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1942  		smp_mb();
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1943  		if (inode_is_open_for_write(mapping->host)) {
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1944  			result = SCAN_FAIL;
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1945  			__mod_lruvec_page_state(hpage, NR_FILE_THPS, -nr);
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1946  			filemap_nr_thps_dec(mapping);
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1947  			goto xa_locked;
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  1948  		}
09d91cda0e8207 Song Liu                2019-09-23  1949  	}
99cb0dbd47a15d Song Liu                2019-09-23  1950  
042a30824871fa Hugh Dickins            2018-11-30  1951  	if (nr_none) {
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1952  		__mod_lruvec_page_state(hpage, NR_FILE_PAGES, nr_none);
2f55f070e5b80f Miaohe Lin              2022-06-25  1953  		/* nr_none is always 0 for non-shmem. */
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1954  		__mod_lruvec_page_state(hpage, NR_SHMEM, nr_none);
042a30824871fa Hugh Dickins            2018-11-30  1955  	}
042a30824871fa Hugh Dickins            2018-11-30  1956  
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1957) 	/* Join all the small entries into a single multi-index entry */
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1958) 	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1959  	xas_store(&xas, hpage);
042a30824871fa Hugh Dickins            2018-11-30  1960  xa_locked:
042a30824871fa Hugh Dickins            2018-11-30  1961  	xas_unlock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1962  xa_unlocked:
042a30824871fa Hugh Dickins            2018-11-30  1963  
6d9df8a5889c56 Hugh Dickins            2022-02-14  1964  	/*
6d9df8a5889c56 Hugh Dickins            2022-02-14  1965  	 * If collapse is successful, flush must be done now before copying.
6d9df8a5889c56 Hugh Dickins            2022-02-14  1966  	 * If collapse is unsuccessful, does flush actually need to be done?
6d9df8a5889c56 Hugh Dickins            2022-02-14  1967  	 * Do it anyway, to clear the state.
6d9df8a5889c56 Hugh Dickins            2022-02-14  1968  	 */
6d9df8a5889c56 Hugh Dickins            2022-02-14  1969  	try_to_unmap_flush();
6d9df8a5889c56 Hugh Dickins            2022-02-14  1970  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1971  	if (result == SCAN_SUCCEED) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1972  		struct page *page, *tmp;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1973  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1974  		/*
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1975  		 * Replacing old pages with new one has succeeded, now we
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1976  		 * need to copy the content and free the old pages.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1977  		 */
2af8ff291848cc Hugh Dickins            2018-11-30  1978  		index = start;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1979  		list_for_each_entry_safe(page, tmp, &pagelist, lru) {
2af8ff291848cc Hugh Dickins            2018-11-30  1980  			while (index < page->index) {
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1981  				clear_highpage(hpage + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  1982  				index++;
2af8ff291848cc Hugh Dickins            2018-11-30  1983  			}
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1984  			copy_highpage(hpage + (page->index % HPAGE_PMD_NR),
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1985  				      page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1986  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1987  			page->mapping = NULL;
042a30824871fa Hugh Dickins            2018-11-30  1988  			page_ref_unfreeze(page, 1);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1989  			ClearPageActive(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1990  			ClearPageUnevictable(page);
042a30824871fa Hugh Dickins            2018-11-30  1991  			unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1992  			put_page(page);
2af8ff291848cc Hugh Dickins            2018-11-30  1993  			index++;
2af8ff291848cc Hugh Dickins            2018-11-30  1994  		}
2af8ff291848cc Hugh Dickins            2018-11-30  1995  		while (index < end) {
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1996  			clear_highpage(hpage + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  1997  			index++;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1998  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1999  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2000  		SetPageUptodate(hpage);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2001  		page_ref_add(hpage, HPAGE_PMD_NR - 1);
6058eaec816f29 Johannes Weiner         2020-06-03  2002  		if (is_shmem)
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2003  			set_page_dirty(hpage);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2004  		lru_cache_add(hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2005  
042a30824871fa Hugh Dickins            2018-11-30  2006  		/*
042a30824871fa Hugh Dickins            2018-11-30  2007  		 * Remove pte page tables, so we can re-fault the page as huge.
042a30824871fa Hugh Dickins            2018-11-30  2008  		 */
34488399fa08fa Zach O'Keefe            2022-09-22  2009  		result = retract_page_tables(mapping, start, mm, addr, hpage,
34488399fa08fa Zach O'Keefe            2022-09-22  2010  					     cc);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2011  		unlock_page(hpage);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2012  		hpage = NULL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2013  	} else {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2014  		struct page *page;
aaa52e340073b7 Hugh Dickins            2018-11-30  2015  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2016  		/* Something went wrong: roll back page cache changes */
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2017  		xas_lock_irq(&xas);
2f55f070e5b80f Miaohe Lin              2022-06-25  2018  		if (nr_none) {
aaa52e340073b7 Hugh Dickins            2018-11-30  2019  			mapping->nrpages -= nr_none;
aaa52e340073b7 Hugh Dickins            2018-11-30  2020  			shmem_uncharge(mapping->host, nr_none);
2f55f070e5b80f Miaohe Lin              2022-06-25  2021  		}
aaa52e340073b7 Hugh Dickins            2018-11-30  2022  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2023  		xas_set(&xas, start);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2024  		xas_for_each(&xas, page, end - 1) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2025  			page = list_first_entry_or_null(&pagelist,
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2026  					struct page, lru);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2027  			if (!page || xas.xa_index < page->index) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2028  				if (!nr_none)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2029  					break;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2030  				nr_none--;
59749e6ce53735 Johannes Weiner         2016-12-12  2031  				/* Put holes back where they were */
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2032  				xas_store(&xas, NULL);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2033  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2034  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2035  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2036  			VM_BUG_ON_PAGE(page->index != xas.xa_index, page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2037  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2038  			/* Unfreeze the page. */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2039  			list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2040  			page_ref_unfreeze(page, 2);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2041  			xas_store(&xas, page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2042  			xas_pause(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2043  			xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2044  			unlock_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2045  			putback_lru_page(page);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2046  			xas_lock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2047  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2048  		VM_BUG_ON(nr_none);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2049  		xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2050  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2051  		hpage->mapping = NULL;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2052  	}
042a30824871fa Hugh Dickins            2018-11-30  2053  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2054  	if (hpage)
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2055  		unlock_page(hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2056  out:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2057  	VM_BUG_ON(!list_empty(&pagelist));
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2058  	if (hpage) {
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2059  		mem_cgroup_uncharge(page_folio(hpage));
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2060  		put_page(hpage);
c6a7f445a2727a Yang Shi                2022-07-06  2061  	}
eae5270d3322f7 Gautam Menghani         2022-10-24  2062  
eae5270d3322f7 Gautam Menghani         2022-10-24  2063  	trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem,
eae5270d3322f7 Gautam Menghani         2022-10-24  2064  		addr, file, nr, result);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2065  	return result;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2066  }
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2067  

:::::: The code at line 1729 was first introduced by commit
:::::: 95feeabb77149f7d48f05bde61d75621c57db67e mm/khugepaged: fix the xas_create_range() error path

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--wysyqVdeORtFaeLI
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--wysyqVdeORtFaeLI--
