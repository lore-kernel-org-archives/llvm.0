Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76910F4;
	Wed, 26 Jun 2024 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383509; cv=none; b=qxWnUpYWwYcfHOjc8UxnSDoGAmcx9t3mc/ZNPLtrAVqVE8JWFmEdiiqDHjhGv7+JR/U/JIIy6C3x3h6Ke1Ph4OvY8kV36hd5IF+HwIeIWZg9kRlmAijLJeTbQiYg0AizC9YcihY9vAulYsH7xfVBuXaRRLU2EEFtF2H5dt8bo40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383509; c=relaxed/simple;
	bh=BVoRCLqYkp2ZUQqom3NayI2b18GmNRdaU5S6+Vbg4FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXQJK2HOeE4dfkWwZ0c2Js6A6ifAOVmghChkeGm/guHTq/u82ncxE9IVdeMOWr3PIQ6W2jAPcVf2JngUltESUO2JJ4+xM+YRryhrrKd9nECt3+QMFiJTQhxL40g1Btqc5UySYnhDIm3zoK6+UXOn3Ai8TBzzVLNsaMKWpQawO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWJY8Tem; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWJY8Tem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719383508; x=1750919508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BVoRCLqYkp2ZUQqom3NayI2b18GmNRdaU5S6+Vbg4FQ=;
  b=hWJY8TemOIsa9Qc6q2F4UTbnUB5Vrno2RgtHG9FrnPI6gT8f/A6sgBtN
   wd2ABi9qcZueMf9Nbl51iJJ4Pnvy4B6XASyHvWfbXZ67Dhz36XMvf+YtL
   MiuYwLWgzc+FYnvTqgFNM/KH+x8AztIokfvbO9cCkJzIyvNVd3Cj56NYT
   ICsASDXIZpAvGmtwqDm0zKt3Mde4KXPcLZpRv3VQh7uBUrQACQQcYr5wh
   aSDn397vPcUD48k4YHc/8RruWVQyoIkjBHH2vTrW1d2+vaVF2geRkSr9p
   GO4QO1KQJNwvgBVytGMIM5NV1NV22ErrDZrDMuexbKgiWGzY/bRJs9Pqz
   A==;
X-CSE-ConnectionGUID: yWNWAmhnRFSz9cc+KGNocw==
X-CSE-MsgGUID: 9tAtZeIlTLS4vdPrMv61bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27026688"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="27026688"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 23:31:46 -0700
X-CSE-ConnectionGUID: eVdE8zJdSnqkG0z4KZmzCQ==
X-CSE-MsgGUID: GW9kMGfHSPeeTQo9aW0qKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="44332092"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2024 23:31:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMMBy-000F3e-1z;
	Wed, 26 Jun 2024 06:31:42 +0000
Date: Wed, 26 Jun 2024 14:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/mipi-dsi: Add OF notifier handler
Message-ID: <202406261441.6rCyDjNq-lkp@intel.com>
References: <20240625100818.3478242-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625100818.3478242-1-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/drm-mipi-dsi-Add-OF-notifier-handler/20240626-014423
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240625100818.3478242-1-wenst%40chromium.org
patch subject: [PATCH] drm/mipi-dsi: Add OF notifier handler
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240626/202406261441.6rCyDjNq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261441.6rCyDjNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261441.6rCyDjNq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dsi.c:1770:42: error: use of undeclared identifier 'mipi_dsi_of_notifier'
    1770 |                 WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
         |                                                        ^
   1 error generated.


vim +/mipi_dsi_of_notifier +1770 drivers/gpu/drm/drm_mipi_dsi.c

  1766	
  1767	static int __init mipi_dsi_bus_init(void)
  1768	{
  1769		if (IS_ENABLED(CONFIG_OF_DYNAMIC))
> 1770			WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
  1771		return bus_register(&mipi_dsi_bus_type);
  1772	}
  1773	postcore_initcall(mipi_dsi_bus_init);
  1774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
