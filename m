Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613BEEAB;
	Wed, 23 Apr 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745380723; cv=none; b=Y/aUEAyK+WqhIUWjr5D/+pWUn3pbOSL087LIl60vwK2fUnGKlZTJCCrnwQ89Hypio0lVdaCWmTLdDz55Gq6yX0SNPB46+7sFns6NIm0ekrnir5WqT0bx58AmuqvjLmsla5Q1O+LV+QGYukB+Onl3LekZJZ4KnS+jW0AdRpA4tfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745380723; c=relaxed/simple;
	bh=eavZ9lTCiaarW34y6kCGKhqQ4Pq0Ai6CZgtDALyoZfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzZg+BjCL/kh7Tcc9JfAKsqsFlYihg0eSPX+DVZiExI9t58xLhoOSLShgsK2xagLAopC7aueFUlK8IcBeM51yCN8cJLIErnBvtYAU9pOL/K0B15wmty0CQyfYraE/Eo+EqFGe5K8AniQPIXvr7FfbH6PAMHwB60SeeEUijCTomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbJmxhFx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbJmxhFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745380722; x=1776916722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eavZ9lTCiaarW34y6kCGKhqQ4Pq0Ai6CZgtDALyoZfk=;
  b=DbJmxhFxgiG82jeHznyAQ+KKx7D4ZU2s+6t0tUUYicL9TPKIqLc93oSR
   s0znZNHdrjBuGGKHXb05AU8OEewKAc8Wi1O98XsCcqqlPSPDHx1fLwssJ
   EE40gjumjmLT1Ff9q8bHLHIELVAew1JU/BZoE1aKHzJUm6WrYPnOLSy4D
   jHmeweqqkFCotGHxCp6CsHSzbWKKsCi9aUs84XH7ItmlNGeaTr3ztvtCm
   nlUEoiiZ53TioljbYsX2I9a51Qzym8bbf4KCT20XhM6GbenOFPHW/18d8
   fJ3/tYRS/LKDtiil8G4wWHrMsOeoj4tDwZ9wZXkyTyKbV3UxDx2gk0oTt
   g==;
X-CSE-ConnectionGUID: zG1fdXNkRaSNGwKJUSnCtw==
X-CSE-MsgGUID: A2mTKLGUQhCUMiDpZC5aPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46660331"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46660331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 20:58:41 -0700
X-CSE-ConnectionGUID: NOAt65lMSB644MpaMHjI0A==
X-CSE-MsgGUID: s0qsg2spRYG+ht42Z8+WEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137063458"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2025 20:58:40 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7RFt-0001a9-26;
	Wed, 23 Apr 2025 03:58:37 +0000
Date: Wed, 23 Apr 2025 11:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Fabre <arthur@arthurfabre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next v2 03/17] trait: XDP support
Message-ID: <202504231144.lGvVxUZ5-lkp@intel.com>
References: <20250422-afabre-traits-010-rfc2-v2-3-92bcc6b146c9@arthurfabre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-afabre-traits-010-rfc2-v2-3-92bcc6b146c9@arthurfabre.com>

Hi Arthur,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5709be4c35ba760b001733939e20069de033a697]

url:    https://github.com/intel-lab-lkp/linux/commits/Arthur-Fabre/trait-limited-KV-store-for-packet-metadata/20250422-212907
base:   5709be4c35ba760b001733939e20069de033a697
patch link:    https://lore.kernel.org/r/20250422-afabre-traits-010-rfc2-v2-3-92bcc6b146c9%40arthurfabre.com
patch subject: [PATCH RFC bpf-next v2 03/17] trait: XDP support
config: i386-buildonly-randconfig-004-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231144.lGvVxUZ5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231144.lGvVxUZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231144.lGvVxUZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:19:
>> include/net/xdp.h:292:15: error: static assertion failed due to requirement 'sizeof(struct xdp_frame) == (40)': sizeof(struct xdp_frame) == _XDP_FRAME_SIZE
     292 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/net/xdp.h:292:40: note: expression evaluates to '32 == 40'
     292 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +292 include/net/xdp.h

   291	
 > 292	static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
