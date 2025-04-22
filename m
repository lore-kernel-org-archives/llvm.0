Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF827F4D5;
	Tue, 22 Apr 2025 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329476; cv=none; b=MucylVHFUNAlkY6Jb/p7IazynVT2qCmnZloNDsyAZp5m2jvJgxfLPqLFQPPKzW/YxnG+hAZpkDDZrM1mvwJXEhr4gghdkWwKbkS9DCY08W5I9cmfP9jUtNjjvtCbIiIe4Nz+qXO6250S+7j2QJ5JfDY6yhryQV4tnSu91T1bAJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329476; c=relaxed/simple;
	bh=UIDlYOfG/JBvC7kNn0PuM/TpyZKHVXcrlkpXMYpJYsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkmwCL7zjMPIye8730XCSX8KDFl2nFFpbnE9GEwZpzti2SlQizugvqELhX6hg/ZrQCLADv0yWW/rxLzvBgg2wCTKkwycDOvfVG6xoJJR55rvri0S8LiDb7FOIdn0BzVzGyF+k92+o1npkM4MrzYR4jDp5wN5wHG8kPbLz376r6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O002pLh8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O002pLh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745329474; x=1776865474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIDlYOfG/JBvC7kNn0PuM/TpyZKHVXcrlkpXMYpJYsM=;
  b=O002pLh8km0vD4O0DMUiBNRwcbm9lA97xg87l/LNFOthEKepwGb05W/0
   XcFFcpVnZdrNvTQxI8k0Qq2dpy6yQ1RaNalVfBeNkyANSyTq93PxdBl3q
   vAuJgDwjD/oVW1YdLDh3Q1D4SWtnSZuxedej+sr729TjnvCgRj1kLRL3Q
   JPOI1bwtwKdF7q+j9wM2pCNU29qxswbqrYnZv85wLKQwU2xp0D1IAiYkN
   vVna+6kYFPcBYT0Ee00/Glkg/o+slAi6dWr+mEbcaodBfrFzQZAPomZhI
   3/5xa6BwEoqCZb94WdnJZ4gJlkeE0JkhMHk7427KMRZ1BOwF0T3WEaL3q
   A==;
X-CSE-ConnectionGUID: xvDMfCvqTt2Y3L5YX86yoQ==
X-CSE-MsgGUID: FYn7OIYQSj2ZcSMv9lf4dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69379415"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69379415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 06:44:34 -0700
X-CSE-ConnectionGUID: sP44HQIrSiOViudOp4T2QQ==
X-CSE-MsgGUID: yi1NXYvBSQeLmoW7WkZ8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="169218877"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 06:44:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7DvK-000131-0y;
	Tue, 22 Apr 2025 13:44:30 +0000
Date: Tue, 22 Apr 2025 21:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-22 82/103] sound/soc/soc-dapm.c:981:
 warning: Function parameter or struct member 'dapm' not described in
 'snd_soc_dapm_init_bias_level'
Message-ID: <202504222110.BJ3jQ3V8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-22
head:   f743db58ae26ad957c2beb5f627c328ec8473d30
commit: b0b8854846877361dd5c29f44ce035743fbd471d [82/103] ASoC: soc-dapm: tidyup snd_soc_dapm_init_bias_level()
config: i386-buildonly-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504222110.BJ3jQ3V8-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504222110.BJ3jQ3V8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504222110.BJ3jQ3V8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-dapm.c:981: warning: Function parameter or struct member 'dapm' not described in 'snd_soc_dapm_init_bias_level'
>> sound/soc/soc-dapm.c:981: warning: Excess function parameter 'component' description in 'snd_soc_dapm_init_bias_level'


vim +981 sound/soc/soc-dapm.c

   966	
   967	/**
   968	 * snd_soc_dapm_init_bias_level() - Initialize DAPM bias level
   969	 * @component: The DAPM context to initialize
   970	 * @level: The DAPM level to initialize to
   971	 *
   972	 * This function only sets the driver internal state of the DAPM level and will
   973	 * not modify the state of the device. Hence it should not be used during normal
   974	 * operation, but only to synchronize the internal state to the device state.
   975	 * E.g. during driver probe to set the DAPM level to the one corresponding with
   976	 * the power-on reset state of the device.
   977	 *
   978	 * To change the DAPM state of the device use snd_soc_dapm_set_bias_level().
   979	 */
   980	void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
 > 981	{
   982		dapm->bias_level = level;
   983	}
   984	EXPORT_SYMBOL_GPL(snd_soc_dapm_init_bias_level);
   985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
