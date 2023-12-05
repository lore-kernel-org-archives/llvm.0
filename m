Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29246ABA6;
	Tue,  5 Dec 2023 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvjG5WYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701806269; x=1733342269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xA1OzQEvdpIisbeo/qOhqWfw2+XY21GFvBNGrnm+YDQ=;
  b=gvjG5WYrGOHskPDYqeE/mZFq7rYPReQ+Js0tkvPFoeHxInuPLH1RKGYT
   e/8FR12wBFw2ecoZNG58wC5mG2Uej1L8QqdApd3MLnKqKBjQJJsy5kRvC
   ZBuMzRFMdiQfU+jP9XCz0f2iCfUEoJvzbF71Y1FMfExKGo1tkoV15hEf/
   kQasRqJn1Oru+LzPpW6j9JhotFpHSQ6c5tOr2jDi3cghdqPQkECWNMwl3
   Aimb+3eskgzHf/gtP+RbCINXy8Oi29gkLAl7ozetMTF7Ae7dG8kFoQQFA
   nXXDXhGE2o4RYnY5y3A2vnu78szHeFf8rDoWAGo2QjgZHdxb4xBekaRxY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373406762"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="373406762"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720831377"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="720831377"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 11:57:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbY8-0009eW-2C;
	Tue, 05 Dec 2023 19:57:44 +0000
Date: Wed, 6 Dec 2023 03:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 14/21] mm/zsmalloc: convert
 zs_page_{isolate,migrate,putback} to use zsdesc
Message-ID: <202312060306.pC0tXo8R-lkp@intel.com>
References: <20231130101242.2590384-15-42.hyeyoo@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130101242.2590384-15-42.hyeyoo@gmail.com>

Hi Hyeonggon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyeonggon-Yoo/mm-zsmalloc-create-new-struct-zsdesc/20231130-181616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231130101242.2590384-15-42.hyeyoo%40gmail.com
patch subject: [RFC PATCH v3 14/21] mm/zsmalloc: convert zs_page_{isolate,migrate,putback} to use zsdesc
config: i386-buildonly-randconfig-002-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060306.pC0tXo8R-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060306.pC0tXo8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060306.pC0tXo8R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:388:14: warning: no previous prototype for function 'zsdesc_zone' [-Wmissing-prototypes]
   struct zone *zsdesc_zone(struct zsdesc *zsdesc)
                ^
   mm/zsmalloc.c:388:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct zone *zsdesc_zone(struct zsdesc *zsdesc)
   ^
   static 
   mm/zsmalloc.c:286:29: warning: unused function 'zsdesc_pfn' [-Wunused-function]
   static inline unsigned long zsdesc_pfn(const struct zsdesc *zsdesc)
                               ^
   mm/zsmalloc.c:296:20: warning: unused function 'zsdesc_get' [-Wunused-function]
   static inline void zsdesc_get(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:303:20: warning: unused function 'zsdesc_put' [-Wunused-function]
   static inline void zsdesc_put(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:320:20: warning: unused function 'wait_on_zsdesc_locked' [-Wunused-function]
   static inline void wait_on_zsdesc_locked(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:343:20: warning: unused function 'zsdesc_set_movable' [-Wunused-function]
   static inline void zsdesc_set_movable(struct zsdesc *zsdesc)
                      ^
   mm/zsmalloc.c:383:20: warning: unused function 'zsdesc_is_isolated' [-Wunused-function]
   static inline bool zsdesc_is_isolated(struct zsdesc *zsdesc)
                      ^
   7 warnings generated.


vim +/zsdesc_zone +388 mm/zsmalloc.c

   387	
 > 388	struct zone *zsdesc_zone(struct zsdesc *zsdesc)
   389	{
   390		return page_zone(zsdesc_page(zsdesc));
   391	}
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
