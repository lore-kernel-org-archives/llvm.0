Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00C3233;
	Sat, 13 Apr 2024 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712972546; cv=none; b=MftnNOYascvxy4QK9NTFVz1fd7rzFnDjnu1AMbjQr77dLAonIvyLr4c+oNS1+GoyDKM+Nw4PL5wTLbhH2mbf1AAnF5Akl4bU6kXFYcI22UqgZQew4j/r7qBo9eyaerOLIa61oosJT1inKrcCpW1qvSFpMgOxeG73Nj5xrw8N8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712972546; c=relaxed/simple;
	bh=v+JvQDGQOnSM0+frISDrMqJC9JAm12VbcoOH/0FKg8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQgyZW9ZhjWvCJ8Xdcb3yKdYuM0mV3OYJqWa0UXJD9Dzr3pRmocN/Spx5kMZtX709pRadlTwpHOsgrOzapALU6k/Hn3R6/WPpCx5bJHhT/XaNyFCnpZgIR4fa7Kx9haxhYdUmyunxF0Jnc1GFZLNkEat2XG7blPXj4HSo2EfLXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3H4KOzJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3H4KOzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712972543; x=1744508543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+JvQDGQOnSM0+frISDrMqJC9JAm12VbcoOH/0FKg8Q=;
  b=m3H4KOzJuJnLxQPjQHzV/BTP805vYUyfNRmLteM4q5GUMq7Op16w9V0T
   ZB/Z4DUnw9Eozh0kzKMUoC7Mpbz4jdeKynyom9kJpGEebbW6FxZUBtGvZ
   vhgSewDIPIyiC5nsy7D6Rc4tJiojrnvez5G12/pHZRLsF/jOIiXNN4DZk
   Fyb8EeFwcfteaPhNJ+5nGN9kKDop9aoswihzzkAnX+vbAl3Kus3KTutF4
   yx3KnJp41rYviFs3uWh7WAwEZW4EMVC5B2ubDfFAUywRGUkJUSwNxwh0x
   m33k/SB8BTWiihiBRa/l3rKH5GPLi6C09KUpv9cYp/TRCtoJZzaiIqG3e
   g==;
X-CSE-ConnectionGUID: vHaFRju3RSSfBTSCJeGbNw==
X-CSE-MsgGUID: BBWOTYowQ+e4uFO6upR0zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8312187"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8312187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 18:42:22 -0700
X-CSE-ConnectionGUID: /d6wiK4JT+ifCMmM/Ws/Lw==
X-CSE-MsgGUID: dUMHbELJQr2pKC84GTuSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21463206"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 18:42:21 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvSNe-00018e-00;
	Sat, 13 Apr 2024 01:40:42 +0000
Date: Sat, 13 Apr 2024 09:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:bhi-fixes 3/4] arch/x86/include/asm/tsc.h:26:3: error:
 expected ')'
Message-ID: <202404130949.K7NiJlh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git bhi-fixes
head:   37c4996142ca475889b13c1aaede6a24140c5ed7
commit: 7c0ac333f0ddd60b0b6e5de7210a903fd22e7703 [3/4] x86/bugs: Remove support for Spectre v2 LFENCE "retpolines"
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240413/202404130949.K7NiJlh5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130949.K7NiJlh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130949.K7NiJlh5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
>> arch/x86/include/asm/tsc.h:26:3: error: expected ')'
      26 |                 return 0;
         |                 ^
   arch/x86/include/asm/tsc.h:24:5: note: to match this '('
      24 |         if (!IS_ENABLED(CONFIG_X86_TSC) &&
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
>> arch/x86/include/asm/timex.h:12:3: error: expected ')'
      12 |                 return random_get_entropy_fallback();
         |                 ^
   arch/x86/include/asm/timex.h:10:5: note: to match this '('
      10 |         if (!IS_ENABLED(CONFIG_X86_TSC) &&
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
--
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   In file included from arch/x86/include/asm/pgtable.h:21:
>> arch/x86/include/asm/pkru.h:38:3: error: expected ')'
      38 |                 return rdpkru();
         |                 ^
   arch/x86/include/asm/pkru.h:37:5: note: to match this '('
      37 |         if (cpu_feature_enabled(X86_FEATURE_OSPKE))
         |            ^
   arch/x86/include/asm/pkru.h:45:3: error: expected ')'
      45 |                 return;
         |                 ^
   arch/x86/include/asm/pkru.h:44:5: note: to match this '('
      44 |         if (!cpu_feature_enabled(X86_FEATURE_OSPKE))
         |            ^
   arch/x86/include/asm/pkru.h:57:3: error: expected ')'
      57 |                 return;
         |                 ^
   arch/x86/include/asm/pkru.h:56:5: note: to match this '('
      56 |         if (!cpu_feature_enabled(X86_FEATURE_OSPKE))
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
>> arch/x86/include/asm/pgtable.h:135:67: error: expected ')'
     135 |                (pte_flags(pte) & (_PAGE_RW | _PAGE_DIRTY)) == _PAGE_DIRTY;
         |                                                                          ^
   arch/x86/include/asm/pgtable.h:134:9: note: to match this '('
     134 |         return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
         |                ^
   arch/x86/include/asm/cpufeature.h:144:2: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   arch/x86/include/asm/pgtable.h:153:34: error: expected ')'
     153 |                (_PAGE_DIRTY | _PAGE_PSE);
         |                                         ^
   arch/x86/include/asm/pgtable.h:151:9: note: to match this '('
     151 |         return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
         |                ^
   arch/x86/include/asm/cpufeature.h:144:2: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |         ^
   49 warnings and 7 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +26 arch/x86/include/asm/tsc.h

2272b0e03ea573 include/asm-i386/tsc.h     Andres Salomon     2007-03-06  21  
2272b0e03ea573 include/asm-i386/tsc.h     Andres Salomon     2007-03-06  22  static inline cycles_t get_cycles(void)
2272b0e03ea573 include/asm-i386/tsc.h     Andres Salomon     2007-03-06  23  {
3bd4abc07a267e arch/x86/include/asm/tsc.h Jason A. Donenfeld 2022-04-08  24  	if (!IS_ENABLED(CONFIG_X86_TSC) &&
3bd4abc07a267e arch/x86/include/asm/tsc.h Jason A. Donenfeld 2022-04-08  25  	    !cpu_feature_enabled(X86_FEATURE_TSC))
2272b0e03ea573 include/asm-i386/tsc.h     Andres Salomon     2007-03-06 @26  		return 0;
4ea1636b04dbd6 arch/x86/include/asm/tsc.h Andy Lutomirski    2015-06-25  27  	return rdtsc();
6d63de8dbcda98 include/asm-x86/tsc.h      Andi Kleen         2008-01-30  28  }
3bd4abc07a267e arch/x86/include/asm/tsc.h Jason A. Donenfeld 2022-04-08  29  #define get_cycles get_cycles
2272b0e03ea573 include/asm-i386/tsc.h     Andres Salomon     2007-03-06  30  

:::::: The code at line 26 was first introduced by commit
:::::: 2272b0e03ea5731aca058eaf79c9955b36f0c083 [PATCH] i386: make x86_64 tsc header require i386 rather than vice-versa

:::::: TO: Andres Salomon <dilinger@debian.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
