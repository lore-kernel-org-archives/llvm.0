Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A98442364;
	Thu, 20 Aug 2026 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229231; cv=none; b=lOmxs1qRadEUoNB9LMPGXycoiPJdFa621foMrA1gd5zK8YRCblQum0rC1gom+GqDHPjUmV1lfzs/55HUgL0SX73JHpcDeq4I/Ynmw9uP39hStnFfcdk5NF1Al7xXI2ojGeIInoANZCpZ61KCnPHRVNUhDgRtcMbpZvnKP4LpXVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229231; c=relaxed/simple;
	bh=tdIJF/p7/e7pDgGK84z5CFpKTftJzznPcEGB0gZ7xPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=isOr317YHe3SjKZENuOh2Msj3PsQgKKJG8gh3y5kcKkNSuCG+/YZb59vT1DnZrkFPuRD4DpLK0iANp9HlRgjmwXCJHcpTbXS9xKvtWZWLhhJjxqSdRSKagvSZIqj1RiR3OaIDSqS5sj5njKDk8m3iWE2bJRRRljBmN5TMAoV6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecbo6eea; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecbo6eea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787229229; x=1818765229;
  h=date:from:to:cc:subject:message-id;
  bh=tdIJF/p7/e7pDgGK84z5CFpKTftJzznPcEGB0gZ7xPE=;
  b=ecbo6eea9rgJl+T52aebK20doL4ndIgqAZLtUXHBCvmCNKJMXt+NBDeA
   T4NQY46BP9dxxhwRSgLhCeCp83EH3nawBh2hiYFtI8Ze9Z7w8Ud+xIWG0
   hCSuXcFrYsijUP5393V0MsUiRaQoQu1BsnUZZk8b1OP7VXW4Wyhsjrm8t
   elnuLo9F9JwzbFcegR18wyb/IGGHvW2372rg31NacMcopnVzNRNf2V7T8
   GPi3BknARwvd3J4A++qmViVispmzFxWuoapaUsygS9DU5lYghR8/7NHmB
   R6MqFuQnpFMjV9Y70sfI3/TBYky7TpH2nX4faEus5ckfQEiCbNc2KTJhy
   w==;
X-CSE-ConnectionGUID: xHD0UwfCQgml0xvtAIIb3A==
X-CSE-MsgGUID: T4gMgsymT1iul08qaGRztw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99283643"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="99283643"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 05:33:48 -0700
X-CSE-ConnectionGUID: m6oihwobTdGDe7qDuqIclg==
X-CSE-MsgGUID: OT0CStejR1yPe0JC7CRbKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="262697776"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2026 05:33:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx1xn-00000000j05-0qyJ;
	Thu, 20 Aug 2026 12:33:43 +0000
Date: Thu, 20 Aug 2026 20:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c:19:37:
 warning: result of comparison of constant 4503599627370495 with expression of
 type 'dma_addr_t' (aka 'unsigned int') is always false
Message-ID: <202608202040.g0B7f22s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Timur,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 31d3354f42c0da34415164a1f621a195caa1f1bc drm/nouveau: verify that hardware supports the flush page address
date:   9 months ago
config: i386-randconfig-007-20260820 (https://download.01.org/0day-ci/archive/20260820/202608202040.g0B7f22s-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608202040.g0B7f22s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 31d3354f42c0 ("drm/nouveau: verify that hardware supports the flush page address")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608202040.g0B7f22s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c:19:37: warning: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      19 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.


vim +19 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c

     9	
    10	static void
    11	gb100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
    12	{
    13		const u32 addr_hi = upper_32_bits(fb->sysmem.flush_page_addr);
    14		const u32 addr_lo = lower_32_bits(fb->sysmem.flush_page_addr);
    15		const u32 hshub = DRF_LO(NV_PFB_HSHUB0);
    16		struct nvkm_device *device = fb->subdev.device;
    17	
    18		// Ensure that the address is within hardware limits
  > 19		WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
    20	
    21		nvkm_wr32(device, hshub + NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI, addr_hi);
    22		nvkm_wr32(device, hshub + NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO, addr_lo);
    23		nvkm_wr32(device, hshub + NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI, addr_hi);
    24		nvkm_wr32(device, hshub + NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO, addr_lo);
    25	}
    26	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
