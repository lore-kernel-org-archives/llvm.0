Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA43CF68B;
	Thu, 14 May 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795525; cv=none; b=WktZWIWK3aXt40C/UBOwbGlrKjL5ecaW6AYHh26LuN3LH0rY3l2Uu0jCpRPD9+XFYJfjb3hGvkfcYf6lHFn4MtrKCwErI4UzfvMlh744ep6AYDN2DcokBehJyJ3/Kx2OmX6mp3gaKJ+InM+1AV4hOTOKxxIfgEgP+bvCrA8K96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795525; c=relaxed/simple;
	bh=UkTKrranTj/SzaOtR72Qivb3hU7dwNUfnPge/jg73gY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYuF311HX3JIxYWWn/1hyBEUaJ4BLBA7ZJyWaUADQzqtlTXklUSzrwCAGA1O1pnM+F2GcIeFTijr68x6rbg9K8VuSLHUNpBNtoIxDlZoNt08sIWYUCFtNTuZhxlFdmVdWGZUXgyWqhQEUqOe1EldbNFhWI9WXBDEsyV/hr5rwT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7fQGPfJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7fQGPfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778795520; x=1810331520;
  h=date:from:to:cc:subject:message-id;
  bh=UkTKrranTj/SzaOtR72Qivb3hU7dwNUfnPge/jg73gY=;
  b=e7fQGPfJ2gMjsK4LeEp327k7Yp/vi3LCktrSKM1hGqy5V9JwRxpvS2LL
   qFZvqnH1/Sbu6+D1YdMWtr00rOrSfcFoxQT0NkBQQOVFrdlF1SgNFyJ8D
   w9yo1+niHTRMKKyey5CSuF5GJj6RM93+cZCARZDyu+ocRyUaBfe1DVvsN
   pTRi/y6n6NdyFXlDMV1XO59oi+4nF4tIqBAGlFh1zYBNRVfmBBSol80Wq
   RTJhHaaVBVWjQH+MtIO8+r1un0iYLXWPeYEgsnv89sL2D1dQERoHRMa/C
   2fAjmrYeHzJTVa9z5MU0zdtG6/bqgOLjt/634+oQzrR8uqVPdLi5wue0o
   Q==;
X-CSE-ConnectionGUID: 70nfixdYRV+2Gk0RS2pD8w==
X-CSE-MsgGUID: jPnP4bxtSS6OGzTlXH3SEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102422588"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="102422588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:51:56 -0700
X-CSE-ConnectionGUID: R/hyXSnYRZ+ULFRT5Wm2ag==
X-CSE-MsgGUID: GZxKTJIjTmG6eVjloffLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="268850939"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2026 14:51:54 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdwq-000000000BR-2O89;
	Thu, 14 May 2026 21:50:52 +0000
Date: Fri, 15 May 2026 05:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: 
 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error: no
 member named 'rvu_dbg' in 'struct rvu'
Message-ID: <202605150512.NzlWSdCm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66182ca873a4e87b3496eca79d57f86b76d7f52d
commit: 1396771b0b7741d517d591cfb63333d3f97a8f6d octeontx2-af: npc: cn20k: Index management
date:   3 months ago
config: sparc64-randconfig-001-20260515 (https://download.01.org/0day-ci/archive/20260515/202605150512.NzlWSdCm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150512.NzlWSdCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1396771b0b77 ("octeontx2-af: npc: cn20k: Index management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150512.NzlWSdCm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error: no member named 'rvu_dbg' in 'struct rvu'
      25 |         debugfs_remove_recursive(rvu->rvu_dbg.npc);
         |                                  ~~~  ^
   1 error generated.


vim +25 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c

    22	
    23	void npc_cn20k_debugfs_deinit(struct rvu *rvu)
    24	{
  > 25		debugfs_remove_recursive(rvu->rvu_dbg.npc);
    26	}
    27	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
