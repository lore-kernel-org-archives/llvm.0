Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A05D1459F7;
	Sat, 21 Jun 2025 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750485018; cv=none; b=eg1UF/i+LyVLcmG0AZT+QMN0kKVyfMG37CNVzG4eoiyY3R/Sz62L4A39O/+P6NDE02V70cHERTWx3un4JbGjvJNsseFbzVroodMOCb10pRLKcqy1+oSvsZ/Q5uNIrS7k10o8AKb9r9VqZcejqDp3LzihWHhwtNgHeviICYx6ziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750485018; c=relaxed/simple;
	bh=QwMkKubOeLSa+ZtQ0WxAQRTkaTQpCRBVlWqTwqLTplA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8LAtvSy3JYiS3ZflVOKb77v2IWD3ImwFw4c4yrSiySSLuyjFIDoIvdrUe+Wuw/riFij1+dHIpEEBKodAEz2GYhdSWCwkvhilU5WZzxJp7DHwnlZE+qqSTAKOKJMdbtAxMcGA1eAVa5NzV9qptYSSr3ziz8PTWFYV1nplJkttWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdD60ap/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdD60ap/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750485016; x=1782021016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwMkKubOeLSa+ZtQ0WxAQRTkaTQpCRBVlWqTwqLTplA=;
  b=RdD60ap/jGTiXskoiMtSxguKZOO4lbW+qM60HkqgFlLf1134fsaxWGkz
   QP4K/8Yu3hUn16xnh4MDfkJ4j+tV4hZ6HBF6wPa+E652snPQwsKC8HknF
   S4H3ITEsRB3nEifJpS4zoLdCGqGZYYO6u4GK24zJKfrGBapqWp3LJCF8V
   l9f4hdeY+SgAQhiOnsslO6+alkCLVtiEwUWrE+s2Udp2dMdPp5+Greg81
   P1ZjcgFzfSuLiYlatT8LjVmR3ZGYqwb2bWL85NnYlaEeEMU+1Z5R3W87s
   L9uk0e74Fbdh+97lpFNEIskvMSCTrwfWCPq1GVSXXtSM0QmztVrTiPWRE
   Q==;
X-CSE-ConnectionGUID: mxfifO4kQpiR0nf6mqiqxA==
X-CSE-MsgGUID: JjpTgFpAQkS7Ny6W3mdeSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52452037"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="52452037"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 22:50:15 -0700
X-CSE-ConnectionGUID: +yZeohbATiKG2nHB/UfV+Q==
X-CSE-MsgGUID: 8az7OZZIRfGlBhc5lx+5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="155400478"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2025 22:50:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSr7D-000MOy-0U;
	Sat, 21 Jun 2025 05:50:11 +0000
Date: Sat, 21 Jun 2025 13:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>
Subject: [lumag-msm:msm-next-lumag 41/56]
 drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function
 'readl_relaxed'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202506211346.vjPTqd04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag
head:   ee1c98ae63d16d80d3dd943b404831e4225180bd
commit: 9d47325ee063bcebd2801a38a7e2397b83c3d234 [41/56] drm/msm/dp: drop the msm_dp_catalog module
config: i386-buildonly-randconfig-005-20250621 (https://download.01.org/0day-ci/archive/20250621/202506211346.vjPTqd04-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506211346.vjPTqd04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506211346.vjPTqd04-lkp@intel.com/

Note: the lumag-msm/msm-next-lumag HEAD ee1c98ae63d16d80d3dd943b404831e4225180bd builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |         return readl_relaxed(panel->link_base + offset);
         |                ^
>> drivers/gpu/drm/msm/dp/dp_panel.c:43:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      43 |         writel(data, panel->link_base + offset);
         |         ^
   drivers/gpu/drm/msm/dp/dp_panel.c:53:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         writel(data, panel->p0_base + offset);
         |         ^
   drivers/gpu/drm/msm/dp/dp_panel.c:63:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         return readl_relaxed(panel->p0_base + offset);
         |                ^
   4 errors generated.


vim +/readl_relaxed +33 drivers/gpu/drm/msm/dp/dp_panel.c

    30	
    31	static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
    32	{
  > 33		return readl_relaxed(panel->link_base + offset);
    34	}
    35	
    36	static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
    37				       u32 offset, u32 data)
    38	{
    39		/*
    40		 * To make sure link reg writes happens before any other operation,
    41		 * this function uses writel() instread of writel_relaxed()
    42		 */
  > 43		writel(data, panel->link_base + offset);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
