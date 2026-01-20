Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002E529E0E8;
	Tue, 20 Jan 2026 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946642; cv=none; b=GUqk1kegllXvCrG96AKBaNjNbCVECYv2YWbkfBvibCmM3QYWhFqe78xdrSkTxys9VMYlCTuI63Yr2asPnyAd2BceatBDIHrELPLIB4F4SfSB4TIX0Qcg+WJ9ljkcjQFG93ZhbOj+lo7D2bVwAKvj1aU0/S7xyDT2zoXm1x8PafQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946642; c=relaxed/simple;
	bh=zip5ATIXcGnPOSFQUuvHx03GlQS1rEwh0UF9MXE7tg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz2AdASP5U2E8dgw9EpMoHjUUw3qDEGPn0Tm0SqbxovaOHNzrzG2X1FM+ZgY8qTSailUc3EpITEOLVODXs9j1rCEbhDnFuylQl7EI2KINCBY9bIs+rSuUPcDwOuVUWdzE9MbjGmUe8fIguitrtrQIITTbAvhZIp9b/EckrfPHEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3choPYM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3choPYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768946640; x=1800482640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zip5ATIXcGnPOSFQUuvHx03GlQS1rEwh0UF9MXE7tg8=;
  b=R3choPYMFvufTPjLENfg7rXxkK9O0whQ2InxO2WVB/h78f5Bh8v39nVg
   mKZD+Bq8vZXrOsZ0ZCBj6fst/jIdJFaErj561ZdjCgDbZS49BA/QmSMpK
   FExw1qTZ8H8XT+BJuOcbv2g+FZdz5kvlm2YlQFDFsBv1ttqj9A4YEoBwW
   akl3wgbMfUgwO+FYAP2THtAu2CicltUnqBdCYm2M20vTJX2b6PttAz3D0
   RjFuOCcbIPnYjZjr+Ohj4iSUFYfP386RO5ypzP+7D2Sl2IdmyggyXje1z
   t+wVI2ylw2SS3Gk97ZdgNBe8RuMRKsdsSeXqljsaoTlOZxoW8Llg5Bb7I
   Q==;
X-CSE-ConnectionGUID: i+7MvID0Q0yzMT/aXpdtcg==
X-CSE-MsgGUID: yHzyl8rkQV276TSaQgmX2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80473249"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80473249"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 14:03:59 -0800
X-CSE-ConnectionGUID: 73eAFPAGT/WDIQ971AOI4w==
X-CSE-MsgGUID: usykPe85S06Yq/5VD5O3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205879081"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jan 2026 14:03:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viJpK-00000000Pbh-1pJw;
	Tue, 20 Jan 2026 22:03:54 +0000
Date: Wed, 21 Jan 2026 06:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Gu <gu_0233@qq.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
Subject: Re: [PATCH] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
Message-ID: <202601210508.3BaBN2n8-lkp@intel.com>
References: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Gu/firmware-arm_scpi-Fix-device_node-reference-leak-in-scpi_probe/20260120-203159
base:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
patch link:    https://lore.kernel.org/r/tencent_845B889AF1A932F1347EE0C09F350E491009%40qq.com
patch subject: [PATCH] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
config: arm-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210508.3BaBN2n8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210508.3BaBN2n8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210508.3BaBN2n8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scpi.c:21:10: fatal error: 'linux/clean.h' file not found
      21 | #include <linux/clean.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.


vim +21 drivers/firmware/arm_scpi.c

    18	
    19	#include <linux/bitmap.h>
    20	#include <linux/bitfield.h>
  > 21	#include <linux/clean.h>
    22	#include <linux/device.h>
    23	#include <linux/err.h>
    24	#include <linux/export.h>
    25	#include <linux/io.h>
    26	#include <linux/kernel.h>
    27	#include <linux/list.h>
    28	#include <linux/mailbox_client.h>
    29	#include <linux/module.h>
    30	#include <linux/of.h>
    31	#include <linux/of_address.h>
    32	#include <linux/of_platform.h>
    33	#include <linux/platform_device.h>
    34	#include <linux/printk.h>
    35	#include <linux/property.h>
    36	#include <linux/pm_opp.h>
    37	#include <linux/scpi_protocol.h>
    38	#include <linux/slab.h>
    39	#include <linux/sort.h>
    40	#include <linux/spinlock.h>
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
