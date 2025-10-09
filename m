Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E419E967;
	Thu,  9 Oct 2025 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026558; cv=none; b=oiBqy7Umn7zH0FdkEj3Mru6modbIVSvc4bS819LetwjvptHUqhbElHfOYEwRRFKNmhOTxf22X3RFlqL0KiYR03szwzvCsQW4UoycciMZihb8pSm2+ovPyugyuIuNlTvwqa7qqnRrMjO6cIIRKLlAwX3Pjb54iG+LfmIiIMeGJ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026558; c=relaxed/simple;
	bh=GW2GbcN//l5fCMJCAmqKOLs19cMOj4ey0L2cyj1vlKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDwoNwSwe9GFTzs1UeHIsTEHDJ4DpTh0AQL7N2d9NhC13xqkyXt7+67vBg0MSwFILEYYUOrz04uqRWyIA6he1gs33nM/Z/DSPs7kLrdzh4VoXq6wDUQepaTWArcqkQBfx/1CYwKuB3Sdr1GUoCIiFMi3SDvNCMuBZjDxXVJcEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuvCudFh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuvCudFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760026557; x=1791562557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GW2GbcN//l5fCMJCAmqKOLs19cMOj4ey0L2cyj1vlKo=;
  b=VuvCudFhBZQotqGjSUlizgoN4SXZnQrTQAsWyX29/fBY63QVhX/DWmlE
   dZnSdvlUimXUZM+LtJCjMPTYMQZbRsl8I+Nd5xO7eFigfY4XAAaayNUtj
   bbJw/sG3uABpJkB7KXiEx+0npaCNCyVBGi2NsiniSJO/gg1s91tUOlnCi
   nycU7VCspw5XtcKLOwQ5y5NaSrzRZDZ+/HR4/XzltRnHwgIJeh2R/CV+E
   aTReyvCrfJcR/CB6Lex7QmRfyrnkBzK5vkUS9nA/a7a8c5/vXydZp+N6b
   mAoIQJjBrRXSE/SsO62EX54N4VkwDcy8FTg1h2iJ2Tk1AH6pLvUPpz9qW
   A==;
X-CSE-ConnectionGUID: 6v/TYAMmTea1ELL/nxE86A==
X-CSE-MsgGUID: 7UsdsysYQrW3zS0NH36ISA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73346882"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="73346882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:15:56 -0700
X-CSE-ConnectionGUID: 31OC3+NXSLWk2EneASn0Lg==
X-CSE-MsgGUID: oXNHlQTTR960XEbEhJpplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="179864807"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2025 09:15:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6tJ2-0000zB-1o;
	Thu, 09 Oct 2025 16:15:52 +0000
Date: Fri, 10 Oct 2025 00:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:always-kfence 1/1] mm/slub.c:4207:10: error: call to
 undeclared function '__kfence_alloc'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510100013.FEFGC7Qg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git always-kfence
head:   90a1fd620f839dfd87e82ec5482b27e364b1b5b9
commit: 90a1fd620f839dfd87e82ec5482b27e364b1b5b9 [1/1] mm: add a way to always do a kfence allocation in a slabcache
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251010/202510100013.FEFGC7Qg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100013.FEFGC7Qg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100013.FEFGC7Qg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:4207:10: error: call to undeclared function '__kfence_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4207 |                 return __kfence_alloc(s, orig_size, gfpflags);
         |                        ^
   mm/slub.c:4207:10: note: did you mean 'kfence_alloc'?
   include/linux/kfence.h:232:21: note: 'kfence_alloc' declared here
     232 | static inline void *kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags) { return NULL; }
         |                     ^
>> mm/slub.c:4207:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
    4207 |                 return __kfence_alloc(s, orig_size, gfpflags);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__kfence_alloc +4207 mm/slub.c

  4203	
  4204	static void *slab_kfence_alloc(struct kmem_cache *s, size_t orig_size, gfp_t gfpflags)
  4205	{
  4206		if (s->flags & SLAB_ALWAYS_KFENCE)
> 4207			return __kfence_alloc(s, orig_size, gfpflags);
  4208		return kfence_alloc(s, orig_size, gfpflags);
  4209	}
  4210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
