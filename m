Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110932857E9;
	Tue, 16 Sep 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011981; cv=none; b=Rb3SsiPOB9hps/ZkZwNvn0F0ZJJlFfMp1jBBhOvq2CAfSwRzBhEalLTF+Mr/dj0vXOLovLjd4pgqc1fBZVEtfiKtckfEPKq+ECwRA/M8MVF0usimyDPKwKeeZ+EApobz+SYzc5iwvSAnPw+GHeRDVtqwUrw97wObpgzw87lZW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011981; c=relaxed/simple;
	bh=x/T8FHXn2TbergbNAp8wb5//5w63nsshgf0lP7yMhHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpjRunbimHPxQbeVAmRz93rau12gYdDqnF7wc3F2l/GGASmQurBESikP2ayNJrMyjN0PWtyF8TjdqBs0WEg8i7Nl66FsX0Yxx/RgdMB9AEA7iR3qzaMZzk2+Nc5C8LnPFXd134ivpU5pf/RjnHIo1k0W5z2hc4xAUeg7xpsw9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OH6epE6F; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH6epE6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758011980; x=1789547980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x/T8FHXn2TbergbNAp8wb5//5w63nsshgf0lP7yMhHw=;
  b=OH6epE6Fs2uwMVTDxhEA4aHVO8ZlZD3TA/UbW7V7GmjZOsPPPaCR+sN4
   SpRxh6O6B7pjCxDQ4VFeLWY8CTHuSLusjMZJfDdri+8muKFhyAmf3Ztbz
   EDhKQelNrhCvOyqaNJ9eEd3RwXB8YmKP3MM9+Y7RPhycltazuM0qT4ujM
   xzn5O3wDEpTssEK9aIsU6KXvn2hc0kMh3p1RaH3D7KY3vv7NUyL4cgzai
   DiyvlXLqqZkfLMST5ItZKSsjVf49HrKwJTa4qYwIVgYMCw6vinQUeTBbj
   txTgrncopTEigrDpi6j5vQ3Hkbk8lO8BXwo8aPy12ssuGBrsRBeb09ibZ
   g==;
X-CSE-ConnectionGUID: BMOmi2wsQYO1UMWov3zNiw==
X-CSE-MsgGUID: rsW8LJDTR8ywu6Y7tbAGjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64090447"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64090447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:39:37 -0700
X-CSE-ConnectionGUID: TlrDqbZRQl2huCeVvk7Dgw==
X-CSE-MsgGUID: ZeUts3fRQai9XjWWnPcx+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="180130050"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2025 01:39:36 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyRDp-00006t-2x;
	Tue, 16 Sep 2025 08:39:33 +0000
Date: Tue, 16 Sep 2025 16:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: nicolas.ferre@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ARM: at91: remove default values for PMC_PLL_ACR
Message-ID: <202509161641.t9H0tP59-lkp@intel.com>
References: <20250915143345.18998-1-nicolas.ferre@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915143345.18998-1-nicolas.ferre@microchip.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on abelloni/rtc-next cbeznea/tests linus/master v6.17-rc6]
[cannot apply to next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/nicolas-ferre-microchip-com/ARM-at91-remove-default-values-for-PMC_PLL_ACR/20250915-223911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250915143345.18998-1-nicolas.ferre%40microchip.com
patch subject: [PATCH 2/2] ARM: at91: remove default values for PMC_PLL_ACR
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250916/202509161641.t9H0tP59-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161641.t9H0tP59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161641.t9H0tP59-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: AT91_PMC_PLL_ACR_DEFAULT_PLLA
   >>> referenced by pm_suspend.S:1181 (arch/arm/mach-at91/pm_suspend.S:1181)
   >>>               arch/arm/mach-at91/pm_suspend.o:(.text+0xa70) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
