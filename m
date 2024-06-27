Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2815AAC2;
	Thu, 27 Jun 2024 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492206; cv=none; b=W/s+l/mlh1rQwvZFp5l61m2Vw9q2CQcyLIYglPwMjjdX/fJZS4zWKeTNineq4I9UpqRzjhLoojY11lYQ6qoBa3HtWNpu7Z8RRfyJlzQ3sNayLfM96wPwYjFEFi+m7pYKHVwigGwiS433bxIrYaDKU175h7b2vs/I2KHtQF5Ozcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492206; c=relaxed/simple;
	bh=FErj0s14LtArBfZfK06UPtDD9JntkEDXltvw1rZgJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzvJ3NWikmK/GW8IjbhNdvxvFbq7zm6SP8nNc0XMuZJEYQ6K0f0eb3OF9BC/vtj56vSF5S73ZVMRNXL/qwdCGu2WlH4MM2M51xFO4kh/rQBBj+116u3YxFlKTA3MRhVIZxNf7oKmu4hemjaned7OyyS2/03HSSg+ewyB8wDMong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDD57TdC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDD57TdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719492204; x=1751028204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FErj0s14LtArBfZfK06UPtDD9JntkEDXltvw1rZgJqU=;
  b=dDD57TdCbAFB51/Vhy+kD4jtL3+MC4PpPNFEmx5yaOZYYDD+qJTOKOq/
   6wgX2d8C5qwE9GBdg++sUKhV3mRgCAikneUOw8v7/NQan1JMGfNbnWiHW
   30NSLJGDnOWgZtleqOVKvyWzudqILAc12gIhwSQYXIbCaQNzKTFD1Paog
   SNJDpKME+KQ/RGTQQ/wduVm4Wjv6eZ6LLODW6Db6tyv2dtxV7GJehtk1K
   H7b/CJCwFlpi2npm2jDJDNNIf1fROvqFYZKoAAuKLx+svIROr1HQl4SDA
   vW76UmG26LgAc946u1qgqHS4yHOFxlDrb1pup6Ixwyn1K+pSnF/Wdg2O8
   w==;
X-CSE-ConnectionGUID: NWZcMapFS2qvPVcaQ2a22g==
X-CSE-MsgGUID: lIFrE6y8SKmQKbqfqUuB7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20435141"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="20435141"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 05:43:24 -0700
X-CSE-ConnectionGUID: U6WzK0atS+CUfp8Z4ArzwA==
X-CSE-MsgGUID: V7uQzIe9RK2S7hBM3NIPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="45022902"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2024 05:43:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMoTA-000GCq-1B;
	Thu, 27 Jun 2024 12:43:20 +0000
Date: Thu, 27 Jun 2024 20:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhai <yan@cloudflare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 3/9] xdp: implement bpf_xdp_disable_gro kfunc
Message-ID: <202406272026.qWOsiblk-lkp@intel.com>
References: <e31ce8f27a672e3c0def5a586a9a10f1d71e9948.1718919473.git.yan@cloudflare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e31ce8f27a672e3c0def5a586a9a10f1d71e9948.1718919473.git.yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/skb-introduce-gro_disabled-bit/20240626-052232
base:   net-next/main
patch link:    https://lore.kernel.org/r/e31ce8f27a672e3c0def5a586a9a10f1d71e9948.1718919473.git.yan%40cloudflare.com
patch subject: [RFC net-next 3/9] xdp: implement bpf_xdp_disable_gro kfunc
config: i386-buildonly-randconfig-001-20240627 (https://download.01.org/0day-ci/archive/20240627/202406272026.qWOsiblk-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406272026.qWOsiblk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272026.qWOsiblk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/xdp.c:782: warning: Function parameter or struct member 'ctx' not described in 'bpf_xdp_disable_gro'


vim +782 net/core/xdp.c

   772	
   773	/**
   774	 * bpf_xdp_disable_gro - Set a flag on underlying XDP buffer, indicating
   775	 * the stack to skip this packet for GRO processing. This flag which be
   776	 * passed on when the driver builds the skb.
   777	 *
   778	 * Return:
   779	 * * always returns 0
   780	 */
   781	__bpf_kfunc int bpf_xdp_disable_gro(struct xdp_md *ctx)
 > 782	{
   783		xdp_buff_disable_gro((struct xdp_buff *)ctx);
   784		return 0;
   785	}
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
