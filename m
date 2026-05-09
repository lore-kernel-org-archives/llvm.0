Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7699136F418;
	Sat,  9 May 2026 21:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363435; cv=none; b=HRvh6agmyPo5VpLJuvKGbngLyk63kubRCaMMjQcqGE+uemWVo9FZ/L7DANTJES4PVSzdURVafferLGDc+wkQYFID0WiwyQbeX2nzd49JNRPKCyc7gIPKjGXujFM8XJp6C5Srr3hEiTpGBrq1mdmzkTy9/bQjF3LVGTjqHaZyloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363435; c=relaxed/simple;
	bh=TQmri5VH7rJFXKHQX2TKYe9ljm7qUkKcELLADSbhfIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqRuG4RGAcAu42vXYn3ThiKmpH4XmaoqalGmwVAX5XsljGje7H0EsWKWyTmUTcQfXXE8a21U9umEVZq9rstYmdNN9I3eAODQ0EgvgxGtByo8n/gf5QyBnPK+2wtRGlfBZ058kJgrawEU4IS6MdIzXh1hVDoC5O4MlxJFExEiyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ao28TJG1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ao28TJG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778363432; x=1809899432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TQmri5VH7rJFXKHQX2TKYe9ljm7qUkKcELLADSbhfIQ=;
  b=Ao28TJG1m3A6q1eFR1vJeFEvms2QinC8YP+xey3FF+45MdXy/IPWfHp7
   KSupKyGzXnA8IKiM1u4MF2US7CxGKpN6ehyyiGU4zdjnGZQCl/mp2deIn
   w1CRar5LcE+FkTJ0E8BjPrOh3q2yvNfWC+wROVYxiSSsCYMVOH/ZyzgkA
   d/sQ8+ySe3AhqHaDBcz1fEldPsAXlxyal3w+6PPRTKT1cGZ6Ly97IfyWk
   TFW7Ah4UUj79FPB1W5lsnF65YRuVOML90gINsgQi1BK/5xwp1qhWghHv1
   Stcu93kFaj6OWFb5NrGQc3MElgwHF+2Yl1dT0vcB7hHPq4srO5RIHFW+D
   w==;
X-CSE-ConnectionGUID: D1chfsK4QDywOQnvjfeCUw==
X-CSE-MsgGUID: d/C/BY+ATY+aeQtPaY0N9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="78442280"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="78442280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 14:50:30 -0700
X-CSE-ConnectionGUID: 1ouVzmEPRn+YbHLnEF7BGw==
X-CSE-MsgGUID: Xf8vUCIxTNWp5bKOWV/+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232744684"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 14:50:29 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLpZ4-000000001RJ-3YQY;
	Sat, 09 May 2026 21:50:26 +0000
Date: Sun, 10 May 2026 05:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH] irqchip/mbigen: add COMPILE_TEST support
Message-ID: <202605100511.0RiOjmqk-lkp@intel.com>
References: <20260508021352.1635187-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508021352.1635187-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/irqchip-mbigen-add-COMPILE_TEST-support/20260509-194636
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260508021352.1635187-1-rosenp%40gmail.com
patch subject: [PATCH] irqchip/mbigen: add COMPILE_TEST support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605100511.0RiOjmqk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100511.0RiOjmqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100511.0RiOjmqk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-mbigen.c:195:36: error: unknown type name 'msi_alloc_info_t'
     195 | static void mbigen_domain_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
         |                                    ^
>> drivers/irqchip/irq-mbigen.c:218:14: error: use of undeclared identifier 'MSI_FLAG_USE_DEV_FWNODE'
     218 |                 .flags                  = MSI_FLAG_USE_DEV_FWNODE,
         |                                           ^
>> drivers/irqchip/irq-mbigen.c:201:41: error: variable has incomplete type 'const struct msi_domain_template'
     201 | static const struct msi_domain_template mbigen_msi_template = {
         |                                         ^
   drivers/irqchip/irq-mbigen.c:201:21: note: forward declaration of 'struct msi_domain_template'
     201 | static const struct msi_domain_template mbigen_msi_template = {
         |                     ^
>> drivers/irqchip/irq-mbigen.c:225:29: error: no member named 'domain' in 'struct dev_msi_info'
     225 |         if (WARN_ON_ONCE(!dev->msi.domain))
         |                           ~~~~~~~~ ^
   include/asm-generic/bug.h:180:18: note: expanded from macro 'WARN_ON_ONCE'
     180 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |                         ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:228:9: error: call to undeclared function 'msi_create_device_irq_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |         return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
         |                ^
   drivers/irqchip/irq-mbigen.c:228:9: note: did you mean 'mbigen_create_device_domain'?
   drivers/irqchip/irq-mbigen.c:222:13: note: 'mbigen_create_device_domain' declared here
     222 | static bool mbigen_create_device_domain(struct device *dev, unsigned int size,
         |             ^
     223 |                                         struct mbigen_device *mgn_chip)
     224 | {
     225 |         if (WARN_ON_ONCE(!dev->msi.domain))
     226 |                 return false;
     227 | 
     228 |         return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                mbigen_create_device_domain
   5 errors generated.


vim +/MSI_FLAG_USE_DEV_FWNODE +218 drivers/irqchip/irq-mbigen.c

fbfe7e13641efe8 Thomas Gleixner 2024-06-23  200  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @201  static const struct msi_domain_template mbigen_msi_template = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  202  	.chip = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  203  		.name			= "mbigen-v2",
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  204  		.irq_mask		= irq_chip_mask_parent,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  205  		.irq_unmask		= irq_chip_unmask_parent,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  206  		.irq_eoi		= mbigen_eoi_irq,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  207  		.irq_set_type		= mbigen_set_type,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  208  		.irq_write_msi_msg	= mbigen_write_msi_msg,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  209  	},
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  210  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  211  	.ops = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  212  		.set_desc		= mbigen_domain_set_desc,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  213  		.msi_translate		= mbigen_domain_translate,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  214  	},
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  215  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  216  	.info = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  217  		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @218  		.flags			= MSI_FLAG_USE_DEV_FWNODE,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  219  	},
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  220  };
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  221  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  222  static bool mbigen_create_device_domain(struct device *dev, unsigned int size,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  223  					struct mbigen_device *mgn_chip)
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  224  {
752e021f5b9be0a Thomas Gleixner 2024-06-23 @225  	if (WARN_ON_ONCE(!dev->msi.domain))
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  226  		return false;
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  227  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @228  	return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  229  					    &mbigen_msi_template, size,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  230  					    NULL, mgn_chip->base);
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  231  }
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
