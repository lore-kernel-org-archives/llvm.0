Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3C26ED46;
	Thu, 21 May 2026 02:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779329815; cv=none; b=qq2QUAMlPtHZI7gBQ7XgGuVuJUtbX1mLnki0Gy60HpIGMIF40ODt+leTy5/RHCfIQSPl0StqnyVkvDBJLAhawH+MqPJt1zCuu3qbUq8D+2ax4cN6QH+qnTzwRl6ut+OJqpGpuRqZxtbiILADbIldx5WjVq37y/VgjFPM0QCOQv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779329815; c=relaxed/simple;
	bh=YgMaS8iXUDKYiWxpH5bkgIlo+a3DLBFIKe8k4wt/Z3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hrkP31+OPcZtm5lk8waqVCGYDpUv6YPrPm1hd9U6QZ5Of0qpNNkSbq18DqzzGQGfCa8vn5bThMg++RXyhKvvjs5WuvDE6DMzvrROFy9ITvanqAzVacUynEXzAQYYYPlmv4WvPLn3rPOtXnZkTzGPQLSKo7YX5jmkhqJsL+kGjRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgW+3RPU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgW+3RPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779329812; x=1810865812;
  h=date:from:to:cc:subject:message-id;
  bh=YgMaS8iXUDKYiWxpH5bkgIlo+a3DLBFIKe8k4wt/Z3k=;
  b=VgW+3RPUjUXceKyCZvgmayvGLxw5iWkW53du+pjO/mYCZEvhieP/GpNH
   t9lDw4/8fssKqmTmGb9D/3hhwVBFlc3e4Jo0oZ/kL/No7vJnieeE6Ipe5
   xJLjU2cMjNA7KxtmWIzxDBxQvaUUmcLavaEzj5dEvnOwHYLNR5MZXU+hi
   bdyl5Jh8JfAEjJNxCVZt7kvpaBKNqg6KHfaB9gs2Nqcks3jiW1W2Yb7hx
   0uOKeSCXvyYz5XkNPuh1cYM6Otqkxl2sBz3Hbf/h8L2DsYEaGC9QvSn6O
   i5y9LnIZAEAEBOQnrLyoXyUz2270PgbJRhvAQUFP77ukzw1qexP/TSCV4
   A==;
X-CSE-ConnectionGUID: KjEwWXcLQ4moNQfIEnWDZg==
X-CSE-MsgGUID: oZbgGfsZQgyljwH1BoOneQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84098733"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84098733"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 19:16:50 -0700
X-CSE-ConnectionGUID: v0LLptEiTT2Wsy33XspX2g==
X-CSE-MsgGUID: 6NnVKLodQwCn/YGAnRQrIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="245412137"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2026 19:16:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPsxq-00000000Ajx-3BlA;
	Thu, 21 May 2026 02:16:46 +0000
Date: Thu, 21 May 2026 04:15:52 +0200
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/page_alloc.c:1622:6: warning: variable 'absorbed' set but
 not used
Message-ID: <202605210415.FsU4y41p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260520-231340
head:   f078b5654577f53b34108d1196286629a290924b
commit: 23db14d962cca7a2a4f4baab0e80c0b410c6c93f mm: page_alloc: split-path PCP free with local-trylock + remote-llist
date:   11 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260521/202605210415.FsU4y41p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210415.FsU4y41p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210415.FsU4y41p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:1622:6: warning: variable 'absorbed' set but not used [-Wunused-but-set-variable]
    1622 |         int absorbed = 0;
         |             ^
   1 warning generated.


vim +/absorbed +1622 mm/page_alloc.c

  1607	
  1608	/*
  1609	 * Absorb pages remotely freed into this CPU's pageblocks. Remote freers
  1610	 * push pages onto pcp->free_llist lock-free (no remote PCP lock taken);
  1611	 * the owning CPU pulls them onto its PCP buddy lists here, where they
  1612	 * become eligible for normal merging on the next free_pcppages_bulk()
  1613	 * pass.
  1614	 *
  1615	 * Called with pcp->lock held. Must be cheap on the empty path; the
  1616	 * llist_empty() check is the fast-path bail-out.
  1617	 */
  1618	static void absorb_remote_frees(struct per_cpu_pages *pcp)
  1619	{
  1620		struct llist_node *node;
  1621		struct page *p, *tmp;
> 1622		int absorbed = 0;
  1623	
  1624		if (likely(llist_empty(&pcp->free_llist)))
  1625			return;
  1626	
  1627		node = llist_del_all(&pcp->free_llist);
  1628		llist_for_each_entry_safe(p, tmp, node, pcp_llist) {
  1629			unsigned long pfn = page_to_pfn(p);
  1630			unsigned int order = pcp_buddy_order(p);
  1631			int mt = pbd_migratetype(pfn_to_pageblock(p, pfn));
  1632	
  1633			if (unlikely(mt >= MIGRATE_PCPTYPES))
  1634				mt = MIGRATE_MOVABLE;
  1635	
  1636			/*
  1637			 * Pages on the llist came from pageblocks owned by this CPU
  1638			 * (that's how the freer picked our llist), so they are
  1639			 * eligible for PCP-buddy merging.
  1640			 */
  1641			__SetPagePCPBuddy(p);
  1642			pcp_enqueue(pcp, p, mt, order);
  1643			absorbed += 1 << order;
  1644		}
  1645	}
  1646	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
