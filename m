Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63AE31ED60;
	Thu, 15 Jan 2026 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506376; cv=none; b=lfAT6wFRDFTyNpJPpyWuYVQvI0Do8Z/Q1wROcADBoL0/RYwQlfDp4mQkdVN4ZhP2ZVjrsaQaxyEvgkiR6jWHyhD1Yah5pb5+PjldajA9sYPFrozq3k9SmKuZ0D3KiMJlj1l9gsMpTdRq/KgZJUbcosLhpScVKirkblWLuW1UoRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506376; c=relaxed/simple;
	bh=yY5jVs5Iyr6QcT0oMRKQdxyVWj3aAXdV6QZbIUqVrN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+wuwIpBS6axNyPBcToH8Aj0DRWmzk6+FWaaK1dzo8UkGufClZKQS5WrltuHNfDxXm++E0l5uP+YRI9fHK1dgLl55VcTJdzsryAqD1v0CxtWmqEuPoZ9kiPDaypzMgBgEdmX0dqWyvsd9nlDSQkiLUh8eSugYjwudjg2FoWPcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHqWGKz+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHqWGKz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768506374; x=1800042374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yY5jVs5Iyr6QcT0oMRKQdxyVWj3aAXdV6QZbIUqVrN8=;
  b=cHqWGKz+4cb+6cYPMFw8DW2pXI0KH+yauncPDhCJJJHmdGsWGaWoJmHF
   NkIEHvukUN0dXFisoFbM//DklT1fIQvwbbGQidPlThaIGAbTXn8w+0DF4
   q4jbAdt8Pqe67rqznq0GKlO/4+ie+gArZN7kSkT8VPZ183XLIxkpnsdCh
   EZymXDPWPSHZdVCTwPRUDP68irjJsJUk73UwOgpZMuakvmwilcil0wM5u
   e1dXRYO0k6mowpXss9uQUI4TRjQoklIt1ElHQJW2bXOsx/acNdW6trcV6
   cM4BxJUKKc2zBHxazxNprPz+nEXq1FXdPnVmSwNQslx9oCwOHyZMCccHE
   Q==;
X-CSE-ConnectionGUID: x6ss/HsERVybSZCKSg2R/A==
X-CSE-MsgGUID: GBlRfrcZR/6Qs6v1HFLwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80539918"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80539918"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 11:46:13 -0800
X-CSE-ConnectionGUID: Yq/rEuGqSR2Aqfz0bKJfqQ==
X-CSE-MsgGUID: F+ilt//VQnGK/aR84+3rpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="205454283"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jan 2026 11:46:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgTIH-00000000Jvs-3qdM;
	Thu, 15 Jan 2026 19:46:09 +0000
Date: Fri, 16 Jan 2026 03:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/3] sched: add helpers for numa balancing
Message-ID: <202601160334.Vyku6d9c-lkp@intel.com>
References: <20260113121238.11300-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113121238.11300-2-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/sched-add-helpers-for-numa-balancing/20260113-201425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260113121238.11300-2-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 1/3] sched: add helpers for numa balancing
config: hexagon-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160334.Vyku6d9c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160334.Vyku6d9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160334.Vyku6d9c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate.c:806:6: error: call to undeclared function 'task_numab_mode_tiering'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     806 |         if (task_numab_mode_tiering()) {
         |             ^
   1 error generated.
--
>> mm/vmscan.c:4847:9: error: call to undeclared function 'task_numab_mode_tiering'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4847 |         mark = task_numab_mode_tiering() ? WMARK_PROMO : WMARK_HIGH;
         |                ^
   mm/vmscan.c:6776:7: error: call to undeclared function 'task_numab_mode_tiering'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6776 |                 if (task_numab_mode_tiering())
         |                     ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]


vim +/task_numab_mode_tiering +806 mm/migrate.c

   756	
   757	/*
   758	 * Copy the flags and some other ancillary information
   759	 */
   760	void folio_migrate_flags(struct folio *newfolio, struct folio *folio)
   761	{
   762		int cpupid;
   763	
   764		if (folio_test_referenced(folio))
   765			folio_set_referenced(newfolio);
   766		if (folio_test_uptodate(folio))
   767			folio_mark_uptodate(newfolio);
   768		if (folio_test_clear_active(folio)) {
   769			VM_BUG_ON_FOLIO(folio_test_unevictable(folio), folio);
   770			folio_set_active(newfolio);
   771		} else if (folio_test_clear_unevictable(folio))
   772			folio_set_unevictable(newfolio);
   773		if (folio_test_workingset(folio))
   774			folio_set_workingset(newfolio);
   775		if (folio_test_checked(folio))
   776			folio_set_checked(newfolio);
   777		/*
   778		 * PG_anon_exclusive (-> PG_mappedtodisk) is always migrated via
   779		 * migration entries. We can still have PG_anon_exclusive set on an
   780		 * effectively unmapped and unreferenced first sub-pages of an
   781		 * anonymous THP: we can simply copy it here via PG_mappedtodisk.
   782		 */
   783		if (folio_test_mappedtodisk(folio))
   784			folio_set_mappedtodisk(newfolio);
   785	
   786		/* Move dirty on pages not done by folio_migrate_mapping() */
   787		if (folio_test_dirty(folio))
   788			folio_set_dirty(newfolio);
   789	
   790		if (folio_test_young(folio))
   791			folio_set_young(newfolio);
   792		if (folio_test_idle(folio))
   793			folio_set_idle(newfolio);
   794	
   795		folio_migrate_refs(newfolio, folio);
   796		/*
   797		 * Copy NUMA information to the new page, to prevent over-eager
   798		 * future migrations of this same page.
   799		 */
   800		cpupid = folio_xchg_last_cpupid(folio, -1);
   801		/*
   802		 * For memory tiering mode, when migrate between slow and fast
   803		 * memory node, reset cpupid, because that is used to record
   804		 * page access time in slow memory node.
   805		 */
 > 806		if (task_numab_mode_tiering()) {
   807			bool f_toptier = node_is_toptier(folio_nid(folio));
   808			bool t_toptier = node_is_toptier(folio_nid(newfolio));
   809	
   810			if (f_toptier != t_toptier)
   811				cpupid = -1;
   812		}
   813		folio_xchg_last_cpupid(newfolio, cpupid);
   814	
   815		folio_migrate_ksm(newfolio, folio);
   816		/*
   817		 * Please do not reorder this without considering how mm/ksm.c's
   818		 * ksm_get_folio() depends upon ksm_migrate_page() and the
   819		 * swapcache flag.
   820		 */
   821		if (folio_test_swapcache(folio))
   822			folio_clear_swapcache(folio);
   823		folio_clear_private(folio);
   824	
   825		/* page->private contains hugetlb specific flags */
   826		if (!folio_test_hugetlb(folio))
   827			folio->private = NULL;
   828	
   829		/*
   830		 * If any waiters have accumulated on the new page then
   831		 * wake them up.
   832		 */
   833		if (folio_test_writeback(newfolio))
   834			folio_end_writeback(newfolio);
   835	
   836		/*
   837		 * PG_readahead shares the same bit with PG_reclaim.  The above
   838		 * end_page_writeback() may clear PG_readahead mistakenly, so set the
   839		 * bit after that.
   840		 */
   841		if (folio_test_readahead(folio))
   842			folio_set_readahead(newfolio);
   843	
   844		folio_copy_owner(newfolio, folio);
   845		pgalloc_tag_swap(newfolio, folio);
   846	
   847		mem_cgroup_migrate(folio, newfolio);
   848	}
   849	EXPORT_SYMBOL(folio_migrate_flags);
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
