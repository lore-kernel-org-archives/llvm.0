Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EFB2D781;
	Wed, 15 Nov 2023 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAZsjmXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700060563; x=1731596563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1HqVu++Or5MPt2IsrGXLkZwksVda8ElGJ+dTFliEGaA=;
  b=kAZsjmXjIj8lriv+R3uVUBfNEbGeWBcNf+uQykbBVoreliXNqz+A4SIJ
   CVdPyQIzSUYnrAKdlQfXWzUyb5+f1K3kX1QPyOwE0Q4XPLF278ynWTAbF
   Ds9J/LzPmth9cQ+JWaB4/D0wpzheTnnDviAcZVFznp9g6C+CZlN6W5Fn/
   Lac3vr3jXv8+D37nfkT7obUAarfR/Fr6g08PFioi4QEESV/+jYf2N+kwK
   ex+gsx7fuuirgj847a7T/qCIdYUenPntrUVwgsD4TXl0yGPY1rFxesOC2
   BLQ0AXrN9Qn1lnVDeEIMEsrUpdZfSWSJSA64W91clo4eDzdANyY7X5syI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="3970776"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="3970776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:02:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6195334"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2023 07:02:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3HPG-0000Qo-38;
	Wed, 15 Nov 2023 15:02:19 +0000
Date: Wed, 15 Nov 2023 23:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	rafael@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] thermal: Add support for device tree thermal zones
 consumers
Message-ID: <202311152242.dch1tAh5-lkp@intel.com>
References: <20231114131514.89031-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114131514.89031-1-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/thermal-Add-support-for-device-tree-thermal-zones-consumers/20231114-211656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231114131514.89031-1-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH] thermal: Add support for device tree thermal zones consumers
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231115/202311152242.dch1tAh5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152242.dch1tAh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152242.dch1tAh5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpufreq/cpufreq.c:19:
   In file included from include/linux/cpu_cooling.h:17:
>> include/linux/thermal.h:281:29: warning: no previous prototype for function 'thermal_of_get_zone_by_index' [-Wmissing-prototypes]
   struct thermal_zone_device *thermal_of_get_zone_by_index(struct device *dev, int index)
                               ^
   include/linux/thermal.h:281:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct thermal_zone_device *thermal_of_get_zone_by_index(struct device *dev, int index)
   ^
   static 
>> include/linux/thermal.h:286:29: warning: no previous prototype for function 'thermal_of_get_zone' [-Wmissing-prototypes]
   struct thermal_zone_device *thermal_of_get_zone(struct device *dev, const char *name)
                               ^
   include/linux/thermal.h:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct thermal_zone_device *thermal_of_get_zone(struct device *dev, const char *name)
   ^
   static 
   2 warnings generated.


vim +/thermal_of_get_zone_by_index +281 include/linux/thermal.h

   280	
 > 281	struct thermal_zone_device *thermal_of_get_zone_by_index(struct device *dev, int index)
   282	{
   283		return ERR_PTR(-EOPNOTSUPP);
   284	}
   285	
 > 286	struct thermal_zone_device *thermal_of_get_zone(struct device *dev, const char *name)
   287	{
   288		return ERR_PTR(-EOPNOTSUPP);
   289	}
   290	#endif
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
