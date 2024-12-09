Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9321767A;
	Mon,  9 Dec 2024 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742432; cv=none; b=uhnf0IHRs4CijpNF1L954dVkJvEVNE841KQRwu93/l2KzF8hUTcmALlptAey0kSXM60vtZTKe74tOasPW/wFGrA4OmL/P0eUa2u9dX0erUx3R4Lh1hxerT+DkMVDrx43sGEU7XZqhuQ2NkfGtDSS47LvY3I68lJKuykZ/lpWY7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742432; c=relaxed/simple;
	bh=rr4MabMmU3SNSOGESL6wcZs35bL3TYoh6pFGFWe65uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDYwsorbY9RorfeAwqlbSco2kINmGXw2bnEbT2benz81eTccOLxEWJ4QXMfjk2rq1TfAw5IGeFikpzMLkYypHGF810F0QUCuQfQuSKADZ1jk5We9Ob6C1E7sWEK02/w3S5PUzFUaLvvz3OV2cX+8aXoJofQrA6jH8hrc65ZC3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiDE7Nno; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiDE7Nno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733742431; x=1765278431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rr4MabMmU3SNSOGESL6wcZs35bL3TYoh6pFGFWe65uw=;
  b=fiDE7NnolFlI4fv8fZrW0dmwlZ+MtgnYso6wRDO49prNrIDu8z/G0YbQ
   6t88oNFvTMr4L68oybBlNNH1d4JEBZVn3pn3MFLaBcVhGDe9N5JRftdYh
   PG1LSsW0c78eyvikX6tS7cbClaIav71gJPT0bILzpABeUoFzjZv9puAB0
   nisFfvILWp878iHp4LKrjyAHs5QdnZiVTyRs4wU1KlehxCJm0nYdR03QQ
   UEpKS+9igfJ7IAfbnfCntY9PvABbS6fIEZzZ6gl8VAhu7o844WVyjncrt
   80QSVfEn/5h3+eeVqfHoNE5rSEDBkUazOcmmF+JqTACSaMxuGu283UQQN
   g==;
X-CSE-ConnectionGUID: heVP3ieWS6CanaOcaMhP5g==
X-CSE-MsgGUID: FFRMACgRTImb1vsnoW/m9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36869910"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="36869910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:07:10 -0800
X-CSE-ConnectionGUID: F4G7TCtNTvWkinMtblaYCQ==
X-CSE-MsgGUID: BiyAjTrJTOaGfMSY7famkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="125918147"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 03:07:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKbbW-0004Ez-1e;
	Mon, 09 Dec 2024 11:07:06 +0000
Date: Mon, 9 Dec 2024 19:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/11] iommu/intel: Convert to
 msi_create_parent_irq_domain() helper
Message-ID: <202412091735.fpwp7CRG-lkp@intel.com>
References: <20241204124549.607054-10-maz@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204124549.607054-10-maz@kernel.org>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on pci/next pci/for-linus linus/master v6.13-rc2 next-20241206]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Zyngier/irqchip-Make-irq-msi-lib-h-globally-available/20241204-204904
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20241204124549.607054-10-maz%40kernel.org
patch subject: [PATCH 09/11] iommu/intel: Convert to msi_create_parent_irq_domain() helper
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241209/202412091735.fpwp7CRG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091735.fpwp7CRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091735.fpwp7CRG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/intel/irq_remapping.c:11:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/irq_remapping.c:1520:3: error: field designator 'bus_token' does not refer to any field in type 'const struct msi_parent_ops'
    1520 |         .bus_token              = DOMAIN_BUS_DMAR,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +1520 drivers/iommu/intel/irq_remapping.c

  1517	
  1518	static const struct msi_parent_ops dmar_msi_parent_ops = {
  1519		.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
> 1520		.bus_token		= DOMAIN_BUS_DMAR,
  1521		.prefix			= "IR-",
  1522		.init_dev_msi_info	= msi_parent_init_dev_msi_info,
  1523	};
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
