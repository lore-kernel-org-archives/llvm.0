Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066BB15253B;
	Fri, 26 Apr 2024 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714141559; cv=none; b=GhKzOi2O6np5Bw2cubboJ9RO0xnYNHFzeYXXkABb06kpEvvIx4Bi7f0tBhLowtjQRL6yjHyoQuftuMfmqgeqHHbptOFzhuDlAbWbo6rwjbzi8lRzQ8OogR/cYgxEhKZF952yGYJWovHqlMv+wNhQcyobFf4uNQJloNfgDq1tAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714141559; c=relaxed/simple;
	bh=FOxXbY04/XnrCXMqvWb1uftEXqf7Fy5BxGfZ+arTFXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpBhTCZPno1MSITV4XscI5sPJlOiSUmbBUKVUbgjpUpW9YzMZS3LL2CFXUoHtZRHfqLi3/zo6FxkGuBYDTxRPSIbc+lyIATE0a2YkhC6+w7JZ//tca/N/qJMKVVTvNXahIS0IyhqSg117tpLmV2G4zBsKrLfpAW+4pjjrLste8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyrxxOZ+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyrxxOZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714141557; x=1745677557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FOxXbY04/XnrCXMqvWb1uftEXqf7Fy5BxGfZ+arTFXk=;
  b=JyrxxOZ+Eq7u7IlqMZe1XZDoLB9Twtdp7/pxti2egsZTuLBwybQDef7+
   jSr3scclNI96xSiQ4MuAX6DrCJQJmYPtYxpGVpRLot9DbFDFuKjFkPJhy
   tl4Cz6knCp6cFG4k5+5t7rpeCPsqimHQ3vBEBwyVXY5y0QJ+TE9ANzphN
   2uBYbkPG1dNbjQzokmOb6bmYWOedrwxAggVi/JqKyFUk6/hBVNHjKgB4H
   3GkBYuDN9PM4TEhjICuAP8aF4k9jJ4krXas/tX3XX3eC7RTwHINt+tDln
   0Fqk/LmRZs7Dsb+lX5NKgjgC2wrKJCJUUaQR6rJmVO9czo59ghU2ftXqz
   g==;
X-CSE-ConnectionGUID: Mqm/FB+CSv2ySxr4a+YotQ==
X-CSE-MsgGUID: 0NJ/v+XZQ/GDR6C/ILi15g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27333069"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="27333069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:25:54 -0700
X-CSE-ConnectionGUID: KaZEcMiAQRK2yurP5QfyJw==
X-CSE-MsgGUID: WdR0UyhOQay6S4gFyvWuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25313701"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Apr 2024 07:25:52 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0MWL-0003o8-1h;
	Fri, 26 Apr 2024 14:25:49 +0000
Date: Fri, 26 Apr 2024 22:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Howlett <liam.howlett@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: lib/maple_tree.c:336:20: error: unused function 'mte_has_null'
Message-ID: <202404262254.lEmMOMMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c942a0cd3603e34dd2d7237e064d9318cb7f9654
commit: 6e7ba8b5e2380f941dda8a1025d70c5ce5b38982 maple_tree: mte_set_full() and mte_clear_full() clang-analyzer clean up
date:   1 year, 5 months ago
config: x86_64-sof-customedconfig-amd-defconfig (https://download.01.org/0day-ci/archive/20240426/202404262254.lEmMOMMd-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404262254.lEmMOMMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404262254.lEmMOMMd-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/maple_tree.c:326:21: error: unused function 'mte_set_full' [-Werror,-Wunused-function]
     326 | static inline void *mte_set_full(const struct maple_enode *node)
         |                     ^~~~~~~~~~~~
   lib/maple_tree.c:331:21: error: unused function 'mte_clear_full' [-Werror,-Wunused-function]
     331 | static inline void *mte_clear_full(const struct maple_enode *node)
         |                     ^~~~~~~~~~~~~~
>> lib/maple_tree.c:336:20: error: unused function 'mte_has_null' [-Werror,-Wunused-function]
     336 | static inline bool mte_has_null(const struct maple_enode *node)
         |                    ^~~~~~~~~~~~
   3 errors generated.


vim +/mte_has_null +336 lib/maple_tree.c

   335	
 > 336	static inline bool mte_has_null(const struct maple_enode *node)
   337	{
   338		return (unsigned long)node & MAPLE_ENODE_NULL;
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
