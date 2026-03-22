Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874135949;
	Sun, 22 Mar 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195310; cv=none; b=gtdKd8OCX1+9DwMDiucC7yQAZ++e17fG3n4pPFIhbrcQjnElAD871MRfQDAtsGUjkQZpfDkCkLRHMGm/5hWQqwYfXhlkTc05yBDnYAVI4fH5BpF0O6nOPzfI17JyYcibrhy9dUPBL/6f6oOeORJttAKDWVF/hXm+kOLqHQgFOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195310; c=relaxed/simple;
	bh=ZBHORc34UbD/7hrVd+L42MyAulXYPVX7dScN5YJL55U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWvN2iH9DLjCFLj7mRcaDYj+WHHMToGRvhBUqbKyekMk37jQnW6Fz1cHCE+w6iHf8FZ+hjW8SBdR0DTFr5eiepiDIwfZ3eMMkWfIm2u4G06iQbypIcq0mcS2zv0BMtMe9zkibf+J8uAg5yjRJJBdOvEpIkdU1uMi8ON20KDZlmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1p3xiqj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1p3xiqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774195308; x=1805731308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBHORc34UbD/7hrVd+L42MyAulXYPVX7dScN5YJL55U=;
  b=U1p3xiqj3Ttep3fvNDcA6b1Ke0fZY/vwQ8ck0x827jwPnJbKS0smo7tK
   VurkrB3FPmr+mowD8BEdzupml3Moo6vAo4ExzSCKDb1u5molfo4WJzJ6J
   IAoMSqNqLxbFD03ZGLk/wVhZZKd+cZgx3oxyh6++lIsGEFbJGtzNiw+yT
   brpusQNrnvo0FbSWEc1dl7GAXLCi+qGlfPaY2mWPGhi4kOkM3fgCZq5Uh
   ZVaJJt4nKwWVH4yAWv34ol9opftErormeyr2pCiauzMBECaRjVk0Om5Nr
   36FzADa7hMHNRM6M8VCMY1FNFMzEoYa82KPKwvenEc4eJSdjlZoZtokxS
   Q==;
X-CSE-ConnectionGUID: eSg2Bj72Qz66n6849ADFJA==
X-CSE-MsgGUID: hbKpzIPRQp2DqwyBD02oGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="92785193"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="92785193"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 09:01:47 -0700
X-CSE-ConnectionGUID: yj5zuzWeSnWGw+nbGJ9B3g==
X-CSE-MsgGUID: WVogo/3GSPWENUF/n+5PbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="254266555"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2026 09:01:46 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4LFH-000000002Kb-1hMN;
	Sun, 22 Mar 2026 16:01:43 +0000
Date: Mon, 23 Mar 2026 00:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/4] locking: Add contended_release tracepoint to
 spinning locks
Message-ID: <202603222343.hjWp2FNy-lkp@intel.com>
References: <51aad0415b78c5a39f2029722118fa01eac77538.1773858853.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51aad0415b78c5a39f2029722118fa01eac77538.1773858853.git.d@ilvokhin.com>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on trace/for-next arnd-asm-generic/master linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Ilvokhin/tracing-lock-Remove-unnecessary-linux-sched-h-include/20260320-145758
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/51aad0415b78c5a39f2029722118fa01eac77538.1773858853.git.d%40ilvokhin.com
patch subject: [RFC PATCH v3 4/4] locking: Add contended_release tracepoint to spinning locks
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260322/202603222343.hjWp2FNy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222343.hjWp2FNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222343.hjWp2FNy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/qspinlock.c:111:2: error: call to undeclared function '__queued_spin_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |         __queued_spin_unlock(lock);
         |         ^
>> kernel/locking/qspinlock.c:107:17: warning: no previous prototype for function 'queued_spin_unlock_traced' [-Wmissing-prototypes]
     107 | void __lockfunc queued_spin_unlock_traced(struct qspinlock *lock)
         |                 ^
   kernel/locking/qspinlock.c:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     107 | void __lockfunc queued_spin_unlock_traced(struct qspinlock *lock)
         | ^
         | static 
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/locking/qspinlock.c:408:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:37:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here


vim +/queued_spin_unlock_traced +107 kernel/locking/qspinlock.c

   106	
 > 107	void __lockfunc queued_spin_unlock_traced(struct qspinlock *lock)
   108	{
   109		if (queued_spin_is_contended(lock))
   110			trace_contended_release(lock);
   111		__queued_spin_unlock(lock);
   112	}
   113	EXPORT_SYMBOL(queued_spin_unlock_traced);
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
