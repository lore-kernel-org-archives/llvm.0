Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F091A08A6;
	Wed, 23 Apr 2025 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424810; cv=none; b=uxvSJkIXUbChMCBPthUv0lhj/EpJsgYfXqnONwzsIbrRealNdopmzoyIG1n+UxG9sl5GKYNIQ0xePXSa4JN2K7tBbO7oRRr8Jw1xmb+6oO8ujleeTHZ7/RgA/L2HBd5c05wCGbh+iI4N3rhvQnSmTGixH5IAxLyahPsto4VVHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424810; c=relaxed/simple;
	bh=U2yFwq3RpBg+WNw4vkVzMAwlOlucHUu4o9YFxpiLI0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWjHN5Xep1aWav7qISRQAUoQZ5tWFcjW8gYBGf7iCmTm5Grcuuzf8dGztjYeofVEqAkjQnnMsYvlOxl/geJPaV5E18NfAO0ksw8an6gmR7PpmSp6Zu9hPwcK8zEAYvDo3rxKvKrVEHCX2+gAexMJhj/1TyjUQ2mJ//puHfRKv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRrELMQ4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRrELMQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745424806; x=1776960806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2yFwq3RpBg+WNw4vkVzMAwlOlucHUu4o9YFxpiLI0M=;
  b=TRrELMQ4dTRqiCGhXLPiVj7vLFzR1eAEQidwMYDqI3FLGPR9rYCPMNcv
   iAvaI6W8s70tFqPaB1ODAOmIViyPTr1akvYKRMg4QKCUhYVLO9j4T7tqJ
   La6uQYiaJTLdflT3FRNN8jiSVfiblfuwb4snqtnWzKlrUskuYEmiIVAaq
   WNCnKnOONKj/1OIWiQwLS1Su1jyyBoKZJpsocisnEygjm+mC5ldSz1tOL
   MPWmiLBjQD/5vddg1e1ab0ANUvogVPoN9DDfO9CGnQCknUdaRtzGA3Nlz
   gJET/yMiuLGLY0JGWN6z0m6YBzRdWohG0yp3Zdt+4iLqfc5f0PrMtWrjN
   A==;
X-CSE-ConnectionGUID: w5y1msKnQS+RENMlWaFiKg==
X-CSE-MsgGUID: Jx7kwbUoT9OmdrvnDoNIoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46937259"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46937259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:13:25 -0700
X-CSE-ConnectionGUID: bPLwa6SlQACTActRM+QX0w==
X-CSE-MsgGUID: nRab89R3QqqjnlU8aM/dsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136434963"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 09:13:24 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7civ-0003QR-1x;
	Wed, 23 Apr 2025 16:13:21 +0000
Date: Thu, 24 Apr 2025 00:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/sev_cache_opts 19/24] drivers/gpu/drm/drm_cache.c:96:2:
 error: invalid argument type 'void' to unary expression
Message-ID: <202504240050.Ipyo2SjN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/sev_cache_opts
head:   fc0ae43d0eef1292a97a3109a394871b69ac9459
commit: a3224547b78b7ba78d71baa8cf1ae1fcefd6fad8 [19/24] x86, lib: Drop the unused return value from wbinvd_on_all_cpus()
config: x86_64-buildonly-randconfig-004-20250423 (https://download.01.org/0day-ci/archive/20250424/202504240050.Ipyo2SjN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240050.Ipyo2SjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240050.Ipyo2SjN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_cache.c:96:2: error: invalid argument type 'void' to unary expression
      96 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/gpu/drm/drm_cache.c:96:2: error: invalid argument type 'void' to unary expression
      96 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> drivers/gpu/drm/drm_cache.c:96:2: error: invalid argument type 'void' to unary expression
      96 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/gpu/drm/drm_cache.c:142:2: error: invalid argument type 'void' to unary expression
     142 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/gpu/drm/drm_cache.c:142:2: error: invalid argument type 'void' to unary expression
     142 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/gpu/drm/drm_cache.c:142:2: error: invalid argument type 'void' to unary expression
     142 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/gpu/drm/drm_cache.c:175:2: error: invalid argument type 'void' to unary expression
     175 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/gpu/drm/drm_cache.c:175:2: error: invalid argument type 'void' to unary expression
     175 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/gpu/drm/drm_cache.c:175:2: error: invalid argument type 'void' to unary expression
     175 |         if (wbinvd_on_all_cpus())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:45: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   9 errors generated.


vim +/void +96 drivers/gpu/drm/drm_cache.c

c9c97b8c750198 Dave Airlie     2009-08-27  89  
c9c97b8c750198 Dave Airlie     2009-08-27  90  #if defined(CONFIG_X86)
906bf7fda2c9cf Borislav Petkov 2016-03-29  91  	if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
c9c97b8c750198 Dave Airlie     2009-08-27  92  		drm_cache_flush_clflush(pages, num_pages);
673a394b1e3b69 Eric Anholt     2008-07-30  93  		return;
673a394b1e3b69 Eric Anholt     2008-07-30  94  	}
673a394b1e3b69 Eric Anholt     2008-07-30  95  
b04d4a38c0691e Ben Widawsky    2014-12-15 @96  	if (wbinvd_on_all_cpus())
499447db0ebf43 Joe Perches     2017-02-28  97  		pr_err("Timed out waiting for cache flush\n");
c9c97b8c750198 Dave Airlie     2009-08-27  98  

:::::: The code at line 96 was first introduced by commit
:::::: b04d4a38c0691e4467fa2988b6fe481bf759daaf drm/cache: Use wbinvd helpers

:::::: TO: Ben Widawsky <ben@bwidawsk.net>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
