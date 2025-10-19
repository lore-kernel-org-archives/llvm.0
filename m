Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4A26ACC;
	Sun, 19 Oct 2025 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760858807; cv=none; b=ZqtCJyo9x6WGISR+zlcHJStIrZjqeMw6BTmKVohWJPHFIAjPVIcPKpIcb3oPzgliYZ/vSS0VF2FZpy0T3aFbI1oF2485GrCDdCb1xYKU1rBkPYFsLA21BsoUgl54DaTlpYbmI6S+yPv/hvKaQP7gcKL+reyEbF1uOxwNhjyOrFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760858807; c=relaxed/simple;
	bh=n85G+Se63+yTB1V82d593hsdF7wRXHiMqqwUVHX+N9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhIcgCRLgHQDl1j2QutitGVrEH5hNfozoXLNjg9R01o5sHx+y+WlZke2IwoKqmiWZiub7CcCs/HgNfb2anxTXHYPkBsYmZcsN9Ow2790mSuwemX075rXvwFLIGEhphX5FwGFKM2r90UceUvXXRwrLvC+3tFHlWROEwjkPngnv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgYMMFD1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgYMMFD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760858806; x=1792394806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n85G+Se63+yTB1V82d593hsdF7wRXHiMqqwUVHX+N9k=;
  b=PgYMMFD1ezQ0pB9N/mvuY+JRAjebcMtsPjEVmP98LC5Vmbsy2l/RmG5t
   Cebk1aro9/3uFResX3DpcfY9UOr6eaT6aV9DIpgYnKTnnG3GNLKFrfuJC
   /76N49K1Vg1AysNL0UzXP9l0pq7/fx6SaOkQu/5j8UKxkPAebty+K3cKJ
   IvFpGEo2OfgV9dejmJXwxVJA2LPSCcG0ugKEJJmQx3HJ4kH3M7eBHNggM
   enFbHb9oyTRsGtjkZmi5U+mpz6z5+WblB8YfHxnvCLtXTT4Qpbe92njXJ
   gzzmr9bvaYhkb9xLTaco9EtprJxNrF9U/qqf2cyAqfyjpv/Wb/SH70w/E
   A==;
X-CSE-ConnectionGUID: VCwVxoAlTxie0gdKp8c1fg==
X-CSE-MsgGUID: HzgUhphrTzeDSAbozAusnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73687813"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="73687813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 00:26:43 -0700
X-CSE-ConnectionGUID: MHT4ywEhS2SbGzbTzjaPMw==
X-CSE-MsgGUID: ZaHxjp5ORZ6ZRzcn1h+HGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="182784147"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2025 00:26:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vANo5-0008uz-0d;
	Sun, 19 Oct 2025 07:26:34 +0000
Date: Sun, 19 Oct 2025 15:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 15/28]
 drivers/vfio/pci/nvgrace-gpu/main.c:714:38: error: called object type 'void
 *' is not a function or function pointer
Message-ID: <202510191540.m5JEj2cl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   fa05815572860da32b9145bb5e396a511cc081a9
commit: b223fd6ff7a3c77e15e53a2068a3906acf8f178b [15/28] vfio/nvgrace: Support get_dmabuf_phys
config: loongarch-randconfig-002-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191540.m5JEj2cl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191540.m5JEj2cl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191540.m5JEj2cl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/nvgrace-gpu/main.c:714:38: error: called object type 'void *' is not a function or function pointer
     714 |         return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   1 error generated.


vim +714 drivers/vfio/pci/nvgrace-gpu/main.c

   686	
   687	static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vdev,
   688					   struct p2pdma_provider **provider,
   689					   unsigned int region_index,
   690					   struct phys_vec *phys_vec,
   691					   struct vfio_region_dma_range *dma_ranges,
   692					   size_t nr_ranges)
   693	{
   694		struct nvgrace_gpu_pci_core_device *nvdev = container_of(
   695			core_vdev, struct nvgrace_gpu_pci_core_device, core_device);
   696		struct pci_dev *pdev = core_vdev->pdev;
   697	
   698		if (region_index == RESMEM_REGION_INDEX) {
   699			*provider = pcim_p2pdma_provider(pdev, 0);
   700			if (!*provider)
   701				return -EINVAL;
   702			return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
   703							   nr_ranges,
   704							   nvdev->resmem.memphys,
   705							   nvdev->resmem.memlength);
   706		} else if (region_index == USEMEM_REGION_INDEX) {
   707			/* Indicates cachable memory. */
   708			*provider = NULL;
   709			return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
   710							   nr_ranges,
   711							   nvdev->usemem.memphys,
   712							   nvdev->usemem.memlength);
   713		}
 > 714		return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
   715						     phys_vec, dma_ranges, nr_ranges);
   716	}
   717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
