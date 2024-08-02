Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0B1ABEB9;
	Fri,  2 Aug 2024 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722632541; cv=none; b=ZXqGh0EDyMhfYtQTysqaVyW9vdWx/+19rOKCBlWWT4amBMuCcHRENrN0+Zg/TaaGuoqJPfyQqTVfFfjQfUzQu8nts7n2cW9lTu2vdZ/vwsFHQcMLqP5SOB8VLoCwO1PGpPPzomIT1I8KaL+KZBNmc9pK5enF0HlTM17aiOZz+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722632541; c=relaxed/simple;
	bh=yxxmkBORmPdCQ0F+YqI+dsKeOyMfnZQoJI2xAc6/PoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lfd6VLAkozUFdx2CrqceuIxk1MT/HNVNLMqKPBwjHJiAZLjZPAITV8EZJKmHpr2io2ytqn8JSLwDG69pOexyLaP3C4o6fzpVPgOq+2xsKiA8R3OKc7hxr1pPBgYOHbYTWXJDIASarb0+r306+qAYtWMLiTe2oxNxSeeheBrRZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cjc/5h07; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cjc/5h07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722632539; x=1754168539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yxxmkBORmPdCQ0F+YqI+dsKeOyMfnZQoJI2xAc6/PoE=;
  b=Cjc/5h07Qj1IhHVHXAurYsO5t7NHaizebGONdg4l0ymXXTdXowq055iz
   PHGlemsgcqBRBHeRERemin3WCk2M2xRFXxD4YHfKC7LS/UWH8KS+hrds0
   H1QOQAnmZUtp0FVwyeuhu6XePltyG+MYULhXLFi9VtTEOcMNw7Jz7paHv
   WIfo/rIiTqSFoSxl95opJ77ss+xirvRHtCHu8LavskNTJgZzHbhH9o5PF
   o/J+VBabI7f1uSZpqzqN5eo/+azjgYa+qwUT/wK5oYYfrattmvjXR+lmx
   5IyX1oUyG4wWDeq04gTR6lB50kez9xsC4xwdibImecswtnogtBaG11xt+
   w==;
X-CSE-ConnectionGUID: gbOfKbrVSFacWdd5X6leCw==
X-CSE-MsgGUID: zbajbGozQX61aCHM57pTfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24456900"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="24456900"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 14:02:18 -0700
X-CSE-ConnectionGUID: IsO13HSLT6GzqjqHWMFg0g==
X-CSE-MsgGUID: xPQnrv4dQRWu1NFvfzMw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="78791674"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2024 14:02:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZzPj-000xQK-18;
	Fri, 02 Aug 2024 21:02:15 +0000
Date: Sat, 3 Aug 2024 05:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [vireshk-pm:cpufreq/arm/linux-next 2/2]
 drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202408030418.gnJDcCpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
head:   dca2ef2b7d916c718c6e88084170413a8a1942d0
commit: dca2ef2b7d916c718c6e88084170413a8a1942d0 [2/2] cpufreq: spear: Use of_property_for_each_u32() instead of open coding
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240803/202408030418.gnJDcCpm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030418.gnJDcCpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030418.gnJDcCpm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                   freq_tbl[i].frequency = val;
                            ^
   drivers/cpufreq/spear-cpufreq.c:176:12: note: initialize the variable 'i' to silence this warning
           int cnt, i, ret;
                     ^
                      = 0
   1 warning generated.


vim +/i +202 drivers/cpufreq/spear-cpufreq.c

   170	
   171	static int spear_cpufreq_probe(struct platform_device *pdev)
   172	{
   173		struct device_node *np;
   174		struct cpufreq_frequency_table *freq_tbl;
   175		u32 val;
   176		int cnt, i, ret;
   177	
   178		np = of_cpu_device_node_get(0);
   179		if (!np) {
   180			pr_err("No cpu node found\n");
   181			return -ENODEV;
   182		}
   183	
   184		if (of_property_read_u32(np, "clock-latency",
   185					&spear_cpufreq.transition_latency))
   186			spear_cpufreq.transition_latency = CPUFREQ_ETERNAL;
   187	
   188		cnt = of_property_count_u32_elems(np, "cpufreq_tbl");
   189		if (cnt <= 0) {
   190			pr_err("Invalid cpufreq_tbl\n");
   191			ret = -ENODEV;
   192			goto out_put_node;
   193		}
   194	
   195		freq_tbl = kcalloc(cnt + 1, sizeof(*freq_tbl), GFP_KERNEL);
   196		if (!freq_tbl) {
   197			ret = -ENOMEM;
   198			goto out_put_node;
   199		}
   200	
   201		of_property_for_each_u32(np, "cpufreq_tbl", val)
 > 202			freq_tbl[i].frequency = val;
   203	
   204		freq_tbl[cnt].frequency = CPUFREQ_TABLE_END;
   205	
   206		spear_cpufreq.freq_tbl = freq_tbl;
   207	
   208		of_node_put(np);
   209	
   210		spear_cpufreq.clk = clk_get(NULL, "cpu_clk");
   211		if (IS_ERR(spear_cpufreq.clk)) {
   212			pr_err("Unable to get CPU clock\n");
   213			ret = PTR_ERR(spear_cpufreq.clk);
   214			goto out_put_mem;
   215		}
   216	
   217		ret = cpufreq_register_driver(&spear_cpufreq_driver);
   218		if (!ret)
   219			return 0;
   220	
   221		pr_err("failed register driver: %d\n", ret);
   222		clk_put(spear_cpufreq.clk);
   223	
   224	out_put_mem:
   225		kfree(freq_tbl);
   226		return ret;
   227	
   228	out_put_node:
   229		of_node_put(np);
   230		return ret;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
