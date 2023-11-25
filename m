Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D01B6FB8;
	Sat, 25 Nov 2023 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQCG4UD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700913596; x=1732449596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oUlEByMoT6bdd+mSiDNamKN4k9Weby3wSolFCnELJvM=;
  b=DQCG4UD+J1Lfdt79ol9CgsV9D6cgFbYoSgHTjFVay7c+UNaXBiw6QJK/
   dYtn/NhjM/LZSi/kVfTLFLu0xScKgxbUdhOkmwxLwFlU/mfViSC4Z+BI9
   TqH2mZjFOeiSMncIez3El1WWPlNPQbiyn4SJx0AB+xA5qmhvUU9p12HPS
   5rj9oVPl7Kb2ShEgnsNpYHtoJ94dVs4kW2jdeELIeGt5UIH7OVtvMUYdD
   bewA4M5DvNFx+thpzFzrki0hkXjwx7RDvzIWtX/aVa/6CwtQn7CoTZszb
   kt1+5ZTqqVwBabxcj+TdzF51ESh99boa9jrw6OJx1OrznTQ4KCsZ0Wx9q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="396415227"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="396415227"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 03:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761188503"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="761188503"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2023 03:59:54 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6rKB-0003ww-2s;
	Sat, 25 Nov 2023 11:59:51 +0000
Date: Sat, 25 Nov 2023 19:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 15/41] include/linux/acpi_iort.h:74:1:
 error: expected identifier or '('
Message-ID: <202311251817.3NIykI1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 1f761415430ba5ac67203383be9727e9a704c32e [15/41] ACPI: IORT: Remove fwspec from the reserved region code
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20231125/202311251817.3NIykI1w-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251817.3NIykI1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251817.3NIykI1w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/glue.c:11:
>> include/linux/acpi_iort.h:74:1: error: expected identifier or '('
   { }
   ^
   1 error generated.


vim +74 include/linux/acpi_iort.h

415e84294798d1 Arnd Bergmann         2023-05-16  31  
73ef3ce9e13c03 Jason Gunthorpe       2023-11-24  32  typedef int (*iort_for_each_fn)(struct acpi_iort_node *iommu, u32 streamid,
73ef3ce9e13c03 Jason Gunthorpe       2023-11-24  33  				void *info);
73ef3ce9e13c03 Jason Gunthorpe       2023-11-24  34  int iort_iommu_for_each_id(struct device *dev, const u32 *id_in,
73ef3ce9e13c03 Jason Gunthorpe       2023-11-24  35  			   unsigned int *flags, iort_for_each_fn fn,
73ef3ce9e13c03 Jason Gunthorpe       2023-11-24  36  			   void *info);
73ef3ce9e13c03 Jason Gunthorpe       2023-11-24  37  
88ef16d888a094 Tomasz Nowicki        2016-09-12  38  #ifdef CONFIG_ACPI_IORT
39c3cf566ceafa Lorenzo Pieralisi     2020-06-19  39  u32 iort_msi_map_id(struct device *dev, u32 id);
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  40  struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  41  					  enum irq_domain_bus_token bus_token);
d4f54a186667ff Hanjun Guo            2017-03-07  42  void acpi_configure_pmsi_domain(struct device *dev);
e302eea8f49717 Shameer Kolothum      2022-06-15  43  void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
e302eea8f49717 Shameer Kolothum      2022-06-15  44  		       struct list_head *head);
e302eea8f49717 Shameer Kolothum      2022-06-15  45  void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode,
e302eea8f49717 Shameer Kolothum      2022-06-15  46  		       struct list_head *head);
643b8e4d86f8b1 Lorenzo Pieralisi     2016-11-21  47  /* IOMMU interface */
db59e1b6e49201 Jean-Philippe Brucker 2021-06-18  48  int iort_dma_get_ranges(struct device *dev, u64 *size);
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  49  int iort_iommu_configure_id(struct device *dev, const u32 *id_in);
1f761415430ba5 Jason Gunthorpe       2023-11-24  50  void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head,
1f761415430ba5 Jason Gunthorpe       2023-11-24  51  				 struct fwnode_handle *iommu_fwnode,
1f761415430ba5 Jason Gunthorpe       2023-11-24  52  				 const u32 *fw_ids, unsigned int fw_num_ids);
2b8652936f0ca9 Ard Biesheuvel        2020-11-19  53  phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
88ef16d888a094 Tomasz Nowicki        2016-09-12  54  #else
39c3cf566ceafa Lorenzo Pieralisi     2020-06-19  55  static inline u32 iort_msi_map_id(struct device *dev, u32 id)
39c3cf566ceafa Lorenzo Pieralisi     2020-06-19  56  { return id; }
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  57  static inline struct irq_domain *iort_get_device_domain(
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  58  	struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
4bf2efd26d7624 Tomasz Nowicki        2016-09-12  59  { return NULL; }
d4f54a186667ff Hanjun Guo            2017-03-07  60  static inline void acpi_configure_pmsi_domain(struct device *dev) { }
e302eea8f49717 Shameer Kolothum      2022-06-15  61  static inline
e302eea8f49717 Shameer Kolothum      2022-06-15  62  void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
e302eea8f49717 Shameer Kolothum      2022-06-15  63  static inline
e302eea8f49717 Shameer Kolothum      2022-06-15  64  void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
643b8e4d86f8b1 Lorenzo Pieralisi     2016-11-21  65  /* IOMMU interface */
db59e1b6e49201 Jean-Philippe Brucker 2021-06-18  66  static inline int iort_dma_get_ranges(struct device *dev, u64 *size)
db59e1b6e49201 Jean-Philippe Brucker 2021-06-18  67  { return -ENODEV; }
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  68  static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  69  { return -ENODEV; }
8b4282e6b8e239 Shameer Kolothum      2018-02-13  70  static inline
1f761415430ba5 Jason Gunthorpe       2023-11-24  71  void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head,
1f761415430ba5 Jason Gunthorpe       2023-11-24  72  				 struct fwnode_handle *iommu_fwnode,
1f761415430ba5 Jason Gunthorpe       2023-11-24  73  				 const u32 *fw_ids, unsigned int fw_num_ids);
8778b1d4811705 Shameer Kolothum      2022-06-15 @74  { }
2b8652936f0ca9 Ard Biesheuvel        2020-11-19  75  

:::::: The code at line 74 was first introduced by commit
:::::: 8778b1d48117055c710a01498f65fa730160fdfa ACPI/IORT: Make iort_iommu_msi_get_resv_regions() return void

:::::: TO: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
