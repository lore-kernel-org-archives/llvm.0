Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411348;
	b=nXFaWPS/foLzuo9PxSddlIBuzOc3j/rhDE/zjCGU+twNJ4HF1XH6sqeWMUPbu8zd0IEy
	 rgkiVLzJW5IaXI9Qyri/z6rDbTma/ENQrzIfZ4+lG/V+VQWbjsC/kw8pOBQ1+voDBMy1Y
	 rKTE2AGfSSPfWfSjo2m1CuEN7BssUAVbe8gUkzbmutG7Sy0C9pIlQi4tEDNE3sy+wC/oM
	 m9qpxfGF6xiHXtKlulbU37bNkwLjFEg0efCjp45/3CsRqrsAi0z9KlKMslNzsXQzij5VR
	 KuRFKWPhF/E10MMq8d2lqVP2tW0TKsH+GfDxd2tgH/eRp/e/H6qUfMCqBu6+08IhkCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411348;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mQ4fAjqKW3D5sPZo53NPq+l40c9RChAf/G3wa8WbYF0=;
	b=NTJ334jQi+qV8Yed8wTKj+v2P7nSP/GEFTWOCHx1oyWouBKoY9Ps35qq1pmHKdoutJyc
	 yiuHvOfq87ddGVXkJj8DmwrAJprVwRUMdzeomUq0hZtQWzl5OVdjHTavm86mwh/TlTjlh
	 aEGcUEy6U+ouQZjKPDXpsux7Db4pp4YS+URvO6tY15o3J5ebt5PyS0DQE0kTAhf7IAQcO
	 /r0E4Uyft7P6ZTdKC9zfxsUO0e4sl8l7ZAM3aCWJRbN87Gk3AE6DfMAoOYTI64cAp5smf
	 Q5svwn5/7iVbXsF9qlD9CZ5nMaWh2rYB4sFCOoszFypUIK4rjgMrKrzDhIP6gp9pFtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mcMSSFBl;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33A606A31E;
	Sat, 31 Oct 2026 01:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B33A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mcMSSFBl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793411345; x=1824947345;
  h=date:from:to:cc:subject:message-id;
  bh=0pkssyEXUtvypp489cZhQOzqhZsUkhdqdWZSkgOzXv8=;
  b=mcMSSFBleSHGjFR/6ZWd+J4l/CZ4sMDVxIScB7sfslOif6lEXYN3ljKI
   9OnQVNLNB1k8CJHM1tsxIi34h+wEVfX/WoyZ1/EH7z3Fc70ZnGJYKfreH
   8SpArCsvTW+3YUEtgTDj9vmNODH2p+zPDLwxF/TiOpyFLl+r1D7MyskGB
   lTWE8etgdaSRpmi+to1WGkJ7XDMncYxYjhGB3B8EJOt42f/7HavaYkvxD
   dEmVMvX9CFFm+JyPluekczRX/JSCy3fIE0GXzUtqCrFUmmIfhGso/rGGx
   7LLxnjCdbGepJXKDzfQhGmKMqgakep/PrxjmwX8rAhJ9aKeChQfdW3n7B
   A==;
X-CSE-ConnectionGUID: Pg8AKNQWQX6IOkr6IdqmGw==
X-CSE-MsgGUID: vo1oh8VfRQym99Cf//wUIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2061724"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2061724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:49:05 -0700
X-CSE-ConnectionGUID: rrAmkHTfRNeeqaF+eyPqBA==
X-CSE-MsgGUID: Uk5wfdH/RRenpdnrdTcRGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5662991"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2026 18:49:03 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyDK-000000005p2-2hqg;
	Sat, 31 Oct 2026 01:48:58 +0000
Date: Sat, 31 Oct 2026 02:48:01 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 33/36] drivers/iommu/sun50i-iommu.c:262:9:
 warning: shift count >= width of type
Message-ID: <202610310227.axf3ZxDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: fb330cb5c647353254defd7befae00c11c3e49b9 [33/36] iommu/sun50i: Allow mapping 3GB~4GB physical address
config: powerpc-randconfig-2001-20261030 (https://download.01.org/0day-ci/archive/20261031/202610310227.axf3ZxDV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310227.axf3ZxDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310227.axf3ZxDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/sun50i-iommu.c:262:9: warning: shift count >= width of type [-Wshift-count-overflow]
     262 |                 pa |= BIT(32);
         |                       ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   1 warning generated.


vim +262 drivers/iommu/sun50i-iommu.c

   255	
   256	static phys_addr_t sun50i_pte_get_page_address(u32 pte)
   257	{
   258		phys_addr_t pa = pte & SUN50I_PTE_PAGE_ADDRESS_MASK;
   259	
   260		/* un-truncate the physical address */
   261		if (pa < memblock_start_of_DRAM())
 > 262			pa |= BIT(32);
   263	
   264		return pa;
   265	}
   266	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
