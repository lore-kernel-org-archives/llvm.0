Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7ED7F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651600463; x=1683136463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ZUxORY7E9pTc8VQk5ZIDZ4Nj1kqBgVR34mX3h+A7rw=;
  b=iMUdmNnZiD8egRNsSx1Oys/ROOGEnMgImhx5skZ/F6/ZRqG9xvLtexus
   lm0fqNXhvomAR0r0eiAhVtAA55GCk76ruQAYLVU553pp0SIv6rHi2hlC2
   fXUMgAgReT+YoGhi3tZqdvZPT2z54tUF8MxKHkyM5xQyyI9klh5Dk07jW
   WQg651NqhAen6miIlet22KbmXPSA8C2NEwAka+PQpxE3RR98x6jlW9fJO
   XH9Fk1mC/6e/cusgAwvGaKUDHDJfjIhDQgvP543FqhLBTF49S2oImiMTa
   XN9X2gqv27j5qlqCN1RSAlfIwwkH1ukmYhNfNJZthX4+ezZduABrRZ46l
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267138840"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="267138840"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 10:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="653363775"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 May 2022 10:54:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlwj5-000Ag5-RG;
	Tue, 03 May 2022 17:54:19 +0000
Date: Wed, 4 May 2022 01:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7457/8237] mm/shmem.c:721:20: error: call to
 __compiletime_assert_289 declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202205040154.R7lMeKvs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
commit: 9a44f3462edc490370e1ac6f0dbc9266f32b39be [7457/8237] mm/shmem: convert shmem_add_to_page_cache to take a folio
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220504/202205040154.R7lMeKvs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9a44f3462edc490370e1ac6f0dbc9266f32b39be
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9a44f3462edc490370e1ac6f0dbc9266f32b39be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/shmem.c:721:20: error: call to __compiletime_assert_289 declared with 'error' attribute: BUILD_BUG failed
                                   count_vm_event(THP_FILE_FALLBACK);
                                                  ^
   include/linux/vm_event_item.h:148:30: note: expanded from macro 'THP_FILE_FALLBACK'
   #define THP_FILE_FALLBACK ({ BUILD_BUG(); 0; })
                                ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:225:1: note: expanded from here
   __compiletime_assert_289
   ^
   mm/shmem.c:743:19: error: call to __compiletime_assert_291 declared with 'error' attribute: BUILD_BUG failed
                           count_vm_event(THP_FILE_ALLOC);
                                          ^
   include/linux/vm_event_item.h:147:27: note: expanded from macro 'THP_FILE_ALLOC'
   #define THP_FILE_ALLOC ({ BUILD_BUG(); 0; })
                             ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:231:1: note: expanded from here
   __compiletime_assert_291
   ^
   2 errors generated.


vim +/error +721 mm/shmem.c

5a6e75f8110c97e Kirill A. Shutemov      2016-07-26  695  
46f65ec15c6878a Hugh Dickins            2011-08-03  696  /*
46f65ec15c6878a Hugh Dickins            2011-08-03  697   * Like add_to_page_cache_locked, but error if expected item has gone.
46f65ec15c6878a Hugh Dickins            2011-08-03  698   */
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  699) static int shmem_add_to_page_cache(struct folio *folio,
46f65ec15c6878a Hugh Dickins            2011-08-03  700  				   struct address_space *mapping,
3fea5a499d57dec Johannes Weiner         2020-06-03  701  				   pgoff_t index, void *expected, gfp_t gfp,
3fea5a499d57dec Johannes Weiner         2020-06-03  702  				   struct mm_struct *charge_mm)
46f65ec15c6878a Hugh Dickins            2011-08-03  703  {
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  704) 	XA_STATE_ORDER(xas, &mapping->i_pages, index, folio_order(folio));
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  705) 	long nr = folio_nr_pages(folio);
3fea5a499d57dec Johannes Weiner         2020-06-03  706  	int error;
46f65ec15c6878a Hugh Dickins            2011-08-03  707  
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  708) 	VM_BUG_ON_FOLIO(index != round_down(index, nr), folio);
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  709) 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  710) 	VM_BUG_ON_FOLIO(!folio_test_swapbacked(folio), folio);
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  711) 	VM_BUG_ON(expected && folio_test_large(folio));
46f65ec15c6878a Hugh Dickins            2011-08-03  712  
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  713) 	folio_ref_add(folio, nr);
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  714) 	folio->mapping = mapping;
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  715) 	folio->index = index;
46f65ec15c6878a Hugh Dickins            2011-08-03  716  
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  717) 	if (!folio_test_swapcache(folio)) {
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  718) 		error = mem_cgroup_charge(folio, charge_mm, gfp);
3fea5a499d57dec Johannes Weiner         2020-06-03  719  		if (error) {
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  720) 			if (folio_test_large(folio)) {
3fea5a499d57dec Johannes Weiner         2020-06-03 @721  				count_vm_event(THP_FILE_FALLBACK);
3fea5a499d57dec Johannes Weiner         2020-06-03  722  				count_vm_event(THP_FILE_FALLBACK_CHARGE);
3fea5a499d57dec Johannes Weiner         2020-06-03  723  			}
3fea5a499d57dec Johannes Weiner         2020-06-03  724  			goto error;
3fea5a499d57dec Johannes Weiner         2020-06-03  725  		}
4c6355b25e8bb83 Johannes Weiner         2020-06-03  726  	}
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  727) 	folio_throttle_swaprate(folio, gfp);
3fea5a499d57dec Johannes Weiner         2020-06-03  728  
552446a4166189a Matthew Wilcox          2017-12-01  729  	do {
552446a4166189a Matthew Wilcox          2017-12-01  730  		xas_lock_irq(&xas);
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  731) 		if (expected != xas_find_conflict(&xas)) {
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  732) 			xas_set_err(&xas, -EEXIST);
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  733) 			goto unlock;
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  734) 		}
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  735) 		if (expected && xas_find_conflict(&xas)) {
552446a4166189a Matthew Wilcox          2017-12-01  736  			xas_set_err(&xas, -EEXIST);
552446a4166189a Matthew Wilcox          2017-12-01  737  			goto unlock;
800d8c63b2e989c Kirill A. Shutemov      2016-07-26  738  		}
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  739) 		xas_store(&xas, folio);
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  740) 		if (xas_error(&xas))
6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  741) 			goto unlock;
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  742) 		if (folio_test_large(folio)) {
800d8c63b2e989c Kirill A. Shutemov      2016-07-26  743  			count_vm_event(THP_FILE_ALLOC);
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  744) 			__lruvec_stat_mod_folio(folio, NR_SHMEM_THPS, nr);
800d8c63b2e989c Kirill A. Shutemov      2016-07-26  745  		}
800d8c63b2e989c Kirill A. Shutemov      2016-07-26  746  		mapping->nrpages += nr;
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  747) 		__lruvec_stat_mod_folio(folio, NR_FILE_PAGES, nr);
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  748) 		__lruvec_stat_mod_folio(folio, NR_SHMEM, nr);
552446a4166189a Matthew Wilcox          2017-12-01  749  unlock:
552446a4166189a Matthew Wilcox          2017-12-01  750  		xas_unlock_irq(&xas);
552446a4166189a Matthew Wilcox          2017-12-01  751  	} while (xas_nomem(&xas, gfp));
552446a4166189a Matthew Wilcox          2017-12-01  752  
552446a4166189a Matthew Wilcox          2017-12-01  753  	if (xas_error(&xas)) {
3fea5a499d57dec Johannes Weiner         2020-06-03  754  		error = xas_error(&xas);
3fea5a499d57dec Johannes Weiner         2020-06-03  755  		goto error;
46f65ec15c6878a Hugh Dickins            2011-08-03  756  	}
552446a4166189a Matthew Wilcox          2017-12-01  757  
552446a4166189a Matthew Wilcox          2017-12-01  758  	return 0;
3fea5a499d57dec Johannes Weiner         2020-06-03  759  error:
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  760) 	folio->mapping = NULL;
9a44f3462edc490 Matthew Wilcox (Oracle  2022-04-29  761) 	folio_ref_sub(folio, nr);
3fea5a499d57dec Johannes Weiner         2020-06-03  762  	return error;
46f65ec15c6878a Hugh Dickins            2011-08-03  763  }
46f65ec15c6878a Hugh Dickins            2011-08-03  764  

:::::: The code at line 721 was first introduced by commit
:::::: 3fea5a499d57dec46043fcdb08e38eac1767bb0d mm: memcontrol: convert page cache to a new mem_cgroup_charge() API

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
