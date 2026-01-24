Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CBD275870;
	Sat, 24 Jan 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769255114; cv=none; b=BOxLpk+t9+DBNnpUX4OxkB6kSyvK3oBBkF7sqso/6m/UgD4Fzz6azU6EItL0cuUtYDNJ61+jmZNnDcBGrGQ4PXeJa30Y0lsEv/Tqy4ILLKJMXfCHiTwBUH3+MCAV6lSyIIrBYCJXVE7w6HLoaajAcmLwXT7QA7JkkGof0Kcla5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769255114; c=relaxed/simple;
	bh=wpOlNnzpcOt5iVevobBGuSDmZh0rUmULW0FJuCmoz8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oXnnWBvdcG4K6fUgtLLsaE3S8uBEBH005JqD/sQYRguDjJLnzvrALjO9Q6Hg/6QUNtctJZW7gmMKfo1QfRfvPm5Nw+q9t0g367i+l/gVJPJ/z0LP6RFAgH5lRVmfXrfMQq0i4gQXB9kmgnYnUR/p2VFI//fdygjrKG5W5JiF60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAUa1OO8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAUa1OO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769255112; x=1800791112;
  h=date:from:to:cc:subject:message-id;
  bh=wpOlNnzpcOt5iVevobBGuSDmZh0rUmULW0FJuCmoz8s=;
  b=IAUa1OO8VN2IDAOBNDJC2dERaeqzjTwj8Zz/JKs7/qey6NUS85kkbN/c
   Fo8bE0KGfPAlfstYSU9IkOIfzQpsDtqPmEe15iEj6Pic03+fPf+Y/IHeT
   TPxJ87qSQb6+x9LmShzdhZ+df6CExtFmrF1KxBkral3vsJW+oZROpSPeZ
   uRSvd4IzbkDyEIhOg5kGrOsgKlVz0tme3ZnsLXXNBhmyiHYlv9HbRpQdp
   TbB3YcTf7oC45z3PkuYmkYbSjvDtLCyLfWCJ9MZsCeGGdEpZxn3X+yB3Q
   Me9LuY8+7bY6pLzyCu1vn66TxK7d2N/oNh26W5he+iXlBKxYoNghm9p5/
   w==;
X-CSE-ConnectionGUID: lWq6ZIwXTims81sZuXkhFw==
X-CSE-MsgGUID: jQwlHENNTESfOEo0G3jVNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70397112"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70397112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:45:11 -0800
X-CSE-ConnectionGUID: ZS3FUVEnQJqoKgxhPg+hxg==
X-CSE-MsgGUID: jY9fOJWNTSa+lmxJzMKr9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jan 2026 03:45:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjc4h-00000000V9K-2d1Y;
	Sat, 24 Jan 2026 11:45:07 +0000
Date: Sat, 24 Jan 2026 19:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core-v2 5/15]
 arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier
 's390_idle'
Message-ID: <202601241924.cr8xEHso-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v2
head:   2d375ca5a093ed3f27bba45a583fedf1ae44a2ee
commit: cad6f3bfa55b9f8abfabb52c940ac93eabb5bb23 [5/15] s390/time: Prepare to stop elapsing in dynticks-idle
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260124/202601241924.cr8xEHso-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241924.cr8xEHso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241924.cr8xEHso-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |                          ^
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:2: error: indirection requires pointer operand ('void' invalid)
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:2: note: expanded from macro '__this_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:369:11: note: expanded from macro '__pcpu_size_call'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:130:1: note: expanded from here
     130 | raw_cpu_write_1
         | ^
   include/asm-generic/percpu.h:230:35: note: expanded from macro 'raw_cpu_write_1'
     230 | #define raw_cpu_write_1(pcp, val)       raw_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:87:2: note: expanded from macro 'raw_cpu_generic_to_op'
      87 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |                          ^
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:2: error: indirection requires pointer operand ('void' invalid)
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:2: note: expanded from macro '__this_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:370:11: note: expanded from macro '__pcpu_size_call'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:131:1: note: expanded from here
     131 | raw_cpu_write_2
         | ^
   include/asm-generic/percpu.h:233:35: note: expanded from macro 'raw_cpu_write_2'
     233 | #define raw_cpu_write_2(pcp, val)       raw_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:87:2: note: expanded from macro 'raw_cpu_generic_to_op'
      87 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |                          ^
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:2: error: indirection requires pointer operand ('void' invalid)
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:2: note: expanded from macro '__this_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:371:11: note: expanded from macro '__pcpu_size_call'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:132:1: note: expanded from here
     132 | raw_cpu_write_4
         | ^
   include/asm-generic/percpu.h:236:35: note: expanded from macro 'raw_cpu_write_4'
     236 | #define raw_cpu_write_4(pcp, val)       raw_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:87:2: note: expanded from macro 'raw_cpu_generic_to_op'
      87 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |                          ^
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:19: error: use of undeclared identifier 's390_idle'
>> arch/s390/kernel/vtime.c:292:2: error: indirection requires pointer operand ('void' invalid)
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:2: note: expanded from macro '__this_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:372:11: note: expanded from macro '__pcpu_size_call'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:133:1: note: expanded from here
     133 | raw_cpu_write_8
         | ^
   include/asm-generic/percpu.h:239:35: note: expanded from macro 'raw_cpu_write_8'
     239 | #define raw_cpu_write_8(pcp, val)       raw_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:87:2: note: expanded from macro 'raw_cpu_generic_to_op'
      87 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/vtime.c:305:19: error: use of undeclared identifier 's390_idle'
     305 |         __this_cpu_write(s390_idle.idle_dyntick, false);
         |                          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/s390_idle +292 arch/s390/kernel/vtime.c

   283	
   284	/**
   285	 * vtime_dyntick_start - Inform vtime about entry to idle-dynticks
   286	 *
   287	 * Called when idle enters in dyntick mode. The idle cputime that elapsed so far
   288	 * is flushed and the tick subsystem takes over the idle cputime accounting.
   289	 */
   290	void vtime_dyntick_start(void)
   291	{
 > 292		__this_cpu_write(s390_idle.idle_dyntick, true);
   293		vtime_flush(current);
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
