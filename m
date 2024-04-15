Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C092F41;
	Mon, 15 Apr 2024 05:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713157861; cv=none; b=EXzC6and0V4Bg6uIWrZE0QAyt+3j3yRACfUo7IYB2ro4RJ5fO6eetzrB3C9uPCzrwy0sTqrbzL+eWvuk1dfTwIYTCFRe9ICP3yG/QgFfiPwnzdgW5/sEMyPuePRkg4V41Z+BlpAoYX6Mf0j56Pbrklu4JjyGW+ndhbWqr6a3N6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713157861; c=relaxed/simple;
	bh=xnNTKg9O11qs5df9fpMkowc+911rIlXEZvhJWTm47AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWqJ4Jgp2eDYE551dck88v3hZyWX3INoo/qre147aTTu2SJ8mNGPnuzAgv0/3Un8pd1VT8gF4p7SLqKsEbQItKUwAl7n2X6icupI1HnAm4w/XCHdInwFTVWOox5mjtUQPsfe19PbJ2S4qKg9QwdYGv7dTj01ubUp6zbPW0/EJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E56CVW6e; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E56CVW6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713157860; x=1744693860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnNTKg9O11qs5df9fpMkowc+911rIlXEZvhJWTm47AQ=;
  b=E56CVW6exGc4e1DGV7r1Dt9I3Gg59dTbSzFNL6Ujt1HaWbSF4v3pPqHo
   HWGK819xyl1sPOOTWUziPlEFv1K02trK10zbt1PKtWte0zE30szkuhGcy
   cSHk0judzBtgHOn+u7QhOYlMVKLPN2kX2Toj/eJLBtaSm0OY2ZwDWez6L
   +dM8cl2+6VyhAsO4OGZNK7bnKuRuKbFOw4Z/dgZja/52uLObGkS9gBzFy
   k6kt8og1cQN4vHXb2j+6u1zkhCOjz+6FkF+9tTCnOgIUaSKY3R0xlhLqq
   UnAzG7c2FQL1J3uRHKdbOFu/G1t/SeJBPETp0jLw0W5gRFL1yRHIIDQq8
   w==;
X-CSE-ConnectionGUID: l/2igV8cQBKOyPdajTmRMA==
X-CSE-MsgGUID: xx5jkbFnQ7aA11BcJOWx6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8387000"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8387000"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 22:10:56 -0700
X-CSE-ConnectionGUID: i3cKZkLqRfKTmdq4Yi9KYg==
X-CSE-MsgGUID: +8G4SjyNQU6aRv9yWPpwKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="59240318"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Apr 2024 22:10:55 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwEcG-0003z8-0X;
	Mon, 15 Apr 2024 05:10:52 +0000
Date: Mon, 15 Apr 2024 13:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v1 1/2] mmc: sdhci-acpi: Switch to
 SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Message-ID: <202404151250.mJXR8RpZ-lkp@intel.com>
References: <20240412184706.366879-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412184706.366879-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc4 next-20240412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mmc-sdhci-acpi-Switch-to-SYSTEM_SLEEP_PM_OPS-RUNTIME_PM_OPS-and-pm_ptr/20240415-093843
base:   linus/master
patch link:    https://lore.kernel.org/r/20240412184706.366879-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/2] mmc: sdhci-acpi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
config: i386-randconfig-002-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151250.mJXR8RpZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151250.mJXR8RpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151250.mJXR8RpZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-acpi.c:969:8: error: call to undeclared function 'sdhci_suspend_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     969 |         ret = sdhci_suspend_host(host);
         |               ^
>> drivers/mmc/host/sdhci-acpi.c:983:9: error: call to undeclared function 'sdhci_resume_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     983 |         return sdhci_resume_host(c->host);
         |                ^
   drivers/mmc/host/sdhci-acpi.c:983:9: note: did you mean 'sdhci_remove_host'?
   drivers/mmc/host/sdhci.h:771:6: note: 'sdhci_remove_host' declared here
     771 | void sdhci_remove_host(struct sdhci_host *host, int dead);
         |      ^
>> drivers/mmc/host/sdhci-acpi.c:995:8: error: call to undeclared function 'sdhci_runtime_suspend_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     995 |         ret = sdhci_runtime_suspend_host(host);
         |               ^
>> drivers/mmc/host/sdhci-acpi.c:1009:9: error: call to undeclared function 'sdhci_runtime_resume_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1009 |         return sdhci_runtime_resume_host(c->host, 0);
         |                ^
   4 errors generated.


vim +/sdhci_suspend_host +969 drivers/mmc/host/sdhci-acpi.c

84d49b3d08a1d3 Hans de Goede 2020-03-16   959  
c4e050376c69bb Adrian Hunter 2012-11-23   960  static int sdhci_acpi_suspend(struct device *dev)
c4e050376c69bb Adrian Hunter 2012-11-23   961  {
c4e050376c69bb Adrian Hunter 2012-11-23   962  	struct sdhci_acpi_host *c = dev_get_drvdata(dev);
d38dcad4e7b48f Adrian Hunter 2017-03-20   963  	struct sdhci_host *host = c->host;
84d49b3d08a1d3 Hans de Goede 2020-03-16   964  	int ret;
c4e050376c69bb Adrian Hunter 2012-11-23   965  
d38dcad4e7b48f Adrian Hunter 2017-03-20   966  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
d38dcad4e7b48f Adrian Hunter 2017-03-20   967  		mmc_retune_needed(host->mmc);
d38dcad4e7b48f Adrian Hunter 2017-03-20   968  
84d49b3d08a1d3 Hans de Goede 2020-03-16  @969  	ret = sdhci_suspend_host(host);
84d49b3d08a1d3 Hans de Goede 2020-03-16   970  	if (ret)
84d49b3d08a1d3 Hans de Goede 2020-03-16   971  		return ret;
84d49b3d08a1d3 Hans de Goede 2020-03-16   972  
84d49b3d08a1d3 Hans de Goede 2020-03-16   973  	sdhci_acpi_reset_signal_voltage_if_needed(dev);
84d49b3d08a1d3 Hans de Goede 2020-03-16   974  	return 0;
c4e050376c69bb Adrian Hunter 2012-11-23   975  }
c4e050376c69bb Adrian Hunter 2012-11-23   976  
c4e050376c69bb Adrian Hunter 2012-11-23   977  static int sdhci_acpi_resume(struct device *dev)
c4e050376c69bb Adrian Hunter 2012-11-23   978  {
c4e050376c69bb Adrian Hunter 2012-11-23   979  	struct sdhci_acpi_host *c = dev_get_drvdata(dev);
c4e050376c69bb Adrian Hunter 2012-11-23   980  
6e1c7d6103fe70 Adrian Hunter 2016-04-15   981  	sdhci_acpi_byt_setting(&c->pdev->dev);
6e1c7d6103fe70 Adrian Hunter 2016-04-15   982  
c4e050376c69bb Adrian Hunter 2012-11-23  @983  	return sdhci_resume_host(c->host);
c4e050376c69bb Adrian Hunter 2012-11-23   984  }
c4e050376c69bb Adrian Hunter 2012-11-23   985  
c4e050376c69bb Adrian Hunter 2012-11-23   986  static int sdhci_acpi_runtime_suspend(struct device *dev)
c4e050376c69bb Adrian Hunter 2012-11-23   987  {
c4e050376c69bb Adrian Hunter 2012-11-23   988  	struct sdhci_acpi_host *c = dev_get_drvdata(dev);
d38dcad4e7b48f Adrian Hunter 2017-03-20   989  	struct sdhci_host *host = c->host;
84d49b3d08a1d3 Hans de Goede 2020-03-16   990  	int ret;
d38dcad4e7b48f Adrian Hunter 2017-03-20   991  
d38dcad4e7b48f Adrian Hunter 2017-03-20   992  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
d38dcad4e7b48f Adrian Hunter 2017-03-20   993  		mmc_retune_needed(host->mmc);
c4e050376c69bb Adrian Hunter 2012-11-23   994  
84d49b3d08a1d3 Hans de Goede 2020-03-16  @995  	ret = sdhci_runtime_suspend_host(host);
84d49b3d08a1d3 Hans de Goede 2020-03-16   996  	if (ret)
84d49b3d08a1d3 Hans de Goede 2020-03-16   997  		return ret;
84d49b3d08a1d3 Hans de Goede 2020-03-16   998  
84d49b3d08a1d3 Hans de Goede 2020-03-16   999  	sdhci_acpi_reset_signal_voltage_if_needed(dev);
84d49b3d08a1d3 Hans de Goede 2020-03-16  1000  	return 0;
c4e050376c69bb Adrian Hunter 2012-11-23  1001  }
c4e050376c69bb Adrian Hunter 2012-11-23  1002  
c4e050376c69bb Adrian Hunter 2012-11-23  1003  static int sdhci_acpi_runtime_resume(struct device *dev)
c4e050376c69bb Adrian Hunter 2012-11-23  1004  {
c4e050376c69bb Adrian Hunter 2012-11-23  1005  	struct sdhci_acpi_host *c = dev_get_drvdata(dev);
c4e050376c69bb Adrian Hunter 2012-11-23  1006  
6e1c7d6103fe70 Adrian Hunter 2016-04-15  1007  	sdhci_acpi_byt_setting(&c->pdev->dev);
6e1c7d6103fe70 Adrian Hunter 2016-04-15  1008  
c6303c5d52d5ec Baolin Wang   2019-07-25 @1009  	return sdhci_runtime_resume_host(c->host, 0);
c4e050376c69bb Adrian Hunter 2012-11-23  1010  }
c4e050376c69bb Adrian Hunter 2012-11-23  1011  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
