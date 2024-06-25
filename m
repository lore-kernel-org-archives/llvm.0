Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B71369B6;
	Tue, 25 Jun 2024 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719351621; cv=none; b=Z0iseOpynR+z0NUeuLt8xVHsMDM3wFQsqw+lHDVYl+6UbwYB31bf4yKdPdD1OPe4GGpjBnI6XpRMAmwE6ahzf0NEm8sRNF7sG0u8HLnMqAKWNCQrKwQ3PldmKNTLnICo8c841nUGj3nwVhHOY0XbFsHQqf9ZhhoM5uy0WiwYBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719351621; c=relaxed/simple;
	bh=4CuI0zn5qDU7kvuxIfsMENvPOOdkxgWMFGgPT64J8JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2dh6Cb59DHnMcqpNUq6FI+IZ+If8KVuXlbJIwLTiN4PCfnMiFQ6+GBfVSSLejFo4xDUVhAn1iRkYueutR3hxsgDuQe064ggoPJuKlWXK45oHsxU1bmz8OtzlE9yLcbSr3UHf0lehkE/WFrWHITxnh5lCFrYlHzqeJybnSH1DE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAJ4HH5D; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAJ4HH5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719351620; x=1750887620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CuI0zn5qDU7kvuxIfsMENvPOOdkxgWMFGgPT64J8JQ=;
  b=YAJ4HH5DnKavg2Jt8jQTUOT2mqckMAULoxuI/WOt8S+ghE5PHqJlO+Ig
   mAF9Aw0nw2zJk/xNIpLI1qtCVyhhsP2ySTkYK4XZup20o4vAxdbsmCFOf
   nQFeTRwKAXXO9VwQrWDmlhhAj+Lcyop+PRd9UubYso+itH89hzzcaMKn8
   cxH3cuLMDl3lH8/KBx89hSQhLdkLPBGh3Y7Qxv9Nqq4vZiRJy0qPFYcRG
   030JThFrbmBRbve+iV3Tt5693DiJLmVdHPLVKDCdak0pBGxwhpjyXBDar
   NLE7svA6I0y+gM1zmqgu0t+M+foZVqoREa+Tbrg44o1+P3EJ+UVcqITjy
   w==;
X-CSE-ConnectionGUID: Qc/rUf4JSX+u04RO7psrCg==
X-CSE-MsgGUID: up/Vvl2IQmmGVPL/AM0aJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33932215"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="33932215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 14:40:19 -0700
X-CSE-ConnectionGUID: 5ma3NtVwQmWOlqtFnqTF2g==
X-CSE-MsgGUID: j2mi259JTAmuKcengYspeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48367260"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2024 14:40:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMDtf-000EkI-0V;
	Tue, 25 Jun 2024 21:40:15 +0000
Date: Wed, 26 Jun 2024 05:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7701/8232] mm/huge_memory.c:2735:31: warning:
 variable 'page' is uninitialized when used here
Message-ID: <202406260514.SLhNM9kQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 4627108658d68fad359600dbe667b88b501cee71 [7701/8232] mm/vmscan: avoid split lazyfree THP during shrink_folio_list()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240626/202406260514.SLhNM9kQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260514.SLhNM9kQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260514.SLhNM9kQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:2735:31: warning: variable 'page' is uninitialized when used here [-Wuninitialized]
    2735 |         folio_remove_rmap_pmd(folio, page, vma);
         |                                      ^~~~
   mm/huge_memory.c:2699:19: note: initialize the variable 'page' to silence this warning
    2699 |         struct page *page;
         |                          ^
         |                           = NULL
   1 warning generated.


vim +/page +2735 mm/huge_memory.c

  2691	
  2692	static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
  2693						    unsigned long addr, pmd_t *pmdp,
  2694						    struct folio *folio)
  2695	{
  2696		struct mm_struct *mm = vma->vm_mm;
  2697		int ref_count, map_count;
  2698		pmd_t orig_pmd = *pmdp;
  2699		struct page *page;
  2700	
  2701		if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
  2702			return false;
  2703	
  2704		orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
  2705	
  2706		/*
  2707		 * Syncing against concurrent GUP-fast:
  2708		 * - clear PMD; barrier; read refcount
  2709		 * - inc refcount; barrier; read PMD
  2710		 */
  2711		smp_mb();
  2712	
  2713		ref_count = folio_ref_count(folio);
  2714		map_count = folio_mapcount(folio);
  2715	
  2716		/*
  2717		 * Order reads for folio refcount and dirty flag
  2718		 * (see comments in __remove_mapping()).
  2719		 */
  2720		smp_rmb();
  2721	
  2722		/*
  2723		 * If the folio or its PMD is redirtied at this point, or if there
  2724		 * are unexpected references, we will give up to discard this folio
  2725		 * and remap it.
  2726		 *
  2727		 * The only folio refs must be one from isolation plus the rmap(s).
  2728		 */
  2729		if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
  2730		    ref_count != map_count + 1) {
  2731			set_pmd_at(mm, addr, pmdp, orig_pmd);
  2732			return false;
  2733		}
  2734	
> 2735		folio_remove_rmap_pmd(folio, page, vma);
  2736		zap_deposited_table(mm, pmdp);
  2737		add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
  2738		if (vma->vm_flags & VM_LOCKED)
  2739			mlock_drain_local();
  2740		folio_put(folio);
  2741	
  2742		return true;
  2743	}
  2744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
