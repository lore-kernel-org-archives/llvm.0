Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755F13E41A;
	Thu, 23 Jan 2025 20:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737665840; cv=none; b=F89HOohjbQthv7DTA/DtDdh5+MejKiGZ4maZlF00Q/NwHlPPQFykVDYHbuCOJWAUi3tu2NrunNAfsJA1lX4gXTZsegT/yQNGTGwvch+YXvZke/OFIePkKhQETdNs7sPavV1Nf1TRU0oCpggZ+onBOwoDjAHriUeGwh/63T0XzFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737665840; c=relaxed/simple;
	bh=vcgzOAWW1RnY5DFAuGmop61CEvLD/zcS5/f/ggmWOU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SR5a6j4eN5p7IKZroQm6pULg69ZEFH5RmU0DeMQPiHQ3vzPB0/O8uZKErO411x3TxrlU4RE8GCMKpLn2YOb0qsWNH3256J73QXask7YfpHBVlU6//PWNg7WrInEFv9lnnE+mcEaAPsO2eLrxZtcJmvlMCk7JENeQkQjVtgnDPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBta2iSX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBta2iSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737665839; x=1769201839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcgzOAWW1RnY5DFAuGmop61CEvLD/zcS5/f/ggmWOU4=;
  b=aBta2iSXhrOReBkJT+ADJAqmKlUjT1zCnFkLXHfoLl15q/MrHCyiAtyP
   2Xa+4wRC/QlhZgcxzOj+HhN6D17NaM+NtP9MkH6eIZkhgLb6TQX/oqT8/
   lFbzhRsjXY3F7AE8BIM5z8RB+cHvqqYVCLO534CVdc3BTV8VQqtRfbyVo
   qNbTxyvhPCLF+71L7LXkEIoaTlxjqsBkoRJkV6Sn4hIIitqf3VxmCkzlA
   lEaIp6tLhhrCOZXdTIdBeQLlkmBRRbaiu88ZWSIP5jq3tMvhupdsXSmr2
   kdkIiLp7SMoMn5FgQb++a4tC6KdhsDja0MauZPcyP9vrQkYsnXYobvY+V
   w==;
X-CSE-ConnectionGUID: KNSmRPxtSQmx84C3B9qwaA==
X-CSE-MsgGUID: KC5tOZwkQZe9BzQHZFqkNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38079144"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38079144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:57:17 -0800
X-CSE-ConnectionGUID: xiy2+7ojQGyzgTpuUS4SQQ==
X-CSE-MsgGUID: TeUzAgiUT3i7VPaYrDBjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107572638"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 12:57:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb4GH-000bfz-1h;
	Thu, 23 Jan 2025 20:57:13 +0000
Date: Fri, 24 Jan 2025 04:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_rm_ops_pgsize 22/23]
 drivers/iommu/riscv/iommu.c:1535:3: error: field designator 'pgsize_bitmap'
 does not refer to any field in type 'const struct iommu_ops'
Message-ID: <202501240431.7HOXfICP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_rm_ops_pgsize
head:   8e7229d631eab655526324f9d867904ee1351605
commit: 7e198028456d41f2aa10f07650728e74a09f427a [22/23] iommu: Remove ops->pgsize_bitmap
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250124/202501240431.7HOXfICP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240431.7HOXfICP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240431.7HOXfICP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/riscv/iommu.c:1535:3: error: field designator 'pgsize_bitmap' does not refer to any field in type 'const struct iommu_ops'
    1535 |         .pgsize_bitmap = SZ_4K,
         |         ~^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1535 drivers/iommu/riscv/iommu.c

488ffbf181718b Tomasz Jeznach 2024-10-15  1533  
822e8bc6850582 Tomasz Jeznach 2024-10-15  1534  static const struct iommu_ops riscv_iommu_ops = {
488ffbf181718b Tomasz Jeznach 2024-10-15 @1535  	.pgsize_bitmap = SZ_4K,
822e8bc6850582 Tomasz Jeznach 2024-10-15  1536  	.of_xlate = riscv_iommu_of_xlate,
822e8bc6850582 Tomasz Jeznach 2024-10-15  1537  	.identity_domain = &riscv_iommu_identity_domain,
1bac10c557adb2 Tomasz Jeznach 2024-10-15  1538  	.blocked_domain = &riscv_iommu_blocking_domain,
1bac10c557adb2 Tomasz Jeznach 2024-10-15  1539  	.release_domain = &riscv_iommu_blocking_domain,
488ffbf181718b Tomasz Jeznach 2024-10-15  1540  	.domain_alloc_paging = riscv_iommu_alloc_paging_domain,
822e8bc6850582 Tomasz Jeznach 2024-10-15  1541  	.device_group = riscv_iommu_device_group,
822e8bc6850582 Tomasz Jeznach 2024-10-15  1542  	.probe_device = riscv_iommu_probe_device,
488ffbf181718b Tomasz Jeznach 2024-10-15  1543  	.release_device	= riscv_iommu_release_device,
822e8bc6850582 Tomasz Jeznach 2024-10-15  1544  };
822e8bc6850582 Tomasz Jeznach 2024-10-15  1545  

:::::: The code at line 1535 was first introduced by commit
:::::: 488ffbf181718b9ad8c1838cb249d60973e78eda iommu/riscv: Paging domain support

:::::: TO: Tomasz Jeznach <tjeznach@rivosinc.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
