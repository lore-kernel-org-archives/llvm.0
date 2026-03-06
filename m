Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1E34BA5B;
	Fri,  6 Mar 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807817; cv=none; b=t6NAln0TErWm8sxKzWRcSSrZ43C+QlkRfpBu1BbOrQO5A1e8srSmj9xrD/pwFBCTJxsKx4dszBWRQjq/9bkMrx/wzZQItzBziLjZ1SVlAU5Es7IFp5V/iKsUN2ZMD3XxmvTPGFoTeitPtv+irwHnWsR85/fkY7xIO7vlQOf4s0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807817; c=relaxed/simple;
	bh=QqkFcFahsd0op5XjYc6lYSwgGgomR2TfWx7WyjH4taw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNhoLPDAqkQeKq8NwkkZTbfORsYGdR6JVNo/M37eXjwjpRN4yhA2dRkGjQPPXbQkljt25e2TKE4ctDWrzPKGMrWSYD2pOkMytJcuS/9P5Cii19WqVzHMPwXA+7yLMzM06IeIzD73ilRW1kHTJy9EPpy/5/bK3PJ0USfrJS2jHSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atIYUquD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atIYUquD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772807817; x=1804343817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QqkFcFahsd0op5XjYc6lYSwgGgomR2TfWx7WyjH4taw=;
  b=atIYUquDLiika2bYHk2ecinUP94Ezw61zLZS08Z2RlZ1lYWKVc9hPOPU
   bxB5Tac0zNNS9i1jp0UZ2p48vrVE66f8/BzXBtIiKqTgFdmuQhloDxEpa
   NiCeFgk/l1FxL4VILJ9I/AWYuk+8dM9faRGmS/u679HzaUQP3PAUjPvAD
   hwL3sM7P19xrN+V7Zbo/N+BLc+S002p8DrtmiwJxr1GllykYNHl1Lf4Vx
   VegCKfGKYz4pkjuiXBlCTbQ75gXKw2J+o9Mxo08HcXrqS4uZVA1/81Lp5
   x4bUToMrGXp/hIzPUAc1TcX2extue8iAYdjIPsBiKpl5j8QlkvM7GepmB
   Q==;
X-CSE-ConnectionGUID: Dd5ZB45RTm2Ybs/NXKjd8A==
X-CSE-MsgGUID: E6L6Z62kRsWS1rOBZiZsBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84241910"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84241910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:36:56 -0800
X-CSE-ConnectionGUID: 5eLOZ5sMRgyJU2Um/15HDA==
X-CSE-MsgGUID: eEHtQg9bQY+UOB1keMyEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="221831643"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2026 06:36:48 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyWIG-000000000wX-3MaE;
	Fri, 06 Mar 2026 14:36:44 +0000
Date: Fri, 6 Mar 2026 22:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, david@kernel.org,
	dave.hansen@intel.com, dave.hansen@linux.intel.com,
	ypodemsk@redhat.com, hughd@google.com, will@kernel.org,
	aneesh.kumar@kernel.org, npiggin@gmail.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, lorenzo.stoakes@oracle.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, shy828301@gmail.com, riel@surriel.com,
	jannh@google.com, jgross@suse.com, seanjc@google.com,
	pbonzini@redhat.com
Subject: Re: [PATCH v6 2/2] x86/tlb: skip redundant sync IPIs for native TLB
 flush
Message-ID: <202603062249.9Wwr2mux-lkp@intel.com>
References: <20260304021046.18550-3-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304021046.18550-3-lance.yang@linux.dev>

Hi Lance,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20260305]
[cannot apply to tip/x86/core arnd-asm-generic/master peterz-queue/sched/core tip/x86/mm linus/master v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lance-Yang/mm-mmu_gather-prepare-to-skip-redundant-sync-IPIs/20260304-101422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260304021046.18550-3-lance.yang%40linux.dev
patch subject: [PATCH v6 2/2] x86/tlb: skip redundant sync IPIs for native TLB flush
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603062249.9Wwr2mux-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062249.9Wwr2mux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062249.9Wwr2mux-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1841:13: warning: no previous prototype for function 'native_pv_tlb_init' [-Wmissing-prototypes]
    1841 | void __init native_pv_tlb_init(void)
         |             ^
   arch/x86/mm/tlb.c:1841:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1841 | void __init native_pv_tlb_init(void)
         | ^
         | static 
   1 warning generated.


vim +/native_pv_tlb_init +1841 arch/x86/mm/tlb.c

  1839	
  1840	#ifndef CONFIG_PARAVIRT
> 1841	void __init native_pv_tlb_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
