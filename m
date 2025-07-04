Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96202360;
	Fri,  4 Jul 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751587482; cv=none; b=sn/zYRjzTo3HLa/wgo4xLU5EAH3kpwiAaF3zqKuAXEX2A2VNwSOSik9OY1jPKrEBZarzpSOFDGg/x97krY7NvcwKg1AfCuUaRj9c/B3kp6DlckxvZWrvG9Dq9PScbAptirByvvmY5Jp/iPhrZ9tpz2AJlwPPwoVCO62kWT6rITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751587482; c=relaxed/simple;
	bh=5dv42JiBk97qXg8ArWBRNahlctmyVmOm2d0YBU/e0j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcOz7ePogaE4e2cExZfGgF4n7iiPUxjNUFJWd4s5E2w7HvtBxe4h70tyhSigteSXR6wCAwKmuZj7mHwvedE0AVcPB2Al0qfMXvQoyyVgljzmaIKqS9J3rRwzcShzQgS66tXDezJm3J8rL6r9P9R/UfS71DCjfVRiOrxardH31Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9aaYT5x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9aaYT5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751587480; x=1783123480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dv42JiBk97qXg8ArWBRNahlctmyVmOm2d0YBU/e0j8=;
  b=n9aaYT5x/Te+b6lzJyiG3NUTh3124YDIMvIs+6GDLbiQ2v+S0204BvXn
   yRMIlJqhITcaHycj5DQ+2/4+gkYkKwG65f94tiEDK+VVEFcsvw2ui27OA
   dBP0MUtNNAYJ29pt4hARQoJkkBsuE7f5f3gtTsrC/5u46ZROiU0TyEPxv
   K/Y7PCSBLF2Xri7i8/reVEmUJdSLeUI82dE58zFqI+RVk5ZVAsWnxLP4c
   2zX9K5W4gGw53Add2m0MP78ZrmelkuGpajC/j1s8/EUovwD/vmzq3XcYS
   3Ytw5tnNpKk196vUvebNn2NwFB13SwCbUMZ5kSPpUglA8TWSLX1OSIcKW
   w==;
X-CSE-ConnectionGUID: 8kV8cxwsRQiGnj6CE58W+w==
X-CSE-MsgGUID: jp7jtqXJRlyaq/4ObmBU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56547246"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="56547246"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 17:04:39 -0700
X-CSE-ConnectionGUID: 14K3srIcQzC0rSRrhf1ZnQ==
X-CSE-MsgGUID: rITyVvasS7S4NPGdzgtRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="153930201"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2025 17:04:37 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXTus-00038V-2w;
	Fri, 04 Jul 2025 00:04:34 +0000
Date: Fri, 4 Jul 2025 08:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 4/7] kernel/rcu/tree.c:764:16: error: no
 member named 'rcu_read_unlock_special' in 'struct task_struct'
Message-ID: <202507040724.D5nyo4ld-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   19450082dae4c12bdd2b7cee28961eb27227a8fd
commit: 7ccc41afea53b41ec9c8f3d77e877062a23184dc [4/7] rcu: Add helper functions for task and cpu_no_qs flag setting
config: i386-buildonly-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040724.D5nyo4ld-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040724.D5nyo4ld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040724.D5nyo4ld-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:529:10: note: expanded from macro '__native_word'
     529 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:529:39: note: expanded from macro '__native_word'
     529 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:10: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:38: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   include/asm-generic/rwonce.h:55:20: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
>> kernel/rcu/tree.c:764:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     764 |         WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   kernel/rcu/tree.c:772:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     772 |         WRITE_ONCE(t->rcu_read_unlock_special.b.need_qs, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:529:10: note: expanded from macro '__native_word'
     529 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:772:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     772 |         WRITE_ONCE(t->rcu_read_unlock_special.b.need_qs, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:529:39: note: expanded from macro '__native_word'
     529 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:772:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     772 |         WRITE_ONCE(t->rcu_read_unlock_special.b.need_qs, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:10: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:772:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     772 |         WRITE_ONCE(t->rcu_read_unlock_special.b.need_qs, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:38: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:772:16: error: no member named 'rcu_read_unlock_special' in 'struct task_struct'
     772 |         WRITE_ONCE(t->rcu_read_unlock_special.b.need_qs, value);
         |                    ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \


vim +764 kernel/rcu/tree.c

   758	
   759	/**
   760	 * rcu_set_blocked - Set blocked flag in task's rcu_special union
   761	 */
   762	void rcu_set_blocked(struct task_struct *t, bool value)
   763	{
 > 764		WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
   765	}
   766	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
