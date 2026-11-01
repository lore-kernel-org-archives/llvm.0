Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502108;
	b=KyqXSAM/68OqpeD6okJ5WVxZqk2B8untRtSqOyViVaNIZdc8oeK6fZhtmDMw5snCqgsM
	 CY2myBMH3IShCEBmKkhWYV2q9chfbGP/mSxJZnrbcOE3WzEBBIt9ul44FGEhYa0e3EFGh
	 6G2ubMUiVbYlEOiX6yvrjq7hNEQNkpjuQADwEBqnUsw0UdApCurU5kvvb3WsKT8Ry/XYc
	 iHIxEwBx8r20Z7GsACn9Zth5Ud5L3DkJsl5hc1r8TG5pWlZDqp553S0ZM/9gq8I7OxKzt
	 tauqu/PjGioZANy9UHEFA3M6yWkf54LHWY/6l0+rI/tw1dZfaGGjcxIAE0MBMHfr4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502108;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nzAg8fpspQHyUhk9/QhfvYiWPKI9kB9a6y3oMgwZdKE=;
	b=yoKCNxzR3jz1ziN8KcUC+0jwcuz+RgPVbsuwRLgt2+cTWsCZJl71zPX42RfZO+8mMeM1
	 6yomXqdKuW/Q0px2zX30w5vb6KCJfggcpIneuAKQ2fKBsNAPnyhg/L7c8/Rfh5saH7SXP
	 dDaV4MJxN7NH5YYCMYxG1bezNogc+QI7f05WAOc0Jf3J7wckwS1AFnAEZWupK4zy3CrrA
	 98/eciSbFY5y8hnkJqv8PbeBOLtkkSwn7A0dsD1+lyYo9nMuz3PNfBtm9N4ZL46n+2d9B
	 icfuZe3Vy2GUABcPEdHbeAmajtnR14IHLUvHjA+4qg2xmsGpH0/zInMZm8ZuBBPWBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=di1Ql5xR;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907EF606A324;
	Sun,  1 Nov 2026 03:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=di1Ql5xR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793502107; x=1825038107;
  h=date:from:to:cc:subject:message-id;
  bh=P0kE4xn8IWss1f7dHyL876FE1vXHbY4ApV7j3ZNaLQE=;
  b=di1Ql5xRq8y9vvu5/oIdW+Akxik50tS1W4yJMdKEkDOKHVPbrGEXiV7w
   Bca8CM8BApPfRXmFhsOriQ8Fl5ZafqfpnnoFraram/rGRf7W1PmznU+Hj
   b3P1ZVvLklSvTb97zNZEn+ei8g3Gjb1GUUZbRcBB58mknqlhxnSgFcvvC
   bkH0+Oy4+dPiDAuE4xTaVt77y6xikBxRkgW389Es8VYW7WDbrq/Ydr035
   fzXUGIyn4NmIowsTyaBXETRMaJ/r7aT+6AMTa2B5RRKLMv2PXbjKj3vC7
   Y8X+azPXh+e6xhFSeCc/RxJced7GMBL1hwDUVy1DkEnucbbpo+a9VqsjI
   w==;
X-CSE-ConnectionGUID: JNz2jjZXSe6WFl3DgKzSdg==
X-CSE-MsgGUID: 2IhrcL6wSo6inYAdjfSGUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2215658"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2215658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 20:01:47 -0700
X-CSE-ConnectionGUID: bbCRNhUIQ+ChFdSQGc1/4A==
X-CSE-MsgGUID: YYDy/mOeRxq/8GjLybddNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5792434"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2026 20:01:44 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNLpE-000000006Jn-1CHs;
	Sun, 01 Nov 2026 03:01:40 +0000
Date: Sun, 01 Nov 2026 04:00:40 +0100
From: kernel test robot <lkp@intel.com>
To: SJ Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 41/139] mm/damon/vaddr.c:891:35: error: too
 few arguments to function call, expected 2, have 1
Message-ID: <202611010353.NDt2ru5X-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   7004d750fdd0fe580091136ef098fba296e51863
commit: 046c68e46b042453c4cdbd909eb4dc448dde6325 [41/139] mm/damon/vaddr: use damos->last_applied for migrate action
config: arm64-randconfig-2000-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010353.NDt2ru5X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010353.NDt2ru5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010353.NDt2ru5X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/damon/vaddr.c:891:35: error: too few arguments to function call, expected 2, have 1
     891 |                 if (damos_va_invalid_folio(folio))
         |                     ~~~~~~~~~~~~~~~~~~~~~~      ^
   mm/damon/vaddr.c:840:20: note: 'damos_va_invalid_folio' declared here
     840 | static inline bool damos_va_invalid_folio(struct folio *folio,
         |                    ^                      ~~~~~~~~~~~~~~~~~~~~
     841 |                 struct damos *s)
         |                 ~~~~~~~~~~~~~~~
   1 error generated.


vim +891 mm/damon/vaddr.c

   877	
   878		start_pte = pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
   879		if (!pte)
   880			return 0;
   881	
   882		for (; addr < next; pte += nr, addr += nr * PAGE_SIZE) {
   883			unsigned long page_idx;
   884	
   885			nr = 1;
   886			ptent = ptep_get(pte);
   887	
   888			if (pte_none(ptent) || !pte_present(ptent))
   889				continue;
   890			folio = vm_normal_folio(walk->vma, addr, ptent);
 > 891			if (damos_va_invalid_folio(folio))
   892				continue;
   893			page_idx = folio_page_idx(folio, pte_page(ptent));
   894			nr = folio_nr_pages(folio) - page_idx;
   895			if (damos_va_filter_out(s, folio, walk->vma, addr, pte, NULL))
   896				continue;
   897			s->last_applied = folio;
   898			damos_va_migrate_dests_add(folio, walk->vma, addr, s,
   899					migration_lists);
   900		}
   901		pte_unmap_unlock(start_pte, ptl);
   902		return 0;
   903	}
   904	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
