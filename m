Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E293C00;
	Sat,  6 Apr 2024 01:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712368457; cv=none; b=Kc2eX9CLiZHQfgla8Aeu+eomHmCTp7fRnLfWJ7aby5vBXLpJyxCue7nXMasM6aqbVxklHenxULe+h/LErAxXVikTivjiSO8w7cDP5Yg3ndxjGGMN+9GtNylDMVslWWNhwRTIPukMMbTi4RvinzAhn8CanbxRwMK/Bk2wTqxA2Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712368457; c=relaxed/simple;
	bh=jSzVcTnBQWbdYVcxaXkpnKBAmD9iUijONk05YNlCz4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3T3dt4CSvFeTSlaWh+UBkVukBb6tb8ST0I7gX21ZdLL0lIL/mgr17kZ30W1raBWAAnIUr5sNFoOgirqTd8t8jTIqfcPHDpJeQdsTWyMkAQa/nLqiviZQl060a8wB86yvQAoVe3TgSOZ2/kwcEdFGe4zvo1QNQTlUbOOc2JS/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS7SjEXz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS7SjEXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712368455; x=1743904455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jSzVcTnBQWbdYVcxaXkpnKBAmD9iUijONk05YNlCz4Q=;
  b=dS7SjEXzl/vgrbWtww5bYJiUsxeBgwL9jy/5KLhf3MuPMn8zr9bTNK3v
   avSRCXFinXfpSR2KGuy1zju/U1G/jWFub6HPKCMr364ASTMASXihbkHFM
   AttqOq8LoVh8fb/7Y8LcH4HScBveIrYplALYXhOQF2sO1Bz5VuJmwKeng
   RNZFWMvkP+3VYZQq5JjFOley2G9m7PZMqN8XifaICCwRvexT9TyG95o3b
   +lIeIOY4NJ6FPbIMwDUB2wzRknxZvcROHE/AmyuOjhANfkHuelLVb+rLg
   HWUta16yPeuz0q0gMH6LF1p5DRWu23s/+k39+ZBRmUc6nMgYu5XHJKoDx
   Q==;
X-CSE-ConnectionGUID: y9WoWx63RNmlv0e35pswqA==
X-CSE-MsgGUID: yWuW4CtWTVaYTYMcUNB4IQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7572319"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7572319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 18:54:14 -0700
X-CSE-ConnectionGUID: XuIbU8vwTeKldngytkY0bQ==
X-CSE-MsgGUID: 93D+psYhTW+e/1Ic3haojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="23960467"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2024 18:54:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsvFy-0002yi-20;
	Sat, 06 Apr 2024 01:54:10 +0000
Date: Sat, 6 Apr 2024 09:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:large_mapcount 19/27] mm/ksm.c:1310:13: error:
 call to undeclared function 'folio_test_swap_cache'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202404060900.74MDm29j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/davidhildenbrand/linux large_mapcount
head:   7e8a03fbcd6b8b5a7e2b6ea60f620c5d816cb44b
commit: 906b1f017658669524416d2e59ef8ea3def1393a [19/27] mm/ksm: remove page_mapcount() usage
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060900.74MDm29j-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060900.74MDm29j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060900.74MDm29j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/ksm.c:17:
   In file included from include/linux/mm.h:2272:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/ksm.c:18:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/ksm.c:1310:13: error: call to undeclared function 'folio_test_swap_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1310 |                 swapped = folio_test_swap_cache(folio);
         |                           ^
   mm/ksm.c:1310:13: note: did you mean 'folio_test_swapcache'?
   include/linux/page-flags.h:579:29: note: 'folio_test_swapcache' declared here
     579 | static __always_inline bool folio_test_swapcache(const struct folio *folio)
         |                             ^
   7 warnings and 1 error generated.


vim +/folio_test_swap_cache +1310 mm/ksm.c

  1277	
  1278	static int write_protect_page(struct vm_area_struct *vma, struct page *page,
  1279				      pte_t *orig_pte)
  1280	{
  1281		struct mm_struct *mm = vma->vm_mm;
  1282		DEFINE_PAGE_VMA_WALK(pvmw, page, vma, 0, 0);
  1283		struct folio *folio = page_folio(page);
  1284		int swapped;
  1285		int err = -EFAULT;
  1286		struct mmu_notifier_range range;
  1287		bool anon_exclusive;
  1288		pte_t entry;
  1289	
  1290		if (WARN_ON_ONCE(folio_test_large(folio)))
  1291			goto out;
  1292	
  1293		pvmw.address = page_address_in_vma(page, vma);
  1294		if (pvmw.address == -EFAULT)
  1295			goto out;
  1296	
  1297		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, pvmw.address,
  1298					pvmw.address + PAGE_SIZE);
  1299		mmu_notifier_invalidate_range_start(&range);
  1300	
  1301		if (!page_vma_mapped_walk(&pvmw))
  1302			goto out_mn;
  1303		if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
  1304			goto out_unlock;
  1305	
  1306		anon_exclusive = PageAnonExclusive(page);
  1307		entry = ptep_get(pvmw.pte);
  1308		if (pte_write(entry) || pte_dirty(entry) ||
  1309		    anon_exclusive || mm_tlb_flush_pending(mm)) {
> 1310			swapped = folio_test_swap_cache(folio);
  1311			flush_cache_page(vma, pvmw.address, folio_pfn(folio));
  1312			/*
  1313			 * Ok this is tricky, when get_user_pages_fast() run it doesn't
  1314			 * take any lock, therefore the check that we are going to make
  1315			 * with the pagecount against the mapcount is racy and
  1316			 * O_DIRECT can happen right after the check.
  1317			 * So we clear the pte and flush the tlb before the check
  1318			 * this assure us that no O_DIRECT can happen after the check
  1319			 * or in the middle of the check.
  1320			 *
  1321			 * No need to notify as we are downgrading page table to read
  1322			 * only not changing it to point to a new page.
  1323			 *
  1324			 * See Documentation/mm/mmu_notifier.rst
  1325			 */
  1326			entry = ptep_clear_flush(vma, pvmw.address, pvmw.pte);
  1327			/*
  1328			 * Check that no O_DIRECT or similar I/O is in progress on the
  1329			 * folio.
  1330			 */
  1331			if (folio_mapcount(folio) + 1 + swapped !=
  1332			    folio_ref_count(folio)) {
  1333				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1334				goto out_unlock;
  1335			}
  1336	
  1337			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
  1338			if (anon_exclusive &&
  1339			    folio_try_share_anon_rmap_pte(folio, page)) {
  1340				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1341				goto out_unlock;
  1342			}
  1343	
  1344			if (pte_dirty(entry))
  1345				folio_mark_dirty(folio);
  1346			entry = pte_mkclean(entry);
  1347	
  1348			if (pte_write(entry))
  1349				entry = pte_wrprotect(entry);
  1350	
  1351			set_pte_at_notify(mm, pvmw.address, pvmw.pte, entry);
  1352		}
  1353		*orig_pte = entry;
  1354		err = 0;
  1355	
  1356	out_unlock:
  1357		page_vma_mapped_walk_done(&pvmw);
  1358	out_mn:
  1359		mmu_notifier_invalidate_range_end(&range);
  1360	out:
  1361		return err;
  1362	}
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
