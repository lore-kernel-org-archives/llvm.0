Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808522ACD7;
	Mon, 10 Feb 2025 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190741; cv=none; b=MdGCoiKgYONTkzlG3wcDCJ6COStGjVXy3sTj/zbi+WR3Q6F5cKEBxu+4y8Tij6FmhrnNRYI/BGVif3n0DcM8TlsdN56NT3EHScB6bk7RC79U/rWr+9Sh1XvcspOOYQGlfhT0SgSwtchRpGKYROxd9iM/11smhFyeFf8lTIJppUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190741; c=relaxed/simple;
	bh=EQSHTPcN/Uh4nElazvazKTJRZoJJU/bBqTejOMZvGkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqYWCcrV+/WhixZgUfuYAERVecAQmang53DV6E3HjspLGeDSSLKIEhbtRG1DvWEDPgq+27ZxFMH6ZKwk8n7NK5RRa6sHfoGR5iQelRiwwXRlM4OzsU1fEBCuGEiCVzDCb3nDbwA7DxVROXXR1jsqK+4Rs+KEzPRRcDXunurM8wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wgl2mAkf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wgl2mAkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739190740; x=1770726740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EQSHTPcN/Uh4nElazvazKTJRZoJJU/bBqTejOMZvGkI=;
  b=Wgl2mAkfNOZzaHKqHA0my6lmz1LnA4YVVJ0MCckoEGWFwTF8DH4tibfw
   wmOhuyqg07KzHjqtp/xjrbo8v/6pKsqJWPdZLXCCrrI0j65pK2rf3gHL5
   vwL4K3tdmy7BpJnC4SQ+B3IDL/o8xYi/pOtTesYxkRFEic9UQeL8Ldh8B
   lPfmKHXeYSaRCFInPbe+os0Zifb/aysbgjoxmNm4qag/Z0TZlKBAuuiX2
   7QhKdIWXbrj6ExEeuOfN9+qZmuP4YMReqDJJOzBPQnFhONcHi4uW6Is3R
   vQnrzGGmTI4wiGdt1xRbf+3Q8ygFJVCdJwmIvT57xzg+/ZZZHX9lG2y5X
   g==;
X-CSE-ConnectionGUID: xnY/NFGtRFSNyj24xsf5IQ==
X-CSE-MsgGUID: RM5QvwboRCOnIwEcpyp+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43428141"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43428141"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:32:16 -0800
X-CSE-ConnectionGUID: eyBVhNlWQM2C44UMCTkDzg==
X-CSE-MsgGUID: FPKlJZLJRmiCct1WczRVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112121351"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 04:32:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thSxP-0012k7-24;
	Mon, 10 Feb 2025 12:32:11 +0000
Date: Mon, 10 Feb 2025 20:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dima Volkovsk <s0ldw3ll@gmail.com>, marvin24@gmx.de,
	gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dima Volkovsk <s0ldw3ll@gmail.com>
Subject: Re: [PATCH] Staging: nvec: Fix pm_power_off reset condition in
 tegra_nvec_remove
Message-ID: <202502102056.z2poG8tW-lkp@intel.com>
References: <20250209201752.66313-1-s0ldw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209201752.66313-1-s0ldw3ll@gmail.com>

Hi Dima,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dima-Volkovsk/Staging-nvec-Fix-pm_power_off-reset-condition-in-tegra_nvec_remove/20250210-041929
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250209201752.66313-1-s0ldw3ll%40gmail.com
patch subject: [PATCH] Staging: nvec: Fix pm_power_off reset condition in tegra_nvec_remove
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250210/202502102056.z2poG8tW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102056.z2poG8tW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102056.z2poG8tW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/nvec/nvec.c:908:19: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
     908 |         if (pm_power_off = nvec_power_off)
         |             ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/staging/nvec/nvec.c:908:19: note: place parentheses around the assignment to silence this warning
     908 |         if (pm_power_off = nvec_power_off)
         |                          ^               
         |             (                            )
   drivers/staging/nvec/nvec.c:908:19: note: use '==' to turn this assignment into an equality comparison
     908 |         if (pm_power_off = nvec_power_off)
         |                          ^
         |                          ==
   1 warning generated.


vim +908 drivers/staging/nvec/nvec.c

   896	
   897	static void tegra_nvec_remove(struct platform_device *pdev)
   898	{
   899		struct nvec_chip *nvec = platform_get_drvdata(pdev);
   900	
   901		nvec_toggle_global_events(nvec, false);
   902		mfd_remove_devices(nvec->dev);
   903		nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
   904		cancel_work_sync(&nvec->rx_work);
   905		cancel_work_sync(&nvec->tx_work);
   906	
   907		/* only reset pm_power_off if it's our handler */
 > 908		if (pm_power_off = nvec_power_off)
   909			pm_power_off = NULL;
   910	}
   911	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
