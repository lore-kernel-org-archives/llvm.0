Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C42199EB0;
	Mon, 30 Dec 2024 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735601583; cv=none; b=c+isYyB7ca+LYXjmgMdAhBzJVxis7SUf9L+6wFjwKdK6lqRBhgji555X1kawjM3Zw3ED/V6LGbq0/K3qDQq2IGxDxl72oqw87EkfVI42cwghkTKCwYOF8dFOSoMZW2m5VmRPwfMmaDhRkBT023/g//QtxWGEXqas9zxYeeSHREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735601583; c=relaxed/simple;
	bh=mMdEPyc1dOLoK8J81NS2DH4PI2Cc7eFlT2aE7aFQx94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O68LwAirWfRNsWviCycqI/MvukxibT6ittXV0Q9tMH0vlkiIWqPpWaS2XRAp57YPi0BHFyMH5LEHGYR260p/J9WuhN//Eqj3aibgfLyFZfcrtBgfgSG3xTpBlkwI8nznoKCV5lbh0UqdlRIrsoMn6qhNV/3IjLIHnuyKF+xNOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9SIkxT2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9SIkxT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735601581; x=1767137581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mMdEPyc1dOLoK8J81NS2DH4PI2Cc7eFlT2aE7aFQx94=;
  b=D9SIkxT2nxtBJRPSs9Qghik/5rGg7CGf+3oqobcIDMllQ+NMhfQ6jPVU
   6H3TcVc1sSEjPNSO2S8STHGWS7qwwLA9Fzwlku5CvWK0JeFtS7FtrTLvG
   nXTD1a+3GaV9ANlrZAslQxUlkDqYyY0nR+6C8IKykPOdmMt2tgtzbNVmK
   YRpYqGWlx864w//NOIeMZzQx7PosZF0V3zH9kNO/7B0JDMJ/GfZkfevLk
   sg+Ml6+fa1GeJb+Q4AGMIFqUgaPWKgUMxOhTEvDMMkAeVvhTTnZ+Cf8GV
   C4RTXyvCEUbuD34WI8zbJu12MRRkfckIglZaHcv9nlm9InquMsW798Cbw
   A==;
X-CSE-ConnectionGUID: z7cz7FigTOKob9K3106WHA==
X-CSE-MsgGUID: P76whuq9RQKHaQth57wKIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35141426"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35141426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 15:33:00 -0800
X-CSE-ConnectionGUID: TQy0soKsQoyVWzfsOf5YYg==
X-CSE-MsgGUID: o4YGL9GJSH+zBKbcbNR+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="100769552"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2024 15:33:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSPFp-0006TP-28;
	Mon, 30 Dec 2024 23:32:57 +0000
Date: Tue, 31 Dec 2024 07:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/5] EDAC: Versal NET: Add support for error
 notification
Message-ID: <202412310713.TqXys4e4-lkp@intel.com>
References: <20241230055849.11183-6-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230055849.11183-6-shubhrajyoti.datta@amd.com>

Hi Shubhrajyoti,

kernel test robot noticed the following build errors:

[auto build test ERROR on ras/edac-for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/cdx-export-the-symbols/20241230-140926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20241230055849.11183-6-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v2 5/5] EDAC: Versal NET: Add support for error notification
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241231/202412310713.TqXys4e4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310713.TqXys4e4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310713.TqXys4e4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/edac/versalnet_rpmsg_edac.c:1321:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
    1321 |         .remove = mc_remove,
         |                   ^~~~~~~~~
   1 error generated.


vim +1321 drivers/edac/versalnet_rpmsg_edac.c

  1314	
  1315	static struct platform_driver amd_ddr_edac_mc_driver = {
  1316		.driver = {
  1317			.name = "amd-ddrmc-edac",
  1318			.of_match_table = amd_edac_match,
  1319		},
  1320		.probe = mc_probe,
> 1321		.remove = mc_remove,
  1322	};
  1323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
