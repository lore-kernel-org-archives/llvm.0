Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210920E6E8;
	Thu, 12 Dec 2024 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998715; cv=none; b=tDJd0Hru5MT1aT46SqYA37rF/XWGsZqqhxq25mkGbeKBLUBjyXa/JrvoEr8rselkP8cl4Ni2jA46ew0U9J9pj5WAX4wKOBpEs9diARjZZVxq9MO6E/nCVw10N3jZ5uABB4o9jRHQibgxsm6FGWsQiEI/h4MoaQitsYUDXwNKuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998715; c=relaxed/simple;
	bh=FjuuzfzNMu01EF+jfJ9izyVgRWwg2v9gh8hjBXrYgp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljVvneMhJEzKLGom/awQRt27pOWAQM+qGMT77e8QCMDRx8eHa9r5C3apuLc5xNBnMUX90Ye185CP/YhQ8x3JeMmOKYIICZqYJOg/4yDMEL6H6cWwIPZHSDflOJeFOgRiLGuCa2lXPbgGQf5qP5p0gKsu/NT0DJ+h1IIphugOg6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCM5om0j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCM5om0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733998714; x=1765534714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FjuuzfzNMu01EF+jfJ9izyVgRWwg2v9gh8hjBXrYgp0=;
  b=iCM5om0jbK3050PZOnZ9vC93jCx3BTbxKiTdfgxVkT36h3+r06FulR/5
   hV/t1nu10VaNaTtRgSOkcNzaz8uDSSgs0OnivomYk8Sy32SThbnegFzWT
   rsdvks/SoXdZWEnOBX3XdtmqXSiVpxdbjtuOV85F7BFi2EwpI5IQri25Y
   wMc7pRJunl4fuHnzQUOWBgg0bth7RMKyc5msqSRnfR4XzvEVaFZ4wRw2X
   +gV6+2AbxeHRrv6BCTZE1n1ZlTSC5yHz+zjDtZ0FRNDHs68Gst3uiPcR6
   NIT5pvnefjPTuTerEG8Rgx9vren/ONhK2vC/zXsrxFeHYKx2Sl8WUK62Z
   Q==;
X-CSE-ConnectionGUID: HoZuAhsNTQe8xOEWf9J5AQ==
X-CSE-MsgGUID: 7DFSsJkmRjiOdNN5ecKazQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34135090"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34135090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 02:18:32 -0800
X-CSE-ConnectionGUID: WyigCFPBTiaAqJSxl1GARg==
X-CSE-MsgGUID: YJ+5P5JLSaOYPXBTbKtkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96984938"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 02:18:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLgH5-0007iT-1g;
	Thu, 12 Dec 2024 10:18:27 +0000
Date: Thu, 12 Dec 2024 18:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/10] drm/i915/histogram: Add support for histogram
Message-ID: <202412121843.XSGtBYyD-lkp@intel.com>
References: <20241209162504.2146697-5-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209162504.2146697-5-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc2 next-20241212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-crtc-Add-histogram-properties/20241210-003717
base:   linus/master
patch link:    https://lore.kernel.org/r/20241209162504.2146697-5-arun.r.murthy%40intel.com
patch subject: [PATCH 04/10] drm/i915/histogram: Add support for histogram
config: i386-buildonly-randconfig-005-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121843.XSGtBYyD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121843.XSGtBYyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121843.XSGtBYyD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/i915/i915.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
