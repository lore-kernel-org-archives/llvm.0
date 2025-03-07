Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A397013C8EA;
	Fri,  7 Mar 2025 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741378949; cv=none; b=HOPFt7TJmBrqPeLiNhx0p8bX8B/JpW2WC+YcDlhrahX2cWirqrG1zL7WNm3kEz/3plpfhhpjcEqrHc2LVjEqQ1nJImWAw2p3iW1P4ox3a25IrhPgsm3XwQ0VwSL1oLOqm7NY9fU8KqK9g7PLvFo+NoEpphV1YEC9c+1MbHhIzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741378949; c=relaxed/simple;
	bh=WYx401f6IJDSMLfGF94SjwionQn8HMWxw1+08UEdnE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qseaq022dWXttN+sfmrrph++DuYTDwofupAJ6h9Jmtk297AWWmX+UbNr8QFPh6Fnfuj0+ZcdO7HQkv36E1rt+1oQpGqHlO/yUS3QHCpTRUBXI5fYePJujuRaif/IYGmbUTQLoQmTlYKgaoTu9/B3XlJil6LgrL8Rmoj/EowD1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJrRHtYF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJrRHtYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741378948; x=1772914948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYx401f6IJDSMLfGF94SjwionQn8HMWxw1+08UEdnE0=;
  b=SJrRHtYFX3xc3L36z7RjoIB5mUWHwb1BCT+QN6brR8VTGzlx4cqABceS
   Sxj642vl24t3syUO9MLEvU0AthsLa75ulDkj+WNf8REVT8Xuo/u1SB994
   Af2OWzcXYzSKxxY1Vy97WYf16Z6A3GItjEv8aa/EcdFw+QGdCKZDq6XS0
   rz3EqHx2zMhxMkcSmyvYtVTpAfFkgHOivYtK7joVXqyiV8qLiHUPUl9X8
   Gojriu72DuT09JadtNeUhurLKGaoz9QQds8IDtEDyOJcfA5y9JBpprUK2
   Rw4aHpM4OmUijlZe8vUdtPA37X9AjsZ7ruazi+QXJMshkQqnNzxDWNJnC
   w==;
X-CSE-ConnectionGUID: ROBOEZy3Q9qaf8GB3YM/8Q==
X-CSE-MsgGUID: Fr35jKTMQBmLYPVA6AorIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46363891"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="46363891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 12:22:27 -0800
X-CSE-ConnectionGUID: E0NnkMVhSzGheL9qeGRFbw==
X-CSE-MsgGUID: OHuVbPfoQ+u4xSF+cMcnjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="119909272"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Mar 2025 12:22:25 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqeD9-00011T-0g;
	Fri, 07 Mar 2025 20:22:23 +0000
Date: Sat, 8 Mar 2025 04:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 187/411]
 drivers/gpu/drm/nouveau/nvkm/device/pci.c:1711:8: error: use of undeclared
 identifier 'nouveau_dsm_priv'
Message-ID: <202503080317.tuXaLwME-lkp@intel.com>
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
commit: 534e42b9723611083d7c2aca1460af3afa9ffec9 [187/411] drm/nouveau/nvif: add runpm supported flag to device impl
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250308/202503080317.tuXaLwME-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080317.tuXaLwME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080317.tuXaLwME-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/device/pci.c:24:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/pci.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/device/pci.c:24:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/pci.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/device/pci.c:24:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/pci.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
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
>> drivers/gpu/drm/nouveau/nvkm/device/pci.c:1711:8: error: use of undeclared identifier 'nouveau_dsm_priv'
    1711 |                 if (!nouveau_dsm_priv.optimus_detected) {
         |                      ^
   drivers/gpu/drm/nouveau/nvkm/device/pci.c:1712:8: error: use of undeclared identifier 'nouveau_dsm_priv'
    1712 |                         if (nouveau_dsm_priv.dsm_detected)
         |                             ^
   16 warnings and 2 errors generated.


vim +/nouveau_dsm_priv +1711 drivers/gpu/drm/nouveau/nvkm/device/pci.c

  1628	
  1629	int
  1630	nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
  1631			    struct nvkm_device **pdevice)
  1632	{
  1633		const struct nvkm_device_quirk *quirk = NULL;
  1634		const struct nvkm_device_pci_device *pcid;
  1635		const struct nvkm_device_pci_vendor *pciv;
  1636		const char *name = NULL;
  1637		struct nvkm_device_pci *pdev;
  1638		struct nvkm_device *device;
  1639		int ret, bits;
  1640	
  1641		switch (pci_dev->vendor) {
  1642		case 0x10de: pcid = nvkm_device_pci_10de; break;
  1643		default:
  1644			pcid = NULL;
  1645			break;
  1646		}
  1647	
  1648		while (pcid && pcid->device) {
  1649			if (pciv = pcid->vendor, pcid->device == pci_dev->device) {
  1650				while (pciv && pciv->vendor) {
  1651					if (pciv->vendor == pci_dev->subsystem_vendor &&
  1652					    pciv->device == pci_dev->subsystem_device) {
  1653						quirk = &pciv->quirk;
  1654						name  =  pciv->name;
  1655						break;
  1656					}
  1657					pciv++;
  1658				}
  1659				if (!name)
  1660					name = pcid->name;
  1661				break;
  1662			}
  1663			pcid++;
  1664		}
  1665	
  1666		if (!(pdev = kzalloc(sizeof(*pdev), GFP_KERNEL)))
  1667			return -ENOMEM;
  1668		pdev->pdev = pci_dev;
  1669		device = &pdev->device;
  1670	
  1671		ret = pci_enable_device(pci_dev);
  1672		if (ret) {
  1673			kfree(pdev);
  1674			return ret;
  1675		}
  1676	
  1677		ret = nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->dev,
  1678				       pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
  1679				       pci_find_capability(pci_dev, PCI_CAP_ID_AGP) ?
  1680				       NVKM_DEVICE_AGP : NVKM_DEVICE_PCI,
  1681				       (u64)pci_domain_nr(pci_dev->bus) << 32 |
  1682					    pci_dev->bus->number << 16 |
  1683					    PCI_SLOT(pci_dev->devfn) << 8 |
  1684					    PCI_FUNC(pci_dev->devfn), name,
  1685				       &pdev->device);
  1686	
  1687		if (ret)
  1688			goto done;
  1689	
  1690		/* Set DMA mask based on capabilities reported by the MMU subdev. */
  1691		if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
  1692			bits = pdev->device.mmu->dma_bits;
  1693		else
  1694			bits = 32;
  1695	
  1696		ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bits));
  1697		if (ret && bits != 32) {
  1698			dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
  1699			pdev->device.mmu->dma_bits = 32;
  1700		}
  1701	
  1702	done:
  1703		if (ret) {
  1704			nvkm_device_del(&device);
  1705			return ret;
  1706		}
  1707	
  1708		*pdevice = &pdev->device;
  1709	
  1710		if (nvkm_runpm) {
> 1711			if (!nouveau_dsm_priv.optimus_detected) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
