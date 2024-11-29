Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052119DF77;
	Fri, 29 Nov 2024 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732884242; cv=none; b=E5Sv9IPohJ645lTZ1F4LGzutEJ/c4cAJxJ4aSlj8GwfQEm1K76okhzoejfpQNNLg6BsEcn6fl7jfT9fgFH0/ADilS8+BVmv/NWaZKWvtkjV+6OnmRO/qMCksXF5fALYTtJhACYyPmU59pSqzt/RkDEVGvU5BX/YD0A9AtBu0NiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732884242; c=relaxed/simple;
	bh=JwAW2AFheSIOpLEMcCaOphbJXDfMBuhJnwI3k8mazTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPqQO/yeKob4LCVPl0nG+1LDKw34A+ja2xdhNYuh28IWezPjhTMBsBLpONwR9vb+m4y5k49jL0hcwDh+gztmb2u16vJgb1vDKAKyLZkgKXzgeoCjEF6DE00bnA1cxxCPqH0IEvGetrvv0pO3npMxCDb6Z9Qax9NeRRO0wgcp3kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcSph9CI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcSph9CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732884241; x=1764420241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JwAW2AFheSIOpLEMcCaOphbJXDfMBuhJnwI3k8mazTU=;
  b=HcSph9CIghY/3Gtl5DCKbiAB3gJIQuSY877t5EXtd9c87WyJEgOsktyE
   O6CEWl67dVvo+ukuoZ3W0vUiB4wY6FON0f++8Iftfu7INWKX6mwDEA+S6
   w2iDEAPrPYhxszD+6d/0GhFLv+EioDD82NcQQK0kGmLsnVnTkjt3R5KNl
   Y9AtRRBh9Clolp682jR9gvNeaf8edOKVIEp5oGHy1LqDIn4Rx8BUmEWUR
   AtAaD24mY4x0QBudvikwR2NXd+X7hIWluhjAX6RS8UCNnNoC8TJRRkJjx
   BkMiVeTnKNfC52Gns6ZpB1ZqclIqO0xw0IVHScReu2D1/u64oLuBEB8Wm
   A==;
X-CSE-ConnectionGUID: /7aZUqH4RO2nnIU2hRbhCQ==
X-CSE-MsgGUID: 7as9iILnSWGaIDfMQDAaHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36790021"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36790021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 04:44:00 -0800
X-CSE-ConnectionGUID: n00YEjSZRdSih53JwOaf+w==
X-CSE-MsgGUID: yDQ2bM8eSdq573oaAmuo3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="96899364"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2024 04:43:58 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH0Lj-0000K7-34;
	Fri, 29 Nov 2024 12:43:55 +0000
Date: Fri, 29 Nov 2024 20:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/hdcp: Change log level for HDMI HDCP LIC check
Message-ID: <202411292051.mFVQ48G0-lkp@intel.com>
References: <20241129090530.1814774-1-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129090530.1814774-1-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on linus/master v6.12 next-20241128]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-hdcp-Change-log-level-for-HDMI-HDCP-LIC-check/20241129-170750
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20241129090530.1814774-1-suraj.kandpal%40intel.com
patch subject: [PATCH] drm/i915/hdcp: Change log level for HDMI HDCP LIC check
config: i386-buildonly-randconfig-005-20241129 (https://download.01.org/0day-ci/archive/20241129/202411292051.mFVQ48G0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411292051.mFVQ48G0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292051.mFVQ48G0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_hdmi.c:31:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_hdmi.c:1603:24: warning: unused variable 'display' [-Wunused-variable]
    1603 |         struct intel_display *display = to_intel_display(dig_port);
         |                               ^~~~~~~
   2 warnings generated.


vim +/display +1603 drivers/gpu/drm/i915/display/intel_hdmi.c

2320175feb74a11 drivers/gpu/drm/i915/intel_hdmi.c         Sean Paul    2018-01-08  1598  
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1599  static
038bac8970ac1c9 drivers/gpu/drm/i915/display/intel_hdmi.c Sean Paul    2020-08-18  1600  bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port,
038bac8970ac1c9 drivers/gpu/drm/i915/display/intel_hdmi.c Sean Paul    2020-08-18  1601  				struct intel_connector *connector)
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1602  {
1138137c2c48f03 drivers/gpu/drm/i915/display/intel_hdmi.c Jani Nikula  2024-08-30 @1603  	struct intel_display *display = to_intel_display(dig_port);
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1604  	int retry;
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1605  
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1606  	for (retry = 0; retry < 3; retry++)
038bac8970ac1c9 drivers/gpu/drm/i915/display/intel_hdmi.c Sean Paul    2020-08-18  1607  		if (intel_hdmi_hdcp_check_link_once(dig_port, connector))
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1608  			return true;
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1609  
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1610  	return false;
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1611  }
b08239b2f471909 drivers/gpu/drm/i915/display/intel_hdmi.c Oliver Barta 2020-05-04  1612  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
