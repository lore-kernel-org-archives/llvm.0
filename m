Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075F356742;
	Wed,  1 Jul 2026 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889363; cv=none; b=ozUbGFji2zh3WjWJuwe27RUwhDJuD/NUrTSAPc+0yZB+wlmCcPCpUmVDT78Bk+lSeOuW5g8JWrMeFMDkzL2pBsXABrEN+fKoB+on1Z3vzrabKX8615gsWrBcF4/lCLFG2F7DV1Oxz+Cij+YN1JKFwb4zLP1KGu5WvMNyIboMA7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889363; c=relaxed/simple;
	bh=EyJwweopzZnmWxToCYHEWhWLLRJaC76EBS3HAsa0uoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AAObiU7It/IPQfnq1c1l/NOlTJdBlshUhIy0m0FopmEFW64X8rLeFieoI0fQwn269DaXvmCs59bn3ECCweefqAEc1GvBOe1JdkoEol3Bdzztrf1KbKxJXOeHf9a3B5Qn2jgPSZKtKKUTf8BT9dxXerzrhLx4HIrLLI9vZgYAg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md+dm/du; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md+dm/du"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782889362; x=1814425362;
  h=date:from:to:cc:subject:message-id;
  bh=EyJwweopzZnmWxToCYHEWhWLLRJaC76EBS3HAsa0uoU=;
  b=md+dm/duIdnEhsnidIBst/GeWIf6n+awWpwdomfJX0s29a/nGco7d09I
   hX11Li09le/AtzOxHGkiJRgJK1KtqoIljzWAeu0IQZXGEXfmMk/fox4Ec
   0TbKNnSZo/W6JycuGQ8opOk36I1yV4UIJB3ArRalughYYEhvWvCp8REQB
   ZLdJ9SbJLT/4DSP3X/iV6x54eUrrUIoK+baAaPi00Fj3p2/mXT78MjOwg
   jt17DPxG0VKOPXyw5Be9JTo2cTZk35twfFaK8Xy7WT0niTfijK3NzDgtt
   ZSMWrDg8HdQQmKSZLaeX2JjxuKMzH3Sp3Q7t6KLlfgf+dbNIC5xHzyxkS
   A==;
X-CSE-ConnectionGUID: f9ueFjwyQQOeqFQydte5gg==
X-CSE-MsgGUID: WuvCvygXSTO+SRhsfoLAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="106402480"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="106402480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 00:02:42 -0700
X-CSE-ConnectionGUID: A70WeOIlSYuWlNQ0plrJrA==
X-CSE-MsgGUID: fGtx1VF2SM2l1r8d2De9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248499698"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 00:02:39 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weoxx-000000000jZ-2Eir;
	Wed, 01 Jul 2026 07:02:37 +0000
Date: Wed, 01 Jul 2026 09:02:01 +0200
From: kernel test robot <lkp@intel.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:37: error:
 member reference base type 'const void' is not a structure or union
Message-ID: <202607010827.sZxkxNQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vladimir-Vdovin/xdp-let-XDP-programs-assert-the-RX-checksum-over-redirect/20260701-032331
head:   346975980761957300c1f7931bbbf1d97df1d5e6
commit: ce9d0ecf93e84f1be1508b5741e4510dd3df4203 ice: support the rx_csum XDP metadata hint
date:   12 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260701/202607010827.sZxkxNQy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010827.sZxkxNQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010827.sZxkxNQy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:37: error: member reference base type 'const void' is not a structure or union
     618 |         status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
         |                               ~~~~~~~~~~~~~^ ~~
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   1 error generated.


vim +618 drivers/net/ethernet/intel/ice/ice_txrx_lib.c

   596	
   597	/**
   598	 * ice_xdp_rx_csum - RX checksum XDP hint handler
   599	 * @ctx: XDP buff pointer
   600	 * @csum_status: destination for the checksum verdict
   601	 *
   602	 * Report whether the hardware validated the packet's L4 checksum, mirroring
   603	 * the verdict ice_rx_csum() uses for CHECKSUM_UNNECESSARY.  Return -ENODATA
   604	 * when RX checksum offload is disabled, since the status bits are not
   605	 * meaningful then.
   606	 */
   607	static int ice_xdp_rx_csum(const struct xdp_md *ctx,
   608				   enum xdp_csum_status *csum_status)
   609	{
   610		const struct libeth_xdp_buff *xdp_ext = (void *)ctx;
   611		struct ice_rx_ring *rx_ring;
   612		u16 status0;
   613	
   614		rx_ring = libeth_xdp_buff_to_rq(xdp_ext, typeof(*rx_ring), xdp_rxq);
   615		if (!(rx_ring->netdev->features & NETIF_F_RXCSUM))
   616			return -ENODATA;
   617	
 > 618		status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
   619		if ((status0 & BIT(ICE_RX_FLEX_DESC_STATUS0_L3L4P_S)) &&
   620		    !(status0 & BIT(ICE_RX_FLEX_DESC_STATUS0_XSUM_L4E_S)))
   621			*csum_status = XDP_CSUM_VERIFIED;
   622		else
   623			*csum_status = XDP_CSUM_NONE;
   624	
   625		return 0;
   626	}
   627	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
