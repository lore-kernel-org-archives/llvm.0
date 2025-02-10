Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8CB24BCFB;
	Mon, 10 Feb 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202340; cv=none; b=YYDBOiq0VY80HUJIdo54Xt8MWcdh1vB5Wu1/UOE0Ran1lcZy4UgeF79af71RCA/pdC2g0udcJaJ40IMFwJIpPsPKBJMFN00pvEYXVpZowc9oiC5DhQjrCOQG/rN5MiU6mDQeATAr5yv/VZ/YXcfYLSN1KbHOSOq/sVIay80PL7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202340; c=relaxed/simple;
	bh=EZNJjSAN8A/FftUfus1hj9pLxxr71iG+EIIm+NeCf4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnvpwAW5OIHedC6pJg+AnSB6alEXswj1LW3IjIhn507H4FIUrz9XMfqr1m3Btr6m3viS+ZWcrjrNR8omm/3UMGrtCLSnG/E3cPFBwVeZ/mOEK7kl/CgI7wEXhtD1AhMVU8BZ4pUw/D4LitImpHwlZYqMnlOSbufZ3kwkzDrWYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpyAxfs5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpyAxfs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739202339; x=1770738339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EZNJjSAN8A/FftUfus1hj9pLxxr71iG+EIIm+NeCf4Y=;
  b=QpyAxfs5IldqXtTXyWY5ofLbqhMQzh2ubEsVEl/vDMxYwgZZ4AhTYAG9
   +BeNNEBc2x7fzzDs81iGUVEeNxx5AEMp8g76nd8V2tOqg/uKfgl0n+EOg
   WMUQeY7c6+yqirNYZYDryC+gUAqhJtwjLjGVYF4VY76szIAahRmFjFwKc
   wUf2vXy9HsEIL+t1mr6kDqVLAj//efMOsb9P6IK9pf4cNPGF/eC3bHz8Y
   sTdgV/6PJ5efECi3E7aK1RIjkkyIge9VvfN2VoNfasTKF7sumjHZSVycp
   Pq6HWYzCOVBlhTEmgPr0X5G5deqwbfbTQ0eIvCCHML2S2OVJ5JJCYX/1s
   w==;
X-CSE-ConnectionGUID: rkapWYDRSPu3Wy+3m72U6g==
X-CSE-MsgGUID: 9t/Lvdj3QcK5XF/AroWaOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50419253"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50419253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:45:38 -0800
X-CSE-ConnectionGUID: kAvpajYwSzKsqQn7eM9b5A==
X-CSE-MsgGUID: RaW5HIlIRDChG/LzfkionQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143120728"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 07:45:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thVyY-0012yl-2K;
	Mon, 10 Feb 2025 15:45:34 +0000
Date: Mon, 10 Feb 2025 23:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Reaver <me@davidreaver.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] debugfs: Replace debugfs_node #define with
 struct wrapping dentry
Message-ID: <202502102301.7D1vpwVw-lkp@intel.com>
References: <20250210052039.144513-7-me@davidreaver.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210052039.144513-7-me@davidreaver.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Reaver/debugfs-Add-temporary-define-debugfs_node-dentry-directives/20250210-132642
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210052039.144513-7-me%40davidreaver.com
patch subject: [RFC PATCH 6/6] debugfs: Replace debugfs_node #define with struct wrapping dentry
config: arm64-randconfig-003-20250210 (https://download.01.org/0day-ci/archive/20250210/202502102301.7D1vpwVw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102301.7D1vpwVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102301.7D1vpwVw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_debugfs.c:21:17: error: incompatible function pointer types initializing 'void (*)(struct pvr_device *, struct dentry *)' with an expression of type 'void (struct pvr_device *, struct debugfs_node *)' [-Wincompatible-function-pointer-types]
      21 |         {"pvr_params", pvr_params_debugfs_init},
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_debugfs.c:22:13: error: incompatible function pointer types initializing 'void (*)(struct pvr_device *, struct dentry *)' with an expression of type 'void (struct pvr_device *, struct debugfs_node *)' [-Wincompatible-function-pointer-types]
      22 |         {"pvr_fw", pvr_fw_trace_debugfs_init},
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imagination/pvr_debugfs.c:45:24: error: incompatible pointer types passing 'struct debugfs_node *' to parameter of type 'struct dentry *' [-Werror,-Wincompatible-pointer-types]
      45 |                 entry->init(pvr_dev, dir);
         |                                      ^~~
   3 errors generated.


vim +21 drivers/gpu/drm/imagination/pvr_debugfs.c

cb56cd61086645 Sarah Walker 2023-11-22  19  
cb56cd61086645 Sarah Walker 2023-11-22  20  static const struct pvr_debugfs_entry pvr_debugfs_entries[] = {
cb56cd61086645 Sarah Walker 2023-11-22 @21  	{"pvr_params", pvr_params_debugfs_init},
cb56cd61086645 Sarah Walker 2023-11-22  22  	{"pvr_fw", pvr_fw_trace_debugfs_init},
cb56cd61086645 Sarah Walker 2023-11-22  23  };
cb56cd61086645 Sarah Walker 2023-11-22  24  
cb56cd61086645 Sarah Walker 2023-11-22  25  void
cb56cd61086645 Sarah Walker 2023-11-22  26  pvr_debugfs_init(struct drm_minor *minor)
cb56cd61086645 Sarah Walker 2023-11-22  27  {
cb56cd61086645 Sarah Walker 2023-11-22  28  	struct drm_device *drm_dev = minor->dev;
cb56cd61086645 Sarah Walker 2023-11-22  29  	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
ff2c46c29b70e2 David Reaver 2025-02-09  30  	struct debugfs_node *root = minor->debugfs_root;
cb56cd61086645 Sarah Walker 2023-11-22  31  	size_t i;
cb56cd61086645 Sarah Walker 2023-11-22  32  
cb56cd61086645 Sarah Walker 2023-11-22  33  	for (i = 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
cb56cd61086645 Sarah Walker 2023-11-22  34  		const struct pvr_debugfs_entry *entry = &pvr_debugfs_entries[i];
ff2c46c29b70e2 David Reaver 2025-02-09  35  		struct debugfs_node *dir;
cb56cd61086645 Sarah Walker 2023-11-22  36  
cb56cd61086645 Sarah Walker 2023-11-22  37  		dir = debugfs_create_dir(entry->name, root);
cb56cd61086645 Sarah Walker 2023-11-22  38  		if (IS_ERR(dir)) {
cb56cd61086645 Sarah Walker 2023-11-22  39  			drm_warn(drm_dev,
cb56cd61086645 Sarah Walker 2023-11-22  40  				 "failed to create debugfs dir '%s' (err=%d)",
cb56cd61086645 Sarah Walker 2023-11-22  41  				 entry->name, (int)PTR_ERR(dir));
cb56cd61086645 Sarah Walker 2023-11-22  42  			continue;
cb56cd61086645 Sarah Walker 2023-11-22  43  		}
cb56cd61086645 Sarah Walker 2023-11-22  44  
cb56cd61086645 Sarah Walker 2023-11-22 @45  		entry->init(pvr_dev, dir);
cb56cd61086645 Sarah Walker 2023-11-22  46  	}
cb56cd61086645 Sarah Walker 2023-11-22  47  }
cb56cd61086645 Sarah Walker 2023-11-22  48  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
