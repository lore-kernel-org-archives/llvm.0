Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712271D554;
	Tue, 21 Jan 2025 02:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737425330; cv=none; b=qmLvA340tNYovFxzVXv12jYTVqHkPRtWSLPkfJEd/ifH6p5Fmk8npHGfcVwzIY1AaA1wxG03r8mrw7paVuXU7AYFdOnGQnPcBSNN+Z8ipGpyC29QqMN2nnWo8jkI10FG2Ze+TzsZXSc/ncsYltfTveX1Ryw9oxpRTVXOTjUMv+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737425330; c=relaxed/simple;
	bh=IQRDZWB46zZ9WnAH8dqodlZl3VAtTARjWjiThvikqx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJJVnQZNeKB06YbtWQCz+B5WdcIm4Q21k0vtDuOt14mU/3J3AZWDfcwVZhNdskqeWSPv1uSxgEFQBj9wqaMh6QzDHvcEUXmguk1qq87njaxiuLNsWGa91NhWhg44QJLLTd61c7MsGzuTFqGm3QZbLuA40StnixA9y133p7M+1NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do1DpPa8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do1DpPa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737425329; x=1768961329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQRDZWB46zZ9WnAH8dqodlZl3VAtTARjWjiThvikqx4=;
  b=do1DpPa8lTHXPIj/G14hdsMr4qcM/FmKfpRnmemOOd3US7eAUv5VK9ce
   VGLZTff1ML0IS/90spj/kO6WpZ0yDu1z8waLNy6WcAhvEByCB16HtOHzt
   C7J6uGyzz0WW7EYU9CBuB9MMGKHUaC6fvvv0NmhB2qaaJAZeqSKrkSW4L
   tRC7ZzsnhQ04Eae7wfwwY+lAzkcEo6gHRA/uFB0pucfs6fXI5SFoSMol8
   XIPS5B1YbsndfSn3xMEg5n9C5ZNtnKy3qX5KRg0AuRq2e+jaECfXTm1Q+
   3PKnsr9nPbqhArNxyaRNp8B8jI0Dh/I0SNp6lJh16nye6/MG/qt66XNwd
   w==;
X-CSE-ConnectionGUID: pSjAoS6fT6CKjWwHgpiEEQ==
X-CSE-MsgGUID: BRItqBezTdyu8wDrwf0Irw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="25426327"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="25426327"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 18:08:48 -0800
X-CSE-ConnectionGUID: C91XyXLaQV69a1Q4WIbKCw==
X-CSE-MsgGUID: uikd7EoXQzqSwvPby7e2bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106477140"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 18:08:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta3h6-000XUb-1r;
	Tue, 21 Jan 2025 02:08:44 +0000
Date: Tue, 21 Jan 2025 10:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-tiny-kfree_rcu 4/4] mm/slab_common.c:1880:20: error:
 redefinition of 'kvfree_rcu_barrier'
Message-ID: <202501210920.yfEDRLsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-tiny-kfree_rcu
head:   22989c19510039d8a73fc59918d4e5927281bd92
commit: 22989c19510039d8a73fc59918d4e5927281bd92 [4/4] slab, rcu: move TINY_RCU variant of kvfree_rcu() to SLAB
config: i386-buildonly-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210920.yfEDRLsv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210920.yfEDRLsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210920.yfEDRLsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slab_common.c:9:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/slab_common.c:34:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/slab_common.c:1880:20: error: redefinition of 'kvfree_rcu_barrier'
    1880 | static inline void kvfree_rcu_barrier(void)
         |                    ^
   include/linux/slab.h:1087:20: note: previous definition is here
    1087 | static inline void kvfree_rcu_barrier(void)
         |                    ^
   3 warnings and 1 error generated.


vim +/kvfree_rcu_barrier +1880 mm/slab_common.c

  1879	
> 1880	static inline void kvfree_rcu_barrier(void)
  1881	{
  1882		rcu_barrier();
  1883	}
  1884	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
