Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDE3D3CF7;
	Wed, 25 Mar 2026 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440518; cv=none; b=Xe9ERaqxt2YOSWjbW0ZLCRBkiY4mV9mYIX0mEqHLNCqUfu+YZpZVKC7MNyp24q98zVa5czOd1+FQZPq7WRbc+j+HxBRr3EJdd8aCcXgtgy/zHsw3KDSaKS7wNW8+UO321XIlWdSn4lnNVOdiaR1UahM2x5AEDDvAuUX75yN1rUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440518; c=relaxed/simple;
	bh=PtOgjXHwZfnjZGY+VUgc0883RJgJeMNHYXjJ5Z9sh4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBoB7WYFUPEEaDmJm9YV+XeCAK8NQtDuRrSn1BxJJTGiWtonfAzoBxQZmnnAgNvoVkXh0agftk/EAPiTat4NJRtRQAAN5YaCrjKainyb0Un1T4t7ui1DfeIA2ftbKnzuEcDseKrYjfFNx4/N+rwZTNamYEpTmgKb6eZRjgZrHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gK8E5RxL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gK8E5RxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440518; x=1805976518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PtOgjXHwZfnjZGY+VUgc0883RJgJeMNHYXjJ5Z9sh4M=;
  b=gK8E5RxLXlrFDyXeov8dHh57Q+LCCpG668AKe3MoMC8jtp91I237VlaN
   UHiJHAgcelWgp7popfZZWF2Y8jwxzoZ4Fbx/QKupedT98ET9z9ZApN1Fm
   P0aNrYmriO7Pio/XnsWHEllqzin3z/vxAsdI0wJV0EX/oHNL3pR9hVVg5
   x02PnpxLavNPAzuWz0tcMHTXJ3wJ4wf0khwHNWdW8Y4K3hexTpXsNKg4+
   EMZ2MVc/Pk5tt/pUKJ976uCD3Gk+lZo2Daqhz4FBg64oh+UCG+dC+XKs1
   GeYKWpinfqD26lVgStXIkqPuM3AeHhedn1nLv+5IhC8EmvboASlLfwKXv
   A==;
X-CSE-ConnectionGUID: Tf/LH2NLTAy6UoSMbKGh1A==
X-CSE-MsgGUID: GGUmYsGyRtaxa9FL1DikSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79330529"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79330529"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:35 -0700
X-CSE-ConnectionGUID: 3jHvj3/WQwaO1tETLo49OA==
X-CSE-MsgGUID: 43I7bx9NQCiF44jy7R/qiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224925530"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 05:08:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5N2C-000000006mL-3y4Q;
	Wed, 25 Mar 2026 12:08:29 +0000
Date: Wed, 25 Mar 2026 20:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: hamjin <jinham@qq.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hamjin <jinham@qq.com>
Subject: Re: [PATCH] lib: typecheck: initialize const variable to avoid Clang
 warning
Message-ID: <202603252009.z5G8iyl7-lkp@intel.com>
References: <tencent_274FD06231C70768C2C28FD13673A24C2B08@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_274FD06231C70768C2C28FD13673A24C2B08@qq.com>

Hi hamjin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hamjin/lib-typecheck-initialize-const-variable-to-avoid-Clang-warning/20260315-165617
base:   linus/master
patch link:    https://lore.kernel.org/r/tencent_274FD06231C70768C2C28FD13673A24C2B08%40qq.com
patch subject: [PATCH] lib: typecheck: initialize const variable to avoid Clang warning
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603252009.z5G8iyl7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252009.z5G8iyl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252009.z5G8iyl7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:12:
   In file included from arch/s390/include/asm/current.h:13:
   In file included from arch/s390/include/asm/lowcore.h:14:
>> arch/s390/include/asm/ptrace.h:224:9: error: used type 'typeof (regs->psw)' (aka 'const psw_t') where arithmetic or pointer type is required
     224 |         return psw_bits(regs->psw).pstate;
         |                ^~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/ptrace.h:98:2: note: expanded from macro 'psw_bits'
      98 |         typecheck(psw_t, __psw);                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:23: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2 = (typeof(x))0; \
         |                              ^          ~
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:


vim +224 arch/s390/include/asm/ptrace.h

952974ac61f686 Heiko Carstens 2010-02-12  221  
afa8fa52a42c31 Jens Remus     2025-12-11  222  static __always_inline bool user_mode(const struct pt_regs *regs)
afa8fa52a42c31 Jens Remus     2025-12-11  223  {
afa8fa52a42c31 Jens Remus     2025-12-11 @224  	return psw_bits(regs->psw).pstate;
afa8fa52a42c31 Jens Remus     2025-12-11  225  }
afa8fa52a42c31 Jens Remus     2025-12-11  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
