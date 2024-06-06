Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329682E639;
	Thu,  6 Jun 2024 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717670946; cv=none; b=SNK7ss/ZtgOaKgQM9kwD/uG9B8NQjOjK1i1Dp/2LzoUpDKhitJpsUEG1e+OXLxSzww52vDNy08Cq7Rz46FiNt4Q16OGcMmggG/+Qk4OmZ6wCQchk4+2mFtmbAtWFXjjVehFuewgft+SuAYGvgIfe8v1WYeRuqY3IQkOUOkZXkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717670946; c=relaxed/simple;
	bh=0Ik9IHA30dbpyjCuVFkRunHddok3/QXHaB1yZ6glyCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktFTxw/ieB+wTtQpnXuUO3nCJilRnXHeHLAgrvugjYXUMklyX3KZggvv+hgwmmC8+sW00OMNAgau+KFb1AZ1XozjrH3KjjYAtP4p5Ye6qtQKAH30oHnGVoGdAWGy6aQF0pocApYsyMa+bx+iL4mhVXCzA58/ujVZI2GsyMFFcV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXELZb/4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXELZb/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717670944; x=1749206944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Ik9IHA30dbpyjCuVFkRunHddok3/QXHaB1yZ6glyCs=;
  b=IXELZb/48PTW1Q5IRtv06i4IUWZhZQpRne79C80mxLyhAxZZOL5Jp9ff
   fRoF6VMXzPEkhg2w3xlM/TXubqwouYNVb1kXgUh/mfIteeA6Gl/wZOVlI
   KEHj+eMVbwv1o4aV38bMSty32qB8xhSQ6VT/DaXBblNPJlVwj1fs3X1IG
   W6/x8JB/xfEBRHZaSxkImjOnkG+U6znrY+vb8Rmy8XrzhIDxs9ySI1aaE
   RrIh7iMJvMIRPToOZ+kCQJPAOvDgkN61BlmbrKjt3jFM2yzyiO3NgDniU
   VsytwH9xONG917Wn9n+Ek3Y6fNWUV+pHPLtNZ5cbEI70/XIOCSQijpGIb
   A==;
X-CSE-ConnectionGUID: VvQ587kDTBakpxS+BlXYbQ==
X-CSE-MsgGUID: kKxveBThQ66zYich5qCWWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25728109"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25728109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 03:49:03 -0700
X-CSE-ConnectionGUID: DJWkUU2PRdutNzRpsdzi6A==
X-CSE-MsgGUID: ivawZ1bhSKqf+/sWXHL5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42388895"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2024 03:49:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFAg0-00031g-1n;
	Thu, 06 Jun 2024 10:49:00 +0000
Date: Thu, 6 Jun 2024 18:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 1/3] platform/x86/intel/sdsi: Add ioctl SPDM transport
Message-ID: <202406061832.LY1udPGK-lkp@intel.com>
References: <20240606011617.557264-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606011617.557264-1-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on c3f38fa61af77b49866b006939479069cd451173]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/tools-arch-x86-intel_sdsi-Rework-Makefile/20240606-091801
base:   c3f38fa61af77b49866b006939479069cd451173
patch link:    https://lore.kernel.org/r/20240606011617.557264-1-david.e.box%40linux.intel.com
patch subject: [PATCH V3 1/3] platform/x86/intel/sdsi: Add ioctl SPDM transport
config: i386-buildonly-randconfig-003-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061832.LY1udPGK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061832.LY1udPGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061832.LY1udPGK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/intel_sdsi.h:13:10: fatal error: 'linux/sizes.h' file not found
      13 | #include <linux/sizes.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
