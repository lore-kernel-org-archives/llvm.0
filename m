Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F7E1DF75C;
	Wed, 13 Nov 2024 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731508483; cv=none; b=oeQnbbtrs382gGTBkKT3lXCmM8CTVhZk3Cg9Dm5O82A2UfNryo0fDIgOyVw0xexSzyCo6RGIUNYVgFw+iVJEVf1uqYrHgWO2PTrrc5oPTTrkM1dMQ5S55U2xq40UKJhXh2+DZS0dRVIwu9pqfONhYVqNt6GaqVuK67nvOnEfMMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731508483; c=relaxed/simple;
	bh=XL2q9gFed17spZbib9zirJervoZJ0UWFCGGZgQVhTfs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2NEKEAZ5hOZ/Zt0JhrEXtmc6sd9qzjSpTGfeucudCqXLMW6kyvzyp6BIWANE8jAZiBJyCeTb9ZAVZAyrI9TooBDVXmfEtqbw0OBEqJbu/D+7OP2GbBKg3/ezy5a5bOI6/36xLB9gZa2+dqY5avHXHhn/DcxP8uYHveGSFHtiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMxrIBUu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMxrIBUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731508482; x=1763044482;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XL2q9gFed17spZbib9zirJervoZJ0UWFCGGZgQVhTfs=;
  b=AMxrIBUu2A6G/wZa6mheGTE0r4I+sgZXyFcQaBnfDOZEdJA9takcgoJN
   HPi89kLCWHsuzRfMzZE1uZ06kUebyt1r+84YTa05/bhsUSEWWhy4RT4Ti
   p8KUbtONhRK35fuRPJ7eMLH3crNvhIzJE/BJ35szG/rWocYocoBD6qiYK
   VF57hMxFXj0n89OR8YHXAfrr9kxcqHj8575JDAUd46pIuAZBzhPM1QVGt
   K5Yz2NhnFDJXWmhPeYEcmahKTp9I7JJOui/K9OSm7xWtL4O85U3mNbEaO
   c8njf+ZCoX/hen15KcMCqXnuldsRGIuoyTuGn77NKV+5nHP9VPaLPbbnQ
   A==;
X-CSE-ConnectionGUID: V9YOiycJRgeTz6qd6BhduQ==
X-CSE-MsgGUID: 5bOr+7BFQtShQV+gm2FhHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19010663"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="19010663"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:34:40 -0800
X-CSE-ConnectionGUID: QsdnP0vkQSuL7NV1/I8Clg==
X-CSE-MsgGUID: mNmQvNSHT7yLZ3gabdEUzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88050340"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Nov 2024 06:34:39 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBES4-0000Sl-2M;
	Wed, 13 Nov 2024 14:34:36 +0000
Date: Wed, 13 Nov 2024 22:34:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [net-next PATCH v3 5/6] octeontx2-af: CN20K mbox implementation
 for AF's VF
Message-ID: <202411132224.WDBx1t3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20241112185326.819546-6-saikrishnag@marvell.com>
References: <20241112185326.819546-6-saikrishnag@marvell.com>
TO: Sai Krishna <saikrishnag@marvell.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: sgoutham@marvell.com
TO: gakula@marvell.com
TO: lcherian@marvell.com
TO: jerinj@marvell.com
TO: hkelam@marvell.com
TO: sbhatta@marvell.com
TO: andrew+netdev@lunn.ch
TO: kalesh-anakkur.purayil@broadcom.com
CC: Sai Krishna <saikrishnag@marvell.com>

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Krishna/octeontx2-Set-appropriate-PF-VF-masks-and-shifts-based-on-silicon/20241113-030302
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241112185326.819546-6-saikrishnag%40marvell.com
patch subject: [net-next PATCH v3 5/6] octeontx2-af: CN20K mbox implementation for AF's VF
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241113/202411132224.WDBx1t3k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411132224.WDBx1t3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132224.WDBx1t3k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/af/rvu.c:12:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
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
   drivers/net/ethernet/marvell/octeontx2/af/rvu.c:589:33: warning: arithmetic between different enumeration types ('enum rvu_af_int_vec_e' and 'enum rvu_pf_int_vec_e') [-Wenum-enum-conversion]
     589 |                 min_vecs = RVU_AF_INT_VEC_CNT + RVU_PF_INT_VEC_CNT;
         |                            ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/marvell/octeontx2/af/rvu.c:2989:54: warning: arithmetic between different enumeration types ('enum rvu_af_cn20k_int_vec_e' and 'enum rvu_mbox_pf_int_vec_e') [-Wenum-enum-conversion]
    2989 |                 return (pfvf->msix.max >= RVU_AF_CN20K_INT_VEC_CNT +
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^
    2990 |                         RVU_MBOX_PF_INT_VEC_CNT) && offset;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/af/rvu.c:2992:47: warning: arithmetic between different enumeration types ('enum rvu_af_int_vec_e' and 'enum rvu_pf_int_vec_e') [-Wenum-enum-conversion]
    2992 |         return (pfvf->msix.max >= RVU_AF_INT_VEC_CNT + RVU_PF_INT_VEC_CNT) &&
         |                                   ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +2989 drivers/net/ethernet/marvell/octeontx2/af/rvu.c

  2975	
  2976	static int rvu_afvf_msix_vectors_num_ok(struct rvu *rvu)
  2977	{
  2978		struct rvu_pfvf *pfvf = &rvu->pf[0];
  2979		int offset;
  2980	
  2981		pfvf = &rvu->pf[0];
  2982		offset = rvu_read64(rvu, BLKADDR_RVUM, RVU_PRIV_PFX_INT_CFG(0)) & 0x3ff;
  2983	
  2984		/* Make sure there are enough MSIX vectors configured so that
  2985		 * VF interrupts can be handled. Offset equal to zero means
  2986		 * that PF vectors are not configured and overlapping AF vectors.
  2987		 */
  2988		if (is_cn20k(rvu->pdev))
> 2989			return (pfvf->msix.max >= RVU_AF_CN20K_INT_VEC_CNT +
  2990				RVU_MBOX_PF_INT_VEC_CNT) && offset;
  2991	
  2992		return (pfvf->msix.max >= RVU_AF_INT_VEC_CNT + RVU_PF_INT_VEC_CNT) &&
  2993		       offset;
  2994	}
  2995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
