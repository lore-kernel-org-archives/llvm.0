Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F38D1DDA31;
	Mon, 23 Jun 2025 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705508; cv=none; b=gWyLYbDeLuiNXcNWbHFe6EzdjVkSfYSgMmwK8XVvswHs/6VprzCci7D9fmSVkLhQT4iNzTUa3Y/QN/+SS6gZfv3WfnGyg3TlNKxTFTCHyDZE2aq3FQBuLlJZ8kxnzVtETKlLearvPD92sNqJQOd80MSBryRyLTpFVPftFjWuwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705508; c=relaxed/simple;
	bh=oh4ffYYNVmm3CEGxInh1CEFlZuucFUAV7yIy+afI8Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLZnsaMhnMoqDsU8xG5wd1rKeSeuQualwrVXUTAZhBCxRc7FAbDnq5BJwDxFx1cXzssTkdUI4HV0qXJHUYwfK3Spi2gZlJ86wkHG4SJr4ZwKxm6bL8pBTzGlSKZB6WoGITMfvRxyHdhBfWAoXxep68nQWFndaYcPFSVM+N2Bj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYTMis9g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYTMis9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750705504; x=1782241504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oh4ffYYNVmm3CEGxInh1CEFlZuucFUAV7yIy+afI8Gk=;
  b=NYTMis9gTB7gx35JDS9uQLufBX0BjbUQFKU8M/MoFUKgG7M/P6vktTXu
   Xe/PknzzrKVSyZFgwz74qEECedi9SqukVTB0PwYdUH1CFXIVG/hd+uXJb
   f4w5NCgnq/p35pwaFjvhhxfkhuvZ9ekihzWR0mKCLhBCRYkbFKSigxU8g
   XoAr+32Damsb5G4ft2NP+bSHN6aQi2nELMpsukYsGsV2MQ1UPhLjToYEd
   4s/Oub62I7Xtg7utC4Y9rH8R5bRiX3gCdJLsmsxnej6PifKGYKjRYq1ql
   k1YVbti2NAygMkphNxnwbRqzfmfIbdh0uC8tZsEp2dn8eIsu6S/oSV6h3
   w==;
X-CSE-ConnectionGUID: ZM6eD+UuSVagiu9iPh2v7A==
X-CSE-MsgGUID: bKVIwrWVQryKH19BTi5k+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55562726"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="55562726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 12:05:03 -0700
X-CSE-ConnectionGUID: aUnyq6E9RsqoBoZoA141bQ==
X-CSE-MsgGUID: aUAdyMmCRS+/K4fcKIViIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="155978161"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2025 12:05:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTmTT-000PEw-0F;
	Mon, 23 Jun 2025 19:04:59 +0000
Date: Tue, 24 Jun 2025 03:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [CI 3/6] drm/xe/pcode: add struct drm_device based interface
Message-ID: <202506240230.pGzee52h-lkp@intel.com>
References: <eeaa9cc8438caab2e22f9cb2142fbc18cc0fd861.1750678991.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeaa9cc8438caab2e22f9cb2142fbc18cc0fd861.1750678991.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250623]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-pcode-drop-fast-wait-from-snb_pcode_write_timeout/20250623-194523
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/eeaa9cc8438caab2e22f9cb2142fbc18cc0fd861.1750678991.git.jani.nikula%40intel.com
patch subject: [CI 3/6] drm/xe/pcode: add struct drm_device based interface
config: x86_64-buildonly-randconfig-001-20250623 (https://download.01.org/0day-ci/archive/20250624/202506240230.pGzee52h-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240230.pGzee52h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240230.pGzee52h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: intel_pcode_read
   >>> defined at intel_pcode.c:281 (drivers/gpu/drm/i915/intel_pcode.c:281)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(intel_pcode_read) in archive vmlinux.a
   >>> defined at xe_device.h:60 (drivers/gpu/drm/xe/xe_device.h:60)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x808) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_intel_pcode_read
   >>> defined at intel_pcode.c:273 (drivers/gpu/drm/i915/intel_pcode.c:273)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(__cfi_intel_pcode_read) in archive vmlinux.a
   >>> defined at xe_pcode.c:336 (drivers/gpu/drm/xe/xe_pcode.c:336)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x800) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: intel_pcode_write_timeout
   >>> defined at intel_pcode.c:288 (drivers/gpu/drm/i915/intel_pcode.c:288)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(intel_pcode_write_timeout) in archive vmlinux.a
   >>> defined at xe_device.h:60 (drivers/gpu/drm/xe/xe_device.h:60)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x828) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_intel_pcode_write_timeout
   >>> defined at intel_pcode.c:281 (drivers/gpu/drm/i915/intel_pcode.c:281)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(__cfi_intel_pcode_write_timeout) in archive vmlinux.a
   >>> defined at xe_pcode.c:346 (drivers/gpu/drm/xe/xe_pcode.c:346)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x820) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: intel_pcode_request
   >>> defined at intel_pcode.c:296 (drivers/gpu/drm/i915/intel_pcode.c:296)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(intel_pcode_request) in archive vmlinux.a
   >>> defined at xe_device.h:60 (drivers/gpu/drm/xe/xe_device.h:60)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x848) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_intel_pcode_request
   >>> defined at intel_pcode.c:288 (drivers/gpu/drm/i915/intel_pcode.c:288)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(__cfi_intel_pcode_request) in archive vmlinux.a
   >>> defined at xe_pcode.c:354 (drivers/gpu/drm/xe/xe_pcode.c:354)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x840) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
