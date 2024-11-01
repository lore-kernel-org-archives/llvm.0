Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA891C687;
	Fri,  1 Nov 2024 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730484118; cv=none; b=i7WF+4TsiAxLlRAJg85F4SViClks2YQN5OzX+Y5dwSbnCEbg7VjDxiIGXH82ZU49GmRvWeDHoJ4Kgk27nI6fliQRIdv+rDmQqzthLBr3AfCRPzMsw4zpP8W6y7Q+hxSCpt4x9dPzBAzSpZrrZUksbLxaY+gTgZ+yHMhI7LKbBzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730484118; c=relaxed/simple;
	bh=L6URiYCoXpopiknFDUGt7k++aqPsAhuBO3pNbeASb0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXDAIji6lrOgvpsRWvLscn/pJ0FgIjMX/W5bjdU2HXPxS8BvOZcUyOwWPnkGqfr0mupHvDGXySFCNa9tvrSehk+u8Lg/K5jVcXKqV9RQef5wBGzyOZGbC7WNdSYEdTIRSsIuvaoBOTBpIaS5wh65rO/3Y9EtmJNTjmAHSiaBiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZkm1hA3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZkm1hA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730484116; x=1762020116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L6URiYCoXpopiknFDUGt7k++aqPsAhuBO3pNbeASb0g=;
  b=TZkm1hA3hCVYpt+UVxmH9WktR/xd7colTomKUrT7K7hzIwUGAncPlxTK
   lYQgpCcvr0Li3OCHjnrCQkf6AS0p6K3pFGIFIbXPkne5BjwCNhgswtKiO
   snf6u5abkO0/8M8g0slJS8Ac6MA8t1FwxJDat76EX+QXBI+zXb5q3XPt9
   q0EdN+gllxRnUUvf0I37BiPwQffF14RSEobM0++BRFK1TEN+uobpZ4LOz
   V/rG6Ynv60j1zWUD9gWm8NLxtzFsX57NgHvb59VwV2yp/Sk81vPHg4hDF
   VCBCsxEq9Jo+OITKsTTPcAC2U5AmPx0yDkVPTNYEhQhrtXvzzNCqB2K1k
   Q==;
X-CSE-ConnectionGUID: SHJHxSqpROOsrD0mRkZjuw==
X-CSE-MsgGUID: tWh2pjqORlqq1bUeUlPN9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17886438"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="17886438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 11:01:56 -0700
X-CSE-ConnectionGUID: cci1yP8SQi2+tg5zQFYffw==
X-CSE-MsgGUID: SvnGqoF9T9290lHTWh9Erw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="87852661"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2024 11:01:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6vy2-000hrH-1J;
	Fri, 01 Nov 2024 18:01:50 +0000
Date: Sat, 2 Nov 2024 02:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	steven.price@arm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
	sami.mujawar@arm.com, linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
Message-ID: <202411020102.mnsnqAiD-lkp@intel.com>
References: <20241029141114.7207-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029141114.7207-1-jeremy.linton@arm.com>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on next-20241101]
[cannot apply to kvmarm/next soc/for-next linus/master arm/for-next arm/fixes v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241029-221213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241029141114.7207-1-jeremy.linton%40arm.com
patch subject: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
config: arm64-randconfig-002-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020102.mnsnqAiD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020102.mnsnqAiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020102.mnsnqAiD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:223:40: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
     223 | static const struct platform_device_id arm_cca_match[] = {
         |                                        ^~~~~~~~~~~~~
   1 warning generated.


vim +/arm_cca_match +223 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c

   222	
 > 223	static const struct platform_device_id arm_cca_match[] = {
   224		{ ARMV9_RSI_PDEV_NAME, 0},
   225		{ }
   226	};
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
