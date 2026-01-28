Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AC338599;
	Wed, 28 Jan 2026 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599475; cv=none; b=mZtir4CK3KIuR55+yUDLswQkwT5BZ5TOucSywXJHMmgPx+oXXncNOGX22SSYmcPwm6GP0WE2rDp4kZtgaFQMcu6+i91tCybufSXBIqvaayuyT/qixH0R7idXQ7Se+A3+7EJixQJA1+KihBShiK9cqQckOhN2Nfj9/+tlrp74Iho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599475; c=relaxed/simple;
	bh=gIfEkEkmsmiXZClBNNjGinmrbInHh+IuqVzN3DPLhiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlnU5e62tVHOb7RqSQyr8VYDaWTY2gRdK98+mCt8ayli/qkVbFCpjhGOK2GFgtculmH31ZtQbhE/SVbzgNZ9k+o2QMewR1MwOyOOwR5myNfU356v86Oa/fwUTZEpkoIiMShCEWzJLQwZdAjrYQXQKWKzmS08MCFHOtU/YqoIFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVmJRtst; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVmJRtst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769599474; x=1801135474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIfEkEkmsmiXZClBNNjGinmrbInHh+IuqVzN3DPLhiQ=;
  b=JVmJRtst0H2OKPOo5BrjVIPAXCITuRW0aT/8BFP+7keY2t29XrOLh3q1
   V1MN4wXtHrcIXJl/+C/ECqZWuZXpUdezuTTDFnkQtixZTQF4UDZWDR+jQ
   +y+rlo0DP5ew2Az2JCRRaN4gFD+WWgAvo+Hb1X9An5ABn9xQ3g81Qrd5K
   iU98SNw7aBOhk4L/uEfa82O7Bs0muR2+J1oPUgfE2vNOfiYIIUEwbcMAF
   lVup8KGSgGLU2ECLVqKyUhVr4c5pGduyJYED0e3JlXVqp0spuHLvnTF5z
   bLrqVBMxhqL9LsrFRj1GrAXSsX1hDNXnsU7V8j9ypBw+UPuMOLmJC3Diq
   g==;
X-CSE-ConnectionGUID: /u5850TdSW2Wxo7e6Il4nQ==
X-CSE-MsgGUID: Yq4mU1K+S72K8OFhjW0MEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93466419"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="93466419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 03:24:33 -0800
X-CSE-ConnectionGUID: ZaSl7l3TTKGQKc3Q6aaSzg==
X-CSE-MsgGUID: U0c3EI0YTkujuqRG2m5MBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="239494023"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2026 03:24:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl3ev-00000000Zbg-3UpX;
	Wed, 28 Jan 2026 11:24:29 +0000
Date: Wed, 28 Jan 2026 19:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 02/11] drm/gpusvm: Use dma-map IOVA alloc, link,
 and sync API in GPU SVM
Message-ID: <202601281942.mPKchFLW-lkp@intel.com>
References: <20260128004841.2436896-3-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128004841.2436896-3-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-tip/drm-tip next-20260127]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-pagemap-Add-helper-to-access-zone_device_data/20260128-085843
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260128004841.2436896-3-matthew.brost%40intel.com
patch subject: [RFC PATCH v3 02/11] drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
config: i386-buildonly-randconfig-004-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281942.mPKchFLW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281942.mPKchFLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281942.mPKchFLW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_287 marked "dontcall-error": BUILD_BUG failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
