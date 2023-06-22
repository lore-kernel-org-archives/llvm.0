Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709D17D0;
	Thu, 22 Jun 2023 04:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687407034; x=1718943034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpwDpPau9AQnWP8p0KdWhexr5emxOCDtM5hNbv3OmHY=;
  b=iSpi4O2EM9aKdDyUvzX60GiEtDFyPbvM5Di/GFPCqKhb+PcPi7DbAGOI
   r7KBpei9aEtFne+MUE+R+3UstIx2VvmwP3fmaCIalwrNJPnsGD63zX3SI
   w/iqiIflhwGF3AeM3uinm/yLxpYyKtFo4P6Fwfs5FKj+BvgJOBZDjA8mO
   tgYDKsHW9TqDCmmEqQb32RZEKfJdg+7RK2nSU0bHN9WPipJwYK4LhJrWA
   1hmejasQ2O+wNlOpfkk1PpPt6Tj/mHWIW5vbaAyK98zlmSNj3CggB/epq
   9G8KPfVU6bMs2weacE30lG8SIR9ke+qy4IRon+yXgVwiDYqYdt3sPxzM+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360397919"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="360397919"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 21:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804627027"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="804627027"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 21:10:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCBeO-0007Jv-1j;
	Thu, 22 Jun 2023 04:10:28 +0000
Date: Thu, 22 Jun 2023 12:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>, suzuki.poulose@arm.com,
	robin.murphy@arm.com, ilkka@os.amperecomputing.com,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, treding@nvidia.com,
	jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
	efunsten@nvidia.com, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH v4] perf: arm_cspmu: Separate Arm and vendor module
Message-ID: <202306221135.Z877Um2S-lkp@intel.com>
References: <20230620041438.32514-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620041438.32514-1-bwicaksono@nvidia.com>

Hi Besar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea8d1c062a0e876e999e4f347daeb598d5e677ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Besar-Wicaksono/perf-arm_cspmu-Separate-Arm-and-vendor-module/20230620-121723
base:   ea8d1c062a0e876e999e4f347daeb598d5e677ab
patch link:    https://lore.kernel.org/r/20230620041438.32514-1-bwicaksono%40nvidia.com
patch subject: [PATCH v4] perf: arm_cspmu: Separate Arm and vendor module
config: arm64-randconfig-r011-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221135.Z877Um2S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221135.Z877Um2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221135.Z877Um2S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_cspmu/arm_cspmu.c:386:30: warning: no previous prototype for function 'arm_cspmu_impl_match_get' [-Wmissing-prototypes]
     386 | struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
         |                              ^
   drivers/perf/arm_cspmu/arm_cspmu.c:386:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     386 | struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
         | ^
         | static 
   1 warning generated.


vim +/arm_cspmu_impl_match_get +386 drivers/perf/arm_cspmu/arm_cspmu.c

   385	
 > 386	struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
   387	{
   388		struct arm_cspmu_impl_match *match = impl_match;
   389	
   390		for (; match->pmiidr_val; match++) {
   391			u32 mask = match->pmiidr_mask;
   392	
   393			if ((match->pmiidr_val & mask) == (pmiidr & mask))
   394				break;
   395		}
   396	
   397		return match;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
