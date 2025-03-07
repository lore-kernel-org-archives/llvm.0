Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4669219E8;
	Fri,  7 Mar 2025 23:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741389529; cv=none; b=AvzxUbWJKOsNn9wIXZ+xxZBEAlMdu3flxe1PKFEcVkM4o9/t3aqffRa943IyFWLqXt+7dcJYgJu+Q+xOqv3+HWpchj3mXio0zOWE7DiHC1GFWitVa5V0CvxD04BpkSoMYjRVJoPmXuXV2/xHF+whCRlIzuWzWO4pXrdcywZP/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741389529; c=relaxed/simple;
	bh=SGbjZXP+dDpCY4Npn4/qv+l6WgdAJj/ZTXj5Ia9hXV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+aHm7cSrnXQZpNdyZ4rG5QlfmIdv6plr1p2+f/ctKZRDFXx+pTWOKPzSrjKSNj3OoVuHnC1gpdSYt2mbnnhOmnW5dt/6FqgtxeXYXTvhDCY5cwgaKr/+iCZm74yLsUIDzxYKkD5171EThYWWzS5DQUFx0cKjbP5teV3S36KvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APiaq9Dr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APiaq9Dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741389528; x=1772925528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SGbjZXP+dDpCY4Npn4/qv+l6WgdAJj/ZTXj5Ia9hXV8=;
  b=APiaq9DrPrdp3r1WK+lRqEyku9+1Ce26hkUuGBS2VTM9ukvKckJM5F6d
   wi0rekwAcNderg0RnxAZMhVmfozPjq869o0jbpdUqEo2qQDaZ91g6Sz5T
   hBNZh2BVmyJyMBP+f2c9A1BBKKi0zoPVQ6evQbaoaMF1eHx4ULm5EOc7R
   +oL7V3ZNLghzZCLnDkUQuYZLW7oV9mkKYFRGrUmmLGCOD0DqPT7jzWMYj
   mzHMYMkK6o1YyBz0ZxM4NvvrINdy7W9Vxc/J5j590GLoecM5CG7LoCOi7
   +nSmOqlQqMV6NJkMYuCaAs2npisNjPUjmyX1nRqsKG4l3+PMGc0rpv2DC
   g==;
X-CSE-ConnectionGUID: XGA52RWfSkK70q7WcjuyRw==
X-CSE-MsgGUID: Bn/0Vj8yRNe1Y2+pZIdozA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42652038"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="42652038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 15:18:48 -0800
X-CSE-ConnectionGUID: 2/XIlxpORZKAoqhdUeHY3w==
X-CSE-MsgGUID: lhF5PQgzSsy5AY37GMF1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="124464035"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2025 15:18:46 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqgxn-0001Az-1n;
	Fri, 07 Mar 2025 23:18:43 +0000
Date: Sat, 8 Mar 2025 07:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 192/411]
 drivers/gpu/drm/nouveau/nouveau_drm.c:824:1: warning: unused label
 'fail_drm_dev_init'
Message-ID: <202503080712.rNSoZTIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: d5f4619b33f18fda53df3bd2b5608cc78d5798b0 [192/411] drm/nouveau/nvkm: move pci probe() enable/disable handling from drm
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250308/202503080712.rNSoZTIG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080712.rNSoZTIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080712.rNSoZTIG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:26:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
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
   In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:27:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:27:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:27:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/nouveau/nouveau_drm.c:824:1: warning: unused label 'fail_drm_dev_init' [-Wunused-label]
     824 | fail_drm_dev_init:
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_drm.c:836:22: warning: unused variable 'device' [-Wunused-variable]
     836 |         struct nvkm_device *device = drm->nvkm;
         |                             ^~~~~~
   drivers/gpu/drm/nouveau/nouveau_drm.c:484:1: warning: unused variable 'nouveau_driver' [-Wunused-const-variable]
     484 | nouveau_driver = {
         | ^~~~~~~~~~~~~~
   19 warnings generated.


vim +/fail_drm_dev_init +824 drivers/gpu/drm/nouveau/nouveau_drm.c

   786	
   787	static int nouveau_drm_probe(struct pci_dev *pdev,
   788				     const struct pci_device_id *pent)
   789	{
   790		struct nvkm_device *device;
   791		struct nouveau_drm *drm;
   792		int ret;
   793	
   794		/* We need to check that the chipset is supported before booting
   795		 * fbdev off the hardware, as there's no way to put it back.
   796		 */
   797		ret = nvkm_device_pci_driver.probe(pdev, NULL);
   798		if (ret)
   799			return ret;
   800	
   801		device = pci_get_drvdata(pdev);
   802	
   803		if (nouveau_atomic)
   804			driver_pci.driver_features |= DRIVER_ATOMIC;
   805	
   806		drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
   807		if (IS_ERR(drm)) {
   808			ret = PTR_ERR(drm);
   809			goto fail_nvkm;
   810		}
   811	
   812		ret = nouveau_drm_device_init(drm);
   813		if (ret)
   814			goto fail_drm;
   815	
   816		if (drm->device.impl->ram_size <= 32 * 1024 * 1024)
   817			drm_fbdev_ttm_setup(drm->dev, 8);
   818		else
   819			drm_fbdev_ttm_setup(drm->dev, 32);
   820	
   821		quirk_broken_nv_runpm(pdev);
   822		return 0;
   823	
 > 824	fail_drm_dev_init:
   825		nouveau_drm_device_fini(drm);
   826	fail_drm:
   827		nouveau_drm_device_del(drm);
   828	fail_nvkm:
   829		nvkm_device_del(&device);
   830		return ret;
   831	}
   832	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
