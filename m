Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D06088F;
	Sat, 19 Oct 2024 20:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729370163; cv=none; b=eQ1CoQy7enjvOruvubUhws4ws0VshZa93ZzNK+g3s6oj5BmrR2m6sJGXpQ0ySt7aNG3CwsfQ8UBTGDQ6xuJu4RfIv8F+Fyo4PArafScbl5evhvEcwRcEXIUVgUB0Pws1jCiF2dyYps1n+ujoP9UYvw9myVU4NUA2iv8KyRAsX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729370163; c=relaxed/simple;
	bh=9u8tht2g98RvUBZFrj0Ff0kborgkfW2EuKqP7u4qJI0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5eEqvNMRK972huWzfyHDig/l1PFcU+h1reLiKQnOI53y+SEntVfR6Qw0UcLPbkEE3A4a9yWye+YhkSOwMZzoN6SRMAT4A7aoXbbIpdIAw63WWRzIT7zF8PrM01NZJG+ipnCgJvgHlxGFc7eZivmTPuuOslwHjq+LvQs4lPMfDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2J0GflS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2J0GflS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729370160; x=1760906160;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9u8tht2g98RvUBZFrj0Ff0kborgkfW2EuKqP7u4qJI0=;
  b=F2J0GflSkKX7t8A/mYPHxbZIwkvzA4Zl2Ay7A1cQhyO6N4AUo0K8rzsZ
   cEX6sWz4zgfmmassbZiGI8H/b6O2NokMtIjD6rQbpdeHD7T1vuxe0Sjl4
   3sl1JxXhonjc/pQXn/Lmp5RJUk+symCY7zicRkTUr6ogUaOGEdT+almlJ
   TeKwBuHrMI+g4uUXz3gGT6oOw8ssFEYIXb57fxWP91PnsCnlF3rWA/LNJ
   VJX2yJeneF9ZVaM1yEq/+bn3Mre5rOPV+xhTuD5ppJhIJKMwpR2aX+qo7
   nr/OywERcn1RPqQtbQns96wxEDJjCcl47+wwxUKKHvOzy7onhiHZQmOf0
   Q==;
X-CSE-ConnectionGUID: C+Hbi3AnQeamwdw6bn7UzA==
X-CSE-MsgGUID: e5o9xjR+RZKnEYKaNnlGHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28839414"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28839414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 13:36:00 -0700
X-CSE-ConnectionGUID: jCn0YChLSRSRcTdyOOoREA==
X-CSE-MsgGUID: X0qoTiy+QuKGXCJewWBRMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="102474934"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2024 13:35:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2GB2-000PWV-1U;
	Sat, 19 Oct 2024 20:35:56 +0000
Date: Sun, 20 Oct 2024 04:34:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [net-next PATCH 5/6] octeontx2-af: CN20K mbox implementation for
 AF's VF
Message-ID: <202410200408.6OIxr2hh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20241018203058.3641959-6-saikrishnag@marvell.com>
References: <20241018203058.3641959-6-saikrishnag@marvell.com>
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
CC: Sai Krishna <saikrishnag@marvell.com>

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Krishna/octeontx2-Set-appropriate-PF-VF-masks-and-shifts-based-on-silicon/20241019-043511
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241018203058.3641959-6-saikrishnag%40marvell.com
patch subject: [net-next PATCH 5/6] octeontx2-af: CN20K mbox implementation for AF's VF
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410200408.6OIxr2hh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200408.6OIxr2hh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200408.6OIxr2hh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/af/rvu.c:8:
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
   In file included from drivers/net/ethernet/marvell/octeontx2/af/rvu.c:11:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from drivers/net/ethernet/marvell/octeontx2/af/rvu.c:11:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/marvell/octeontx2/af/rvu.c:11:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   drivers/net/ethernet/marvell/octeontx2/af/rvu.c:589:33: warning: arithmetic between different enumeration types ('enum rvu_af_int_vec_e' and 'enum rvu_pf_int_vec_e') [-Wenum-enum-conversion]
     589 |                 min_vecs = RVU_AF_INT_VEC_CNT + RVU_PF_INT_VEC_CNT;
         |                            ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/marvell/octeontx2/af/rvu.c:2991:54: warning: arithmetic between different enumeration types ('enum rvu_af_cn20k_int_vec_e' and 'enum rvu_mbox_pf_int_vec_e') [-Wenum-enum-conversion]
    2991 |                 return (pfvf->msix.max >= RVU_AF_CN20K_INT_VEC_CNT +
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^
    2992 |                         RVU_MBOX_PF_INT_VEC_CNT) && offset;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/af/rvu.c:2994:47: warning: arithmetic between different enumeration types ('enum rvu_af_int_vec_e' and 'enum rvu_pf_int_vec_e') [-Wenum-enum-conversion]
    2994 |         return (pfvf->msix.max >= RVU_AF_INT_VEC_CNT + RVU_PF_INT_VEC_CNT) &&
         |                                   ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   19 warnings generated.


vim +2991 drivers/net/ethernet/marvell/octeontx2/af/rvu.c

  2977	
  2978	static int rvu_afvf_msix_vectors_num_ok(struct rvu *rvu)
  2979	{
  2980		struct rvu_pfvf *pfvf = &rvu->pf[0];
  2981		int offset;
  2982	
  2983		pfvf = &rvu->pf[0];
  2984		offset = rvu_read64(rvu, BLKADDR_RVUM, RVU_PRIV_PFX_INT_CFG(0)) & 0x3ff;
  2985	
  2986		/* Make sure there are enough MSIX vectors configured so that
  2987		 * VF interrupts can be handled. Offset equal to zero means
  2988		 * that PF vectors are not configured and overlapping AF vectors.
  2989		 */
  2990		if (is_cn20k(rvu->pdev))
> 2991			return (pfvf->msix.max >= RVU_AF_CN20K_INT_VEC_CNT +
  2992				RVU_MBOX_PF_INT_VEC_CNT) && offset;
  2993	
  2994		return (pfvf->msix.max >= RVU_AF_INT_VEC_CNT + RVU_PF_INT_VEC_CNT) &&
  2995		       offset;
  2996	}
  2997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
