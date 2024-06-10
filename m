Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599D93BBE9;
	Mon, 10 Jun 2024 23:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718061523; cv=none; b=s5C6YVcWkb5K6eYQQLcHIl+ZQU+seuRL7KjGclTF8vhx82zKu3jpLVGULEYCXgs0CPipkgMk447+ac7J5mO79f3ErE0gS1jtfMIN1fuiTs52b5AI/5pFphZASoHVCpSgdFjxJpxj/ycCJmvMIQDad0l/6s1LONyy+2g5P9HVYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718061523; c=relaxed/simple;
	bh=HEHDSsMOc1R1S1VQAGeuXtrpByKsBEyFoTn6UfzyxL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeSjPt5aMCuZZZMo5/OmbOAFsBohf3AA/r5cBBGvnE/PGjkNCHWytSJGrmJmTszpes22D8jiqmCUVLCdu44JI1R+HBJr6vmnEkD4xljC1XLUPEC3dzFqWe8MGZelRn4Ts2A+WxuQniCgUCtgS4uI5IJZYSU+57ecBoTDo6sLiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jg7euksw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jg7euksw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718061521; x=1749597521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HEHDSsMOc1R1S1VQAGeuXtrpByKsBEyFoTn6UfzyxL4=;
  b=jg7eukswiZikFfqmIVpX3C++rqqdTFAzhjN7+NM4hmC7aUSsT6zy5n74
   iUJ0w0gp81j76BybnvbiWt6nzk7Qp20D1jFCRpZWibBUdkWMvZKGm0dax
   O4v2ghGC+MGLRQ+mb8+SoUjUQ07tQZJnN4qqPQi7bscPQceZyq/BiS//7
   8fUedkmWmfEvSARB5ZR2m81uM/XJNyzr2jrUqu98+OwlfyOkDOibyH6LL
   kTHbfw0MrqqMupwpIhZES+C32IO6J2wGl41t3HaDjgZqa5oWnjn7P4CBw
   ZPJDTHA9wyE9qqaOr8GkFs3jsClZnwK0QufROSJIpu/plTt87jv5HwokT
   Q==;
X-CSE-ConnectionGUID: kXWqF1KaSnK2O+5xekD7yg==
X-CSE-MsgGUID: LcHgcpuIRZKZBzHox0ZkiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12008200"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="12008200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 16:18:40 -0700
X-CSE-ConnectionGUID: imA/flIMTiSNQlE0ltN3GA==
X-CSE-MsgGUID: hU5WL8PPTsq9Mvk5wlYKzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="76672526"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2024 16:18:39 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGoHd-0002Zg-0C;
	Mon, 10 Jun 2024 23:18:37 +0000
Date: Tue, 11 Jun 2024 07:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Subject: [tglx-devel:devmsi-arm 3/25] include/linux/acpi_iort.h:53:19: error:
 static declaration of 'iort_pmsi_get_dev_id' follows non-static declaration
Message-ID: <202406110704.R8AnGe0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-arm
head:   c0f9480169244284eb4f7bc656ab52d03a5badd4
commit: f2082cdb1e418911969043dda100eaaab513e531 [3/25] ACPI/IORT: Make iort_pmsi_get_dev_id() available for !CONFIG_ACPI_IORT
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240611/202406110704.R8AnGe0q-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110704.R8AnGe0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110704.R8AnGe0q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/glue.c:11:
>> include/linux/acpi_iort.h:53:19: error: static declaration of 'iort_pmsi_get_dev_id' follows non-static declaration
      53 | static inline int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
         |                   ^
   include/linux/acpi_iort.h:30:5: note: previous declaration is here
      30 | int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id);
         |     ^
   In file included from drivers/acpi/glue.c:19:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 1 error generated.


vim +/iort_pmsi_get_dev_id +53 include/linux/acpi_iort.h

    31	
    32	#ifdef CONFIG_ACPI_IORT
    33	u32 iort_msi_map_id(struct device *dev, u32 id);
    34	struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
    35						  enum irq_domain_bus_token bus_token);
    36	void acpi_configure_pmsi_domain(struct device *dev);
    37	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
    38			       struct list_head *head);
    39	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode,
    40			       struct list_head *head);
    41	/* IOMMU interface */
    42	int iort_dma_get_ranges(struct device *dev, u64 *limit);
    43	int iort_iommu_configure_id(struct device *dev, const u32 *id_in);
    44	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head);
    45	phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
    46	#else
    47	static inline u32 iort_msi_map_id(struct device *dev, u32 id)
    48	{ return id; }
    49	static inline struct irq_domain *iort_get_device_domain(
    50		struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
    51	{ return NULL; }
    52	static inline void acpi_configure_pmsi_domain(struct device *dev) { }
  > 53	static inline int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id)
    54	{ return -ENODEV; }
    55	static inline
    56	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    57	static inline
    58	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    59	/* IOMMU interface */
    60	static inline int iort_dma_get_ranges(struct device *dev, u64 *limit)
    61	{ return -ENODEV; }
    62	static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
    63	{ return -ENODEV; }
    64	static inline
    65	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head)
    66	{ }
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
