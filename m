Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E928683;
	Thu, 15 Aug 2024 03:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723692416; cv=none; b=MqBVPoWPOHqP925fCP4WZ5M0xdOY7/bHNxVg8R/ztWT6HfK0baS8U4b5600n1emZQSkoHLxzNzZjhziLGhssoJi/fQ7eGPlI0gqrHF8zeSl+BZ4CFW27ke2LSbc4Nu6xZ7vd1SPpxIabf3ftQXvxqyh/u+CoIkNSXQsgPHDBBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723692416; c=relaxed/simple;
	bh=ZxM65UX+fbcZH/6sBBI9qdcqTEL4G84VK4yEhxvCOk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt4nhhx/zhvc1UbkyPfWg2PmotbU7hTSNET5uFynwjXkOmBoaULvSL+pLAMTdciFsTqpeJ3ZOe+KGKmmd43U2eMYL0E1o/fxLS8p7R9aCpYAQ0YI47U6YiI7zWvogKSay++HIoi5dh06lFfCyk341jjAL0B0YL/K6/ApPU6EkEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZBbTmXt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZBbTmXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723692415; x=1755228415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZxM65UX+fbcZH/6sBBI9qdcqTEL4G84VK4yEhxvCOk4=;
  b=JZBbTmXtyFJ1S3prLhW+mlJyrjlv1WkE6Ut9gcuyQWpr5jkmvXeEKAAX
   xQPLZ966paT57q+1nV1pijGNjfAcpd4z480OWTQxYBsbhpe7YOsyado+A
   JjokZkqwjo+jxEOLOVALHwXKS+mSQu15yrNYhiUgnY5hyECHFJv3xITGw
   UkLhT1PFUUOd6pDcmBl1nzDX7kGltAIkX3LqMBM/GC6Patuom5I4eg6t/
   mmmDzg0aThbSBQN0V/D6HYuqITvo78oxjVwbAHkh/79pqMlAhn4jrIqG9
   AlC3Odt600hWfqx59O5L6iCd69NDPpNtFRS6JVD6g94EqDoO07FmbiXnW
   w==;
X-CSE-ConnectionGUID: CPIZdmMPQNqIxpat6SYWxQ==
X-CSE-MsgGUID: du35pG6XSLauicmc1OYTvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21811843"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21811843"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 20:26:54 -0700
X-CSE-ConnectionGUID: jxsaP1F5Q5KHurkNQQ+C8g==
X-CSE-MsgGUID: 3MRYSDVtTt+Ud6EDQCBPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63657918"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2024 20:26:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seR8U-00038Q-1n;
	Thu, 15 Aug 2024 03:26:50 +0000
Date: Thu, 15 Aug 2024 11:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v9 04/14] iavf: add support
 for negotiating flexible RXDID format
Message-ID: <202408151113.7gpAuQJc-lkp@intel.com>
References: <20240813125513.8212-5-mateusz.polchlopek@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813125513.8212-5-mateusz.polchlopek@intel.com>

Hi Mateusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d1815992133ebcc6007009645571f322f4bc7c44]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Polchlopek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20240815-013335
base:   d1815992133ebcc6007009645571f322f4bc7c44
patch link:    https://lore.kernel.org/r/20240813125513.8212-5-mateusz.polchlopek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v9 04/14] iavf: add support for negotiating flexible RXDID format
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240815/202408151113.7gpAuQJc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151113.7gpAuQJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151113.7gpAuQJc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.h:9:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.h:9:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.h:9:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_virtchnl.h:9:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/net/ethernet/intel/ice/ice_virtchnl.c:2734:2: warning: variable 'rxdid' is uninitialized when used here [-Wuninitialized]
    2734 |         rxdid |= BIT(ICE_RXDID_LEGACY_1);
         |         ^~~~~
   drivers/net/ethernet/intel/ice/ice_virtchnl.c:2716:11: note: initialize the variable 'rxdid' to silence this warning
    2716 |         u64 rxdid;
         |                  ^
         |                   = 0
   18 warnings generated.


vim +/rxdid +2734 drivers/net/ethernet/intel/ice/ice_virtchnl.c

  2701	
  2702	/**
  2703	 * ice_vc_query_rxdid - query RXDID supported by DDP package
  2704	 * @vf: pointer to VF info
  2705	 *
  2706	 * Called from VF to query a bitmap of supported flexible
  2707	 * descriptor RXDIDs of a DDP package.
  2708	 */
  2709	static int ice_vc_query_rxdid(struct ice_vf *vf)
  2710	{
  2711		enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_SUCCESS;
  2712		struct ice_hw *hw = &vf->pf->hw;
  2713		struct ice_pf *pf = vf->pf;
  2714		u32 len = sizeof(u64);
  2715		u32 regval;
  2716		u64 rxdid;
  2717		int ret, i;
  2718	
  2719		if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states)) {
  2720			v_ret = VIRTCHNL_STATUS_ERR_PARAM;
  2721			goto err;
  2722		}
  2723	
  2724		if (!(vf->driver_caps & VIRTCHNL_VF_OFFLOAD_RX_FLEX_DESC)) {
  2725			v_ret = VIRTCHNL_STATUS_ERR_PARAM;
  2726			goto err;
  2727		}
  2728	
  2729		/* RXDIDs supported by DDP package can be read from the register
  2730		 * to get the supported RXDID bitmap. But the legacy 32byte RXDID
  2731		 * is not listed in DDP package, add it in the bitmap manually.
  2732		 * Legacy 16byte descriptor is not supported.
  2733		 */
> 2734		rxdid |= BIT(ICE_RXDID_LEGACY_1);
  2735	
  2736		for (i = ICE_RXDID_FLEX_NIC; i < ICE_FLEX_DESC_RXDID_MAX_NUM; i++) {
  2737			regval = rd32(hw, GLFLXP_RXDID_FLAGS(i, 0));
  2738			if ((regval >> GLFLXP_RXDID_FLAGS_FLEXIFLAG_4N_S)
  2739				& GLFLXP_RXDID_FLAGS_FLEXIFLAG_4N_M)
  2740				rxdid |= BIT(i);
  2741		}
  2742	
  2743		pf->supported_rxdids = rxdid;
  2744	
  2745	err:
  2746		ret = ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_GET_SUPPORTED_RXDIDS,
  2747					    v_ret, (u8 *)&rxdid, len);
  2748		return ret;
  2749	}
  2750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
