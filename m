Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532228F518;
	Wed,  4 Jun 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045663; cv=none; b=FXvk5M1tRDO7yoqYQwBMGlv7c/p8p8Wjne0ocJ4n159U2/PR7z6M3DbeOPC8nntCxvoCg/IRVql3s0aF5yf1laG6G8HMUMhGZrDC2S5vBIJP/xufJHvfJGmQ7H8mnq2XvaoF9gZ4gesOzIiwu47wblbCZmszXO1KQL8b5D7IPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045663; c=relaxed/simple;
	bh=yyEFeUWnnIC4j2V9MvybUjIKaB3zfiWxH+hVoXh1KQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HydmCDhqJAP9dgdaBbpzQQvhudse5okZA+ltSD2gv1eTERLafoNrJvQBSj1yn+uHxZNPuI78KotHp8NJ5Re5bpDmsUlkOqvJqZRStppwZPGxhm3IdHbNvMOWoo3Bg1CDkPyo5Z+teYlDqtUSy/uh+pRbp1iEMetr4pJ1CzCR6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbP7SAJD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbP7SAJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749045662; x=1780581662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yyEFeUWnnIC4j2V9MvybUjIKaB3zfiWxH+hVoXh1KQg=;
  b=ZbP7SAJD3CAG1cafT3aSONV1xYZFzzZVxFTYb4cyNN8siS0CMjKqyfYv
   dt26QTb53B8nCgsYYt00pljrYmsv5KwxJhxnApzK78jzXsSDP7mxs7Bnj
   MJdse/ahxOXMv5NWwD/lXD5sCm3SDws7dOE+hnn0xGfzUCZOs+GgGcDTs
   TiMXKI7KTOQOU3WyC/H50+wpObD5JmB8ggHzbocHk820FYl8OnHchY7uO
   wJAgkjmMFWgAxXW6rKOUNqIqrUd2ETqEYWxLwDUMpN59/7wCJnoS9VWC7
   DIE1rq1LKdhHGk58QHLA/OoAelJFcaD1Usl9pvZbcpcBOBlxB9Tr1h4Uh
   A==;
X-CSE-ConnectionGUID: ITU9hlITSiS/GxJmDKGFrQ==
X-CSE-MsgGUID: bUAhwfUNTC6Nw3O7by2xyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50824785"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50824785"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:00:58 -0700
X-CSE-ConnectionGUID: tS3tKUMORYijbrNpR1JVCQ==
X-CSE-MsgGUID: HcTHtrD6Sw2+Bcg7ltMzCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176156140"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 07:00:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMofm-0003Bl-2K;
	Wed, 04 Jun 2025 14:00:54 +0000
Date: Wed, 4 Jun 2025 22:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/repro-irq-loop 25/26] kernel/softirq.c:642:22: error: no
 member named 'rcu_read_unlock_special' in 'struct task_struct'
Message-ID: <202506042116.qdOac1Qk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/repro-irq-loop
head:   fa3bc34561eb0c8d8d6a0634a8cb953083255117
commit: 9b64249e95c159447bf6ca5adcd2fea32a91491d [25/26] HACK: Force rcu_r_u_s in tick_irq_exit()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250604/202506042116.qdOac1Qk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042116.qdOac1Qk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042116.qdOac1Qk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:524:10: note: expanded from macro '__native_word'
     524 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:524:39: note: expanded from macro '__native_word'
     524 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:525:10: note: expanded from macro '__native_word'
     525 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:525:38: note: expanded from macro '__native_word'
     525 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   include/asm-generic/rwonce.h:55:20: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
>> kernel/softirq.c:642:22: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     642 |         WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
         |                    ~~~~~~~  ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   7 errors generated.


vim +642 kernel/softirq.c

   638	
   639	static inline void tick_irq_exit(void)
   640	{
   641		rcu_read_lock();
 > 642		WRITE_ONCE(current->rcu_read_unlock_special.b.need_qs, true);
   643		rcu_read_unlock();
   644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
