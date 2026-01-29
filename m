Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80EC2C028F;
	Thu, 29 Jan 2026 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769712614; cv=none; b=ZOmgd3EBSEz6X/Ob7baprkepNyOoVdx0Kj2ma2u8j5J1TfiqiPV1X17lvujQAlHntP7Z+6MSNDcnjorf3a+t9Yy99GVH9YzCEL0f1ifh2T0Vtx4rLtAQwK6HVkrHn7akx4IivRZt5769Akx0FRfHMsu0cYDCr+ROHq/hTquKx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769712614; c=relaxed/simple;
	bh=4NIq0yMAxcCBNtMevyEn0r35r1h+lTlde//nJt2+j6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=civ6WGRjXWySC0NVvpBgczYg+zJ1k3HrM5PWTwVgOXjV7C15j7J7giTi3Ep7qUVylBURmgkpqdqIZiwgDm3fKx8qlfcrcQh3WqIpt2WNRzP+otNh1MFFt1Rt/XMv/7pg4C6TvOtDP80cUoN4p6D/dnt/cGTm0RUcTwiUn74OMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDQ6uYCo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDQ6uYCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769712613; x=1801248613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4NIq0yMAxcCBNtMevyEn0r35r1h+lTlde//nJt2+j6c=;
  b=GDQ6uYCo7aA8oYQe9ifd6bcu3eR0UOw5feaerHKu6t6qw3Qvh12rbWiZ
   2/03ea8bXwPoX9Lwt4gvVV8B7gGU7t3JR1nf7wXmkCCAk/IMp5ki1dqkw
   jdaqc+dDsC+Slzfz/jg2Gu7fEo3NVlT33AtCeVECCtg7isw6DXhvJPb09
   1C5LYoq9NPHhdI2Vp+i4rESMSduXKm7QCkT1LKJ11ILrVMXcvwVSLFMJY
   zRqWDCbChe1jCbqRYE5EgSH8HRUH9h//IokCrLRfu0hyLN9A4DPhv0uZH
   rzqp2XtjqvnMsgFLsmPuSijGn6tXfHKiFf5UnVtOVJJAdNEb0y7DoCNNO
   Q==;
X-CSE-ConnectionGUID: NM1OlkzJSv6wgLa/4EZ24Q==
X-CSE-MsgGUID: 9NTf44BNROaYiQ33PAp2Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88375495"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="88375495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:50:12 -0800
X-CSE-ConnectionGUID: weEkcWSrRNiodjursDISZw==
X-CSE-MsgGUID: A6dH0ETHTQmRX9s8/4iYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208758157"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jan 2026 10:50:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlX5k-00000000bn6-1Jg3;
	Thu, 29 Jan 2026 18:50:08 +0000
Date: Fri, 30 Jan 2026 02:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1 1/1] dmaengine: idma64: switch to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <202601300212.Cjv94jx1-lkp@intel.com>
References: <20260129104916.200484-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129104916.200484-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.19-rc7 next-20260129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/dmaengine-idma64-switch-to-DEFINE_SIMPLE_DEV_PM_OPS/20260129-185309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260129104916.200484-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] dmaengine: idma64: switch to DEFINE_SIMPLE_DEV_PM_OPS()
config: hexagon-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260130/202601300212.Cjv94jx1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300212.Cjv94jx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601300212.Cjv94jx1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/idma64.c:690:68: error: too few arguments provided to function-like macro invocation
     690 | static DEFINE_SIMPLE_DEV_PM_OPS(idma64_pm_suspend, idma64_pm_resume);
         |                                                                    ^
   include/linux/pm.h:416:9: note: macro 'DEFINE_SIMPLE_DEV_PM_OPS' defined here
     416 | #define DEFINE_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
         |         ^
>> drivers/dma/idma64.c:690:8: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     690 | static DEFINE_SIMPLE_DEV_PM_OPS(idma64_pm_suspend, idma64_pm_resume);
         | ~~~~~~ ^
         | int
>> drivers/dma/idma64.c:697:23: error: use of undeclared identifier 'idma64_dev_pm_ops'
     697 |                 .pm     = pm_sleep_ptr(&idma64_dev_pm_ops),
         |                                         ^~~~~~~~~~~~~~~~~
   3 errors generated.


vim +690 drivers/dma/idma64.c

   689	
 > 690	static DEFINE_SIMPLE_DEV_PM_OPS(idma64_pm_suspend, idma64_pm_resume);
   691	
   692	static struct platform_driver idma64_platform_driver = {
   693		.probe		= idma64_platform_probe,
   694		.remove		= idma64_platform_remove,
   695		.driver = {
   696			.name	= LPSS_IDMA64_DRIVER_NAME,
 > 697			.pm	= pm_sleep_ptr(&idma64_dev_pm_ops),
   698		},
   699	};
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
