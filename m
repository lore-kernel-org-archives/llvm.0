Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27C584C8;
	Tue, 21 Nov 2023 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1ncNT+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700601989; x=1732137989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K74fmG01u+fJvTPFrdGPpv9XzLAyvnSDGmUJAEvX8ww=;
  b=e1ncNT+x50uzDQj4bbHu0I2gdQBvmcXQ6CDyzgLHS3KJ2yjmzqe9wy/U
   OyWFe/IF4PKrZdHsd3WRFGe3fX7Ux5prR+Jae8Kk75wJ2vSS0jt4CuYMQ
   Bayx5L9LV8pktQ0xIcAy00/KUiJ2sSrp6sHzCuKpxdFJdMlWMSyOgSvpn
   9ryTNJ/m2rLcZZcmwCASbd9NCsCJO0vFw6XpO9Qq7BHdVhNl/hR+HSDhI
   4/UUUF3AIflEKo4RQP+aFHY74pQ+pKWy2AEBHDF9spuXqGtodD0uBU/kJ
   t5POZqvTo4DkGMTatsOtIfMXWL75NMMjCWybGfzvtIXZ6Mtbe8JekDgIK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382327478"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="382327478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 13:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884335128"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="884335128"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2023 13:26:26 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5YGE-0008HB-1v;
	Tue, 21 Nov 2023 21:26:22 +0000
Date: Wed, 22 Nov 2023 05:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v5 4/4] drm/i915/display: Split i915 specific
 code away from intel_fb.c
Message-ID: <202311220447.1Vw2SgEJ-lkp@intel.com>
References: <20231121112729.4191245-5-jouni.hogander@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121112729.4191245-5-jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-i915-display-use-intel_bo_to_drm_bo-in-intel_fb-c/20231121-193155
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231121112729.4191245-5-jouni.hogander%40intel.com
patch subject: [Intel-gfx] [PATCH v5 4/4] drm/i915/display: Split i915 specific code away from intel_fb.c
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311220447.1Vw2SgEJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220447.1Vw2SgEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220447.1Vw2SgEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/i915/display/intel_fb_bo.o', needed by 'drivers/gpu/drm/i915/i915.o'.
   make[7]: *** [scripts/Makefile.build:243: drivers/gpu/drm/i915/display/intel_fb.o] Error 1
   make[7]: Target 'drivers/gpu/drm/i915/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
