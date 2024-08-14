Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B70144D1A;
	Wed, 14 Aug 2024 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723673389; cv=none; b=DOXSQQyTEzI5EtVmadgkXsP9zvObE7RVU5rkrIxxSd1cO3UEMj0y1vrEVuNcBD9NkEsXxwYHSU//vWSpACFazoe41mejLFyCWlLm/M3FndaZurF8zXAsMgX7TYiaud0eDJSi3vStXlUDPJQ3YdsZmYYj7G7brqKDIZfR7Xk+buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723673389; c=relaxed/simple;
	bh=r59eTN9HyEJUp+QIY5zdaWUiOfL2X+Vi+7JNlu6FKIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YV3bN5l2MlRPYS+Rh5+bB5TND+WSpA0LXhTGzSWiAVSiWqnpXIF9afYGzQOirAX0Lh5KOE/9RVbtaT3UZq86eY0CV5XzoPFImD5K39gpE3OrlxlM0yI6GFPPINy0fjuQGtrwhd/FqHhdNAGAQ7j1oNog1H8RZuKlY3gCuhytquQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glZY/XEy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glZY/XEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723673386; x=1755209386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r59eTN9HyEJUp+QIY5zdaWUiOfL2X+Vi+7JNlu6FKIA=;
  b=glZY/XEybGezKA3cltbDgEZAv3UvnCyMHKmktqGud6SLxOVYRVqrd8aL
   vcMS5o0RbwBPKcLufImPo/ubEv4JKOT6r1G7ZNQK8BowcoChKBFW+KjSh
   pqzo4qU5ioeYh5fY6zKAY8CexLES6ozv4KGtXijZJ5YZ4lIIob/f2fi9w
   lo4RciWDJ3qHOB7oze/PrJQ2CknUllvN92alnkoWrr/VRExwZzJsV8iQV
   Qg4ReAQK+3Z85f3ZgLHUycupxQeKtfNIKykb6tmKmBmLfu/miyNtF1OcN
   dXvjBvbl11KAzDwHGHraecZ89Tn7lVX0H4HGkjNSilZM2Qz88q86ZZ22L
   A==;
X-CSE-ConnectionGUID: zAN1jJqbQDKzdj+/l9LtMQ==
X-CSE-MsgGUID: sFhh/8GfSh6RFL6x10wB8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22046367"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="22046367"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 15:09:45 -0700
X-CSE-ConnectionGUID: pM6GE6z8Sz6L5GSvxs+U1g==
X-CSE-MsgGUID: urukDfipTai6j5xIKIyK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="59433853"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2024 15:09:43 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seMBY-0002vy-22;
	Wed, 14 Aug 2024 22:09:40 +0000
Date: Thu, 15 Aug 2024 06:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [linux-next:master 4179/4667]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: error: call to
 undeclared function 'pci_prepare_ats'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202408150626.4kndgpL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
commit: 2665d975db35f124d47e9584d448a3fb4d54f225 [4179/4667] iommu: Allow ATS to work on VFs when the PF uses IDENTITY
config: arm64-randconfig-003-20240815 (https://download.01.org/0day-ci/archive/20240815/202408150626.4kndgpL3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150626.4kndgpL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150626.4kndgpL3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:15:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: error: call to undeclared function 'pci_prepare_ats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3301 |                 pci_prepare_ats(to_pci_dev(dev), stu);
         |                 ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:3: note: did you mean 'pci_enable_ats'?
   include/linux/pci-ats.h:18:19: note: 'pci_enable_ats' declared here
      18 | static inline int pci_enable_ats(struct pci_dev *d, int ps)
         |                   ^
   1 warning and 1 error generated.


vim +/pci_prepare_ats +3301 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3249	
  3250	static struct iommu_device *arm_smmu_probe_device(struct device *dev)
  3251	{
  3252		int ret;
  3253		struct arm_smmu_device *smmu;
  3254		struct arm_smmu_master *master;
  3255		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
  3256	
  3257		if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
  3258			return ERR_PTR(-EBUSY);
  3259	
  3260		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
  3261		if (!smmu)
  3262			return ERR_PTR(-ENODEV);
  3263	
  3264		master = kzalloc(sizeof(*master), GFP_KERNEL);
  3265		if (!master)
  3266			return ERR_PTR(-ENOMEM);
  3267	
  3268		master->dev = dev;
  3269		master->smmu = smmu;
  3270		dev_iommu_priv_set(dev, master);
  3271	
  3272		ret = arm_smmu_insert_master(smmu, master);
  3273		if (ret)
  3274			goto err_free_master;
  3275	
  3276		device_property_read_u32(dev, "pasid-num-bits", &master->ssid_bits);
  3277		master->ssid_bits = min(smmu->ssid_bits, master->ssid_bits);
  3278	
  3279		/*
  3280		 * Note that PASID must be enabled before, and disabled after ATS:
  3281		 * PCI Express Base 4.0r1.0 - 10.5.1.3 ATS Control Register
  3282		 *
  3283		 *   Behavior is undefined if this bit is Set and the value of the PASID
  3284		 *   Enable, Execute Requested Enable, or Privileged Mode Requested bits
  3285		 *   are changed.
  3286		 */
  3287		arm_smmu_enable_pasid(master);
  3288	
  3289		if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
  3290			master->ssid_bits = min_t(u8, master->ssid_bits,
  3291						  CTXDESC_LINEAR_CDMAX);
  3292	
  3293		if ((smmu->features & ARM_SMMU_FEAT_STALLS &&
  3294		     device_property_read_bool(dev, "dma-can-stall")) ||
  3295		    smmu->features & ARM_SMMU_FEAT_STALL_FORCE)
  3296			master->stall_enabled = true;
  3297	
  3298		if (dev_is_pci(dev)) {
  3299			unsigned int stu = __ffs(smmu->pgsize_bitmap);
  3300	
> 3301			pci_prepare_ats(to_pci_dev(dev), stu);
  3302		}
  3303	
  3304		return &smmu->iommu;
  3305	
  3306	err_free_master:
  3307		kfree(master);
  3308		return ERR_PTR(ret);
  3309	}
  3310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
