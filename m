Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A86AAD;
	Sun, 23 Feb 2025 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740270841; cv=none; b=soGjeBmAh+YPeb8a9AylZ4AgXb8cBcPnqAZNn7IxeSFu7CgA/hO2gwunzn77XG+/iIQFsUJ9bjfFLdzTVdyLNdW9Y+KE+oCP2WkoOkhnH/N4oTpyDvymDK2ZT1DC4MwqLsvDSGQud7/EnipWrHY3elB/IKxzvntkIrC+JE96fAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740270841; c=relaxed/simple;
	bh=fkgNxA+xtUXoDFWrU0XngDn3bdYGJ+CGOF7vd2iQS38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HyAh3FKHYCd5+LvoRWjicunpx9mSFXrEzwgkUV3R+6DaAUcv4AlFgXw6BXCRFxxFbOz7dU24JNBP0/wQQORpz2QaQFfRilkux9KQnPbhSxI3bceNqFGNf3Z56FuVsQbWKXSpglTi8mudpPGh33AUQ8aD5cuNTaKCut3okZyBATE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv1WAObI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv1WAObI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740270839; x=1771806839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkgNxA+xtUXoDFWrU0XngDn3bdYGJ+CGOF7vd2iQS38=;
  b=Fv1WAObIaufXOBvrfol09fi0IV98H4c5awqBWLuvGcai/8AXpbyxjzCD
   SVCimSqDnuCPgZBlTyILlSZvFdYN0i/yYTmgwXJGDD86RWNvTK1IAt2As
   YXKSD0lgDmh3j6ePgsee5qbGo4mwybvx3FH6esa1gKrdFEBqAU92ZK/Ux
   JB6bjEsTQkD+cks0zKcSqPBIABvmXFJaU09S0X3o+8aHKRyzOU0J+WToD
   Y1YEytbZQdOYfmvw64cO3XuLz3zjxeaUvMm+hJA57bksRqJA1tcWfiI8k
   rZvV8/pEIscpXQO8YDgzKoD+qcF83juy3IFWhjgvSBLXJ664hKjx/+iN8
   A==;
X-CSE-ConnectionGUID: sUBQlmlgTJSZLAsISFfDCA==
X-CSE-MsgGUID: 1UO4OdtgTKCEH3sKfYe+1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="44840055"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="44840055"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 16:33:58 -0800
X-CSE-ConnectionGUID: aPXwhaqBQvGjh42vYKygBQ==
X-CSE-MsgGUID: WbadgvcBT32lt76hb/zgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116200579"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2025 16:33:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlzwQ-00070l-2T;
	Sun, 23 Feb 2025 00:33:54 +0000
Date: Sun, 23 Feb 2025 08:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Suman Ghosh <sumang@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 4116/5524]
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:3217:1: warning: unused
 label 'err_free_zc_bmap'
Message-ID: <202502230842.RQVRAr2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: efabce29015189cb5cd8066cf29eb1d754de6c3c [4116/5524] octeontx2-pf: AF_XDP zero copy receive support
config: powerpc64-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230842.RQVRAr2h-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230842.RQVRAr2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230842.RQVRAr2h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2224:
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
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:3217:1: warning: unused label 'err_free_zc_bmap' [-Wunused-label]
    3217 | err_free_zc_bmap:
         | ^~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c:8:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2224:
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
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c:740:1: warning: unused label 'err_free_zc_bmap' [-Wunused-label]
     740 | err_free_zc_bmap:
         | ^~~~~~~~~~~~~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


vim +/err_free_zc_bmap +3217 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c

  3212	
  3213		otx2_qos_init(pf, qos_txqs);
  3214	
  3215		return 0;
  3216	
> 3217	err_free_zc_bmap:
  3218		bitmap_free(pf->af_xdp_zc_qidx);
  3219	err_sriov_cleannup:
  3220		otx2_sriov_vfcfg_cleanup(pf);
  3221	err_pf_sriov_init:
  3222		otx2_shutdown_tc(pf);
  3223	err_mcam_flow_del:
  3224		otx2_mcam_flow_del(pf);
  3225	err_unreg_netdev:
  3226		unregister_netdev(netdev);
  3227	err_ipsec_clean:
  3228		cn10k_ipsec_clean(pf);
  3229	err_mcs_free:
  3230		cn10k_mcs_free(pf);
  3231	err_del_mcam_entries:
  3232		otx2_mcam_flow_del(pf);
  3233	err_ptp_destroy:
  3234		otx2_ptp_destroy(pf);
  3235	err_detach_rsrc:
  3236		if (pf->hw.lmt_info)
  3237			free_percpu(pf->hw.lmt_info);
  3238		if (test_bit(CN10K_LMTST, &pf->hw.cap_flag))
  3239			qmem_free(pf->dev, pf->dync_lmt);
  3240		otx2_detach_resources(&pf->mbox);
  3241		otx2_disable_mbox_intr(pf);
  3242		otx2_pfaf_mbox_destroy(pf);
  3243		pci_free_irq_vectors(hw->pdev);
  3244	err_free_netdev:
  3245		pci_set_drvdata(pdev, NULL);
  3246		free_netdev(netdev);
  3247	err_release_regions:
  3248		pci_release_regions(pdev);
  3249		return err;
  3250	}
  3251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
