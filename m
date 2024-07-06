Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237EA927;
	Sat,  6 Jul 2024 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720231824; cv=none; b=W9WL9CnNxZtmjihlssPENemyjvIBVB+DrMnWxrodYF12CFe23cB8eQsLVq/+BTkDebhe0ykYzSDyUrla4wEBvsPz7B1jvlyj48v8CmtEJiQHCobmxnbaBhdtDt7aE06Dm4J0Wg8DsYZeijTGNHYWCP91UkYBkd5YR6JR4P5WMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720231824; c=relaxed/simple;
	bh=y5OYvQ7qoNRRu/fAFV6HRl2+kvQ30bbSzm1awHnw//o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+XKr7NZYwf4ca5C6Hp+YeDjqQ23+prE645d7/VqMcNRI8b/Kr0P9YtE5HIE6JwveGmK0m2470niQRGdTHCAAuAza/e/pvpPzLIo7BRciPbNb/AHUPT0hcT4vUFUA3+Fcz9XNffAGW7iJWGimnpMcdkShXGL1YiAalAyQjZDz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdYWKldN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdYWKldN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720231822; x=1751767822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y5OYvQ7qoNRRu/fAFV6HRl2+kvQ30bbSzm1awHnw//o=;
  b=KdYWKldNIlE0kO2T2sb3IZJ1TBf+RlprG6Huc0/W2n/Jdd7P85DNYled
   xaNmCi0XC8mVmEGijDzBBi1xrz9xMxFTj3Li6CzBIuMEZs6UqTedzmkrK
   EFGgXNiPmLUrnp8Wsg2bUKsFK9ct+aA16WJgoDRuntm/EQh1AeOXXn/d3
   yUxZPV1GtPq7aKB/0XffPkvXNIaTGAisQ+QeseCH2+omNMOibpyyWF3VX
   nhng5rARoO0d5SeWkIrlJEUwEWDZ3tyvV+1dQRnvTOHJkzOhRf/dGE9zd
   I8fnLOa0tiBod4hKXwG4Pa9mfog1q64u8pS3ODbrbxn0tgmV3soNRs82j
   Q==;
X-CSE-ConnectionGUID: IB8RnPZSTymMD1dNshlObA==
X-CSE-MsgGUID: VDhj3oX4QY6qid5speJq5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17648377"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="17648377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 19:10:21 -0700
X-CSE-ConnectionGUID: Ml9y3AEqS7+6VF+aXGLSxA==
X-CSE-MsgGUID: 0N/MBXoHRkGeR6P0qAju8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="47079091"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jul 2024 19:10:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPusU-000TCS-02;
	Sat, 06 Jul 2024 02:10:18 +0000
Date: Sat, 6 Jul 2024 10:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/5] drm/i915/display: Compute the scaler filter
 coefficients
Message-ID: <202407060905.l9gatVXa-lkp@intel.com>
References: <20240705090205.72302-3-nemesa.garg@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705090205.72302-3-nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-Introduce-sharpness-mode-property/20240705-214049
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240705090205.72302-3-nemesa.garg%40intel.com
patch subject: [PATCH 2/5] drm/i915/display: Compute the scaler filter coefficients
config: x86_64-buildonly-randconfig-001-20240706 (https://download.01.org/0day-ci/archive/20240706/202407060905.l9gatVXa-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060905.l9gatVXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060905.l9gatVXa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_dsi.c:9:
   In file included from drivers/gpu/drm/i915/display/intel_dsi.h:30:
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h:58:
>> drivers/gpu/drm/i915/display/intel_sharpen_filter.h:6:9: error: '__INTEL_SHARPEN_FLITER_H__' is used as a header guard here, followed by #define of a different macro [-Werror,-Wheader-guard]
       6 | #ifndef __INTEL_SHARPEN_FLITER_H__
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_sharpen_filter.h:7:9: note: '__INTEL_SHARPEN_FILTER_H__' is defined here; did you mean '__INTEL_SHARPEN_FLITER_H__'?
       7 | #define __INTEL_SHARPEN_FILTER_H__
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         __INTEL_SHARPEN_FLITER_H__
   1 error generated.


vim +/__INTEL_SHARPEN_FLITER_H__ +6 drivers/gpu/drm/i915/display/intel_sharpen_filter.h

   > 6	#ifndef __INTEL_SHARPEN_FLITER_H__
     7	#define __INTEL_SHARPEN_FILTER_H__
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
