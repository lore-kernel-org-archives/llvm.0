Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B812D1F1;
	Sun, 30 Jun 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719749685; cv=none; b=QUlHs5fe+Vy1ixJo5GtsIH/nr19+Wt3UC73vBSHuRfmlhxO8HZ6qXOBpbUw/oMMejJrYfo1KHP+7Ho7K/bCqvEWq7Hi8jhHJL2bPPDtMAlyyLNulG0EkG9fVNUkLHXL7+OfXMUKqzBMrD1fZ66GZBeNLsM9ibIuoonPPOwEYBOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719749685; c=relaxed/simple;
	bh=6tEE0HovZr0YQZA8+/0jwkZ9VFUyUxZc007vqz5+Zr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d52VbWxGna4mdMUXzIskUoRe/skrL4uwxCsejqwTrkKOyneSulh8A2mA9JiIfa1uR1A/1onucVcXrAuDhZs6wBkCdoTWV8NvQ1CiXcOUShZ9UDddrC8aeWiQphzhlTdgVO/mQ6ouQwgy8DSCuFR5x5jtWQatKmmRb+qeo1jwm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZivJXM+0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZivJXM+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719749681; x=1751285681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6tEE0HovZr0YQZA8+/0jwkZ9VFUyUxZc007vqz5+Zr8=;
  b=ZivJXM+0WkVPVczi96987PdVrq8icWy0sX4f0eJhcTBC8CBxSjTBKW6/
   PczcAoROSqmbkcpY2OgQRJEmZG5Ut3XUiIc141Nt3fVOMLBp1nFfwEAA5
   W2Pf+MRyPGAVQ0QiwtzZLGFqxcix0IPb+ZZjdX8uG6vEkIBwIkMYDD03x
   5LtcPUSOStOlMRZW7VqOsQxsCE73kFEuwhZ9k0dRPvRSE6QacwFo1wxwp
   bmQ4TtHWQrJOOmD+cDMeF/f33YyNPqKveELk5zJQmHQVEZ5jyH2IXs/tl
   B/nTb3DTja9U4vV+05PqC0gqVH2ptah53/IzEQlcl6FB7WpwOU1AlA068
   g==;
X-CSE-ConnectionGUID: +L3tBufsTq2cvcC3SbENOw==
X-CSE-MsgGUID: rvGVVWF6SF+oRi1ou+K5og==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="16750285"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="16750285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 05:14:40 -0700
X-CSE-ConnectionGUID: OepLdzGDS+ahFPqxuTV+dA==
X-CSE-MsgGUID: SwvwpCu5RPWgl8V0714ygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="76418901"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jun 2024 05:14:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNtS1-000LVn-08;
	Sun, 30 Jun 2024 12:14:37 +0000
Date: Sun, 30 Jun 2024 20:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 1/2] mm: swap: introduce swapcache_prepare_nr and
 swapcache_clear_nr for large folios swap-in
Message-ID: <202406301917.UoglDhDV-lkp@intel.com>
References: <20240629111010.230484-2-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="kPIQ8/96DO+3LspG"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240629111010.230484-2-21cnbao@gmail.com>


--kPIQ8/96DO+3LspG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-swap-introduce-swapcache_prepare_nr-and-swapcache_clear_nr-for-large-folios-swap-in/20240630-180307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240629111010.230484-2-21cnbao%40gmail.com
patch subject: [PATCH RFC v4 1/2] mm: swap: introduce swapcache_prepare_nr and swapcache_clear_nr for large folios swap-in
config: s390-allnoconfig
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build):

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406301917.UoglDhDV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   mm/memory.c:4085:8: error: call to undeclared function 'swapcache_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4085 |                         if (swapcache_prepare(entry)) {
         |                             ^
   mm/memory.c:4085:8: note: did you mean 'swapcache_prepare_nr'?
   include/linux/swap.h:558:19: note: 'swapcache_prepare_nr' declared here
     558 | static inline int swapcache_prepare_nr(swp_entry_t swp, int nr)
         |                   ^
>> mm/memory.c:4391:3: error: call to undeclared function 'swapcache_clear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4391 |                 swapcache_clear(si, entry);
         |                 ^
   mm/memory.c:4391:3: note: did you mean 'swapcache_clear_nr'?
   mm/swap.h:123:20: note: 'swapcache_clear_nr' declared here
     123 | static inline void swapcache_clear_nr(struct swap_info_struct *si, swp_entry_t entry, int nr)
         |                    ^
   15 warnings and 2 errors generated.


vim +/swapcache_clear +4391 mm/memory.c

5c041f5d1f23d3 Peter Xu                2022-05-12  3989  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3990  /*
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3991   * We enter with non-exclusive mmap_lock (to exclude vma changes,
8f4e2101fd7df9 Hugh Dickins            2005-10-29  3992   * but allow concurrent faults), and pte mapped but not yet locked.
9a95f3cf7b33d6 Paul Cassella           2014-08-06  3993   * We return with pte unmapped and unlocked.
9a95f3cf7b33d6 Paul Cassella           2014-08-06  3994   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3995   * We return with the mmap_lock locked or unlocked in the same cases
9a95f3cf7b33d6 Paul Cassella           2014-08-06  3996   * as does filemap_fault().
^1da177e4c3f41 Linus Torvalds          2005-04-16  3997   */
2b7403035459c7 Souptick Joarder        2018-08-23  3998  vm_fault_t do_swap_page(struct vm_fault *vmf)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3999  {
82b0f8c39a3869 Jan Kara                2016-12-14  4000  	struct vm_area_struct *vma = vmf->vma;
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4001) 	struct folio *swapcache, *folio = NULL;
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4002) 	struct page *page;
2799e77529c2a2 Miaohe Lin              2021-06-28  4003  	struct swap_info_struct *si = NULL;
14f9135d547060 David Hildenbrand       2022-05-09  4004  	rmap_t rmap_flags = RMAP_NONE;
13ddaf26be324a Kairui Song             2024-02-07  4005  	bool need_clear_cache = false;
1493a1913e34b0 David Hildenbrand       2022-05-09  4006  	bool exclusive = false;
65500d234e74fc Hugh Dickins            2005-10-29  4007  	swp_entry_t entry;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4008  	pte_t pte;
2b7403035459c7 Souptick Joarder        2018-08-23  4009  	vm_fault_t ret = 0;
aae466b0052e18 Joonsoo Kim             2020-08-11  4010  	void *shadow = NULL;
b87b78172664e3 Chuanhua Han            2024-05-29  4011  	int nr_pages;
b87b78172664e3 Chuanhua Han            2024-05-29  4012  	unsigned long page_idx;
b87b78172664e3 Chuanhua Han            2024-05-29  4013  	unsigned long address;
b87b78172664e3 Chuanhua Han            2024-05-29  4014  	pte_t *ptep;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4015  
2ca99358671ad3 Peter Xu                2021-11-05  4016  	if (!pte_unmap_same(vmf))
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4017  		goto out;
65500d234e74fc Hugh Dickins            2005-10-29  4018  
2994302bc8a171 Jan Kara                2016-12-14  4019  	entry = pte_to_swp_entry(vmf->orig_pte);
d1737fdbec7f90 Andi Kleen              2009-09-16  4020  	if (unlikely(non_swap_entry(entry))) {
0697212a411c1d Christoph Lameter       2006-06-23  4021  		if (is_migration_entry(entry)) {
82b0f8c39a3869 Jan Kara                2016-12-14  4022  			migration_entry_wait(vma->vm_mm, vmf->pmd,
82b0f8c39a3869 Jan Kara                2016-12-14  4023  					     vmf->address);
b756a3b5e7ead8 Alistair Popple         2021-06-30  4024  		} else if (is_device_exclusive_entry(entry)) {
b756a3b5e7ead8 Alistair Popple         2021-06-30  4025  			vmf->page = pfn_swap_entry_to_page(entry);
b756a3b5e7ead8 Alistair Popple         2021-06-30  4026  			ret = remove_device_exclusive_entry(vmf);
5042db43cc26f5 Jérôme Glisse           2017-09-08  4027  		} else if (is_device_private_entry(entry)) {
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4028  			if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4029  				/*
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4030  				 * migrate_to_ram is not yet ready to operate
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4031  				 * under VMA lock.
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4032  				 */
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4033  				vma_end_read(vma);
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4034  				ret = VM_FAULT_RETRY;
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4035  				goto out;
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4036  			}
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4037  
af5cdaf82238fb Alistair Popple         2021-06-30  4038  			vmf->page = pfn_swap_entry_to_page(entry);
16ce101db85db6 Alistair Popple         2022-09-28  4039  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
16ce101db85db6 Alistair Popple         2022-09-28  4040  					vmf->address, &vmf->ptl);
3db82b9374ca92 Hugh Dickins            2023-06-08  4041  			if (unlikely(!vmf->pte ||
c33c794828f212 Ryan Roberts            2023-06-12  4042  				     !pte_same(ptep_get(vmf->pte),
c33c794828f212 Ryan Roberts            2023-06-12  4043  							vmf->orig_pte)))
3b65f437d9e8dd Ryan Roberts            2023-06-02  4044  				goto unlock;
16ce101db85db6 Alistair Popple         2022-09-28  4045  
16ce101db85db6 Alistair Popple         2022-09-28  4046  			/*
16ce101db85db6 Alistair Popple         2022-09-28  4047  			 * Get a page reference while we know the page can't be
16ce101db85db6 Alistair Popple         2022-09-28  4048  			 * freed.
16ce101db85db6 Alistair Popple         2022-09-28  4049  			 */
16ce101db85db6 Alistair Popple         2022-09-28  4050  			get_page(vmf->page);
16ce101db85db6 Alistair Popple         2022-09-28  4051  			pte_unmap_unlock(vmf->pte, vmf->ptl);
4a955bed882e73 Alistair Popple         2022-11-14  4052  			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
16ce101db85db6 Alistair Popple         2022-09-28  4053  			put_page(vmf->page);
d1737fdbec7f90 Andi Kleen              2009-09-16  4054  		} else if (is_hwpoison_entry(entry)) {
d1737fdbec7f90 Andi Kleen              2009-09-16  4055  			ret = VM_FAULT_HWPOISON;
5c041f5d1f23d3 Peter Xu                2022-05-12  4056  		} else if (is_pte_marker_entry(entry)) {
5c041f5d1f23d3 Peter Xu                2022-05-12  4057  			ret = handle_pte_marker(vmf);
d1737fdbec7f90 Andi Kleen              2009-09-16  4058  		} else {
2994302bc8a171 Jan Kara                2016-12-14  4059  			print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
d99be1a8ecf377 Hugh Dickins            2009-12-14  4060  			ret = VM_FAULT_SIGBUS;
d1737fdbec7f90 Andi Kleen              2009-09-16  4061  		}
0697212a411c1d Christoph Lameter       2006-06-23  4062  		goto out;
0697212a411c1d Christoph Lameter       2006-06-23  4063  	}
0bcac06f27d752 Minchan Kim             2017-11-15  4064  
2799e77529c2a2 Miaohe Lin              2021-06-28  4065  	/* Prevent swapoff from happening to us. */
2799e77529c2a2 Miaohe Lin              2021-06-28  4066  	si = get_swap_device(entry);
2799e77529c2a2 Miaohe Lin              2021-06-28  4067  	if (unlikely(!si))
2799e77529c2a2 Miaohe Lin              2021-06-28  4068  		goto out;
0bcac06f27d752 Minchan Kim             2017-11-15  4069  
5a423081b2465d Matthew Wilcox (Oracle  2022-09-02  4070) 	folio = swap_cache_get_folio(entry, vma, vmf->address);
5a423081b2465d Matthew Wilcox (Oracle  2022-09-02  4071) 	if (folio)
5a423081b2465d Matthew Wilcox (Oracle  2022-09-02  4072) 		page = folio_file_page(folio, swp_offset(entry));
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4073) 	swapcache = folio;
f80207727aaca3 Minchan Kim             2018-01-18  4074  
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4075) 	if (!folio) {
a449bf58e45abf Qian Cai                2020-08-14  4076  		if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
eb085574a7526c Huang Ying              2019-07-11  4077  		    __swap_count(entry) == 1) {
13ddaf26be324a Kairui Song             2024-02-07  4078  			/*
13ddaf26be324a Kairui Song             2024-02-07  4079  			 * Prevent parallel swapin from proceeding with
13ddaf26be324a Kairui Song             2024-02-07  4080  			 * the cache flag. Otherwise, another thread may
13ddaf26be324a Kairui Song             2024-02-07  4081  			 * finish swapin first, free the entry, and swapout
13ddaf26be324a Kairui Song             2024-02-07  4082  			 * reusing the same entry. It's undetectable as
13ddaf26be324a Kairui Song             2024-02-07  4083  			 * pte_same() returns true due to entry reuse.
13ddaf26be324a Kairui Song             2024-02-07  4084  			 */
13ddaf26be324a Kairui Song             2024-02-07  4085  			if (swapcache_prepare(entry)) {
13ddaf26be324a Kairui Song             2024-02-07  4086  				/* Relax a bit to prevent rapid repeated page faults */
13ddaf26be324a Kairui Song             2024-02-07  4087  				schedule_timeout_uninterruptible(1);
13ddaf26be324a Kairui Song             2024-02-07  4088  				goto out;
13ddaf26be324a Kairui Song             2024-02-07  4089  			}
13ddaf26be324a Kairui Song             2024-02-07  4090  			need_clear_cache = true;
13ddaf26be324a Kairui Song             2024-02-07  4091  
0bcac06f27d752 Minchan Kim             2017-11-15  4092  			/* skip swapcache */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4093) 			folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0,
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4094) 						vma, vmf->address, false);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4095) 			page = &folio->page;
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4096) 			if (folio) {
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4097) 				__folio_set_locked(folio);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4098) 				__folio_set_swapbacked(folio);
4c6355b25e8bb8 Johannes Weiner         2020-06-03  4099  
6599591816f522 Matthew Wilcox (Oracle  2022-09-02  4100) 				if (mem_cgroup_swapin_charge_folio(folio,
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4101) 							vma->vm_mm, GFP_KERNEL,
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4102) 							entry)) {
545b1b077ca6b3 Michal Hocko            2020-06-25  4103  					ret = VM_FAULT_OOM;
4c6355b25e8bb8 Johannes Weiner         2020-06-03  4104  					goto out_page;
545b1b077ca6b3 Michal Hocko            2020-06-25  4105  				}
0add0c77a9bd0c Shakeel Butt            2021-04-29  4106  				mem_cgroup_swapin_uncharge_swap(entry);
4c6355b25e8bb8 Johannes Weiner         2020-06-03  4107  
aae466b0052e18 Joonsoo Kim             2020-08-11  4108  				shadow = get_shadow_from_swap_cache(entry);
aae466b0052e18 Joonsoo Kim             2020-08-11  4109  				if (shadow)
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4110) 					workingset_refault(folio, shadow);
0076f029cb2906 Joonsoo Kim             2020-06-25  4111  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4112) 				folio_add_lru(folio);
0add0c77a9bd0c Shakeel Butt            2021-04-29  4113  
c9bdf768dd9319 Matthew Wilcox (Oracle  2023-12-13  4114) 				/* To provide entry to swap_read_folio() */
3d2c9087688777 David Hildenbrand       2023-08-21  4115  				folio->swap = entry;
420d8ce32b2681 Yosry Ahmed             2024-06-07  4116  				swap_read_folio(folio, NULL);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4117) 				folio->private = NULL;
0bcac06f27d752 Minchan Kim             2017-11-15  4118  			}
aa8d22a11da933 Minchan Kim             2017-11-15  4119  		} else {
e9e9b7ecee4a13 Minchan Kim             2018-04-05  4120  			page = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
e9e9b7ecee4a13 Minchan Kim             2018-04-05  4121  						vmf);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4122) 			if (page)
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4123) 				folio = page_folio(page);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4124) 			swapcache = folio;
0bcac06f27d752 Minchan Kim             2017-11-15  4125  		}
0bcac06f27d752 Minchan Kim             2017-11-15  4126  
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4127) 		if (!folio) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  4128  			/*
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4129  			 * Back out if somebody else faulted in this pte
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4130  			 * while we released the pte lock.
^1da177e4c3f41 Linus Torvalds          2005-04-16  4131  			 */
82b0f8c39a3869 Jan Kara                2016-12-14  4132  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
82b0f8c39a3869 Jan Kara                2016-12-14  4133  					vmf->address, &vmf->ptl);
c33c794828f212 Ryan Roberts            2023-06-12  4134  			if (likely(vmf->pte &&
c33c794828f212 Ryan Roberts            2023-06-12  4135  				   pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
^1da177e4c3f41 Linus Torvalds          2005-04-16  4136  				ret = VM_FAULT_OOM;
65500d234e74fc Hugh Dickins            2005-10-29  4137  			goto unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4138  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4139  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4140  		/* Had to read the page from swap area: Major fault */
^1da177e4c3f41 Linus Torvalds          2005-04-16  4141  		ret = VM_FAULT_MAJOR;
f8891e5e1f93a1 Christoph Lameter       2006-06-30  4142  		count_vm_event(PGMAJFAULT);
2262185c5b287f Roman Gushchin          2017-07-06  4143  		count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
d1737fdbec7f90 Andi Kleen              2009-09-16  4144  	} else if (PageHWPoison(page)) {
71f72525dfaaec Wu Fengguang            2009-12-16  4145  		/*
71f72525dfaaec Wu Fengguang            2009-12-16  4146  		 * hwpoisoned dirty swapcache pages are kept for killing
71f72525dfaaec Wu Fengguang            2009-12-16  4147  		 * owner processes (which may be unknown at hwpoison time)
71f72525dfaaec Wu Fengguang            2009-12-16  4148  		 */
d1737fdbec7f90 Andi Kleen              2009-09-16  4149  		ret = VM_FAULT_HWPOISON;
4779cb31c0ee3b Andi Kleen              2009-10-14  4150  		goto out_release;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4151  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4152  
fdc724d6aa44ef Suren Baghdasaryan      2023-06-30  4153  	ret |= folio_lock_or_retry(folio, vmf);
fdc724d6aa44ef Suren Baghdasaryan      2023-06-30  4154  	if (ret & VM_FAULT_RETRY)
d065bd810b6deb Michel Lespinasse       2010-10-26  4155  		goto out_release;
073e587ec2cc37 KAMEZAWA Hiroyuki       2008-10-18  4156  
84d60fdd3733fb David Hildenbrand       2022-03-24  4157  	if (swapcache) {
4969c1192d15af Andrea Arcangeli        2010-09-09  4158  		/*
3b344157c0c15b Matthew Wilcox (Oracle  2022-09-02  4159) 		 * Make sure folio_free_swap() or swapoff did not release the
84d60fdd3733fb David Hildenbrand       2022-03-24  4160  		 * swapcache from under us.  The page pin, and pte_same test
84d60fdd3733fb David Hildenbrand       2022-03-24  4161  		 * below, are not enough to exclude that.  Even if it is still
84d60fdd3733fb David Hildenbrand       2022-03-24  4162  		 * swapcache, we need to check that the page's swap has not
84d60fdd3733fb David Hildenbrand       2022-03-24  4163  		 * changed.
4969c1192d15af Andrea Arcangeli        2010-09-09  4164  		 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4165) 		if (unlikely(!folio_test_swapcache(folio) ||
cfeed8ffe55b37 David Hildenbrand       2023-08-21  4166  			     page_swap_entry(page).val != entry.val))
4969c1192d15af Andrea Arcangeli        2010-09-09  4167  			goto out_page;
4969c1192d15af Andrea Arcangeli        2010-09-09  4168  
84d60fdd3733fb David Hildenbrand       2022-03-24  4169  		/*
84d60fdd3733fb David Hildenbrand       2022-03-24  4170  		 * KSM sometimes has to copy on read faults, for example, if
84d60fdd3733fb David Hildenbrand       2022-03-24  4171  		 * page->index of !PageKSM() pages would be nonlinear inside the
84d60fdd3733fb David Hildenbrand       2022-03-24  4172  		 * anon VMA -- PageKSM() is lost on actual swapout.
84d60fdd3733fb David Hildenbrand       2022-03-24  4173  		 */
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4174) 		folio = ksm_might_need_to_copy(folio, vma, vmf->address);
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4175) 		if (unlikely(!folio)) {
5ad6468801d28c Hugh Dickins            2009-12-14  4176  			ret = VM_FAULT_OOM;
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4177) 			folio = swapcache;
4969c1192d15af Andrea Arcangeli        2010-09-09  4178  			goto out_page;
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4179) 		} else if (unlikely(folio == ERR_PTR(-EHWPOISON))) {
6b970599e807ea Kefeng Wang             2022-12-09  4180  			ret = VM_FAULT_HWPOISON;
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4181) 			folio = swapcache;
6b970599e807ea Kefeng Wang             2022-12-09  4182  			goto out_page;
4969c1192d15af Andrea Arcangeli        2010-09-09  4183  		}
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4184) 		if (folio != swapcache)
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4185) 			page = folio_page(folio, 0);
c145e0b47c77eb David Hildenbrand       2022-03-24  4186  
c145e0b47c77eb David Hildenbrand       2022-03-24  4187  		/*
c145e0b47c77eb David Hildenbrand       2022-03-24  4188  		 * If we want to map a page that's in the swapcache writable, we
c145e0b47c77eb David Hildenbrand       2022-03-24  4189  		 * have to detect via the refcount if we're really the exclusive
c145e0b47c77eb David Hildenbrand       2022-03-24  4190  		 * owner. Try removing the extra reference from the local LRU
1fec6890bf2247 Matthew Wilcox (Oracle  2023-06-21  4191) 		 * caches if required.
c145e0b47c77eb David Hildenbrand       2022-03-24  4192  		 */
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4193) 		if ((vmf->flags & FAULT_FLAG_WRITE) && folio == swapcache &&
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4194) 		    !folio_test_ksm(folio) && !folio_test_lru(folio))
c145e0b47c77eb David Hildenbrand       2022-03-24  4195  			lru_add_drain();
84d60fdd3733fb David Hildenbrand       2022-03-24  4196  	}
5ad6468801d28c Hugh Dickins            2009-12-14  4197  
4231f8425833b1 Kefeng Wang             2023-03-02  4198  	folio_throttle_swaprate(folio, GFP_KERNEL);
8a9f3ccd24741b Balbir Singh            2008-02-07  4199  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4200  	/*
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4201  	 * Back out if somebody else already faulted in this pte.
^1da177e4c3f41 Linus Torvalds          2005-04-16  4202  	 */
82b0f8c39a3869 Jan Kara                2016-12-14  4203  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
82b0f8c39a3869 Jan Kara                2016-12-14  4204  			&vmf->ptl);
c33c794828f212 Ryan Roberts            2023-06-12  4205  	if (unlikely(!vmf->pte || !pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
b81074800b98ac Kirill Korotaev         2005-05-16  4206  		goto out_nomap;
b81074800b98ac Kirill Korotaev         2005-05-16  4207  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4208) 	if (unlikely(!folio_test_uptodate(folio))) {
b81074800b98ac Kirill Korotaev         2005-05-16  4209  		ret = VM_FAULT_SIGBUS;
b81074800b98ac Kirill Korotaev         2005-05-16  4210  		goto out_nomap;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4211  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4212  
b87b78172664e3 Chuanhua Han            2024-05-29  4213  	nr_pages = 1;
b87b78172664e3 Chuanhua Han            2024-05-29  4214  	page_idx = 0;
b87b78172664e3 Chuanhua Han            2024-05-29  4215  	address = vmf->address;
b87b78172664e3 Chuanhua Han            2024-05-29  4216  	ptep = vmf->pte;
b87b78172664e3 Chuanhua Han            2024-05-29  4217  	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
b87b78172664e3 Chuanhua Han            2024-05-29  4218  		int nr = folio_nr_pages(folio);
b87b78172664e3 Chuanhua Han            2024-05-29  4219  		unsigned long idx = folio_page_idx(folio, page);
b87b78172664e3 Chuanhua Han            2024-05-29  4220  		unsigned long folio_start = address - idx * PAGE_SIZE;
b87b78172664e3 Chuanhua Han            2024-05-29  4221  		unsigned long folio_end = folio_start + nr * PAGE_SIZE;
b87b78172664e3 Chuanhua Han            2024-05-29  4222  		pte_t *folio_ptep;
b87b78172664e3 Chuanhua Han            2024-05-29  4223  		pte_t folio_pte;
b87b78172664e3 Chuanhua Han            2024-05-29  4224  
b87b78172664e3 Chuanhua Han            2024-05-29  4225  		if (unlikely(folio_start < max(address & PMD_MASK, vma->vm_start)))
b87b78172664e3 Chuanhua Han            2024-05-29  4226  			goto check_folio;
b87b78172664e3 Chuanhua Han            2024-05-29  4227  		if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)))
b87b78172664e3 Chuanhua Han            2024-05-29  4228  			goto check_folio;
b87b78172664e3 Chuanhua Han            2024-05-29  4229  
b87b78172664e3 Chuanhua Han            2024-05-29  4230  		folio_ptep = vmf->pte - idx;
b87b78172664e3 Chuanhua Han            2024-05-29  4231  		folio_pte = ptep_get(folio_ptep);
b87b78172664e3 Chuanhua Han            2024-05-29  4232  		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
b87b78172664e3 Chuanhua Han            2024-05-29  4233  		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
b87b78172664e3 Chuanhua Han            2024-05-29  4234  			goto check_folio;
b87b78172664e3 Chuanhua Han            2024-05-29  4235  
b87b78172664e3 Chuanhua Han            2024-05-29  4236  		page_idx = idx;
b87b78172664e3 Chuanhua Han            2024-05-29  4237  		address = folio_start;
b87b78172664e3 Chuanhua Han            2024-05-29  4238  		ptep = folio_ptep;
b87b78172664e3 Chuanhua Han            2024-05-29  4239  		nr_pages = nr;
b87b78172664e3 Chuanhua Han            2024-05-29  4240  		entry = folio->swap;
b87b78172664e3 Chuanhua Han            2024-05-29  4241  		page = &folio->page;
b87b78172664e3 Chuanhua Han            2024-05-29  4242  	}
b87b78172664e3 Chuanhua Han            2024-05-29  4243  
b87b78172664e3 Chuanhua Han            2024-05-29  4244  check_folio:
78fbe906cc900b David Hildenbrand       2022-05-09  4245  	/*
78fbe906cc900b David Hildenbrand       2022-05-09  4246  	 * PG_anon_exclusive reuses PG_mappedtodisk for anon pages. A swap pte
78fbe906cc900b David Hildenbrand       2022-05-09  4247  	 * must never point at an anonymous page in the swapcache that is
78fbe906cc900b David Hildenbrand       2022-05-09  4248  	 * PG_anon_exclusive. Sanity check that this holds and especially, that
78fbe906cc900b David Hildenbrand       2022-05-09  4249  	 * no filesystem set PG_mappedtodisk on a page in the swapcache. Sanity
78fbe906cc900b David Hildenbrand       2022-05-09  4250  	 * check after taking the PT lock and making sure that nobody
78fbe906cc900b David Hildenbrand       2022-05-09  4251  	 * concurrently faulted in this page and set PG_anon_exclusive.
78fbe906cc900b David Hildenbrand       2022-05-09  4252  	 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4253) 	BUG_ON(!folio_test_anon(folio) && folio_test_mappedtodisk(folio));
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4254) 	BUG_ON(folio_test_anon(folio) && PageAnonExclusive(page));
78fbe906cc900b David Hildenbrand       2022-05-09  4255  
1493a1913e34b0 David Hildenbrand       2022-05-09  4256  	/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4257  	 * Check under PT lock (to protect against concurrent fork() sharing
1493a1913e34b0 David Hildenbrand       2022-05-09  4258  	 * the swap entry concurrently) for certainly exclusive pages.
1493a1913e34b0 David Hildenbrand       2022-05-09  4259  	 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4260) 	if (!folio_test_ksm(folio)) {
1493a1913e34b0 David Hildenbrand       2022-05-09  4261  		exclusive = pte_swp_exclusive(vmf->orig_pte);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4262) 		if (folio != swapcache) {
1493a1913e34b0 David Hildenbrand       2022-05-09  4263  			/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4264  			 * We have a fresh page that is not exposed to the
1493a1913e34b0 David Hildenbrand       2022-05-09  4265  			 * swapcache -> certainly exclusive.
1493a1913e34b0 David Hildenbrand       2022-05-09  4266  			 */
1493a1913e34b0 David Hildenbrand       2022-05-09  4267  			exclusive = true;
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4268) 		} else if (exclusive && folio_test_writeback(folio) &&
eacde32757c756 Miaohe Lin              2022-05-19  4269  			  data_race(si->flags & SWP_STABLE_WRITES)) {
1493a1913e34b0 David Hildenbrand       2022-05-09  4270  			/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4271  			 * This is tricky: not all swap backends support
1493a1913e34b0 David Hildenbrand       2022-05-09  4272  			 * concurrent page modifications while under writeback.
1493a1913e34b0 David Hildenbrand       2022-05-09  4273  			 *
1493a1913e34b0 David Hildenbrand       2022-05-09  4274  			 * So if we stumble over such a page in the swapcache
1493a1913e34b0 David Hildenbrand       2022-05-09  4275  			 * we must not set the page exclusive, otherwise we can
1493a1913e34b0 David Hildenbrand       2022-05-09  4276  			 * map it writable without further checks and modify it
1493a1913e34b0 David Hildenbrand       2022-05-09  4277  			 * while still under writeback.
1493a1913e34b0 David Hildenbrand       2022-05-09  4278  			 *
1493a1913e34b0 David Hildenbrand       2022-05-09  4279  			 * For these problematic swap backends, simply drop the
1493a1913e34b0 David Hildenbrand       2022-05-09  4280  			 * exclusive marker: this is perfectly fine as we start
1493a1913e34b0 David Hildenbrand       2022-05-09  4281  			 * writeback only if we fully unmapped the page and
1493a1913e34b0 David Hildenbrand       2022-05-09  4282  			 * there are no unexpected references on the page after
1493a1913e34b0 David Hildenbrand       2022-05-09  4283  			 * unmapping succeeded. After fully unmapped, no
1493a1913e34b0 David Hildenbrand       2022-05-09  4284  			 * further GUP references (FOLL_GET and FOLL_PIN) can
1493a1913e34b0 David Hildenbrand       2022-05-09  4285  			 * appear, so dropping the exclusive marker and mapping
1493a1913e34b0 David Hildenbrand       2022-05-09  4286  			 * it only R/O is fine.
1493a1913e34b0 David Hildenbrand       2022-05-09  4287  			 */
1493a1913e34b0 David Hildenbrand       2022-05-09  4288  			exclusive = false;
1493a1913e34b0 David Hildenbrand       2022-05-09  4289  		}
1493a1913e34b0 David Hildenbrand       2022-05-09  4290  	}
1493a1913e34b0 David Hildenbrand       2022-05-09  4291  
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4292  	/*
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4293  	 * Some architectures may have to restore extra metadata to the page
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4294  	 * when reading from swap. This metadata may be indexed by swap entry
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4295  	 * so this must be called before swap_free().
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4296  	 */
f238b8c33c6738 Barry Song              2024-03-23  4297  	arch_swap_restore(folio_swap(entry, folio), folio);
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4298  
8c7c6e34a1256a KAMEZAWA Hiroyuki       2009-01-07  4299  	/*
c145e0b47c77eb David Hildenbrand       2022-03-24  4300  	 * Remove the swap entry and conditionally try to free up the swapcache.
c145e0b47c77eb David Hildenbrand       2022-03-24  4301  	 * We're already holding a reference on the page but haven't mapped it
c145e0b47c77eb David Hildenbrand       2022-03-24  4302  	 * yet.
8c7c6e34a1256a KAMEZAWA Hiroyuki       2009-01-07  4303  	 */
b87b78172664e3 Chuanhua Han            2024-05-29  4304  	swap_free_nr(entry, nr_pages);
a160e5377b55bc Matthew Wilcox (Oracle  2022-09-02  4305) 	if (should_try_to_free_swap(folio, vma, vmf->flags))
a160e5377b55bc Matthew Wilcox (Oracle  2022-09-02  4306) 		folio_free_swap(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4307  
b87b78172664e3 Chuanhua Han            2024-05-29  4308  	add_mm_counter(vma->vm_mm, MM_ANONPAGES, nr_pages);
b87b78172664e3 Chuanhua Han            2024-05-29  4309  	add_mm_counter(vma->vm_mm, MM_SWAPENTS, -nr_pages);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4310  	pte = mk_pte(page, vma->vm_page_prot);
83e66de687b62a Barry Song              2024-06-02  4311  	if (pte_swp_soft_dirty(vmf->orig_pte))
83e66de687b62a Barry Song              2024-06-02  4312  		pte = pte_mksoft_dirty(pte);
83e66de687b62a Barry Song              2024-06-02  4313  	if (pte_swp_uffd_wp(vmf->orig_pte))
83e66de687b62a Barry Song              2024-06-02  4314  		pte = pte_mkuffd_wp(pte);
c145e0b47c77eb David Hildenbrand       2022-03-24  4315  
c145e0b47c77eb David Hildenbrand       2022-03-24  4316  	/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4317  	 * Same logic as in do_wp_page(); however, optimize for pages that are
1493a1913e34b0 David Hildenbrand       2022-05-09  4318  	 * certainly not shared either because we just allocated them without
1493a1913e34b0 David Hildenbrand       2022-05-09  4319  	 * exposing them to the swapcache or because the swap entry indicates
1493a1913e34b0 David Hildenbrand       2022-05-09  4320  	 * exclusivity.
c145e0b47c77eb David Hildenbrand       2022-03-24  4321  	 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4322) 	if (!folio_test_ksm(folio) &&
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4323) 	    (exclusive || folio_ref_count(folio) == 1)) {
83e66de687b62a Barry Song              2024-06-02  4324  		if ((vma->vm_flags & VM_WRITE) && !userfaultfd_pte_wp(vma, pte) &&
6d3fd7a399ad57 Barry Song              2024-06-08  4325  		    !pte_needs_soft_dirty_wp(vma, pte)) {
83e66de687b62a Barry Song              2024-06-02  4326  			pte = pte_mkwrite(pte, vma);
6c287605fd5646 David Hildenbrand       2022-05-09  4327  			if (vmf->flags & FAULT_FLAG_WRITE) {
83e66de687b62a Barry Song              2024-06-02  4328  				pte = pte_mkdirty(pte);
82b0f8c39a3869 Jan Kara                2016-12-14  4329  				vmf->flags &= ~FAULT_FLAG_WRITE;
6c287605fd5646 David Hildenbrand       2022-05-09  4330  			}
83e66de687b62a Barry Song              2024-06-02  4331  		}
14f9135d547060 David Hildenbrand       2022-05-09  4332  		rmap_flags |= RMAP_EXCLUSIVE;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4333  	}
b87b78172664e3 Chuanhua Han            2024-05-29  4334  	folio_ref_add(folio, nr_pages - 1);
b87b78172664e3 Chuanhua Han            2024-05-29  4335  	flush_icache_pages(vma, page, nr_pages);
b87b78172664e3 Chuanhua Han            2024-05-29  4336  	vmf->orig_pte = pte_advance_pfn(pte, page_idx);
0bcac06f27d752 Minchan Kim             2017-11-15  4337  
0bcac06f27d752 Minchan Kim             2017-11-15  4338  	/* ksm created a completely new copy */
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4339) 	if (unlikely(folio != swapcache && swapcache)) {
92493c3b92b1e7 Barry Song              2024-06-18  4340  		folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4341) 		folio_add_lru_vma(folio, vma);
db4fb1039a1973 Barry Song              2024-06-18  4342  	} else if (!folio_test_anon(folio)) {
db4fb1039a1973 Barry Song              2024-06-18  4343  		/*
db4fb1039a1973 Barry Song              2024-06-18  4344  		 * We currently only expect small !anon folios, which are either
db4fb1039a1973 Barry Song              2024-06-18  4345  		 * fully exclusive or fully shared. If we ever get large folios
db4fb1039a1973 Barry Song              2024-06-18  4346  		 * here, we have to be careful.
db4fb1039a1973 Barry Song              2024-06-18  4347  		 */
db4fb1039a1973 Barry Song              2024-06-18  4348  		VM_WARN_ON_ONCE(folio_test_large(folio));
db4fb1039a1973 Barry Song              2024-06-18  4349  		VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
db4fb1039a1973 Barry Song              2024-06-18  4350  		folio_add_new_anon_rmap(folio, vma, address, rmap_flags);
0bcac06f27d752 Minchan Kim             2017-11-15  4351  	} else {
b87b78172664e3 Chuanhua Han            2024-05-29  4352  		folio_add_anon_rmap_ptes(folio, page, nr_pages, vma, address,
b832a354d787bf David Hildenbrand       2023-12-20  4353  					rmap_flags);
00501b531c4723 Johannes Weiner         2014-08-08  4354  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4355  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4356) 	VM_BUG_ON(!folio_test_anon(folio) ||
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4357) 			(pte_write(pte) && !PageAnonExclusive(page)));
b87b78172664e3 Chuanhua Han            2024-05-29  4358  	set_ptes(vma->vm_mm, address, ptep, pte, nr_pages);
b87b78172664e3 Chuanhua Han            2024-05-29  4359  	arch_do_swap_page_nr(vma->vm_mm, vma, address,
b87b78172664e3 Chuanhua Han            2024-05-29  4360  			pte, pte, nr_pages);
1eba86c096e35e Pasha Tatashin          2022-01-14  4361  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4362) 	folio_unlock(folio);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4363) 	if (folio != swapcache && swapcache) {
4969c1192d15af Andrea Arcangeli        2010-09-09  4364  		/*
4969c1192d15af Andrea Arcangeli        2010-09-09  4365  		 * Hold the lock to avoid the swap entry to be reused
4969c1192d15af Andrea Arcangeli        2010-09-09  4366  		 * until we take the PT lock for the pte_same() check
4969c1192d15af Andrea Arcangeli        2010-09-09  4367  		 * (to avoid false positives from pte_same). For
4969c1192d15af Andrea Arcangeli        2010-09-09  4368  		 * further safety release the lock after the swap_free
4969c1192d15af Andrea Arcangeli        2010-09-09  4369  		 * so that the swap count won't change under a
4969c1192d15af Andrea Arcangeli        2010-09-09  4370  		 * parallel locked swapcache.
4969c1192d15af Andrea Arcangeli        2010-09-09  4371  		 */
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4372) 		folio_unlock(swapcache);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4373) 		folio_put(swapcache);
4969c1192d15af Andrea Arcangeli        2010-09-09  4374  	}
c475a8ab625d56 Hugh Dickins            2005-06-21  4375  
82b0f8c39a3869 Jan Kara                2016-12-14  4376  	if (vmf->flags & FAULT_FLAG_WRITE) {
2994302bc8a171 Jan Kara                2016-12-14  4377  		ret |= do_wp_page(vmf);
61469f1d51777f Hugh Dickins            2008-03-04  4378  		if (ret & VM_FAULT_ERROR)
61469f1d51777f Hugh Dickins            2008-03-04  4379  			ret &= VM_FAULT_ERROR;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4380  		goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4381  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4382  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4383  	/* No need to invalidate - it was non-present before */
b87b78172664e3 Chuanhua Han            2024-05-29  4384  	update_mmu_cache_range(vmf, vma, address, ptep, nr_pages);
65500d234e74fc Hugh Dickins            2005-10-29  4385  unlock:
3db82b9374ca92 Hugh Dickins            2023-06-08  4386  	if (vmf->pte)
82b0f8c39a3869 Jan Kara                2016-12-14  4387  		pte_unmap_unlock(vmf->pte, vmf->ptl);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4388  out:
13ddaf26be324a Kairui Song             2024-02-07  4389  	/* Clear the swap cache pin for direct swapin after PTL unlock */
13ddaf26be324a Kairui Song             2024-02-07  4390  	if (need_clear_cache)
13ddaf26be324a Kairui Song             2024-02-07 @4391  		swapcache_clear(si, entry);
2799e77529c2a2 Miaohe Lin              2021-06-28  4392  	if (si)
2799e77529c2a2 Miaohe Lin              2021-06-28  4393  		put_swap_device(si);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4394  	return ret;
b81074800b98ac Kirill Korotaev         2005-05-16  4395  out_nomap:
3db82b9374ca92 Hugh Dickins            2023-06-08  4396  	if (vmf->pte)
82b0f8c39a3869 Jan Kara                2016-12-14  4397  		pte_unmap_unlock(vmf->pte, vmf->ptl);
bc43f75cd98158 Johannes Weiner         2009-04-30  4398  out_page:
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4399) 	folio_unlock(folio);
4779cb31c0ee3b Andi Kleen              2009-10-14  4400  out_release:
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4401) 	folio_put(folio);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4402) 	if (folio != swapcache && swapcache) {
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4403) 		folio_unlock(swapcache);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4404) 		folio_put(swapcache);
4969c1192d15af Andrea Arcangeli        2010-09-09  4405  	}
13ddaf26be324a Kairui Song             2024-02-07  4406  	if (need_clear_cache)
13ddaf26be324a Kairui Song             2024-02-07  4407  		swapcache_clear(si, entry);
2799e77529c2a2 Miaohe Lin              2021-06-28  4408  	if (si)
2799e77529c2a2 Miaohe Lin              2021-06-28  4409  		put_swap_device(si);
65500d234e74fc Hugh Dickins            2005-10-29  4410  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4411  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  4412  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--kPIQ8/96DO+3LspG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch akpm-mm mm-everything
        git checkout akpm-mm/mm-everything
        b4 shazam https://lore.kernel.org/r/20240629111010.230484-2-21cnbao@gmail.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-19 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-19 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash mm/

--kPIQ8/96DO+3LspG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/s390 6.10.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 19.0.0git (git://gitmirror/llvm_project 326ba38a991250a8587a399a260b0f7af2c9166a)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=190000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=190000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24100
CONFIG_LLD_VERSION=0
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=127
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_HAVE_KERNEL_UNCOMPRESSED=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
# CONFIG_KERNEL_UNCOMPRESSED is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_SPARSE_IRQ=y
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC10_NO_ARRAY_BOUNDS=y
CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_CGROUPS is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_TIME_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_BOOT_CONFIG is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_RSEQ=y
CONFIG_CACHESTAT_SYSCALL=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set

#
# Kexec and crash features
#
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
# end of Kexec and crash features
# end of General setup

CONFIG_MMU=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_AUDIT_ARCH=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_S390=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_HAVE_LIVEPATCH=y
CONFIG_ARCH_SUPPORTS_KEXEC=y
CONFIG_ARCH_SUPPORTS_KEXEC_FILE=y
CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY=y
CONFIG_ARCH_SUPPORTS_CRASH_DUMP=y

#
# Processor type and features
#
CONFIG_HAVE_MARCH_Z10_FEATURES=y
CONFIG_HAVE_MARCH_Z196_FEATURES=y
# CONFIG_MARCH_Z10 is not set
CONFIG_MARCH_Z196=y
# CONFIG_MARCH_ZEC12 is not set
# CONFIG_MARCH_Z13 is not set
# CONFIG_MARCH_Z14 is not set
# CONFIG_MARCH_Z15 is not set
# CONFIG_MARCH_Z16 is not set
CONFIG_MARCH_Z196_TUNE=y
CONFIG_TUNE_DEFAULT=y
# CONFIG_TUNE_Z10 is not set
# CONFIG_TUNE_Z196 is not set
# CONFIG_TUNE_ZEC12 is not set
# CONFIG_TUNE_Z13 is not set
# CONFIG_TUNE_Z14 is not set
# CONFIG_TUNE_Z15 is not set
# CONFIG_TUNE_Z16 is not set
CONFIG_64BIT=y
CONFIG_COMMAND_LINE_SIZE=4096
CONFIG_SMP=y
CONFIG_NR_CPUS=64
CONFIG_HOTPLUG_CPU=y
# CONFIG_SCHED_TOPOLOGY is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_KERNEL_NOBP is not set
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_KERNEL_IMAGE_BASE=0x3FFE0000000
# end of Processor type and features

#
# Memory setup
#
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_MAX_PHYSMEM_BITS=46
# CONFIG_CHECK_STACK is not set
# end of Memory setup

#
# I/O subsystem
#
# CONFIG_QDIO is not set
# CONFIG_CHSC_SCH is not set
# CONFIG_SCM_BUS is not set
# CONFIG_AP is not set
# end of I/O subsystem

CONFIG_CCW=y

#
# Virtualization
#
# CONFIG_PROTECTED_VIRTUALIZATION_GUEST is not set
# CONFIG_PFAULT is not set
# CONFIG_CMM is not set
# CONFIG_APPLDATA_BASE is not set
# CONFIG_S390_HYPFS is not set
# CONFIG_VIRTUALIZATION is not set
# CONFIG_S390_GUEST is not set
# end of Virtualization

#
# Selftests
#
# end of Selftests

CONFIG_CPU_MITIGATIONS=y

#
# General architecture-dependent options
#
CONFIG_GENERIC_ENTRY=y
# CONFIG_KPROBES is not set
# CONFIG_JUMP_LABEL is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_USTAT_F_TINODE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_GATHER_NO_GATHER=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE=y
CONFIG_ARCH_HAS_SCALED_CPUTIME=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_KERNEL_PMD_MKWRITE=y
CONFIG_ARCH_WANT_PMD_MKWRITE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=12
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_CLONE_BACKWARDS2=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_VDSO_DATA=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y

#
# GCOV-based kernel profiling
#
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_WRITE_MOUNTED is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

#
# IO Schedulers
#
# CONFIG_MQ_IOSCHED_DEADLINE is not set
# CONFIG_MQ_IOSCHED_KYBER is not set
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK=y
CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_READ_TRYLOCK=y
CONFIG_ARCH_INLINE_READ_LOCK=y
CONFIG_ARCH_INLINE_READ_LOCK_BH=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_READ_UNLOCK=y
CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_INLINE_SPIN_TRYLOCK=y
CONFIG_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_INLINE_SPIN_LOCK=y
CONFIG_INLINE_SPIN_LOCK_BH=y
CONFIG_INLINE_SPIN_LOCK_IRQ=y
CONFIG_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_INLINE_SPIN_UNLOCK_BH=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_INLINE_READ_TRYLOCK=y
CONFIG_INLINE_READ_LOCK=y
CONFIG_INLINE_READ_LOCK_BH=y
CONFIG_INLINE_READ_LOCK_IRQ=y
CONFIG_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_BH=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_INLINE_WRITE_TRYLOCK=y
CONFIG_INLINE_WRITE_LOCK=y
CONFIG_INLINE_WRITE_LOCK_BH=y
CONFIG_INLINE_WRITE_LOCK_IRQ=y
CONFIG_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_BH=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_ARCH_BINFMT_ELF_STATE=y
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set
CONFIG_HAVE_ZSMALLOC=y

#
# Slab allocator options
#
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
# CONFIG_SLUB_CPU_PARTIAL is not set
# CONFIG_RANDOM_KMALLOC_CACHES is not set
# end of Slab allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_PHYS_MAP=y
CONFIG_HAVE_GUP_FAST=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
# CONFIG_COMPACTION is not set
# CONFIG_PAGE_REPORTING is not set
# CONFIG_MIGRATION is not set
CONFIG_PCP_BATCH_SCALE_MAX=5
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
# CONFIG_CMA is not set
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set

#
# GUP_TEST needs to have DEBUG_FS enabled
#
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_PER_VMA_LOCK=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Cache Drivers
#
# end of Cache Drivers

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_GOOGLE_FIRMWARE is not set

#
# Qualcomm firmware drivers
#
# end of Qualcomm firmware drivers

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
# CONFIG_NVME_FC is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_DUMMY_IRQ is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_93CX6 is not set
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

#
# Altera FPGA firmware download module (requires I2C)
#
# CONFIG_ECHO is not set
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# end of SCSI device support

# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
# CONFIG_SERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set
# CONFIG_NULL_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_DEVMEM is not set
# CONFIG_HANGCHECK_TIMER is not set

#
# S/390 character device drivers
#
# CONFIG_TN3270 is not set
# CONFIG_TN3215 is not set
# CONFIG_SCLP_TTY is not set
# CONFIG_SCLP_VT220_TTY is not set
# CONFIG_HMC_DRV is not set
# CONFIG_SCLP_OFB is not set
# CONFIG_S390_TAPE is not set
# CONFIG_VMCP is not set
# CONFIG_MONWRITER is not set
# CONFIG_S390_VMUR is not set
# end of Character devices

#
# I2C support
#
# CONFIG_I2C is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
# CONFIG_GPIOLIB is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
# CONFIG_REGULATOR is not set
# CONFIG_RC_CORE is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

#
# Graphics support
#
# CONFIG_AUXDISPLAY is not set

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#

#
# Amlogic PM Domains
#
# end of Amlogic PM Domains

#
# Broadcom PM Domains
#
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
# end of i.MX PM Domains

#
# Qualcomm PM Domains
#
# end of Qualcomm PM Domains
# end of PM Domains

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# end of PHY drivers for Broadcom platforms
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
# CONFIG_NVMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
# CONFIG_BCACHEFS_FS is not set
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS3_FS is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
# CONFIG_CONFIGFS_FS is not set
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NLS is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

#
# Hardening of kernel data structures
#
# CONFIG_LIST_HARDENED is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Hardening of kernel data structures

CONFIG_CC_HAS_RANDSTRUCT=y
CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# end of Kernel hardening options
# end of Security options

# CONFIG_CRYPTO is not set

#
# Library routines
#
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# end of Crypto library routines

# CONFIG_CRC_CCITT is not set
# CONFIG_CRC16 is not set
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC64_ROCKSOFT is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_RANDOM32_SELFTEST is not set
# CONFIG_ZLIB_DFLTCC is not set
# CONFIG_XZ_DEC is not set
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
# CONFIG_SWIOTLB_DYNAMIC is not set
CONFIG_DMA_NEED_SYNC=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_IRQ_POLL is not set
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_MAX_FRAMES=64
CONFIG_SBITMAP=y
# CONFIG_LWQ_TEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

# CONFIG_DEBUG_KERNEL is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_ULEB128=y
CONFIG_FRAME_WARN=2048
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_DEBUG_FS is not set
CONFIG_ARCH_HAS_UBSAN=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_PER_VMA_LOCK_STATS is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_MEM_ALLOC_PROFILING is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
CONFIG_HAVE_KMSAN_COMPILER=y
# end of Memory Debugging

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_WW_MUTEX_SELFTEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set

#
# Debug kernel data structures
#
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# end of RCU Debugging

CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_HAVE_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_RETVAL=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_NOP_MCOUNT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# s390 Debugging
#
CONFIG_EARLY_PRINTK=y
# end of s390 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--kPIQ8/96DO+3LspG--
