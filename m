Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9617D2;
	Fri, 14 Mar 2025 00:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741912329; cv=none; b=delMs3oXzx1AX1xwc63nQ3QA2u+ChvpRTaJaJ31Wvu11uO3SXQk4LgD5rNvHLGGqU+6HqjBKI2t1YCDq8+nmz04GWS0zaflxSgCxUYuK9FRz6+WDA00OoY+/pkXLWWboULk6UY69Svge69GOAQpWPxtYTJCO4Eo3u7AcZ0rWJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741912329; c=relaxed/simple;
	bh=HtnX3fKiPDeZxpTk5T/FrAwvbTQAyZy2SaD3hvVwhbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqYrFVxm4o0WDzhZQyJ4zvlRdyNCzhoYbjtfDI8idclhafI0360nX9lH+vbt1D4aUDk/SsmEQ10jZBrxoTzKuj+O+3at5WreI+YDnmfianC6UItxvrACsxamryzlViak/FLUe/s1fevKLx5H1UinWuskIMdnKno8T53HuMYmSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMWaq4z6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMWaq4z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741912328; x=1773448328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtnX3fKiPDeZxpTk5T/FrAwvbTQAyZy2SaD3hvVwhbk=;
  b=IMWaq4z65n+eWPBuxFna4n5THlldQCw8rvEqUdsou1CettXKHdWxC4jc
   7sth5UVXXjbQBceJbL2JBAuO7V9hI3x1MOMpaqCPQTdmxQa54459PZbDN
   cYbA+EbKxqWgmO3W2ttcx1v0Ez3Ok4wFNbYF6QtvvwppbG2EFwJauxC7B
   7SXdK7HQgyPamlP4OnciPmbC7i/aUSrzJ8uCyXVtUWVuAE+RRHTbaYsIx
   TsCJQ1FukhIPVQjVfJ566RBiO+p9g6kPhFwCdtvF3T/lAYFRRaJIYDXew
   DmkEbswg399wF27Q8F8n+W4zOC4pIvD09vbabsTRTUi85ZNdTQOQjF9Cq
   A==;
X-CSE-ConnectionGUID: zmu4UU/hRrqVZfqdI/uYcA==
X-CSE-MsgGUID: X8KvA0YeSfWDy6iLNVvc+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60454988"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60454988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 17:32:07 -0700
X-CSE-ConnectionGUID: r/qsnK1iRsSiNm1O0yc7lQ==
X-CSE-MsgGUID: DxGiGVhYT2WyXnvCVgvDsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="125742044"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Mar 2025 17:32:05 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tssy3-000A22-17;
	Fri, 14 Mar 2025 00:32:03 +0000
Date: Fri, 14 Mar 2025 08:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/scmi_minor_cleanup 7/7]
 drivers/pmdomain/arm/scmi_pm_domain.c:27:13: warning: unused variable
 'ret_state'
Message-ID: <202503140851.OfvuRJ6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/scmi_minor_cleanup
head:   51352dcbe987669cc05f54142918faf4240c4bb4
commit: 51352dcbe987669cc05f54142918faf4240c4bb4 [7/7] pmdomain: arm: scmi_pm_domain: Remove redundant state verification
config: x86_64-buildonly-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503140851.OfvuRJ6C-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140851.OfvuRJ6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140851.OfvuRJ6C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/arm/scmi_pm_domain.c:27:13: warning: unused variable 'ret_state' [-Wunused-variable]
      27 |         u32 state, ret_state;
         |                    ^~~~~~~~~
   1 warning generated.


vim +/ret_state +27 drivers/pmdomain/arm/scmi_pm_domain.c

898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  24  
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  25  static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  26  {
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14 @27  	u32 state, ret_state;
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  28  	struct scmi_pm_domain *pd = to_scmi_pd(domain);
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  29  
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  30  	if (power_on)
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  31  		state = SCMI_POWER_STATE_GENERIC_ON;
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  32  	else
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  33  		state = SCMI_POWER_STATE_GENERIC_OFF;
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  34  
51352dcbe987669 drivers/pmdomain/arm/scmi_pm_domain.c      Sudeep Holla 2025-03-13  35  	return power_ops->state_set(pd->ph, pd->domain, state);
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  36  }
898216c97ed2ebf drivers/firmware/arm_scmi/scmi_pm_domain.c Sudeep Holla 2017-06-14  37  

:::::: The code at line 27 was first introduced by commit
:::::: 898216c97ed2ebfffda659ce12388da43534de6c firmware: arm_scmi: add device power domain support using genpd

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
