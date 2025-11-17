Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDA2EC541;
	Mon, 17 Nov 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403580; cv=none; b=njAa93QahJV2szEvHNdwD7er3kg8xKe7y9Q+lM9Cc4JjnbFpn7R2YH+WJCoPXhoJ+SKkAyvPnvv7nG39QnZaEmvyOv+ex3kWAG75uFH1vYhgKlFIgf1a6Ivfk/fxj2/T34k6bsDmsO5Bx2kw9MsjzCh95tp2jHC94BIyXfr/mxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403580; c=relaxed/simple;
	bh=DtGmD+7V6LQOQU0I4l9/aauwsK8ZhFi4hC3prTi3cu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f20HyBPyqswQN6eUYgS/E1dETM2eyphdvLwQbmMxGfTTbyTMFAB8oNQVj43xFxwRotaP3fvuphsiiMS37l6O86mMDLNKZ6NonR313OMgsQ8U4QqRKFqqKpDZ0yBDDe/EyqAX4aoC35TS2Sp9wZnT0T7GaXautW9KpklMl1uYPWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrVs/Ct3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrVs/Ct3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763403578; x=1794939578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DtGmD+7V6LQOQU0I4l9/aauwsK8ZhFi4hC3prTi3cu8=;
  b=jrVs/Ct3+06Au3rnCLCJMZCAs4tX3YQ+RokjJPSjKMl4ccql4Uno3bgh
   4el1jW9GZeM1meAY/v8yUFda1/PeDhQRV/zcFLAZk8WeEoA091GU/p35U
   2GO+DwYpFqOqxBxXp7U1u/8H34UoWe7UzgtUh4dpr00QR84g5TjbFHGbs
   SX/VqS9qaG6xrUUKjNxiThmPke39OaxxzWSP3xPK+E8yNMf6yyxXX+h92
   DgaWtD53izSi1etFMGZe/jm81NvGeMH1J/bzHXH+d0NH/Gx+qBxHOYmfM
   Gei/EgmjqN1e4p6K5zkVMlmbS1fUzF+5mSl77HsadaX7YDhfvPryLXLxI
   A==;
X-CSE-ConnectionGUID: 71mynBPsTxmKXE23ckpCHQ==
X-CSE-MsgGUID: VBUspTKbTyycKRjiraxq/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65451814"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65451814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 10:19:37 -0800
X-CSE-ConnectionGUID: m2p8M+VSTX+yOFwMnllqog==
X-CSE-MsgGUID: luTljIkeSFeGh0rYmbYTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190545918"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2025 10:19:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL3p6-0000vT-1y;
	Mon, 17 Nov 2025 18:19:32 +0000
Date: Tue, 18 Nov 2025 02:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Srouji <edwards@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next 9/9] RDMA/core: Add command to set pinned FRMR
 handles
Message-ID: <202511180120.k49Kg82B-lkp@intel.com>
References: <20251116-frmr_pools-v1-9-5eb3c8f5c9c4@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-frmr_pools-v1-9-5eb3c8f5c9c4@nvidia.com>

Hi Edward,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d056bc45b62b5981ebcd18c4303a915490b8ebe9]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Srouji/IB-core-Introduce-FRMR-pools/20251117-031555
base:   d056bc45b62b5981ebcd18c4303a915490b8ebe9
patch link:    https://lore.kernel.org/r/20251116-frmr_pools-v1-9-5eb3c8f5c9c4%40nvidia.com
patch subject: [PATCH rdma-next 9/9] RDMA/core: Add command to set pinned FRMR handles
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251118/202511180120.k49Kg82B-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180120.k49Kg82B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180120.k49Kg82B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/nldev.c:2943:12: warning: stack frame size (2112) exceeds limit (2048) in 'nldev_frmr_pools_set_doit' [-Wframe-larger-than]
    2943 | static int nldev_frmr_pools_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
         |            ^
   1 warning generated.


vim +/nldev_frmr_pools_set_doit +2943 drivers/infiniband/core/nldev.c

362ddee594f2a3 Michael Guralnik 2025-11-16  2942  
79939baf7a9de1 Michael Guralnik 2025-11-16 @2943  static int nldev_frmr_pools_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
79939baf7a9de1 Michael Guralnik 2025-11-16  2944  				     struct netlink_ext_ack *extack)
79939baf7a9de1 Michael Guralnik 2025-11-16  2945  {
79939baf7a9de1 Michael Guralnik 2025-11-16  2946  	struct nlattr *tb[RDMA_NLDEV_ATTR_MAX];
79939baf7a9de1 Michael Guralnik 2025-11-16  2947  	struct ib_device *device;
79939baf7a9de1 Michael Guralnik 2025-11-16  2948  	u32 aging_period;
79939baf7a9de1 Michael Guralnik 2025-11-16  2949  	int err;
79939baf7a9de1 Michael Guralnik 2025-11-16  2950  
79939baf7a9de1 Michael Guralnik 2025-11-16  2951  	err = nlmsg_parse(nlh, 0, tb, RDMA_NLDEV_ATTR_MAX - 1, nldev_policy,
79939baf7a9de1 Michael Guralnik 2025-11-16  2952  			  extack);
79939baf7a9de1 Michael Guralnik 2025-11-16  2953  	if (err)
79939baf7a9de1 Michael Guralnik 2025-11-16  2954  		return err;
79939baf7a9de1 Michael Guralnik 2025-11-16  2955  
79939baf7a9de1 Michael Guralnik 2025-11-16  2956  	if (!tb[RDMA_NLDEV_ATTR_DEV_INDEX])
79939baf7a9de1 Michael Guralnik 2025-11-16  2957  		return -EINVAL;
79939baf7a9de1 Michael Guralnik 2025-11-16  2958  
79939baf7a9de1 Michael Guralnik 2025-11-16  2959  	device = ib_device_get_by_index(
79939baf7a9de1 Michael Guralnik 2025-11-16  2960  		sock_net(skb->sk), nla_get_u32(tb[RDMA_NLDEV_ATTR_DEV_INDEX]));
79939baf7a9de1 Michael Guralnik 2025-11-16  2961  	if (!device)
79939baf7a9de1 Michael Guralnik 2025-11-16  2962  		return -EINVAL;
79939baf7a9de1 Michael Guralnik 2025-11-16  2963  
9ad54ccf068d69 Michael Guralnik 2025-11-16  2964  	if (tb[RDMA_NLDEV_ATTR_FRMR_POOLS_AGING_PERIOD]) {
9ad54ccf068d69 Michael Guralnik 2025-11-16  2965  		aging_period = nla_get_u32(
9ad54ccf068d69 Michael Guralnik 2025-11-16  2966  			tb[RDMA_NLDEV_ATTR_FRMR_POOLS_AGING_PERIOD]);
79939baf7a9de1 Michael Guralnik 2025-11-16  2967  		err = ib_frmr_pools_set_aging_period(device, aging_period);
9ad54ccf068d69 Michael Guralnik 2025-11-16  2968  		goto done;
9ad54ccf068d69 Michael Guralnik 2025-11-16  2969  	}
79939baf7a9de1 Michael Guralnik 2025-11-16  2970  
9ad54ccf068d69 Michael Guralnik 2025-11-16  2971  	if (tb[RDMA_NLDEV_ATTR_FRMR_POOL_PINNED_HANDLES])
9ad54ccf068d69 Michael Guralnik 2025-11-16  2972  		err = nldev_frmr_pools_set_pinned(device, tb, extack);
9ad54ccf068d69 Michael Guralnik 2025-11-16  2973  
9ad54ccf068d69 Michael Guralnik 2025-11-16  2974  done:
79939baf7a9de1 Michael Guralnik 2025-11-16  2975  	ib_device_put(device);
79939baf7a9de1 Michael Guralnik 2025-11-16  2976  	return err;
79939baf7a9de1 Michael Guralnik 2025-11-16  2977  }
79939baf7a9de1 Michael Guralnik 2025-11-16  2978  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
