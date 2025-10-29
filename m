Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792737A3C7;
	Wed, 29 Oct 2025 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774925; cv=none; b=LmEgwxGTNiU2qiZ1Imlnrr/GdLDa2Ulv6vgpllm86XmrnWHlHmR9XWB04FpfpUPeEM1To5Bmf/4aTJNWGOCnbtjfr/Fy4ZnT3QmnHPAih9XlVZ6JA2XDIHOQPpIzhFTFtY1iPHP3NAKM4X8E+f0yx7dWI0zb6OOcg+ZAkPRO8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774925; c=relaxed/simple;
	bh=4gOfY8lg1jVrRumoF/nd+a4QA339CE47ErY5ZC9Ldas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beAmm6nzoYBKBrm4MFDZxkZ3vB/JBs8OMZRuftjfT7eQql0LRZ9EyLxxVvQ7hye4vNrkRr9ntH+pbnByuS8szURC/0l5znD9eWvfkSWPJDBumN9x3WjNRP5HFJ8si1a9otpiyQrKnw2RVUGs/tloNdEuRkQAzn9XV5CsI2KfCCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tr5519qI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tr5519qI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761774924; x=1793310924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gOfY8lg1jVrRumoF/nd+a4QA339CE47ErY5ZC9Ldas=;
  b=Tr5519qIJkHpqIxNnxHgEVK0Yt4N92SZ959KOZNuWjyyO1te/9+vDJRw
   kXcjycANsR4d6wX3Z41QT1HT5tdMmnQIgD6BrJKYcXQ8xerKzK/OCn6Zw
   hPQsN8rCF2J2ZdvxKqXu/CYh2X50vb7bMzrWSa1IE6NP0rVTbMnAdrIk2
   TuqGfJV5UWwrqVXuUYTczXeRnJahhwtIwfnH9R/2HBgrH/ZI1mosZ4/L7
   AjRmYXohAaU73D3u/Ey4mZIF7iH7Wqfl0p3v6d+1CBL8AuOu8hrRpdyk3
   3sjpiIPA3fABaa2mKvP8UGHgoofCgeaSDlXHwCc2cGmBmn+wTCbzLMqSg
   g==;
X-CSE-ConnectionGUID: k1oIuZKmQ268uw4Z3IGzUg==
X-CSE-MsgGUID: a6JmPfdySYuyPv5K6LX93Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74199610"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="74199610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:55:23 -0700
X-CSE-ConnectionGUID: 5WSP2OEXRruyhhvSxEsF4w==
X-CSE-MsgGUID: vLOfw5xwReaS4Mfm3OLgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185436260"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 14:55:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEE8G-000LD8-0C;
	Wed, 29 Oct 2025 21:55:09 +0000
Date: Thu, 30 Oct 2025 05:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 4/5] include/linux/writeback.h:196:38:
 error: invalid operands to binary expression ('typeof
 (_Generic((inode->i_state), char: (char)0, unsigned char: (unsigned char)0,
 signed char: (signed char)0, unsigned short: (unsigned short)0, short:
 (short)0, unsigned i...
Message-ID: <202510300534.LNsiaiKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   016122ac8ad0ad10b89ed1daca70253ddcc199e9
commit: 852843205ebcc8cdbf267a7e67ffd76718776ddb [4/5] Merge branch 'vfs-6.19.inode' into vfs.all
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510300534.LNsiaiKf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300534.LNsiaiKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300534.LNsiaiKf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:23:
>> include/linux/writeback.h:196:38: error: invalid operands to binary expression ('typeof (_Generic((inode->i_state), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, short: (short)0, unsigned int: (unsigned int)0, int: (int)0, unsigned long: (unsigned long)0, long: (long)0, unsigned long long: (unsigned long long)0, long long: (long long)0, default: (inode->i_state)))' (aka 'struct inode_state_flags') and 'int')
     195 |         wait_var_event(inode_state_wait_address(inode, __I_NEW),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     196 |                        !(READ_ONCE(inode->i_state) & I_NEW));
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/wait_bit.h:306:6: note: expanded from macro 'wait_var_event'
     306 |         if (condition)                                                  \
         |             ^~~~~~~~~
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:23:
>> include/linux/writeback.h:196:38: error: invalid operands to binary expression ('typeof (_Generic((inode->i_state), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, short: (short)0, unsigned int: (unsigned int)0, int: (int)0, unsigned long: (unsigned long)0, long: (long)0, unsigned long long: (unsigned long long)0, long long: (long long)0, default: (inode->i_state)))' (aka 'struct inode_state_flags') and 'int')
     195 |         wait_var_event(inode_state_wait_address(inode, __I_NEW),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     196 |                        !(READ_ONCE(inode->i_state) & I_NEW));
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/wait_bit.h:308:24: note: expanded from macro 'wait_var_event'
     308 |         __wait_var_event(var, condition);                               \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/wait_bit.h:281:25: note: expanded from macro '__wait_var_event'
     281 |         ___wait_var_event(var, condition, TASK_UNINTERRUPTIBLE, 0, 0,   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     282 |                           schedule())
         |                           ~~~~~~~~~~~
   include/linux/wait_bit.h:266:7: note: expanded from macro '___wait_var_event'
     266 |                 if (condition)                                          \
         |                     ^~~~~~~~~
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +196 include/linux/writeback.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  191  
^1da177e4c3f415 Linus Torvalds    2005-04-16  192  /* writeback.h requires fs.h; it, too, is not included from here. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  193  static inline void wait_on_inode(struct inode *inode)
^1da177e4c3f415 Linus Torvalds    2005-04-16  194  {
0fe340a98b584a3 Christian Brauner 2024-08-23  195  	wait_var_event(inode_state_wait_address(inode, __I_NEW),
0fe340a98b584a3 Christian Brauner 2024-08-23 @196  		       !(READ_ONCE(inode->i_state) & I_NEW));
^1da177e4c3f415 Linus Torvalds    2005-04-16  197  }
1c0eeaf56985971 Joern Engel       2007-10-16  198  

:::::: The code at line 196 was first introduced by commit
:::::: 0fe340a98b584a31b07c664dc5ff0c923730581e inode: port __I_NEW to var event

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
