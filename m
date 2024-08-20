Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26B188CC5;
	Tue, 20 Aug 2024 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149652; cv=none; b=bQ0KJOiPeIM1j3emUgKR5HF0Cs44KRBeuvIMhjT7fiQLOnIE6sCH6pV92N8DYmJuNnAxFlSgisf3EFrkMAXGuDXwVQU5VAbkq12ZtldORFFcS+3ezmma5VfX6fZZOBqOXte/87XDM5iUe1KDcHRuCApMhKCEuAuhXHQo+NoWNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149652; c=relaxed/simple;
	bh=GdUhYnWUSpHo2Uj+GU3GKy4GV/YLV/ySEKo+EbguywI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+sj4v1WPutObkZ3dnEaZ21wXHOfvS1sWYZGkYSAfU0M8FNCs0W6iROC/q7gy0xGlgUT7R+KYvVx0oWNizTjFvyuJkIjnyKUh/nqEwa5G9Z8VLu2nTaOfYu4JyruRo334JT06XrBShRm61eFM2+aNU3kskles7InjAsyLwYjLf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT+8PXGu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT+8PXGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724149651; x=1755685651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GdUhYnWUSpHo2Uj+GU3GKy4GV/YLV/ySEKo+EbguywI=;
  b=BT+8PXGu3xmVYx0fECv42itVE33xnDYS6JpF6EpIcjfxnO8Fqtg4Ua4Q
   cwvmbdHpJWDmcVKXfzVDuvLs3Q6UKfTnAv1Hg8lw1jpJg+/oxJfiDi/g2
   ih9u65kBAn8awNQ2UvdAl2NvP3856jD+fNpioNh0DerOCvJUe8f8E9Pnd
   3u94qPshgwkGuCZJG9UoohYA9qmpIFxL2Bs8bkltzEPGR6bb9ENOR8AHR
   2Rfg2hjND9upX9tV98JYA5AHI/660pc6ZYrzP6c85+WwJAh2u+gQ0NQeA
   8SEPFqTwGviJbocoAeHudczRaEtCw2fPVfg+HFr9tr7gQ+xxBo5GzWm3s
   Q==;
X-CSE-ConnectionGUID: 36YuqJtCQJCMgtnziFPQ/g==
X-CSE-MsgGUID: oJDn7FnCQuiOg+J28z643g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="39896241"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="39896241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 03:27:31 -0700
X-CSE-ConnectionGUID: D68TYDe/SC2Lkac4zMYjyw==
X-CSE-MsgGUID: 6W5JroNcQhONBLYTwOdOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="61443510"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 03:27:29 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgM5G-000A2g-2d;
	Tue, 20 Aug 2024 10:27:26 +0000
Date: Tue, 20 Aug 2024 18:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/3] pmdomain: ti_sci: add per-device latency
 constraint management
Message-ID: <202408201832.dBeZprIs-lkp@intel.com>
References: <20240819-lpm-v6-10-constraints-pmdomain-v2-1-461325a6008f@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-lpm-v6-10-constraints-pmdomain-v2-1-461325a6008f@baylibre.com>

Hi Kevin,

kernel test robot noticed the following build errors:

[auto build test ERROR on ad7eb1b6b92ee0c959a0a6ae846ddadd7a79ea64]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Hilman/pmdomain-ti_sci-add-per-device-latency-constraint-management/20240820-080207
base:   ad7eb1b6b92ee0c959a0a6ae846ddadd7a79ea64
patch link:    https://lore.kernel.org/r/20240819-lpm-v6-10-constraints-pmdomain-v2-1-461325a6008f%40baylibre.com
patch subject: [PATCH v2 1/3] pmdomain: ti_sci: add per-device latency constraint management
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240820/202408201832.dBeZprIs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201832.dBeZprIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201832.dBeZprIs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/ti/ti_sci_pm_domains.c:68:20: error: no member named 'pm_ops' in 'struct ti_sci_ops'
           ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
                 ~~~~~~~~~~~ ^
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:68:63: error: use of undeclared identifier 'TISCI_MSG_CONSTRAINT_SET'
           ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
                                                                        ^
   drivers/pmdomain/ti/ti_sci_pm_domains.c:236:34: error: no member named 'pm_ops' in 'struct ti_sci_ops'
                                   if (pd_provider->ti_sci->ops.pm_ops.set_device_constraint &&
                                       ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/pmdomain/ti/ti_sci_pm_domains.c:237:34: error: no member named 'pm_ops' in 'struct ti_sci_ops'
                                       pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
                                       ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   4 errors generated.


vim +68 drivers/pmdomain/ti/ti_sci_pm_domains.c

    60	
    61	static int ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
    62	{
    63		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
    64		struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
    65		const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
    66		int ret;
    67	
  > 68		ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
    69		if (ret)
    70			dev_err(dev, "ti_sci_pd: set latency constraint failed: ret=%d\n",
    71				ret);
    72		else
    73			dev_dbg(dev, "ti_sci_pd: ID:%d set latency constraint %d\n",
    74				pd->idx, val);
    75	
    76		return ret;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
