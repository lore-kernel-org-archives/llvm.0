Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103922ACC6;
	Wed,  5 Feb 2025 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745293; cv=none; b=I8Fxn7WSRGo6ujCuCh5FxeZ2ShLTxz8DKH7iEHEYa779QT8NB64faX22urSJF8PXybTMpBY10N4whaeX/F0fukky6bSZh/I3/QGyX/duW0Gl3g3VVaYP8rYcXZy/UpLtjO4D3vOf/KdcnSbzS/ZnZN5RMMrjKcYNRdjul8eiYys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745293; c=relaxed/simple;
	bh=UNbgX1n5Uzf4j6uTC4YY7nuS80iheYtt8wJ86ky5yGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9hpXkYtkP8/CNmb80u1F3dUbcNx0KgRKk5DMAv9M3/9z2e7aB4kBQpY4zv5QaPGcovgjwoBoHQGsc5X0g8haqE23+zzstAUvNRn6kdNgvg2MJ5kSvCBE002PQJTRh8yidypoax0koC+Og0ka+8+eZ4dxy7/dPp0Kxd6+wuVaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBz4pF6i; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBz4pF6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745291; x=1770281291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNbgX1n5Uzf4j6uTC4YY7nuS80iheYtt8wJ86ky5yGI=;
  b=LBz4pF6iRZdV5q1jzY0U4EDKCHDk0Ay3KFCz/AUxHnysExipjF+nUpht
   mloH9eCyc3VoIZInQc3rH+f1/zm3Gyj777ONz6TKvVH2NnVLd542UhbW5
   wu2xuFY3lFIEDEAqjCM3YFOfvuGS7st0eTpZNX9wem1tQzcN1EhKiOxen
   LFCTlpVocrYK1iAlgnPqnTojhU32y3xMxNr1sWReKjfQNIkWKar1ZoO5C
   aXGmq9yaORYOReArDA+yAjR7okVk0MKPPA3UFTffay8zpsPCLca/4DQAW
   s1AgG165Blhy8HZAFCwfGiIG1SaFYZ/mTL2SfZG5ICqmnxDa+jbsX66fm
   w==;
X-CSE-ConnectionGUID: eNONZBiwQCKz/IiEe/8vIQ==
X-CSE-MsgGUID: XOFKCLB5SvyyGqKgoVzYqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64658192"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="64658192"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:48:10 -0800
X-CSE-ConnectionGUID: cl/eQuUeRxKZh1g8anwIxQ==
X-CSE-MsgGUID: Y/eaIo/bRD6XJcXKHhBmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111422927"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Feb 2025 00:48:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfb4p-000tfd-1U;
	Wed, 05 Feb 2025 08:48:07 +0000
Date: Wed, 5 Feb 2025 16:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 9/22] mm/ksm.c:1276:28: error:
 passing 'pte_t *' to parameter of incompatible type 'pte_t'; dereference
 with *
Message-ID: <202502051640.vYN3JWVM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   ddc42f5fd72394838fc2d280ff2486ccb7178b9a
commit: e06705cb196ddea990ddec54bffd90ebff1ea85c [9/22] mm/ksm: handle device-exclusive entries correctly in write_protect_page()
config: i386-buildonly-randconfig-006-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051640.vYN3JWVM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051640.vYN3JWVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051640.vYN3JWVM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/ksm.c:18:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/ksm.c:1276:28: error: passing 'pte_t *' to parameter of incompatible type 'pte_t'; dereference with *
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |                                   ^~~~~~~~
         |                                   *
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/x86/include/asm/pgtable.h:1010:37: note: passing argument to parameter 'a' here
    1010 | static inline int pte_present(pte_t a)
         |                                     ^
>> mm/ksm.c:1277:3: error: expected ')'
    1277 |                 goto out_unlock;
         |                 ^
   mm/ksm.c:1276:5: note: to match this '('
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |            ^
   2 warnings and 2 errors generated.


vim +1276 mm/ksm.c

  1245	
  1246	static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
  1247				      pte_t *orig_pte)
  1248	{
  1249		struct mm_struct *mm = vma->vm_mm;
  1250		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, 0, 0);
  1251		int swapped;
  1252		int err = -EFAULT;
  1253		struct mmu_notifier_range range;
  1254		bool anon_exclusive;
  1255		pte_t entry;
  1256	
  1257		if (WARN_ON_ONCE(folio_test_large(folio)))
  1258			return err;
  1259	
  1260		pvmw.address = page_address_in_vma(folio, folio_page(folio, 0), vma);
  1261		if (pvmw.address == -EFAULT)
  1262			goto out;
  1263	
  1264		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, pvmw.address,
  1265					pvmw.address + PAGE_SIZE);
  1266		mmu_notifier_invalidate_range_start(&range);
  1267	
  1268		if (!page_vma_mapped_walk(&pvmw))
  1269			goto out_mn;
  1270		if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
  1271			goto out_unlock;
  1272		/*
  1273		 * Handle PFN swap entries, such as device-exclusive ones, that
  1274		 * actually map pages: give up just like the next folio_walk would.
  1275		 */
> 1276		if (unlikely(!pte_present(pvmw.pte))
> 1277			goto out_unlock;
  1278	
  1279		anon_exclusive = PageAnonExclusive(&folio->page);
  1280		entry = ptep_get(pvmw.pte);
  1281		if (pte_write(entry) || pte_dirty(entry) ||
  1282		    anon_exclusive || mm_tlb_flush_pending(mm)) {
  1283			swapped = folio_test_swapcache(folio);
  1284			flush_cache_page(vma, pvmw.address, folio_pfn(folio));
  1285			/*
  1286			 * Ok this is tricky, when get_user_pages_fast() run it doesn't
  1287			 * take any lock, therefore the check that we are going to make
  1288			 * with the pagecount against the mapcount is racy and
  1289			 * O_DIRECT can happen right after the check.
  1290			 * So we clear the pte and flush the tlb before the check
  1291			 * this assure us that no O_DIRECT can happen after the check
  1292			 * or in the middle of the check.
  1293			 *
  1294			 * No need to notify as we are downgrading page table to read
  1295			 * only not changing it to point to a new page.
  1296			 *
  1297			 * See Documentation/mm/mmu_notifier.rst
  1298			 */
  1299			entry = ptep_clear_flush(vma, pvmw.address, pvmw.pte);
  1300			/*
  1301			 * Check that no O_DIRECT or similar I/O is in progress on the
  1302			 * page
  1303			 */
  1304			if (folio_mapcount(folio) + 1 + swapped != folio_ref_count(folio)) {
  1305				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1306				goto out_unlock;
  1307			}
  1308	
  1309			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
  1310			if (anon_exclusive &&
  1311			    folio_try_share_anon_rmap_pte(folio, &folio->page)) {
  1312				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1313				goto out_unlock;
  1314			}
  1315	
  1316			if (pte_dirty(entry))
  1317				folio_mark_dirty(folio);
  1318			entry = pte_mkclean(entry);
  1319	
  1320			if (pte_write(entry))
  1321				entry = pte_wrprotect(entry);
  1322	
  1323			set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1324		}
  1325		*orig_pte = entry;
  1326		err = 0;
  1327	
  1328	out_unlock:
  1329		page_vma_mapped_walk_done(&pvmw);
  1330	out_mn:
  1331		mmu_notifier_invalidate_range_end(&range);
  1332	out:
  1333		return err;
  1334	}
  1335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
