Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AB1FC7E0;
	Wed,  8 Jan 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348371; cv=none; b=f8pjek5x+ai9xA0d2njZvD0+AXytWxZP6hl4KMKAVZ9THj95sbT6nJAdb5So0+DDglP8iJrzXa2kA/wjrwISmVMD4e5ro9qIJCCcdDnireVKVJcBCfbgO5tERNSf9ucUKYB5C+xmtbz+/k3F4MHRRVmXNJM9NcfEGRaNDfnkHnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348371; c=relaxed/simple;
	bh=hvlbd6k/iNbp1dFwhti5m02aRgksQ4i/6azTS2S//Z4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p99IboZSanfIVmVIrd1D+VXGjpDg35sfAtbvtyfucCgRmRUeLDuTr3CCPQDe/P9WayspyJAC0q+ZJRjEQhiUyLZ/xbv8hCnEfvI7a/Qx1wgLkuo3xzmIlnolFpEyV2HyqlJ+Vlj5ykaIiLgWy2fNeHMzf5QxA+CsfYIDxAdpNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJLfSitT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJLfSitT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736348369; x=1767884369;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hvlbd6k/iNbp1dFwhti5m02aRgksQ4i/6azTS2S//Z4=;
  b=kJLfSitTqPHSX5lpJZkG5aIvMS+MjRKLytAJmlsdUYkBHaTBXXZSyQEh
   By+rD/ttCI+EwxA7NroZpUadw0eKwTlUsdvPgoM59Car+4OBvVBk+SngQ
   jZX5/quS17BKi2mdBQTHB5sx4m5xnrKwGoYDsYX5QQGV7Grx/O+TAjLVO
   cCJrPItmi2RK3bvygQVKK5tH2SI78WlTT4omRy+0yC9+fcjla5HXNfccx
   szjGr9Oy3z7LVQLiq/AvNpzD09lY+l7fG4VacDsZlBfcmho7qMf0MHwRO
   xM7ZbYC0j34QXzfhceYrLzwFuiKJMNpBVViWVyiNPkZBw/HCQ4KCx0jb6
   w==;
X-CSE-ConnectionGUID: DKjyj2V4SR2vT70rpwy+IQ==
X-CSE-MsgGUID: h4c9XsP1SVKg01s9ii6Fyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47076503"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47076503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 06:59:28 -0800
X-CSE-ConnectionGUID: FVOysFVNRI6QddOqHEGhbQ==
X-CSE-MsgGUID: AaoaQBlaRhWNlEoEO+qulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140458021"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2025 06:59:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVXWm-000GF9-2d;
	Wed, 08 Jan 2025 14:59:24 +0000
Date: Wed, 8 Jan 2025 22:59:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable
 'nec_priv' set but not used
Message-ID: <202501082213.4JCKIepk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   3 months ago
config: arm-randconfig-003-20250105 (https://download.01.org/0day-ci/archive/20250108/202501082213.4JCKIepk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082213.4JCKIepk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082213.4JCKIepk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/gpib/eastwood/fluke_gpib.c:10:
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.h:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
     196 |         struct nec7210_priv *nec_priv;
         |                              ^
   2 warnings generated.
--
   In file included from drivers/staging/gpib/nec7210/nec7210.c:14:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/gpib/nec7210/nec7210.c:940:16: warning: variable 'command' set but not used [-Wunused-but-set-variable]
     940 |                 unsigned int command;
         |                              ^
>> drivers/staging/gpib/nec7210/nec7210.c:1000:23: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum ppr_bits') [-Wenum-enum-conversion]
    1000 |         write_byte(priv, PPR | HR_PPU, AUXMR);
         |                          ~~~ ^ ~~~~~~
>> drivers/staging/gpib/nec7210/nec7210.c:1004:26: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum auxra_bits') [-Wenum-enum-conversion]
    1004 |         priv->auxa_bits = AUXRA | HR_HLDA;
         |                           ~~~~~ ^ ~~~~~~~
>> drivers/staging/gpib/nec7210/nec7210.c:1010:26: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum auxrb_bits') [-Wenum-enum-conversion]
    1010 |         priv->auxb_bits = AUXRB | HR_CPTE;
         |                           ~~~~~ ^ ~~~~~~~
   5 warnings generated.


vim +/nec_priv +196 drivers/staging/gpib/eastwood/fluke_gpib.c

55936779f49612 Dave Penkler 2024-09-18  190  
55936779f49612 Dave Penkler 2024-09-18  191  static int fluke_line_status(const gpib_board_t *board)
55936779f49612 Dave Penkler 2024-09-18  192  {
55936779f49612 Dave Penkler 2024-09-18  193  	int status = ValidALL;
55936779f49612 Dave Penkler 2024-09-18  194  	int bsr_bits;
55936779f49612 Dave Penkler 2024-09-18  195  	struct fluke_priv *e_priv;
55936779f49612 Dave Penkler 2024-09-18 @196  	struct nec7210_priv *nec_priv;
55936779f49612 Dave Penkler 2024-09-18  197  
55936779f49612 Dave Penkler 2024-09-18  198  	e_priv = board->private_data;
55936779f49612 Dave Penkler 2024-09-18  199  	nec_priv = &e_priv->nec7210_priv;
55936779f49612 Dave Penkler 2024-09-18  200  
55936779f49612 Dave Penkler 2024-09-18  201  	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
55936779f49612 Dave Penkler 2024-09-18  202  
55936779f49612 Dave Penkler 2024-09-18  203  	if ((bsr_bits & BSR_REN_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  204  		status |= BusREN;
55936779f49612 Dave Penkler 2024-09-18  205  	if ((bsr_bits & BSR_IFC_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  206  		status |= BusIFC;
55936779f49612 Dave Penkler 2024-09-18  207  	if ((bsr_bits & BSR_SRQ_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  208  		status |= BusSRQ;
55936779f49612 Dave Penkler 2024-09-18  209  	if ((bsr_bits & BSR_EOI_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  210  		status |= BusEOI;
55936779f49612 Dave Penkler 2024-09-18  211  	if ((bsr_bits & BSR_NRFD_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  212  		status |= BusNRFD;
55936779f49612 Dave Penkler 2024-09-18  213  	if ((bsr_bits & BSR_NDAC_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  214  		status |= BusNDAC;
55936779f49612 Dave Penkler 2024-09-18  215  	if ((bsr_bits & BSR_DAV_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  216  		status |= BusDAV;
55936779f49612 Dave Penkler 2024-09-18  217  	if ((bsr_bits & BSR_ATN_BIT) == 0)
55936779f49612 Dave Penkler 2024-09-18  218  		status |= BusATN;
55936779f49612 Dave Penkler 2024-09-18  219  
55936779f49612 Dave Penkler 2024-09-18  220  	return status;
55936779f49612 Dave Penkler 2024-09-18  221  }
55936779f49612 Dave Penkler 2024-09-18  222  

:::::: The code at line 196 was first introduced by commit
:::::: 55936779f4961299efa99a6843c8ff3b019d3858 staging: gpib: Add Fluke cda based cards GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
