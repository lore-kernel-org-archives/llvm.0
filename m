Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8421623DE80;
	Tue, 10 Dec 2024 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824906; cv=none; b=Ccvapr5OfecnbFZco4PEJyDIHEDsY4FBEWh6Zqwzr9+CzGcH0gR2pS2JK3EOaM2Wo4ddBsqcg7L7VzrEFdK6ko0ET63AEUyYdBCwsykGDE/gnLosjdv0yGBIsV6Ts6wHa8rSxDRcvGXVW8UQa9P8OsL+5h0XplgihyPYQ06ePSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824906; c=relaxed/simple;
	bh=UxNGTFxLzH5h1Q1qNa96VXFgW2TmHFKNGLlWyoa7Vy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k3X5k76pWzqP2dnrYFTFydEUfAHFq8H9ebihSymY06dsxHrnWUsJ1vcuuGniIGnMB/VBt9JrvdMo4g1FHJSgDvzY3aChKQWjGXlpAyPx4o+x0BWMcmVAEy5avHqjmI4ykFJNOPoJIC/giH1yGcKwLE4ja3xNJUNOvwM5DEcaOM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjVcVm1c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjVcVm1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733824904; x=1765360904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UxNGTFxLzH5h1Q1qNa96VXFgW2TmHFKNGLlWyoa7Vy4=;
  b=gjVcVm1cQoZvXOwk7v9K11U9s713wOoNNIZPOi2RxwpNFjFJRjY3DHAW
   qeoF6HZ/KaVZUZqNKLFPLlt07j/i1SU40DMjLcINSB1tsUHIcshH+xgBs
   VXrxv2pcKtlDSnpYxsK7EOwTqpl5f8LJQZL+ez8rUO67Kcmm/3KfTnOQS
   5pFWaz5MYqC7p4TXlxycXzfcZ9+Ug/mPNBrf7DzByyz9/yKTJs782+TdK
   d+ksysNXuKwtIyVmW90JjOBJn6GQKnA1pKwCWsC0E1NZB6AGnvqf9V80r
   Z7bqLIUY8lFqadtur4RxCI/3mx5hsujxb1WC9gfrtyS3du9EcSkYTkY4n
   g==;
X-CSE-ConnectionGUID: Odc7SuVaQVa3X1b4IuGOiA==
X-CSE-MsgGUID: plJF/2jrTMGkN+IGC95RBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33496480"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33496480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 02:01:44 -0800
X-CSE-ConnectionGUID: B9ayLaQ6RNOVAX+XyLV+DA==
X-CSE-MsgGUID: u18wOnXHTYOIuzqcp+PPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100399525"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2024 02:01:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKx3j-0005N7-2O;
	Tue, 10 Dec 2024 10:01:39 +0000
Date: Tue, 10 Dec 2024 18:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/xgene-fixes-6.13 8/18]
 drivers/iommu/amd/iommu.c:3810:3: error: field designator 'bus_token' does
 not refer to any field in type 'const struct msi_parent_ops'
Message-ID: <202412101701.Uu0dEEE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/xgene-fixes-6.13
head:   32627e010975ae9817552c5e21d1860ce9c9bdfa
commit: 3c9773aab9b801ba71766b264e859785309b13ba [8/18] iommu/amd: Convert to msi_create_parent_irq_domain() helper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241210/202412101701.Uu0dEEE7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101701.Uu0dEEE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101701.Uu0dEEE7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/amd/iommu.c:12:
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
>> drivers/iommu/amd/iommu.c:3810:3: error: field designator 'bus_token' does not refer to any field in type 'const struct msi_parent_ops'
    3810 |         .bus_token              = DOMAIN_BUS_AMDVI,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +3810 drivers/iommu/amd/iommu.c

  3807	
  3808	static const struct msi_parent_ops amdvi_msi_parent_ops = {
  3809		.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
> 3810		.bus_token		= DOMAIN_BUS_AMDVI,
  3811		.prefix			= "IR-",
  3812		.init_dev_msi_info	= msi_parent_init_dev_msi_info,
  3813	};
  3814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
