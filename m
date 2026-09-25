Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0496D3921DD;
	Fri, 25 Sep 2026 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317472; cv=none; b=h0KLII13FAq3z7uH7egkGs2YuB4MLCTbWOQrlkzM4uJu7jNAs2Gupekz/wmYfpPKVu4XlwlhI1zWemHuzi0j8V/lFPalzRhpGMP5a3bibKuNcEjpPVH5JXV77nfXZU2FQDDt03AzCy76kCKRfNeAnSzfYULPgx7sjengriPugGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317472; c=relaxed/simple;
	bh=RYwxAXEieuzmAiIxOZsQQZq48JHTZcUCM6yc9NfvMag=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcLSu4YpC1SGZZYJENegmhyx3DSyznzL7m+8Esp/27r1Djf88/q+6aQ017W913zonUmkIjcG9fYxyHoFS2qjz9UKpXyRVmJE28xgjV9k/T+GyyZh0oQ1fueOAFXVmV6ogaQLyM50Nu/3XhS0N31PCcUvWYc+D9c7K0WAdmKcBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyZfFfHa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyZfFfHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790317470; x=1821853470;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=RYwxAXEieuzmAiIxOZsQQZq48JHTZcUCM6yc9NfvMag=;
  b=iyZfFfHaD75F+qXhnAUk8zAHTn58PtX8+kscu7MrLuUxRaHzsbrGe6F5
   7YpnnEi5XFrW+5Fz7IdVfQKB/chenv03NMflUTuXYCC1ayjeqa/az5RRW
   Qa5aOTGs/2OrSZFvVvypNkAND34EISXTZPFfKI1D0VGRVMnEjo7EChSWv
   /ba6RPmMwpnUZvGxOzJzJoWUxOzSU1avAnWddO41vpCAsTdFDgE+aOt+Z
   lwsZ3rfPOEhBqHwBNrtwTsbRV2oJg6QD878KaZVOnjqHK6YbXB9wi+tcr
   FMhlzUYpHKMsD9LakBlbRTs8S6UDc91Q0r+tUYVjhSAZKKV4BVLGPQox6
   Q==;
X-CSE-ConnectionGUID: luGznPOuQWuPUeoCQyTwkw==
X-CSE-MsgGUID: Sb/KCrjQRgyNl0YgISFE2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90006447"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90006447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 23:24:29 -0700
X-CSE-ConnectionGUID: dr06/A5/QsekUwsIYwpNqg==
X-CSE-MsgGUID: ioLMoF9GRlSY4xifP17PZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="278959257"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2026 23:24:28 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9zM9-00000000K8Q-3eX8;
	Fri, 25 Sep 2026 06:24:25 +0000
Date: Fri, 25 Sep 2026 14:24:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609251426.jvxMSRpi-lkp@intel.com>
References: <202609251426.jvxMSRpi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609251426.jvxMSRpi-lkp@intel.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/pmdomain-imx-gpc-remove-all-initialized-power-domains/20260924-222520
base:   
patch link:    https://lore.kernel.org/r/202609251426.jvxMSRpi-lkp%40intel.com
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260925/202609251426.jvxMSRpi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251426.jvxMSRpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251426.jvxMSRpi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/imx/gpc.c:554:1: error: function definition is not allowed here
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^
   include/linux/device/driver.h:294:41: note: expanded from macro 'builtin_driver'
     294 | static int __init __driver##_init(void) \
         |                                         ^
>> drivers/pmdomain/imx/gpc.c:554:1: error: use of undeclared identifier 'imx_gpc_driver_init'; did you mean 'imx_gpc_driver'?
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:17: note: expanded from macro 'builtin_driver'
     298 | device_initcall(__driver##_init);
         |                 ^~~~~~~~~~~~~~~
   <scratch space>:136:1: note: expanded from here
     136 | imx_gpc_driver_init
         | ^~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:546:31: note: 'imx_gpc_driver' declared here
     546 | static struct platform_driver imx_gpc_driver = {
         |                               ^
>> drivers/pmdomain/imx/gpc.c:554:1: error: initializing 'initcall_t' (aka 'int (*)(void)') with an expression of incompatible type 'struct platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:297:3: note: expanded from macro 'builtin_driver'
     297 | } \
         |   ^
     298 | device_initcall(__driver##_init);
         |                 ~~~~~~~~~~~~~~~
   include/linux/init.h:306:30: note: expanded from macro '\
   device_initcall'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^                 ~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:150:1: note: expanded from here
     150 | __initcall__kmod_gpc__425_554_imx_gpc_driver_init6
         | ^
   include/linux/init.h:264:20: note: expanded from macro '____define_initcall'
     264 |         static initcall_t __name __used                         \
         |                           ^
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ~~
>> drivers/pmdomain/imx/gpc.c:554:40: error: expected '}'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                                        ^
   drivers/pmdomain/imx/gpc.c:504:1: note: to match this '{'
     504 | {
         | ^
   4 errors generated.


vim +554 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  545  
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @546  static struct platform_driver imx_gpc_driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  547  	.driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  548  		.name = "imx-gpc",
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  549  		.of_match_table = imx_gpc_dt_ids,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  550  	},
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  551  	.probe = imx_gpc_probe,
e70140ba0d2b1a drivers/pmdomain/imx/gpc.c Linus Torvalds 2024-12-01  552  	.remove = imx_gpc_remove,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  553  };
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @554  builtin_platform_driver(imx_gpc_driver)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
