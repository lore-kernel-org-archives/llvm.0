Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57AF256E;
	Sat, 17 Aug 2024 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723896462; cv=none; b=c0Oh53Y4eO4LBNukv6UWwwCmkVVUdwRqdML4cgxDlEq7fAyW+xbxWeku9xEWRG1cJVLJEtYMIYWQS+Q1SdEea4YFBNOEnm1ZGC33fv2gT9ihvJw8K+guNHYjsLDqy6ZLDHTRej7IFvuwKdjJYmiPK+vI4GVOFOtsVY+Wt0flWB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723896462; c=relaxed/simple;
	bh=0E4qHRWxQycgZwCCTQdnYUaH2mCgBlnpZ8yLGUOGW58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icrzmfePdAnaq9Zy9C4M+HbUmdnIBCD8QMgp4zYOt7eVfvBGymuYqA0UQPLyf9udON29jqTr7qvWjG6jVjwEHRD+hXYiVhjK7uAp5gOi32lkHWJBr4V74Jqn4JDukyBZUjV82QkYAvqwmqIy+loHZ/M35/ng1gg8leftSdNVoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUyFU02l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUyFU02l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723896460; x=1755432460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0E4qHRWxQycgZwCCTQdnYUaH2mCgBlnpZ8yLGUOGW58=;
  b=VUyFU02l5mhrBLPpDlEvyQ3pVPpU/FBX0noYeU03srMAtCiikOBG2Rg8
   znSJWmXTzSclV7GlSOxk4laRxN2O639KHMFeXw7KDIqXBlQWu824ekJBC
   v4DR84P8pbTsD1LHGYC28URXTLBj8Xd/fiLr3dob0AmgBLcM921UsZCLz
   obnF8oVVrqg/IUix5NnyigXLF6AF3kNXA2mr2NPArBMgIsLdnxddtrgV/
   /2FmRd1pPlEaDyyk8gKqKrIoJFXEZVEPvQvWWB0fhqberVmyTXvAhBQgt
   V89hdaq4s4IjR2lXiJPc2jam+WP5n/Br7C1+gn6RrCf1fV7gWRRMVqV4V
   Q==;
X-CSE-ConnectionGUID: ow4he/J/S++HOto+BR33TA==
X-CSE-MsgGUID: 6vj0c77ARI+s4/NoRRHeNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="21730411"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="21730411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 05:07:39 -0700
X-CSE-ConnectionGUID: 0OUhR4qTSy61wGP3AQLQCQ==
X-CSE-MsgGUID: jjuNWhtkQP2hsLtQooMZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="60090562"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2024 05:07:35 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfIDV-0007QC-0A;
	Sat, 17 Aug 2024 12:07:33 +0000
Date: Sat, 17 Aug 2024 20:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
	airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
Message-ID: <202408171913.L3jTjYJX-lkp@intel.com>
References: <20240816125408.310253-84-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-84-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-fbdev-helper-Move-color-mode-lookup-into-4CC-format-helper/20240816-210651
base:   70d6d55dea574b7b78ccf714699cc5d8d62fcc2c
patch link:    https://lore.kernel.org/r/20240816125408.310253-84-tzimmermann%40suse.de
patch subject: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408171913.L3jTjYJX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171913.L3jTjYJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171913.L3jTjYJX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device.c:6:
   In file included from drivers/gpu/drm/xe/xe_device.h:9:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_device.c:20:10: fatal error: 'intel_fbdev.h' file not found
      20 | #include "intel_fbdev.h"
         |          ^~~~~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +20 drivers/gpu/drm/xe/xe_device.c

    19	
  > 20	#include "intel_fbdev.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
