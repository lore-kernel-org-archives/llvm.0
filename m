Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A61D5893;
	Wed,  4 Sep 2024 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452600; cv=none; b=ZfLYh0y+3o8/sTEaJFogzpKkhI5G+tNdDAQZzuNPOL7Tkzqa0smCmLu54rVeXg7RrBqMKXci/Wqn014Sy/SOhkyY/7AoiLTf/H05CfFXIP7yqmXLd12izDGE/h/vkuUg2H8P6WyUeoDe+RSDojb+k6qKn0x0t1Uj4SnfjS9hh8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452600; c=relaxed/simple;
	bh=Jdu2kz9W5Sjyd/IOxvSp/1ivt7ICOhga1XjdHhtwc5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reypwXwePpd8Ayi5wo6rVmLCSUVcij3vW6/IWKjMA+18eDxUVGxkuiFgX+GQKJxPUJ5R3a+XOI6Xt0poS1nUp8Oql+G1USpO9LGfnQl7SpiYoVNkATd5eG6OyxWIAuf8DcxtSQH0/rvSjFUGsesaZN6qh2fOzg2fIPc9UcxsjNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1Yie3nH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1Yie3nH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725452599; x=1756988599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jdu2kz9W5Sjyd/IOxvSp/1ivt7ICOhga1XjdHhtwc5A=;
  b=C1Yie3nHVeq8As71ezLjO01rDLob+5uzudjYQmas3KsRuCKru6ZFmluY
   UCz/OmQzBhMiaf/hl/D7IL+fMxbhySrUkp+2jQnUhcqeI7FSpaLU8Zzhe
   uLR1yJILdX4S4EP1fckqDiqYEiq9jIOGYeCEb8wi4MOIGqa4WMlAXQn6F
   RaIQiFMLjf32wv8sB2w+5GCSU58MsDIm1VuAsQ+NOtbTX/2H8p8681JIP
   CLuYkWanBauEvfQ435TkjBrU6GfAhzJDYPbaDiuZ6DSASPWZg02o7AbZS
   eL/jJo087UN/elZ9LuzEShcG+H3rUtqfXdNyEy+mNqaZHyCaFjhrcxdj1
   Q==;
X-CSE-ConnectionGUID: 0JS0niQBQ2qXT8WYeID1GQ==
X-CSE-MsgGUID: HFY/lWM6REW1VflMz76glA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27871263"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27871263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:23:16 -0700
X-CSE-ConnectionGUID: 6WFrrxHWTpiP7iEwkrMlIw==
X-CSE-MsgGUID: 6e8to1QPS3y+7a9d51XnMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65493956"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2024 05:23:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slp2W-00082D-2v;
	Wed, 04 Sep 2024 12:23:12 +0000
Date: Wed, 4 Sep 2024 20:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com
Subject: Re: [PATCH 2/4] drm/i915/display: add intel_display_snapshot
 abstraction
Message-ID: <202409042040.doh7ZTmu-lkp@intel.com>
References: <f2cc41111504e062c3ecb287daee6967078b73cc.1725372032.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2cc41111504e062c3ecb287daee6967078b73cc.1725372032.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20240904]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-dump-display-parameters-captured-in-error-state-not-current/20240903-220614
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/f2cc41111504e062c3ecb287daee6967078b73cc.1725372032.git.jani.nikula%40intel.com
patch subject: [PATCH 2/4] drm/i915/display: add intel_display_snapshot abstraction
config: i386-buildonly-randconfig-003-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042040.doh7ZTmu-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042040.doh7ZTmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042040.doh7ZTmu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
>> ERROR: modpost: "intel_overlay_snapshot_capture" [drivers/gpu/drm/i915/i915.ko] undefined!
>> ERROR: modpost: "intel_overlay_snapshot_print" [drivers/gpu/drm/i915/i915.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
