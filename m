Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986F3207;
	Sat,  2 Aug 2025 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754143454; cv=none; b=iM81zTUG0dR4CSiHHIO57pVlLwoDspwoE+r/efvjzQITeNI7wS1odjwywSes0PfvKCE7ppjl6hvqhWaHgBGCOfV5TMcpJ6pyGNEMyaaizew1KwoeMWGlQFL4hTSIEUYznjYy5I74te0wWxi1x9lUG0UVJD0zUUmNsL3c2vvdWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754143454; c=relaxed/simple;
	bh=oRyFVka2Czo2wGF6lraHVyhBDjjQ5JajTWiaseAlTgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlZdXJKL4vpsj6iQ2ZiLpmvURaXGK3chKn41JLPW5spzL1Y1jeuKB+GN+8bpzJ8bwYD6hLGflLr+W7/NdYQsvtMSGiA/NPa+VvQ1DBOToks2q9AYmJtCjbTwI9bKPnfIT7YceRKtwQzEMUncr5YaJlVGvxyB9pYmTXSTdg30B3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/yPg8ZK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/yPg8ZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754143453; x=1785679453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oRyFVka2Czo2wGF6lraHVyhBDjjQ5JajTWiaseAlTgo=;
  b=d/yPg8ZK31iQpaFs4jvpeV23t4CClSV/Ednvc2Wk0+p8shYMwdLTxu+1
   CZ3gRjdjEfjhnZb0kER3dP9f2KbsxnIXu0rOzmtxDJNn+wlHx9YnxMwR4
   SUom7LSiT7EBfNeWSu+ygRHrXCCuj0Aw1rweXiLDux+LDwHjXWDNoKULY
   5c6XQcZtZxBmsZ4x3wbjbhRt3566Cay0cj+dy7jyMUK6UBzBTdRHm4bX0
   ZdzosAtxb93WoXNAlS1q4ZMY/hCsPwa+px0O3M2kkeyD6qd3X3AYC/Yxv
   zuGAESsdq6G9u5QLOm3rUKOEhrqc0Tw3kQQbDDZPuknjD1zQKFrwQVbRX
   g==;
X-CSE-ConnectionGUID: ATvDDDWDSLm8E8fMJSjFKQ==
X-CSE-MsgGUID: CkwpkqgvTD+V9xzSOpxD7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="67919590"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67919590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 07:04:12 -0700
X-CSE-ConnectionGUID: PSlNFCCNQM2HY58bOZE9Jg==
X-CSE-MsgGUID: n0UNl4cFRD2xe68M/KQoSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164184911"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Aug 2025 07:04:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiCqG-0005PA-1D;
	Sat, 02 Aug 2025 14:04:08 +0000
Date: Sat, 2 Aug 2025 22:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH iwl-net] ice: use fixed adapter index for E825C embedded
 devices
Message-ID: <202508022159.3qQ9x6to-lkp@intel.com>
References: <20250801-jk-fix-e825c-ice-adapter-v1-1-f8d4a579e992@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-jk-fix-e825c-ice-adapter-v1-1-f8d4a579e992@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 01051012887329ea78eaca19b1d2eac4c9f601b5]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/ice-use-fixed-adapter-index-for-E825C-embedded-devices/20250802-062825
base:   01051012887329ea78eaca19b1d2eac4c9f601b5
patch link:    https://lore.kernel.org/r/20250801-jk-fix-e825c-ice-adapter-v1-1-f8d4a579e992%40intel.com
patch subject: [PATCH iwl-net] ice: use fixed adapter index for E825C embedded devices
config: i386-randconfig-017-20250802 (https://download.01.org/0day-ci/archive/20250802/202508022159.3qQ9x6to-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508022159.3qQ9x6to-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022159.3qQ9x6to-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_adapter.c:37:10: warning: shift count >= width of type [-Wshift-count-overflow]
      37 |                 return ICE_ADAPTER_INDEX_E825C;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_adapter.c:19:32: note: expanded from macro 'ICE_ADAPTER_INDEX_E825C'
      19 |         (ICE_DEV_ID_E825C_BACKPLANE | ICE_ADAPTER_FIXED_INDEX)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_adapter.c:16:33: note: expanded from macro 'ICE_ADAPTER_FIXED_INDEX'
      16 | #define ICE_ADAPTER_FIXED_INDEX BIT(63)
         |                                 ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   drivers/net/ethernet/intel/ice/ice_adapter.c:39:31: warning: shift count >= width of type [-Wshift-count-overflow]
      39 |                 return pci_get_dsn(pdev) & ~ICE_ADAPTER_FIXED_INDEX;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_adapter.c:16:33: note: expanded from macro 'ICE_ADAPTER_FIXED_INDEX'
      16 | #define ICE_ADAPTER_FIXED_INDEX BIT(63)
         |                                 ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   2 warnings generated.


vim +37 drivers/net/ethernet/intel/ice/ice_adapter.c

    17	
    18	#define ICE_ADAPTER_INDEX_E825C	\
    19		(ICE_DEV_ID_E825C_BACKPLANE | ICE_ADAPTER_FIXED_INDEX)
    20	
    21	static u64 ice_adapter_index(struct pci_dev *pdev)
    22	{
    23		switch (pdev->device) {
    24		case ICE_DEV_ID_E825C_BACKPLANE:
    25		case ICE_DEV_ID_E825C_QSFP:
    26		case ICE_DEV_ID_E825C_SFP:
    27		case ICE_DEV_ID_E825C_SGMII:
    28			/* E825C devices have multiple NACs which are connected to the
    29			 * same clock source, and which must share the same
    30			 * ice_adapter structure. We can't use the serial number since
    31			 * each NAC has its own NVM generated with its own unique
    32			 * Device Serial Number. Instead, rely on the embedded nature
    33			 * of the E825C devices, and use a fixed index. This relies on
    34			 * the fact that all E825C physical functions in a given
    35			 * system are part of the same overall device.
    36			 */
  > 37			return ICE_ADAPTER_INDEX_E825C;
    38		default:
    39			return pci_get_dsn(pdev) & ~ICE_ADAPTER_FIXED_INDEX;
    40		}
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
