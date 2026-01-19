Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28CC354AF3;
	Mon, 19 Jan 2026 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814247; cv=none; b=W1506WkSIdzW6f7NZIaEb1oTU6pcgwvc+UxbvrIv5XPaoKRxMsiU5lf7HUB2t0KrJpc0s0fCXrDD6/J3WeB8G9h5kxkEr3/q1bP3dVeLI+/Wfm4I+vHslTuFca1JCxRzYbbvel8w7nBoBo8POEKuuCG0a7i7iI0KeW9poSzzODs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814247; c=relaxed/simple;
	bh=AU9JVoNnfRKsIj4AsW7oSKQlXRJhBnRLc/ccZNkzymE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dgi/k5DhwsQ5uX0t3i2Mg3VnMTCChQRXrqguHULb4/slCxcEvXAQFt4XBgUuwWL72RYonjM8B32hfsCAf2RLLN/pM13pZTU0289RwrirHmG/tOTKeCxztLw6tMDJSKLOvMSak4l1he+47ATwstfP6EBGK4ncCAvUmRbnRaIwzfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEfDHTEP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEfDHTEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768814246; x=1800350246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AU9JVoNnfRKsIj4AsW7oSKQlXRJhBnRLc/ccZNkzymE=;
  b=EEfDHTEP0TBAoqVN8iJns0mfs6X5p6rZE3ORmJxrRwCdIOoWem2EaAwr
   mWtO5yO6jyd3hFsVsjO26Pdf+SYUuAOruFXI7GnOlLZpkrY56cQvBRdWC
   1fynYbd3EMj+EP60ubApFMhnCuhVycox2ok8MLNrv78q7oIbMn5fPKqyk
   1eaH74yyMsqssmhekA+tXTCKVMIXtW5Cn6AVaZv+5T2h/aWeU2azH0tna
   Bay+wmyJva+uSaGxhzH75WeUoBb7aesj92MNKdpK5C2s3QoW4UONnmxtW
   jaPGxI8biXRQUrPd5wu5cI8/itSFuIHqFmElkX2wQv87wNTHHJKsMnacD
   Q==;
X-CSE-ConnectionGUID: aYouTIrRSD2rthjf/2/1jQ==
X-CSE-MsgGUID: Vn9NRsH9RE2lp8Ipv0+8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73881376"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="73881376"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:17:25 -0800
X-CSE-ConnectionGUID: hDP+P3CzSqW+srxROFK3Pg==
X-CSE-MsgGUID: sXSNzcZUQDmRSiM+EyGXIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="206249073"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jan 2026 01:17:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhlNu-00000000Ndd-1Vmo;
	Mon, 19 Jan 2026 09:17:18 +0000
Date: Mon, 19 Jan 2026 17:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Zhiguo Zhou <zhiguo.zhou@intel.com>, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	willy@infradead.org, akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	muchun.song@linux.dev, osalvador@suse.de,
	linux-kernel@vger.kernel.org, tianyou.li@intel.com,
	tim.c.chen@linux.intel.com, gang.deng@intel.com,
	Zhiguo Zhou <zhiguo.zhou@intel.com>
Subject: Re: [PATCH 1/2] mm/filemap: refactor __filemap_add_folio to separate
 critical section
Message-ID: <202601191620.O1a0T02o-lkp@intel.com>
References: <20260119065027.918085-2-zhiguo.zhou@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119065027.918085-2-zhiguo.zhou@intel.com>

Hi Zhiguo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhiguo-Zhou/mm-filemap-refactor-__filemap_add_folio-to-separate-critical-section/20260119-143737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260119065027.918085-2-zhiguo.zhou%40intel.com
patch subject: [PATCH 1/2] mm/filemap: refactor __filemap_add_folio to separate critical section
config: s390-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191620.O1a0T02o-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191620.O1a0T02o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191620.O1a0T02o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/filemap.c:861:2: error: member reference type 'spinlock_t' (aka 'struct spinlock') is not a pointer; did you mean to use '.'?
     861 |         lockdep_assert_held(xas->xa->xa_lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:52: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> mm/filemap.c:861:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
     861 |         lockdep_assert_held(xas->xa->xa_lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:45: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/filemap.c:941:3: error: member reference type 'spinlock_t' (aka 'struct spinlock') is not a pointer; did you mean to use '.'?
     941 |                 lockdep_assert_held(xas->xa->xa_lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:52: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/filemap.c:941:3: error: cannot take the address of an rvalue of type 'struct lockdep_map'
     941 |                 lockdep_assert_held(xas->xa->xa_lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:45: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/filemap.c:944:3: error: member reference type 'spinlock_t' (aka 'struct spinlock') is not a pointer; did you mean to use '.'?
     944 |                 lockdep_assert_not_held(xas->xa->xa_lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:288:17: note: expanded from macro 'lockdep_assert_not_held'
     288 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:52: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/filemap.c:944:3: error: cannot take the address of an rvalue of type 'struct lockdep_map'
     944 |                 lockdep_assert_not_held(xas->xa->xa_lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:288:17: note: expanded from macro 'lockdep_assert_not_held'
     288 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:45: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   6 errors generated.


vim +861 mm/filemap.c

   847	
   848	/*
   849	 * The critical section for storing a folio in an XArray.
   850	 * Context: Expects xas->xa->xa_lock to be held.
   851	 */
   852	static void __filemap_add_folio_xa_locked(struct xa_state *xas,
   853			struct address_space *mapping, struct folio *folio, void **shadowp)
   854	{
   855		bool huge;
   856		long nr;
   857		unsigned int forder = folio_order(folio);
   858		int order = -1;
   859		void *entry, *old = NULL;
   860	
 > 861		lockdep_assert_held(xas->xa->xa_lock);
   862	
   863		huge = folio_test_hugetlb(folio);
   864		nr = folio_nr_pages(folio);
   865	
   866		xas_for_each_conflict(xas, entry) {
   867			old = entry;
   868			if (!xa_is_value(entry)) {
   869				xas_set_err(xas, -EEXIST);
   870				return;
   871			}
   872			/*
   873			 * If a larger entry exists,
   874			 * it will be the first and only entry iterated.
   875			 */
   876			if (order == -1)
   877				order = xas_get_order(xas);
   878		}
   879	
   880		if (old) {
   881			if (order > 0 && order > forder) {
   882				unsigned int split_order = max(forder,
   883						xas_try_split_min_order(order));
   884	
   885				/* How to handle large swap entries? */
   886				BUG_ON(shmem_mapping(mapping));
   887	
   888				while (order > forder) {
   889					xas_set_order(xas, xas->xa_index, split_order);
   890					xas_try_split(xas, old, order);
   891					if (xas_error(xas))
   892						return;
   893					order = split_order;
   894					split_order =
   895						max(xas_try_split_min_order(
   896							    split_order),
   897						    forder);
   898				}
   899				xas_reset(xas);
   900			}
   901			if (shadowp)
   902				*shadowp = old;
   903		}
   904	
   905		xas_store(xas, folio);
   906		if (xas_error(xas))
   907			return;
   908	
   909		mapping->nrpages += nr;
   910	
   911		/* hugetlb pages do not participate in page cache accounting */
   912		if (!huge) {
   913			lruvec_stat_mod_folio(folio, NR_FILE_PAGES, nr);
   914			if (folio_test_pmd_mappable(folio))
   915				lruvec_stat_mod_folio(folio,
   916						NR_FILE_THPS, nr);
   917		}
   918	}
   919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
