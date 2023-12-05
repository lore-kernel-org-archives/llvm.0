Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598D36DCE7;
	Tue,  5 Dec 2023 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ7NpuaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701807589; x=1733343589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mGiZ1Vrk5OevNQyt+Ms4l77bHmZzSrQssl1EC9pYXiE=;
  b=JZ7NpuaXBbFnpPSvhG42KBPgUlX61vMPpQavLCIFajKB6+u7/MKSRT0f
   e18HtrCQcPyX1HLsNBuxdJeAbfgxySSTntvlr5FH1hcUgYqNnXUDIR2S2
   3pZkqpcyxZOQRPwXd3KWls8IcgAFLwlnrWEzAW3TeJz+JHMxfSWiviiYi
   EIKCTxNqfyvn8cYx4TWJcZrLuy2rtp4TbZFjUOywr4A3/TA3nfIB8f0x6
   Ze0W81LVxoiKMf7HMoRVAsm9DfUyYSn6oOdiSDMDVartMiiaABeqVvV7h
   R+RiC8Jw3M/qXgzQiqzkWnRLnANC7Ve8DO3XhG/2rfBPq45801GBKflze
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="849865"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="849865"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841594334"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841594334"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 12:19:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbtR-0009fG-0k;
	Tue, 05 Dec 2023 20:19:45 +0000
Date: Wed, 6 Dec 2023 04:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 14/21] mm/zsmalloc: convert
 zs_page_{isolate,migrate,putback} to use zsdesc
Message-ID: <202312060420.woW6hGsl-lkp@intel.com>
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
config: i386-randconfig-002-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060420.woW6hGsl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060420.woW6hGsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060420.woW6hGsl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zsmalloc.c:388:14: warning: no previous prototype for function 'zsdesc_zone' [-Wmissing-prototypes]
   struct zone *zsdesc_zone(struct zsdesc *zsdesc)
                ^
   mm/zsmalloc.c:388:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct zone *zsdesc_zone(struct zsdesc *zsdesc)
   ^
   static 
   mm/zsmalloc.c:286:29: warning: unused function 'zsdesc_pfn' [-Wunused-function]
   static inline unsigned long zsdesc_pfn(const struct zsdesc *zsdesc)
                               ^
>> mm/zsmalloc.c:383:20: warning: function 'zsdesc_is_isolated' is not needed and will not be emitted [-Wunneeded-internal-declaration]
   static inline bool zsdesc_is_isolated(struct zsdesc *zsdesc)
                      ^
   3 warnings generated.


vim +/zsdesc_is_isolated +383 mm/zsmalloc.c

   382	
 > 383	static inline bool zsdesc_is_isolated(struct zsdesc *zsdesc)
   384	{
   385		return PageIsolated(zsdesc_page(zsdesc));
   386	}
   387	
 > 388	struct zone *zsdesc_zone(struct zsdesc *zsdesc)
   389	{
   390		return page_zone(zsdesc_page(zsdesc));
   391	}
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
