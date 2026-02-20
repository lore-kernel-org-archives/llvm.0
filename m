Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD45474F;
	Fri, 20 Feb 2026 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771548717; cv=none; b=dT4H7YY2ZvXMSj3BW3Nrt6QE0BBPMDHftG0GkuzngkcKU5ynlL8J1irdk/QlvmGri3Xv46QNUXP9PH++AYvr7owwNdM1poVAlhFqWpQgnAGP0nI5BGGUdG/R+Km4IcETrQ5pJ/bCe8r+bVxpdCSXtdChK7i8r1CYLAIkIH8FpGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771548717; c=relaxed/simple;
	bh=H+oB6etazd4qiS6vBm5xqaFjSOH/CTl3QMgByN3nCXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VK1MXCTR7koLAgkgfz9b8zwoI47OnSwBrlJY4X0scIYSk2sypNbZe0FM11mYBSaQEdZ5GL54FcZruxeI93tC1+4M5iQB9A4ruLh5SUr2ge0C6bkXSux7j9wfmfZdD4S9tBqvAVIsgyxk8TbmRS89rzss0bAlMjicTOruMFh9HXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kq4oWfRk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kq4oWfRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771548715; x=1803084715;
  h=date:from:to:cc:subject:message-id;
  bh=H+oB6etazd4qiS6vBm5xqaFjSOH/CTl3QMgByN3nCXU=;
  b=kq4oWfRkGEuYCy3cdEp9LqCH7W/9O8r8wbeQifaY8dGi/DR+4z6zESse
   Y+F9ARW4OUoRoZcaV/dVaVNzVIRZKowihdk4z5X1IvdndQtB3ghPVnrrE
   kHmxWUmgv+TF1uEm0bkBV485aoj0+sUEQ2yg81JEH7dt+slmpjYXCbVSe
   R6tz8ruiC3Ku5S0dMYdESs6KW5ozRLWhcmcuaCP2N5Lp3D0WfinnNG/1R
   FeETefD6PEjJYy1UnUWKW8I9dV5xrIpU85j+JeQ2E7H1QeuNqqGJmTkgj
   +c5qCdiivQFjM2FlhtU/O6ncTFXgy1Zzc8Jz5gGYGHzskvbuv8B9KAOcf
   A==;
X-CSE-ConnectionGUID: jSNBPA/kS7CcYngoVUfxJg==
X-CSE-MsgGUID: yUJeELb3TlOYN2rVukG71w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71669976"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="71669976"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 16:51:55 -0800
X-CSE-ConnectionGUID: nK4x3BIPSTGkzGUjCEvoXw==
X-CSE-MsgGUID: 8npVCUYgSfCxPGSTdPLOKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="252398667"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2026 16:51:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtEkJ-000000013gG-1MYw;
	Fri, 20 Feb 2026 00:51:51 +0000
Date: Fri, 20 Feb 2026 08:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 25/42]
 kernel/time/hrtimer.c:1252:40: error: too many arguments to function call,
 expected single argument 'is_local', have 3 arguments
Message-ID: <202602200859.o15feb9K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 8a407a52a7bbadb7e60638bdc055bdf5cc8a3311 [25/42] hrtimer: Optimize for local timers
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200859.o15feb9K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200859.o15feb9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200859.o15feb9K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:1252:40: error: too many arguments to function call, expected single argument 'is_local', have 3 arguments
    1252 |         return hrtimer_prefer_local(is_local, is_first, is_pinned);
         |                ~~~~~~~~~~~~~~~~~~~~           ^~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1239:29: note: 'hrtimer_prefer_local' declared here
    1239 | static __always_inline bool hrtimer_prefer_local(bool is_local)
         |                             ^                    ~~~~~~~~~~~~~
   1 error generated.


vim +/is_local +1252 kernel/time/hrtimer.c

  1244	
  1245	static inline bool hrtimer_keep_base(struct hrtimer *timer, bool is_local, bool is_first,
  1246					     bool is_pinned)
  1247	{
  1248		/* If the timer is running the callback it has to stay on its CPU base. */
  1249		if (unlikely(timer->base->running == timer))
  1250			return true;
  1251	
> 1252		return hrtimer_prefer_local(is_local, is_first, is_pinned);
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
