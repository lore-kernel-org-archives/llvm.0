Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684CA1E51E;
	Sun,  3 Mar 2024 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709505928; cv=none; b=ikXab0qad/IaEJ6duEl3pceHSKqUIaa2MN6aqwzoLAf39ys/QSLiqTEWelQ240UA7YOGjv5pELG4MS3h5xPlTqW0oIs1VeHsmosukBEva++uFOzlKnJZC814v/MNfW6ZD0GvYq1L3CrzOhJTrRQzE/HnwbliJze1abqob8lL7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709505928; c=relaxed/simple;
	bh=OrcFdy0tfWw1yIEFFjB2UeTuEXGnk+sfFWjSaOTP6uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERlkb6Bze6y0TMZDBhTWSZNMMq+Jov2AN0CX126t4l2NAArPhoZmme2aI2X6hINKymHC+X9VSb1x0WNOvfWUUytIaYzn2Mj8wBSrtMyCo/UgPLWN8ch/VovgAqzaupd7BVn7otsJHlvfdPUDFA1AEVm2O7Swd5d9KxC9npuTq9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k84sYJ07; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k84sYJ07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709505926; x=1741041926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrcFdy0tfWw1yIEFFjB2UeTuEXGnk+sfFWjSaOTP6uA=;
  b=k84sYJ078dI6k0N1YHt47Wm8g1h0Uh7Fzzby6UVQC/Qpmy0tnBeMQnrX
   WhZ5yAUay/mHRSoFMgBPJzjgDBpJSvlW6Qa/riAGAHfXRaBNiCFLANB6V
   EHmy9V+fWwiYlLNDxQ2SQO7+PHwpDHv8mKvqo6OHIlF6oZgKaM1ZLg13T
   mHtAHHIixtC8Xepp4FOpCykPl4PfmCvOXsnXnVKpjnvGT4HdhzvhEnnVd
   Efj8onH4d9iaWidDubS1oEkC/DSA/wnhmGCIn9AeB7EGjYs8RRecrTtGM
   ZvyUrlGJoV9ffMcX5t/DbF4jdI8p8DNnrNX4o4V2pJUDDnkFnj1B1RZ6/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4150510"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4150510"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 14:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9241275"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2024 14:45:20 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgua5-00029l-1Z;
	Sun, 03 Mar 2024 22:45:17 +0000
Date: Mon, 4 Mar 2024 06:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@elte.hu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt-rebase 75/29558] mm/page_alloc.c:295:30:
 warning: unused variable 'pa_lock'
Message-ID: <202403040609.eLVNtUD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: d2ca13faf7cbc48696294f1f2819bce3311321ce [75/29558] mm: page_alloc: rt-friendly per-cpu pages
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240304/202403040609.eLVNtUD0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040609.eLVNtUD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040609.eLVNtUD0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:21:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1417:6: warning: no previous prototype for function 'set_zone_contiguous' [-Wmissing-prototypes]
    1417 | void set_zone_contiguous(struct zone *zone)
         |      ^
   mm/page_alloc.c:1417:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1417 | void set_zone_contiguous(struct zone *zone)
         | ^
         | static 
   mm/page_alloc.c:1438:6: warning: no previous prototype for function 'clear_zone_contiguous' [-Wmissing-prototypes]
    1438 | void clear_zone_contiguous(struct zone *zone)
         |      ^
   mm/page_alloc.c:1438:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1438 | void clear_zone_contiguous(struct zone *zone)
         | ^
         | static 
   mm/page_alloc.c:2240:5: warning: no previous prototype for function 'find_suitable_fallback' [-Wmissing-prototypes]
    2240 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^
   mm/page_alloc.c:2240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2240 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         | ^
         | static 
>> mm/page_alloc.c:295:30: warning: unused variable 'pa_lock' [-Wunused-const-variable]
     295 | static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
         |                              ^~~~~~~
   include/linux/locallock.h:243:60: note: expanded from macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   5 warnings generated.
   mm/page_alloc.o: warning: objtool: missing symbol for section .ref.text


vim +/pa_lock +295 mm/page_alloc.c

   294	
 > 295	static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
