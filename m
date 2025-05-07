Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AC820D51E;
	Wed,  7 May 2025 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618813; cv=none; b=Uoq4uIBqzrQ5rZudgRlW+Ly9N1MTV4MwQ79UsXtSZqV21LRQh5NOszB2d5+sN729py+WTMIOl0lnVv5luppA00DoTUaeWPaLL01Xaz69nT6Ej1NV+n+eETzsAGnrwVolwGhSnqwZLy63CEBxBdJJ87lnuei81+sv62R1tUGiYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618813; c=relaxed/simple;
	bh=72Scb1V0hycsXKAsGR/ifXYu2GLLvEtvC8pJoVQX4Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPubLWfX2Vk7dCbGaXsSWZetyNVdl1PH/sqmwobQRaaPuzgYOEqnbT2n7Nj7/HSEvry7LkSOHiqPvb4/xd7hvdJdWKKg/oFLXtfUkuMRW2y5NDexWxy8zX7n7bZKmsV9qcmSqcukz/6JCjzFwQj23JbV58AEPk1kiO/Qg2oTR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9bCLrVa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9bCLrVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746618812; x=1778154812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72Scb1V0hycsXKAsGR/ifXYu2GLLvEtvC8pJoVQX4Zo=;
  b=X9bCLrVaCEUoWxEmuawXzMYgtXljye6KTmlAw+zjgBK6dpYL/u0pUKMW
   fgkguzz3y5W2orZ7cRY4lkYie4Ueitdzh2t2I8iG/c20aRxwghs9az+qg
   XB73ldASnmfyM0dZENYxbomxiPUayQs2O5H74cAvleWTTFOUgN9ivhvm8
   1rnp+M8SmLk/YAiZf48lqGozCVBBRtjxOWfC8HoyFWk6hrhswlOtja6hf
   FwqMSXjvqGrdYajPcEY1imNfhMlWtFB1Rcp1NqYfL21Z9MDCyqgG58JAb
   wGyffljPkVEz6pEwAA/njaOnVXLVzQsPIHYeWyWWLaAYoyH1krsbc8tNQ
   Q==;
X-CSE-ConnectionGUID: +1T+Z1QPQlijZRSYhGyVRA==
X-CSE-MsgGUID: BgClpzG8SHujIa+aqrTpfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59332538"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59332538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:53:31 -0700
X-CSE-ConnectionGUID: LhlCLecGS0Kjox3SYmsO2w==
X-CSE-MsgGUID: pWiazrmQTcC6g3fF7eWhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135898621"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 04:53:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdL4-0007il-1W;
	Wed, 07 May 2025 11:53:26 +0000
Date: Wed, 7 May 2025 19:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, npiggin@gmail.com,
	naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 3/6] powerpc/perf:make isa207_pmu_format_group struct
 static
Message-ID: <202505071909.iZZsdCTI-lkp@intel.com>
References: <20250422131040.374427-4-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422131040.374427-4-maddy@linux.ibm.com>

Hi Madhavan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes powerpc/topic/ppc-kvm linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-kvm-Fix-sparse-warning/20250422-211309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250422131040.374427-4-maddy%40linux.ibm.com
patch subject: [PATCH 3/6] powerpc/perf:make isa207_pmu_format_group struct static
config: powerpc64-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250507/202505071909.iZZsdCTI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071909.iZZsdCTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071909.iZZsdCTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/perf/isa207-common.c:40:37: warning: unused variable 'isa207_pmu_format_group' [-Wunused-const-variable]
      40 | static const struct attribute_group isa207_pmu_format_group = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/isa207_pmu_format_group +40 arch/powerpc/perf/isa207-common.c

    39	
  > 40	static const struct attribute_group isa207_pmu_format_group = {
    41		.name = "format",
    42		.attrs = isa207_pmu_format_attr,
    43	};
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
