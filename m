Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB922619;
	Fri, 17 Jan 2025 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737098406; cv=none; b=qufRstTY36BLZ8C0E9hqKkl1hTHm44Vhkggc2jiEe9c1hRfChNkmCKa1/IlOyNCxFIXuDHvAO72bjuI7jzR+dTdr3ArnhFJTAe2VkvpGVfM0QDRS6+L7VrEl8F0gyqpmj2gCWNM1FjILSyYwKi704Eoyc1UQT5s/GDzF662yjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737098406; c=relaxed/simple;
	bh=9OqbDH8cFpvGxPnAlZOcAheuxt1jMIT28WNum3S8wzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLVWL03zSmcWQOeaxgwRPdiO/ek8uGVFDaKmoRPV02LeijXh8NNTb6o/TDh3IsqBN6fEYoSgAeQqUUWtoP6ypj3mQ0eXOUM1KZbI7PQ3OrhFm7EfMJI4v3WkjkbT4WsyRLV42FMv4sV7NcOa9K4M7vDrD+n97KYdHWarJrDBB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfhJWrjO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfhJWrjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737098405; x=1768634405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OqbDH8cFpvGxPnAlZOcAheuxt1jMIT28WNum3S8wzw=;
  b=RfhJWrjOpwsSwhmQ2PfPRYmaZ/TGgF566sxAlOUYfs8BVtblBIZOnRcj
   mu9UYHKoR4dNlDHOTckxWHxUH66iN81HYrsLDbKUxzOqskOPFUpDfKLPP
   uNi98qMAQbEpladEkr6X50O6N2ZtQMqNsJ8eQy5fBEQLBcJhsTbQNlIjr
   RbdP5dFgOKLq0yd9wnZjuGbyfZNS7l8F2i/QZXZyF+iZye5z3BQbCcaS6
   aTzZRhiEo7EVEDJfeGcM6Zagf3WHA0NnbzrzF7llnQyZU6jczrUux6fXX
   yCyh85NQfKdMJNG1j3HCH8aRLO8QsXPlz4Tfr/QDLkx7f7VdZYMKoOcFK
   g==;
X-CSE-ConnectionGUID: c/Bf+KQSS2+4ALbhnflHCw==
X-CSE-MsgGUID: 4pMhmuHcSIiov6JElKBtuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="62894103"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="62894103"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 23:20:04 -0800
X-CSE-ConnectionGUID: l8+2YN6ZQFuIbQzb9mXB5g==
X-CSE-MsgGUID: NDzvrDPqQWaHbl9F4Porgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="106318386"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 23:20:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYge9-000Sub-0o;
	Fri, 17 Jan 2025 07:20:01 +0000
Date: Fri, 17 Jan 2025 15:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 27/36] include/linux/unwind_deferred.h:49:6:
 warning: no previous prototype for function 'unwind_deferred_cancel'
Message-ID: <202501171532.NKzVp1XB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   dc92bc7c1009e5d80cd83d21ead7228bc6887c23
commit: 0b9c279e2f1ea50bbb9d78c3a3744e2d4df4a441 [27/36] unwind: Add deferred userspace unwinding API
config: i386-buildonly-randconfig-002-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171532.NKzVp1XB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171532.NKzVp1XB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171532.NKzVp1XB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/entry/common.c:13:
   In file included from include/linux/entry-common.h:6:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/x86/entry/common.c:13:
   In file included from include/linux/entry-common.h:15:
>> include/linux/unwind_deferred.h:49:6: warning: no previous prototype for function 'unwind_deferred_cancel' [-Wmissing-prototypes]
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         |      ^
   include/linux/unwind_deferred.h:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         | ^
         | static 
   In file included from arch/x86/entry/common.c:13:
   include/linux/entry-common.h:366:2: error: call to undeclared function 'unwind_exit_to_user_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     366 |         unwind_exit_to_user_mode();
         |         ^
   include/linux/entry-common.h:366:2: note: did you mean 'arch_exit_to_user_mode'?
   include/linux/entry-common.h:290:29: note: 'arch_exit_to_user_mode' declared here
     290 | static __always_inline void arch_exit_to_user_mode(void);
         |                             ^
   arch/x86/include/asm/entry-common.h:102:32: note: expanded from macro 'arch_exit_to_user_mode'
     102 | #define arch_exit_to_user_mode arch_exit_to_user_mode
         |                                ^
   2 warnings and 1 error generated.


vim +/unwind_deferred_cancel +49 include/linux/unwind_deferred.h

    46	
    47	static inline void unwind_deferred_init(struct unwind_work *work, unwind_callback_t func) {}
    48	static inline int unwind_deferred_request(struct task_struct *task, struct unwind_work *work, u64 *cookie) { return -ENOSYS; }
  > 49	bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
