Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FA188713;
	Thu,  6 Mar 2025 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741273145; cv=none; b=s71QBAro29mfeVmYR5YppuNMj9/NKakZlGyqD3UCeNRO8hCRuNIwlSIH8327vCzEsfsNELrV0sXY51qfbhc5Z2RHTxKtpml/hZLqcI5YpeAQaAumru9yldA6hIuZy3aP/wS/sVaG9N1YjRygXPGMtXOjTV+iGDbxHy0zj2NUeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741273145; c=relaxed/simple;
	bh=LW8E4ccOWBUMY/dF9K95uGvLK9J/8cD7GOT5hx0osfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmvsIeudGvzAz3qpu+aEUIgOBs9Jz7JCrbsRb3FzcfPlJpSw/7rPn27K6W/bsZNVimnFIlNRpl62wZeqqKEpl/TdAFeY0WETrJfzpsCynTI73gdeCo6ua8C885j76MHf3O+nl5Ga1t1/DUUQ/AEXAgAlPr4rcDe5YoeiaRReb/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aljMi6uy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aljMi6uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741273143; x=1772809143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LW8E4ccOWBUMY/dF9K95uGvLK9J/8cD7GOT5hx0osfs=;
  b=aljMi6uy7T/eEBzuWk+FV6gfoB3FiSBieu2I2MRbTg+hEIRZeWHcde71
   pHW98AUDLBJQ8OqVFBlXlS27TIVSHd4Yms5WCup60lXpLQAbbqPoj/jvp
   Con85vFgWiHVDR9SHKxJhurNKxYONFN3uppL6aBJYTKV6AXBLCR9fOc2h
   HtUyWjtGDTXimuWtH15N3cnKBOZVw+JG2CGNzp9FCfiwjcdslu+oonyrm
   LjZIgt0OLD4kqgltPfInUjBz//GPe/qLGGL+ItUVTZTIxo7aZMrzfdVY4
   sLJTsfHxoz3Fwy6xTiJCr9cs6H3Q6wvA7mi+94u2WVmeMxjAHQMoMvmrG
   g==;
X-CSE-ConnectionGUID: jY78g81+S/a9EdXVpC+NZA==
X-CSE-MsgGUID: NQq3/UW/RnqBGAKB/koc1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46055647"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46055647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:59:02 -0800
X-CSE-ConnectionGUID: TO+Fj5huS/66Gly5ghMj6Q==
X-CSE-MsgGUID: PCwHMHv5SjmE9KQ/C+EyXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119543421"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 06:59:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqCgc-000NBi-2S;
	Thu, 06 Mar 2025 14:58:58 +0000
Date: Thu, 6 Mar 2025 22:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
Message-ID: <202503062235.DNAQREOf-lkp@intel.com>
References: <20250305121705.2143540-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305121705.2143540-1-y-abhilashchandra@ti.com>

Hi Yemike,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/media-i2c-ds90ub960-Enable-second-i2c-interface/20250305-201858
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250305121705.2143540-1-y-abhilashchandra%40ti.com
patch subject: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
config: i386-buildonly-randconfig-001-20250306 (https://download.01.org/0day-ci/archive/20250306/202503062235.DNAQREOf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062235.DNAQREOf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503062235.DNAQREOf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub960.c:2182:25: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2182 |         enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
         |                                ^
   1 error generated.


vim +/FIELD_PREP +2182 drivers/media/i2c/ds90ub960.c

  2173	
  2174	static int ub960_init_rx_ports(struct ub960_data *priv)
  2175	{
  2176		unsigned int nport;
  2177		u8 enabled_rxports_mask;
  2178		u8 enabled_rxports;
  2179		int ret;
  2180	
  2181		/* Configure i2c interface for RX ports */
> 2182		enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
  2183		enabled_rxports = (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_rxports_mask;
  2184	
  2185		ret = ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_mask, enabled_rxports);
  2186		if (ret)
  2187			return ret;
  2188	
  2189		for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
  2190			struct ub960_rxport *rxport = priv->rxports[nport];
  2191	
  2192			if (!rxport)
  2193				continue;
  2194	
  2195			if (priv->hw_data->is_ub9702)
  2196				ub960_init_rx_port_ub9702(priv, rxport);
  2197			else
  2198				ub960_init_rx_port_ub960(priv, rxport);
  2199		}
  2200	
  2201		return 0;
  2202	}
  2203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
