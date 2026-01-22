Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F33C00B6;
	Thu, 22 Jan 2026 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077561; cv=none; b=TUrk3RRmpeuhPQwuTBYIvLv5eiPtMDd+40VsG/afFWjrYfsSuUX9D7gf/QSkuX/wcYwmmeXHW7vNaC1LBnx+jfVcso6iZPrw8gvq+m4WUCppsFE8Fi+jriSMj3m4tcqdSEOmoQXPSLnvKckpZ5cAwFBGYa4AaKA4iyrc4ECqKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077561; c=relaxed/simple;
	bh=BxdXf/m/Kyw4lL+Qsi5LqoiFjK21NIuFP/MsQJ3LfaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTrS6T5Zkc2RhzsQ81L0B0zUgeZ9Hk/W3r0TDfHyrjn/8hIlfEAb0R9Nc5PLppsbQuoYUXg0BXDsyN6C7jwzwlikhXG/slMthbEXHwPaPEb8hNZoMarBdXBY+PRntEFnLUS/AhndUz20lTShAIo3/IVL/uEtff7xvetqJ5uikS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEg+1ohE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEg+1ohE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769077559; x=1800613559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BxdXf/m/Kyw4lL+Qsi5LqoiFjK21NIuFP/MsQJ3LfaE=;
  b=dEg+1ohEq65dkeAP+gW/PMGbsVGXghF0PmhLb9jBxpntYlhv0+C7M0T4
   B5ZnsgghxZ7HcvtdHnSqrOCp7TIxHAalayiPb7ZHZRlHMR4f1+Fs9TyiV
   6cDjgqISc8Q58On11oXe7kN4wM2RIngBNw5K+Ma2jlVOwl780ByBFv7S6
   YgmkYkEK/x7DK2AL6VyOWSmInWyuBZbcjIgCPIPgQlvgI4o2dg08p9nHS
   9VLYcldNtzus4QmOIP5JovnXqaAiNdYhi1tdDiMBzQjUhwlWG7yS9uRmO
   MHL+9Nq+6S9OYeSxOcJQjOAByvhdFUhBADsxeWG0GcBDm/e+pd+v9LnTl
   Q==;
X-CSE-ConnectionGUID: QZ75fmt9ROONtmeiAbsZqw==
X-CSE-MsgGUID: 5F71npV/T42yRv8uc5dxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80940772"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="80940772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:25:55 -0800
X-CSE-ConnectionGUID: OnBRMG/jQBa5BKLU44gMKg==
X-CSE-MsgGUID: /IMi3/1UTJyykyXhNupayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207130743"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 02:25:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1virst-00000000Siv-2Sva;
	Thu, 22 Jan 2026 10:25:51 +0000
Date: Thu, 22 Jan 2026 18:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of
 cs35l56_set_fw_suffix()
Message-ID: <202601221843.kS9IMZ0E-lkp@intel.com>
References: <20260121132243.1256019-6-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121132243.1256019-6-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-cs-amp-lib-Support-Dell-SSIDExV2-UEFI-variable/20260121-220028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260121132243.1256019-6-rf%40opensource.cirrus.com
patch subject: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
config: arm64-randconfig-003-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221843.kS9IMZ0E-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221843.kS9IMZ0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221843.kS9IMZ0E-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module snd-soc-cs35l56-test uses symbol cs35l56_set_fw_suffix from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
