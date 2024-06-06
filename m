Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C5413C8E0;
	Thu,  6 Jun 2024 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717711837; cv=none; b=gjAIuGI3eHlehdhLUDCRAmSWyauEq6R7+Gswyz2g0uYByxYUq7XtrA8MX0bA/60/Tj+yOrZsgjoX7wFRhwplU8zoFD29se0q7KSq+m0jFBjp/NTAbImortgxbifZtGXOoipKbZW15hCMEukCoRSBf1WmgwQr/t+27s87Yhj2hcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717711837; c=relaxed/simple;
	bh=PMhKFVZSaMbvLkqpk7BfxQD1Pb6Zjy3rMEeEuR9p7fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAbwxZ69beHjXoVG48U0CUK7sjgYpSlydmSwlkOZmnfYT37D2NUIymhdvfIpGLulc6HvqpwjX+MOf2Xg6vWHzip5NxKtyn33MHSa2R5o0P5nwH1lNmLqQf4Sl1xMKLCNWCJ2th6fbiW/Pta8wms1CaoXK2OzitKHdK/pjNh7x60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njkqUULt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njkqUULt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717711835; x=1749247835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PMhKFVZSaMbvLkqpk7BfxQD1Pb6Zjy3rMEeEuR9p7fk=;
  b=njkqUULt33p4Fm8KqKqoaj17lK0vwhU2cF3KhbNgNjzR/cz/gB1TLaeA
   6tt2Dm9sl6hbcZmtgMnoMI40s+xU1fcC5xfHljByg2CWPTGGKaZ9yb4T2
   5cCVxy3tYU9qUuOcKm98o0z7JtToNz5PV6a+qBmh1b8Vlp26Cy5DRpZVn
   wNkQjQGOgHr3NLzFpSVZC0PtV3+kpylpAj811yfKioVahrT3PAs7k93i1
   vnFVT3Mz2HOm5Ihphg2nztC50URh/jqm9MpL6jv8Xo+vaSJZLsBKnkial
   ns89dFAWrm+la6ZTohdJZZI/d804/62J76gWJ7lquaTeNdaaJMiYLW2Bn
   w==;
X-CSE-ConnectionGUID: BgoT0ixJRFafFWplqOZR3Q==
X-CSE-MsgGUID: 6w20Kt4ISLGzkcSfniy/mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14638428"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14638428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 15:10:34 -0700
X-CSE-ConnectionGUID: X22tVJAzQVy8HprLnr0eMQ==
X-CSE-MsgGUID: vOEagHS3RiedO254s5cNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38235354"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 15:10:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFLJW-0003mk-02;
	Thu, 06 Jun 2024 22:10:30 +0000
Date: Fri, 7 Jun 2024 06:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	rric@kernel.org, bp@alien8.de, tony.luck@intel.com,
	james.morse@arm.com, mchehab@kernel.org,
	shubhrajyoti.datta@gmail.com
Subject: Re: [PATCH v2] EDAC/synopsys: Fix the injection of the errors
Message-ID: <202406070554.klyVxRJT-lkp@intel.com>
References: <20240603114026.4927-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603114026.4927-1-shubhrajyoti.datta@amd.com>

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc2 next-20240606]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/EDAC-synopsys-Fix-the-injection-of-the-errors/20240603-195015
base:   linus/master
patch link:    https://lore.kernel.org/r/20240603114026.4927-1-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v2] EDAC/synopsys: Fix the injection of the errors
config: arm-randconfig-002-20240607 (https://download.01.org/0day-ci/archive/20240607/202406070554.klyVxRJT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070554.klyVxRJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070554.klyVxRJT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:423:18: warning: result of comparison of constant 34359738368 with expression of type 'ulong' (aka 'unsigned long') is always false [-Wtautological-constant-out-of-range-compare]
           if (linear_addr >= SZ_32G)
               ~~~~~~~~~~~ ^  ~~~~~~
   1 warning generated.


vim +423 drivers/edac/synopsys_edac.c

   409	
   410	#ifdef CONFIG_EDAC_DEBUG
   411	/**
   412	 * zynqmp_get_mem_info - Get the current memory info.
   413	 * @priv:	DDR memory controller private instance data.
   414	 *
   415	 * Return: host interface address.
   416	 */
   417	static ulong zynqmp_get_mem_info(struct synps_edac_priv *priv)
   418	{
   419		ulong hif_addr = 0;
   420		ulong linear_addr;
   421	
   422		linear_addr = priv->poison_addr;
 > 423		if (linear_addr >= SZ_32G)
   424			linear_addr = linear_addr - SZ_32G + SZ_2G;
   425		hif_addr = linear_addr >> 3;
   426		return hif_addr;
   427	}
   428	#endif
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
