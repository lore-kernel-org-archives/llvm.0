Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A46319601;
	Thu, 11 Jun 2026 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213030; cv=none; b=NyHq2xIoT9nxe6BVNP810Gu/uGkYR3NA2NRGNiVNiuKCWZtmRGUO+uIishPDcjmPdyIH2eNR49YmOqmzMhjx9yvcOnk5yLopMg2rj9Ob8tVL2+Stwmsjer23ozLjEuV8Nlog/4zLi8YWKDIhKyP2ZJf6vX2jd8NyTyFWJ7zj2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213030; c=relaxed/simple;
	bh=I7GE2A+upkAU4oZ3P8lcytBJIWKwKKOEuz4CqtmMGYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmQoyjk+f+IcG0rrHQHEG1wGVz+o8YBW8qzZILB1JO1g655t+2Bj0Gkmji6ePo+mh4fw0xFwKzh+WJu3xTlET5yaT8rSp3vRsloxaIztP6fBGHqdVf829N0H+F5fBS47VFy14KV3JXAlbDguXz2UZGAlsz34zmRNAJBMtIWv/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+DQ97sb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+DQ97sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781213028; x=1812749028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I7GE2A+upkAU4oZ3P8lcytBJIWKwKKOEuz4CqtmMGYU=;
  b=V+DQ97sbeo92rKo0Hm/rYHyRySArkECziDJPJiUHR2TEndmlCFWQMVoc
   lFXZ7YPKPdkgM8obKc4DPgKbXMOi7Ot4wckoZY6CrNSAI9+DtXtolmv7o
   BzU7RE1PaASBremKddBU59l0zIuf7UbNQYCr3lXk8SYKOZi/A2PRSOl1I
   EQSYMjxsrMh/z6MHC9frvSfe1+CxSA+Ug3TGayxD8RGGH471X9Pvly9fg
   dlHNg7gFU6X8elvDjNe7kb3ci5YQ4yHVuAjewLCyfj9zGj0xLmliuaW94
   yYCltXkgJ9DDbhRNESBOMOV1RwTisUIAomDCWbWcq8sxz8d9fMGKisz3z
   w==;
X-CSE-ConnectionGUID: 75VtENbDR+KNL/aR3EZ5ew==
X-CSE-MsgGUID: XpW2278LRDSQq50pb2GREA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81885482"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81885482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 14:23:47 -0700
X-CSE-ConnectionGUID: MR8cdogWQfGdyth3Wp8/vQ==
X-CSE-MsgGUID: HfH64ohBQWef0zeLB1+EtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250892962"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 14:23:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXmsJ-00000000NsR-2XhZ;
	Thu, 11 Jun 2026 21:23:43 +0000
Date: Fri, 12 Jun 2026 05:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Yeo <alexyeo362@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
Message-ID: <202606120553.FYqbwN47-lkp@intel.com>
References: <20260610031756.546459-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610031756.546459-1-alexyeo362@gmail.com>

Hi Alex,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc7 next-20260610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Yeo/platform-x86-panasonic-laptop-add-fan-speed-mode-for-newer-models/20260610-112852
base:   linus/master
patch link:    https://lore.kernel.org/r/20260610031756.546459-1-alexyeo362%40gmail.com
patch subject: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed mode for newer models
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260612/202606120553.FYqbwN47-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120553.FYqbwN47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120553.FYqbwN47-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/panasonic-laptop.c:518:2: error: use of undeclared identifier 'status'
     518 |         status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
         |         ^~~~~~
   drivers/platform/x86/panasonic-laptop.c:519:19: error: use of undeclared identifier 'status'; did you mean 'static'?
     519 |         if (ACPI_FAILURE(status))
         |                          ^~~~~~
   drivers/platform/x86/panasonic-laptop.c:521:2: error: use of undeclared identifier 'status'
     521 |         status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
         |         ^~~~~~
   drivers/platform/x86/panasonic-laptop.c:522:19: error: use of undeclared identifier 'status'; did you mean 'static'?
     522 |         if (ACPI_FAILURE(status))
         |                          ^~~~~~
   4 errors generated.


vim +/status +518 drivers/platform/x86/panasonic-laptop.c

   512	
   513	static acpi_status check_fan_mode_present(void)
   514	{
   515		acpi_handle handle;
   516	
   517		/* check if read (CEFM) and set (SEFM) are available */
 > 518		status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
   519		if (ACPI_FAILURE(status))
   520			return -ENOENT;
   521		status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
   522		if (ACPI_FAILURE(status))
   523			return -ENOENT;
   524	
   525		return 0;
   526	}
   527	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
