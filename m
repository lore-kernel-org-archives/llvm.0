Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B301F152C;
	Thu, 13 Mar 2025 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866472; cv=none; b=ZNagS2Q/kYB0t5b6MI+9OHZanrqtgjPbrURbjrZ+gZ0XWvSx6JTDPviE42t2ZfG6HHzpuslz1l3qOEqPGwwx8Q/McSvVdR6VcDjS5CvDQNL8mGsogwQAOwPt/wDbtCxGDSpzuGixI/CGFVrVqGHHH3ZpLkk9C9MA2GTfyS8PJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866472; c=relaxed/simple;
	bh=Ucd9FDOg8VD+LIrLONSQCUwGVRYNLI0XlCV26ewHSg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfF2uK+VuJBEjZY9jSrtWMQdoQ6uoGpoxAgA7pSAU/QUiwkek22v+lIahxg/9uouI2hl63Oq31jag94V4aSekjd2UK1nAa5KnZ6DOUjgRCioXGTIK1k183tlVsh7YBSlM7GXYJDvmuffMJOZmmXp7X+g0bIH7cz8qDWoE4I7BY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5q6w5f2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5q6w5f2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741866470; x=1773402470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ucd9FDOg8VD+LIrLONSQCUwGVRYNLI0XlCV26ewHSg4=;
  b=k5q6w5f2O1X4IB24xPRL3P1SwvCvVXltF37av5E/Hnymc2HMGDjc4LrK
   PqdVv4LqlRkfLrxTbTitofkYK3dud4LIkZgwK1UTIXQSLtQjWBo6HLPvu
   uPoKtk5rnVdnVj9sMDmWMkNHvrp4wfEHDEmr5ZL7uzR5ruAmkl7noQW3b
   U1RvRkO7r6lw27Jk4dUjAPF6qJaAb9Da9I97/wM2A3m4T/fCshqXuiPLk
   4FgbmhDjLAfPbo4GEpad2n474fY27XM8bf0xKya3aX2FVIAAZIJrKxcI9
   wk+CKAIBzvgZfNkvxqNANJaTys1a9jusUr9af9iKnBMopkz/6HgIkRpgv
   A==;
X-CSE-ConnectionGUID: S10IelHHQ4eiA70ZBodFvg==
X-CSE-MsgGUID: 6qJuxK0GQxOCD1ewrD57Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53625555"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="53625555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 04:47:50 -0700
X-CSE-ConnectionGUID: 6IYZF1a9SH++iSN4zLIYIg==
X-CSE-MsgGUID: fYKGttlEQ4y2tETGt7IY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121428236"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Mar 2025 04:47:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsh2I-0009Ma-35;
	Thu, 13 Mar 2025 11:47:40 +0000
Date: Thu, 13 Mar 2025 19:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] drivers/misc: add silex multipk driver
Message-ID: <202503131951.mXFrHhEv-lkp@intel.com>
References: <20250312095421.1839220-1-nipun.gupta@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312095421.1839220-1-nipun.gupta@amd.com>

Hi Nipun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus robh/for-next soc/for-next linus/master v6.14-rc6 next-20250313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nipun-Gupta/dt-bindings-add-device-tree-binding-for-silex-multipk/20250312-175851
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250312095421.1839220-1-nipun.gupta%40amd.com
patch subject: [RFC PATCH 1/2] drivers/misc: add silex multipk driver
config: x86_64-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131951.mXFrHhEv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131951.mXFrHhEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131951.mXFrHhEv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/misc/silex_mpk.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/misc/silex_mpk.h] Error 1 shuffle=3739512866
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1365: headers] Error 2 shuffle=3739512866
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3739512866
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3739512866
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
