Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302779;
	b=irfZ7KzInC9JVKTsrQLdmmVHZKN0GiheP5stq4XFesUWM7YgwR6mN0AAY89FmY2rXL7Q
	 /MZsYu5MyNJDybTxDqWESoyMEVLpe7Xs5F9L0zCfisDQrKZ22XxFjT6ux9fLtuTEvsyJW
	 WUbODj9ll2A6mOba4XTdF2y/iX/C1mJ5u1tRS9KzQL3i2bGJRuyF1gIgM0G0HE+djxWQa
	 ESxTYSUGiSJqRpE9EA+xsG3/SGLULwt6f+cps4gA0tUyP+sR3bFLdFS+zg7ZLkjKRLiYB
	 DRu9kZ2YDychyHC2ru8h4lus4TCCB4Xt8hN//RPlqj0y2w8213JCVuXsOFRKde9gZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302779;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vwMSBReu/Bf7JM5qsY+T+HiRJ7jmx8jYYQc1ZkNTqBA=;
	b=Y5stWH96tobRrx3r2allfFk4Ax+vQBD60JJ0/C8m0C+VvsF3bRMX0FX0US8aNCCPpH+o
	 DA0MWXuklHyMjwuBzgjC37Axj81Nqq5tolCZ5ZtlXm0tHFG8LNLrBrAS9p+0dvabE/2AU
	 7uAyrseF/oqwx1lS4UKoLohF7K0T7sGjlsOQV0QnSK6V+ch7c6Qv76qCZtrPS1flNVdkU
	 JarcAroBoBpm6lprSNG8cD85fCfoPOg6+iPHWMkIVdX/7zf1nSfYxT0b8n4SpKO4cZjaa
	 jvDX3EJfW31zN8CqTBqi2UFNFpOFOizEnHHfkPHmzFpoDdq2YhScjSKnyS09UWbyXiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYJZkYTw;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4520B606A320;
	Sat, 21 Nov 2026 23:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4520B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYJZkYTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302778; x=1826838778;
  h=date:from:to:cc:subject:message-id;
  bh=Xa/DVIU0dfCyM34fK8E5Dt2Y638mDLq8d863Pfq7GIs=;
  b=QYJZkYTwrPlp/+yRW7TYsEc+AViulSeqKnVjmzkCXIVAr/HLLWgidtkc
   eSmf6nELQYfbEy4ErFmRTs3EyCtzN7mDiPRiB/YUEc5mFgsmPAxdylZZi
   0ZnhIvRgqfTcequZD80Pv/NsMN3p8dNmFxmzgxK8JB9WeV/ehhlYHd79t
   xfa72TiebFt0IzkfTWAOiZe3rccMgiisGhVkvu3sIIJy7XiXlh9Od9UtX
   9TyzhpIs9IW9N5IqYKdIqV9kO5frysoe/mhDFu8Fdg8EuuvKNnrVNPN2d
   RlOo9dsd/qYJI3fbmX7ubWygsg562LLMLvGKvD9FVwpPuLSpW1BouM5ed
   A==;
X-CSE-ConnectionGUID: wzIX7NVHQ0G/u7GtkvSQLA==
X-CSE-MsgGUID: fMhOb0JGSGCSAvAtlZ3MkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4042803"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4042803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:12:58 -0800
X-CSE-ConnectionGUID: Ut5ODoiXR/eh+BIJ9K/npw==
X-CSE-MsgGUID: rVhrMwJMSVK3/cxmTtfZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11066251"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2026 15:12:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUuGM-00000001Kjr-0RwZ;
	Sat, 21 Nov 2026 23:12:54 +0000
Date: Sun, 22 Nov 2026 07:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 52/105]
 drivers/iommu/riscv/iommu.c:1374:16: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611220733.xV4aOPf6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   5d559f35c311939a912dec052dd62819d2d39c70
commit: 27d7999789fe4bde5b3d8f8815fb9cbdf7efb76f [52/105] iommu/riscv: Prepare MSI table updates for interrupt remapping
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611220733.xV4aOPf6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220733.xV4aOPf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611220733.xV4aOPf6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu.c:18:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iommu/riscv/iommu.c:1374:16: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1374 |                 dc->msiptp = virt_to_pfn(msi_table->root) |
         |                              ^
   drivers/iommu/riscv/iommu.c:1374:16: note: did you mean 'virt_to_pte'?
   arch/um/include/asm/pgtable.h:291:15: note: 'virt_to_pte' declared here
     291 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |               ^
   1 warning and 1 error generated.


vim +/virt_to_pfn +1374 drivers/iommu/riscv/iommu.c

  1369	
  1370	static void riscv_iommu_msi_table_set_dc(struct riscv_iommu_msi_table *msi_table,
  1371						 struct riscv_iommu_dc *dc, bool activate)
  1372	{
  1373		if (activate) {
> 1374			dc->msiptp = virt_to_pfn(msi_table->root) |
  1375				     FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1376						RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1377			dc->msi_addr_mask = msi_table->msi_addr_mask;
  1378			dc->msi_addr_pattern = msi_table->msi_addr_pattern;
  1379		} else {
  1380			dc->msiptp = 0;
  1381			dc->msi_addr_mask = 0;
  1382			dc->msi_addr_pattern = 0;
  1383		}
  1384	}
  1385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
