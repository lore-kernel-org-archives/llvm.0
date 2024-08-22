Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7612B143;
	Thu, 22 Aug 2024 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309517; cv=none; b=qizw0rKcjUFfJz51GOKyvEerONd8xZJ5x96ZuaaE86XXoQHY8ecbTqM4wyuK6vYV8CIsqCXxsBys1mNRRaCiK3T7XcLbCnblqjZ5sznmo8bYLqSjwuf02rXA6i/iqdBI3JAQ88PJTotNoSgXQ/6ncbm6g1JL40/kTPPXngMBidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309517; c=relaxed/simple;
	bh=BviDPMfTvzLHmTkKInT8320R0K+GofgCLzIgaDWNW5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Csgc8CJ8oqA1yCERp0HNmEP62TPg8M6PftBQM3QtDuV4/leZ9MY5ctUNbjOv1hT9T73YYXtxfvIVlWokgJLJMBdC9BIajhcJ71jhpBWyLn7aU2G/sUArp6Vhgr8xeNa5+W8FjLXOKEtdAnCmSzhjw11XV6hphf/ViBDCCzCMtZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXOqAe0g; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXOqAe0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724309516; x=1755845516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BviDPMfTvzLHmTkKInT8320R0K+GofgCLzIgaDWNW5s=;
  b=QXOqAe0gz2Dvr0YVvCyXe7pSIpN5QS8+hmSQW8Jae3ts622scpa9bh1x
   hz6keWaFBYhGgFy2HhoWWEjslmBxf4fWDiOly7pr9YHz23KG+IN2ELLRJ
   x56p3L2NDORFbWkvbYeSXzNRKxngsvtkVeZKU1zSHrPa/+5NRwPBneu2W
   naXi9XBJ+MUO+gZpZsBi1FfNnbow0/lQPKQmy3T6vn1cOLBjJWbNgwGO3
   049ABpMlXyv7hgGSZJY1W66pGZAOKJdr9n0T0hDQQ1OTOCq4zD3DgH8JW
   k5+b9IS6+6cAN+NZbar1MxIBgE6b5OOzk/tnjwxSkRq0VlVW22VTJe8AO
   g==;
X-CSE-ConnectionGUID: YK7JRculQXeiWbsaayQKXg==
X-CSE-MsgGUID: sgls83ZOTqGqJUF7ZW1gpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="34087982"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="34087982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 23:51:55 -0700
X-CSE-ConnectionGUID: RVjJB9f0SOe+TeSoOOVzYg==
X-CSE-MsgGUID: siXkyo/PRvSNE3itp1SxZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66227346"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 23:51:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh1fj-000CUJ-1q;
	Thu, 22 Aug 2024 06:51:51 +0000
Date: Thu, 22 Aug 2024 14:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: daire.mcnamara@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <202408221459.u2myKH8g-lkp@intel.com>
References: <20240821130217.957424-2-daire.mcnamara@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821130217.957424-2-daire.mcnamara@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/daire-mcnamara-microchip-com/PCI-microchip-Fix-outbound-address-translation-tables/20240821-210421
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240821130217.957424-2-daire.mcnamara%40microchip.com
patch subject: [PATCH v8 1/3] PCI: microchip: Fix outbound address translation tables
config: i386-randconfig-001-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221459.u2myKH8g-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221459.u2myKH8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221459.u2myKH8g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/plda/pcie-microchip-host.c:617:5: warning: no previous prototype for function 'mc_pcie_setup_iomems' [-Wmissing-prototypes]
     617 | int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
         |     ^
   drivers/pci/controller/plda/pcie-microchip-host.c:617:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     617 | int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
         | ^
         | static 
   1 warning generated.


vim +/mc_pcie_setup_iomems +617 drivers/pci/controller/plda/pcie-microchip-host.c

   616	
 > 617	int mc_pcie_setup_iomems(struct pci_host_bridge *bridge,
   618				   struct plda_pcie_rp *port)
   619	{
   620		void __iomem *bridge_base_addr = port->bridge_addr;
   621		struct resource_entry *entry;
   622		u64 pci_addr;
   623		u32 index = 1;
   624	
   625		resource_list_for_each_entry(entry, &bridge->windows) {
   626			if (resource_type(entry->res) == IORESOURCE_MEM) {
   627				pci_addr = entry->res->start - entry->offset;
   628				plda_pcie_setup_window(bridge_base_addr, index,
   629						       entry->res->start & MC_OUTBOUND_TRANS_TBL_MASK,
   630						       pci_addr, resource_size(entry->res));
   631				index++;
   632			}
   633		}
   634	
   635		return 0;
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
