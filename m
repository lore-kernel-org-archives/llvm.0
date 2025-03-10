Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480FB1D47A6;
	Mon, 10 Mar 2025 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741590381; cv=none; b=fScAK/7ONSwfLahLMWthIUdthN3d1aeRVJqFqV5VmeLANsGHel8ao5viz2qf/rJukN+nLbjo40ZXwuCeiN1sN3Eg23RRGeqWFHG0Tyv7F22dDkQEMFcY5XWqaaxhFsATOop2qpSuiwzMYp8UUxC3xwMH3vCuHy2IGGcFFiwuleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741590381; c=relaxed/simple;
	bh=BsJiA2ygptrvH1uNkFxANUpxUW22yaXCcjgQIUIM3eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/xFJGP9iS7Tk1OP4ctBmOSTNBDgQTDamYDkxU9hktT14Q8co45BzM9yZ7L/fYFKIGE4+1uQM6KqM/MkrcysxcYJxLXqhHJimdQqtyE1ynUtBT3uznlHqxDYUZbczJSCqH6RJnkK0uqra35A2K/3NavtPqbxTSTvBaKbH01I1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mriv+YV2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mriv+YV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741590379; x=1773126379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsJiA2ygptrvH1uNkFxANUpxUW22yaXCcjgQIUIM3eo=;
  b=mriv+YV2kYcOtDn4kOobwMR62MpXrOlo+IfvT48sH8arlMVd51ybquub
   6v7hbrTrGU48cDdr9xjWv64bz0r0pL3PGFN16Vot7jnQPtHgWq6LSxlhe
   u8ZAyET9bzJ3bHEEJYtUk0Iua6AZRVx4JFnkxMjziW5eUl1/6RzXoKo0i
   g70EiQMQuQ2qh4HFtphxRYFIRskKCGPfSTgmfRq5zBv219SMFhc7f3YaZ
   HiDfnZ0ymyyN8Vq2ucQ124qg1pfgyNyQXbbiQ9csUMAH3yDc6qOLc9SDw
   f9y3V2fhcDAe16Xi1Pc9bXsQUZ+vWKoVmtq4WnzpwKQrWE/IN9gY7nTcz
   A==;
X-CSE-ConnectionGUID: +IW1F5p8TsWleLeabea03w==
X-CSE-MsgGUID: 0cplZWEQTtWV5/SOj8JbLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="67931905"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="67931905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 00:06:18 -0700
X-CSE-ConnectionGUID: dfuxbyzhSqmV7NsTs1FzRA==
X-CSE-MsgGUID: 0neuSCJGQPOY8uiDwX5Tgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="150849378"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Mar 2025 00:06:18 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trXDG-0003uY-1C;
	Mon, 10 Mar 2025 07:06:11 +0000
Date: Mon, 10 Mar 2025 15:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-03-07 40/40]
 sound/soc/soc-core.c:2895:80: error: use of undeclared identifier 'name'
Message-ID: <202503101524.cxor4d3p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-03-07
head:   609577579ecf4de9913d0d83a96d240bd935a4a1
commit: 609577579ecf4de9913d0d83a96d240bd935a4a1 [40/40] ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
config: x86_64-buildonly-randconfig-004-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101524.cxor4d3p-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101524.cxor4d3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101524.cxor4d3p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-core.c:2895:80: error: use of undeclared identifier 'name'
    2895 |                 struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, name);
         |                                                                                              ^
   1 error generated.


vim +/name +2895 sound/soc/soc-core.c

  2877	
  2878	/**
  2879	 * snd_soc_unregister_component_by_driver - Unregister component using a given driver
  2880	 * from the ASoC core
  2881	 *
  2882	 * @dev: The device to unregister
  2883	 * @component_driver: The component driver to unregister
  2884	 */
  2885	void snd_soc_unregister_component_by_driver(struct device *dev,
  2886						    const struct snd_soc_component_driver *component_driver)
  2887	{
  2888		const char *driver_name = NULL;
  2889	
  2890		if (component_driver)
  2891			driver_name = component_driver->name;
  2892	
  2893		mutex_lock(&client_mutex);
  2894		while (1) {
> 2895			struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, name);
  2896	
  2897			if (!component)
  2898				break;
  2899	
  2900			snd_soc_del_component_unlocked(component);
  2901		}
  2902		mutex_unlock(&client_mutex);
  2903	}
  2904	EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
  2905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
