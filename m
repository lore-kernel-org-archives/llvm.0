Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764BF194ACA;
	Sat, 14 Dec 2024 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197918; cv=none; b=uyOhhc/+9wGx2/uQMQ5noS8Xnqokxy2mOL5Jl/0udByBNTb5PoxM7WSkCjVsbL/ToNHeU0OlrrVq32jWv+D6BK1hTY1bJgNfHTbNnBkZbDq7JvbqM03rpcOEr1GaXk7/B2Gs78mBJ2o6+wD9Dr4NPfAoKqjFxJxJhQSs3l208gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197918; c=relaxed/simple;
	bh=x6S1ln/zNyMJscykjzLbnadFyfPafbr4UY2oSg59Wpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R69EPogUiA0O6xTHaOqi6ZEPN0dfn+MERtv4DkmsbhgSBLz6zcmy5Q89rJEKEijY+o7CvMbiyVw4u8VO5qJ4Lu9cTFpdTxmshbIBgMok4ZKJQVfY5ZBr57yrAu5RoYWxF57i82ASgtiHn9L6ggWDjBf/MRJC0t1T6Yy0qM/hwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl73JTY0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl73JTY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734197916; x=1765733916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6S1ln/zNyMJscykjzLbnadFyfPafbr4UY2oSg59Wpg=;
  b=Fl73JTY0lrypnPk7o1+EORRd0T2bIjaZuW5p7hPj5T/UkGS4cbS5Tqa6
   UnNgdn+g9AIZwCBHvsB0y4lOlvBmruZ/8Nqm0NbqEtNnu8j1eu2xn587J
   +WPC6S3fhjsEGgIp++lzSxvLtAR5LyJOcldLrEEmqt9s33c/gezLwSHCM
   Hjm4nvH7b3WKk/KjMEYjMjP5kv0ZViYPy+yidpl5j0RHJa8CnNb6Q4/c6
   /5cCIW8CsDsn6NjYczN2unKlaCToroUHzyZSHfy25pJZC+J5ak4E9srEM
   kNUBoFLVATjUsbOQmCVdMCLTyDyTN+rwIHnVp3ypL3YzlDsiy3RZjsoZC
   Q==;
X-CSE-ConnectionGUID: ILw30hAITZmKj3Na1j9JMA==
X-CSE-MsgGUID: wdp+lVDETVeKgPoTkyxn7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34867275"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34867275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:38:36 -0800
X-CSE-ConnectionGUID: 5fWTWWh8Qj6jf6z7hd4KsA==
X-CSE-MsgGUID: I0b5ZM63Tsi7sVhQ30mOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101908940"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2024 09:38:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMW64-000D6X-0x;
	Sat, 14 Dec 2024 17:38:32 +0000
Date: Sun, 15 Dec 2024 01:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id 9/17] include/linux/rmap.h:203:50: warning:
 result of comparison of constant -1 with expression of type 'mm_mapcount_t'
 (aka 'unsigned short') is always true
Message-ID: <202412150157.TEmGpTYe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id
head:   4450db81511279bd8a750c7f19e7d02dd6661c05
commit: 308ab7ba6c2cfcd257b50194361b89b82a4c2346 [9/17] mm/rmap: initial MM owner tracking for large folios (!hugetlb)
config: i386-buildonly-randconfig-004-20241214 (https://download.01.org/0day-ci/archive/20241215/202412150157.TEmGpTYe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150157.TEmGpTYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150157.TEmGpTYe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:46:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from kernel/fork.c:71:
>> include/linux/rmap.h:203:50: warning: result of comparison of constant -1 with expression of type 'mm_mapcount_t' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     203 |                 VM_WARN_ON_ONCE(folio->_mm_id_data.mapcount[0] != -1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
   include/linux/mmdebug.h:92:50: note: expanded from macro 'VM_WARN_ON_ONCE'
      92 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                                  ^~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   In file included from kernel/fork.c:71:
   include/linux/rmap.h:204:50: warning: result of comparison of constant -1 with expression of type 'mm_mapcount_t' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     204 |                 VM_WARN_ON_ONCE(folio->_mm_id_data.mapcount[1] != -1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
   include/linux/mmdebug.h:92:50: note: expanded from macro 'VM_WARN_ON_ONCE'
      92 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                                  ^~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   In file included from kernel/fork.c:71:
>> include/linux/rmap.h:244:38: warning: result of comparison of constant -1 with expression of type 'mm_mapcount_t' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     244 |                 if (folio->_mm_id_data.mapcount[0] == -1) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
   include/linux/rmap.h:250:51: warning: result of comparison of constant -1 with expression of type 'mm_mapcount_t' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     250 |                         VM_WARN_ON_ONCE(folio->_mm_id_data.mapcount[1] != -1);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
   include/linux/mmdebug.h:92:50: note: expanded from macro 'VM_WARN_ON_ONCE'
      92 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                                  ^~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   6 warnings generated.


vim +203 include/linux/rmap.h

   194	
   195	static __always_inline void folio_set_large_mapcount(struct folio *folio,
   196			int mapcount, struct vm_area_struct *vma)
   197	{
   198		__folio_large_mapcount_sanity_checks(folio, mapcount, vma->vm_mm->mm_id);
   199	
   200		/* Note: mapcounts start at -1. */
   201		atomic_set(&folio->_large_mapcount, mapcount - 1);
   202		if (IS_ENABLED(CONFIG_64BIT) || folio_large_order(folio) > 1) {
 > 203			VM_WARN_ON_ONCE(folio->_mm_id_data.mapcount[0] != -1);
   204			VM_WARN_ON_ONCE(folio->_mm_id_data.mapcount[1] != -1);
   205			folio->_mm_id_data.mapcount[0] = mapcount - 1;
   206			folio->_mm_id_data.id[0] = vma->vm_mm->mm_id;
   207		}
   208	}
   209	
   210	static __always_inline void folio_add_large_mapcount(struct folio *folio,
   211			int diff, struct vm_area_struct *vma)
   212	{
   213		bool was_exclusive, maybe_shared = false;
   214		const mm_id_t mm_id = vma->vm_mm->mm_id;
   215		int new_mapcount_val;
   216	
   217		folio_lock_large_mapcount(folio);
   218		__folio_large_mapcount_sanity_checks(folio, diff, mm_id);
   219	
   220		new_mapcount_val = atomic_read(&folio->_large_mapcount) + diff;
   221		atomic_set(&folio->_large_mapcount, new_mapcount_val);
   222	
   223		/* order-1 folios on 32bit are maybe share if it wasn't unmapped. */
   224		if (!IS_ENABLED(CONFIG_64BIT) && folio_large_order(folio) == 1) {
   225			if (new_mapcount_val != diff - 1)
   226				folio_set_large_maybe_mapped_shared(folio);
   227			goto unlock;
   228		}
   229	
   230		was_exclusive = !folio_test_large_maybe_mapped_shared(folio);
   231		if (folio->_mm_id_data.id[0] == mm_id) {
   232			folio->_mm_id_data.mapcount[0] += diff;
   233			maybe_shared = folio->_mm_id_data.mapcount[0] ^ new_mapcount_val;
   234		} else if (folio->_mm_id_data.id[1] == mm_id) {
   235			folio->_mm_id_data.mapcount[1] += diff;
   236			maybe_shared = folio->_mm_id_data.mapcount[1] ^ new_mapcount_val;
   237		} else if (was_exclusive) {
   238			/*
   239			 * An MM can only take over a slot if there are no mappings yet
   240			 * or if all mappings belong to one slot ("exclusive"). This
   241			 * makes sure that mappings of a MM are not partially tracked in
   242			 * a slot.
   243			 */
 > 244			if (folio->_mm_id_data.mapcount[0] == -1) {
   245				folio->_mm_id_data.id[0] = mm_id;
   246				/* Note: mapcounts start at -1. */
   247				folio->_mm_id_data.mapcount[0] = diff - 1;
   248				maybe_shared = folio->_mm_id_data.mapcount[0] ^ new_mapcount_val;
   249			} else {
   250				VM_WARN_ON_ONCE(folio->_mm_id_data.mapcount[1] != -1);
   251				folio->_mm_id_data.id[1] = mm_id;
   252				/* Note: mapcounts start at -1. */
   253				folio->_mm_id_data.mapcount[1] = diff - 1;
   254				maybe_shared = true;
   255			}
   256		}
   257	
   258		if (maybe_shared && was_exclusive)
   259			folio_set_large_maybe_mapped_shared(folio);
   260	unlock:
   261		folio_unlock_large_mapcount(folio);
   262	}
   263	#define folio_inc_large_mapcount(folio, vma) \
   264		folio_add_large_mapcount(folio, 1, vma)
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
