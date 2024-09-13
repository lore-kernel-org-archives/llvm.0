Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A62B9C6;
	Fri, 13 Sep 2024 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241838; cv=none; b=NjBSlQ9qPyXl9knBmYEByOQzNKglXObM6KGUT4tvpt9W1itz+zoMksWgi+OkxNW+WLND7Xeo17qSaTIvyV9WOnNAQkxLcvmu4MKEodcdCcwMXLS/SyCU0iybnpfMyoXjL7mOXLlNPDnJ7o49UDZ5VhDQr35CP+FZGD0rdXq0rSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241838; c=relaxed/simple;
	bh=k2jkR+mn4m9r4PJ8poWcvrYHk1WEmAREfg71LRRCOmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4biey56Y7w8rdG5cLmfMrhPtkr6K8u2y5ykVOILNXA6szD8GPCiEyZUSq1cx4pksc5HDecPyd8LPoCkMjsZtA1C9q7S31uVUGHE9YB1+YvY1mchDS4bER2HmEyD2pvm2LFqSj0fF7bUoxtuOo9SXK0PDrhPgCBoeqc1rB4S4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7ytgack; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7ytgack"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726241836; x=1757777836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k2jkR+mn4m9r4PJ8poWcvrYHk1WEmAREfg71LRRCOmw=;
  b=k7ytgack/L72OxJpU5a0N+k5YHRXmOjdshXSpxgYjiyFuZyszOHivmiR
   PfHmD9xz5FZx5jClahYgbKXOOrrBKV//ipeevcSbOanarYy7kYjcPn7fs
   buO3Wq3kr7UxDkfo5x/TpY/wybk/vQujO3646JDjUm7dSvrEtte8DA9Q4
   3RTiZJOgdbBWfXFQCZtCmoZjSeokZl7uJ51ylGTQYuAw5I4/1D4EZ5b3s
   xMI4nBf38r9aL/EHnWrX86D8ma7DG4wgwdmBmwvg0FHrWx7HQzLwwEmbu
   UBSzfXudwmAATW3+dj9NNnDzq7pMv/hntFb7TEodYAqeX+ZxV1nlCii/J
   A==;
X-CSE-ConnectionGUID: 4QYqJloVTrSf87rTZO845Q==
X-CSE-MsgGUID: ZmCkdKYLR2mpyg6AS94lgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25345510"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25345510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 08:37:02 -0700
X-CSE-ConnectionGUID: wVgnMCSBRi2AdvWqCZmYoA==
X-CSE-MsgGUID: C5gKQhq5SASQxHMwhCc6Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="91352229"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 08:37:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp8Ly-0006dB-0j;
	Fri, 13 Sep 2024 15:36:58 +0000
Date: Fri, 13 Sep 2024 23:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <202409132343.1z91h4au-lkp@intel.com>
References: <20240911072751.365361-10-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-10-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20240913]
[cannot apply to robh/for-next wsa/i2c/for-next linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240911-153237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240911072751.365361-10-wenst%40chromium.org
patch subject: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
config: arm64-randconfig-002-20240913 (https://download.01.org/0day-ci/archive/20240913/202409132343.1z91h4au-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132343.1z91h4au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132343.1z91h4au-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/chrome/chromeos_of_hw_prober.c:66:8: error: call to undeclared function 'of_machine_is_compatible'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 |                 if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
         |                      ^
   drivers/platform/chrome/chromeos_of_hw_prober.c:93:7: error: call to undeclared function 'of_machine_is_compatible'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      93 |                 if (of_machine_is_compatible(hw_prober_platforms[i].compatible))
         |                     ^
   2 errors generated.


vim +/of_machine_is_compatible +66 drivers/platform/chrome/chromeos_of_hw_prober.c

    60	
    61	static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
    62	{
    63		for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
    64			int ret;
    65	
  > 66			if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
    67				continue;
    68	
    69			ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
    70			/* Ignore unrecoverable errors and keep going through other probers */
    71			if (ret == -EPROBE_DEFER)
    72				return ret;
    73		}
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
