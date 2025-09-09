Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F91B245016;
	Tue,  9 Sep 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409102; cv=none; b=rmeNRRDkfADd9bMJZWTRKwgmUjEiQSW3mYBnz4l8B+KO7xWlM7hspVGLd0y5loVD+fTgth9ntAeksfS8IcmQmQ3qF07Vnx2N9bGgWG60Te0AINCV8APCj2vtzQ9hhaZhK4rLy3nmtmRA9VtRluryywx+LjnHS9mXJIgbexzAOCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409102; c=relaxed/simple;
	bh=2M5iv9kgM7IimGSdjwbDnFvaxL772sNfvRUBJztjviE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JsA1Sugs+YxF1jNFO8dyB5KrZOCJYy90WGFlsty2fryBoIHrkeDbzLKrlYwux5WyH8z/yY15rmKni2Ej1TSOv2Gtv/efqMIsG4oqnLMT4TiMqP5Uiyv4o60HwIwbYfVfOTb+aZl6ipY/iD38b6GUQOw5DNgaNvzb9aYuJh254x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDt3e59k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDt3e59k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757409099; x=1788945099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2M5iv9kgM7IimGSdjwbDnFvaxL772sNfvRUBJztjviE=;
  b=JDt3e59kfiZXE12ZKnOu+H16+ATBbbHAzQp60OhCYPH8uz9eyMrl7caS
   ibZR4mzgU1HCZG03JUr5LZGjcRTdV9D0z63OuMDFPMHJEIImYJI61TPL+
   Vd8vv4mPpjV1xve8EFHH+/miWDJyL7RYhofTNTosDGuBEvnjsDeTmrwHC
   SSQNW1C6yAUWxShMUTuHD/MvjN+QcxmKkB+1fXy2xOyGHqP20jEDwUkkh
   4/hS8U7KhH+E0CzsZ+jtmZgpYXbIHV497omdKAu4BRhOPQs8+VeiDibq7
   5zQ7hJn++EgB6ykeJECj/LLZ8W1IYiR4Hd6vnnTXYQpj6yewSiN7HverU
   Q==;
X-CSE-ConnectionGUID: ARhOzKUsSya+KMtw007cAQ==
X-CSE-MsgGUID: zA4NxB1STgW6XsNJOKkBpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="71103596"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="71103596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:11:39 -0700
X-CSE-ConnectionGUID: i/oPDO+eTwujhmTcuf21ew==
X-CSE-MsgGUID: pQc9ba2AQiSCW0PQ3UJeRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173499281"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2025 02:11:37 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvuNy-0004gl-2w;
	Tue, 09 Sep 2025 09:11:34 +0000
Date: Tue, 9 Sep 2025 17:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 28/53] drivers/tty/vt/keyboard.c:1789:7: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202509091702.Oc7eCRDw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   71311086e214f78774f7c36ef14866b211ea94df
commit: 215a9ed05f527245cba11f20f81cf39637088b78 [28/53] vt/keyboard: use __free()
config: arm64-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091702.Oc7eCRDw-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091702.Oc7eCRDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091702.Oc7eCRDw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/vt/keyboard.c:1789:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
                   __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
           asm_goto_output(                                                \
           ^
   include/linux/compiler_types.h:488:31: note: expanded from macro 'asm_goto_output'
   #define asm_goto_output(x...) asm volatile goto(x)
                                 ^
   drivers/tty/vt/keyboard.c:1736:7: note: possible target of asm goto statement
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1784:23: note: jump exits scope of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = NULL;
                                       ^
   drivers/tty/vt/keyboard.c:1722:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
                                       ^
   drivers/tty/vt/keyboard.c:1712:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:339:3: note: expanded from macro '__raw_put_user'
                   __raw_put_mem("sttr", __rpu_val, __rpu_ptr, __rpu_failed, U);   \
                   ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
                   __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
           asm goto(                                                       \
           ^
   drivers/tty/vt/keyboard.c:1736:7: note: possible target of asm goto statement
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1692:33: note: jump exits scope of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
                                                 ^
   drivers/tty/vt/keyboard.c:1722:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
                                       ^
   drivers/tty/vt/keyboard.c:1753:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
                   __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
                   ^
--
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:245:2: note: expanded from macro '__raw_get_user'
           __rgu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1692:33: note: jump exits scope of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
                                                 ^
   drivers/tty/vt/keyboard.c:1784:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = NULL;
                                       ^
   drivers/tty/vt/keyboard.c:1753:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
                   __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
           asm_goto_output(                                                \
           ^
   include/linux/compiler_types.h:488:31: note: expanded from macro 'asm_goto_output'
   #define asm_goto_output(x...) asm volatile goto(x)
                                 ^
   drivers/tty/vt/keyboard.c:1789:7: note: possible target of asm goto statement
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:245:2: note: expanded from macro '__raw_get_user'
           __rgu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1747:33: note: jump exits scope of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = NULL;
                                                 ^
   drivers/tty/vt/keyboard.c:1784:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = NULL;
                                       ^
   drivers/tty/vt/keyboard.c:1736:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:339:3: note: expanded from macro '__raw_put_user'
                   __raw_put_mem("sttr", __rpu_val, __rpu_ptr, __rpu_failed, U);   \
                   ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
                   __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
           asm goto(                                                       \
           ^
   drivers/tty/vt/keyboard.c:1712:7: note: possible target of asm goto statement
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1722:23: note: jump exits scope of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
                                       ^
   drivers/tty/vt/keyboard.c:1692:33: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
                                                 ^
>> drivers/tty/vt/keyboard.c:1789:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
                   __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
           asm_goto_output(                                                \
           ^
   include/linux/compiler_types.h:488:31: note: expanded from macro 'asm_goto_output'
   #define asm_goto_output(x...) asm volatile goto(x)
                                 ^
   drivers/tty/vt/keyboard.c:1712:7: note: possible target of asm goto statement
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1784:23: note: jump exits scope of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = NULL;
                                       ^
   drivers/tty/vt/keyboard.c:1692:33: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
                                                 ^
   drivers/tty/vt/keyboard.c:1753:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
                   __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
           asm_goto_output(                                                \
           ^
   include/linux/compiler_types.h:488:31: note: expanded from macro 'asm_goto_output'
   #define asm_goto_output(x...) asm volatile goto(x)
                                 ^
   drivers/tty/vt/keyboard.c:1712:7: note: possible target of asm goto statement
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:342:2: note: expanded from macro '__raw_put_user'
           __rpu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1747:33: note: jump exits scope of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = NULL;
                                                 ^
   drivers/tty/vt/keyboard.c:1692:33: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
                                                 ^
   drivers/tty/vt/keyboard.c:1736:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:339:3: note: expanded from macro '__raw_put_user'
                   __raw_put_mem("sttr", __rpu_val, __rpu_ptr, __rpu_failed, U);   \
                   ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
                   __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
           asm goto(                                                       \
           ^
   drivers/tty/vt/keyboard.c:1753:7: note: possible target of asm goto statement
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:245:2: note: expanded from macro '__raw_get_user'
           __rgu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1722:23: note: jump exits scope of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
                                       ^
   drivers/tty/vt/keyboard.c:1747:33: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = NULL;
                                                 ^
>> drivers/tty/vt/keyboard.c:1789:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
                   __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
           asm_goto_output(                                                \
           ^
   include/linux/compiler_types.h:488:31: note: expanded from macro 'asm_goto_output'
   #define asm_goto_output(x...) asm volatile goto(x)
                                 ^
   drivers/tty/vt/keyboard.c:1753:7: note: possible target of asm goto statement
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:245:2: note: expanded from macro '__raw_get_user'
           __rgu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1784:23: note: jump exits scope of variable with __attribute__((cleanup))
                   void __free(kfree) *buf = NULL;
                                       ^
   drivers/tty/vt/keyboard.c:1747:33: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = NULL;
                                                 ^
   drivers/tty/vt/keyboard.c:1712:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (put_user(asize, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:369:18: note: expanded from macro 'put_user'
   #define put_user        __put_user
                           ^
   arch/arm64/include/asm/uaccess.h:365:2: note: expanded from macro '__put_user'
           __put_user_error((x), (ptr), __pu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:355:3: note: expanded from macro '__put_user_error'
                   __raw_put_user((x), __p, __pu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:339:3: note: expanded from macro '__raw_put_user'
                   __raw_put_mem("sttr", __rpu_val, __rpu_ptr, __rpu_failed, U);   \
                   ^
   arch/arm64/include/asm/uaccess.h:309:3: note: expanded from macro '__raw_put_mem'
                   __put_mem_asm(str "b", "%w", __pu_val, (ptr), label, type);     \
                   ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
           asm goto(                                                       \
           ^
   drivers/tty/vt/keyboard.c:1753:7: note: possible target of asm goto statement
                   if (get_user(ct, &a->kb_cnt))
                       ^
   arch/arm64/include/asm/uaccess.h:272:18: note: expanded from macro 'get_user'
   #define get_user        __get_user
                           ^
   arch/arm64/include/asm/uaccess.h:268:2: note: expanded from macro '__get_user'
           __get_user_error((x), (ptr), __gu_err);                         \
           ^
   arch/arm64/include/asm/uaccess.h:258:3: note: expanded from macro '__get_user_error'
                   __raw_get_user((x), __p, __gu_failed);                  \
                   ^
   arch/arm64/include/asm/uaccess.h:245:2: note: expanded from macro '__raw_get_user'
           __rgu_failed:                                                   \
           ^
   drivers/tty/vt/keyboard.c:1692:33: note: jump exits scope of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
                                                 ^
   drivers/tty/vt/keyboard.c:1747:33: note: jump bypasses initialization of variable with __attribute__((cleanup))
                   struct kbdiacr __free(kfree) *dia = NULL;
                                                 ^
   12 errors generated.


vim +1789 drivers/tty/vt/keyboard.c

247ff8e610cb63 Alan Cox              2012-02-24  1671  
247ff8e610cb63 Alan Cox              2012-02-24  1672  /**
247ff8e610cb63 Alan Cox              2012-02-24  1673   *	vt_do_diacrit		-	diacritical table updates
247ff8e610cb63 Alan Cox              2012-02-24  1674   *	@cmd: ioctl request
9d329c1c68d2cc Mark Rustad           2014-09-05  1675   *	@udp: pointer to user data for ioctl
247ff8e610cb63 Alan Cox              2012-02-24  1676   *	@perm: permissions check computed by caller
247ff8e610cb63 Alan Cox              2012-02-24  1677   *
247ff8e610cb63 Alan Cox              2012-02-24  1678   *	Update the diacritical tables atomically and safely. Lock them
247ff8e610cb63 Alan Cox              2012-02-24  1679   *	against simultaneous keypresses
247ff8e610cb63 Alan Cox              2012-02-24  1680   */
9d329c1c68d2cc Mark Rustad           2014-09-05  1681  int vt_do_diacrit(unsigned int cmd, void __user *udp, int perm)
247ff8e610cb63 Alan Cox              2012-02-24  1682  {
247ff8e610cb63 Alan Cox              2012-02-24  1683  	unsigned long flags;
247ff8e610cb63 Alan Cox              2012-02-24  1684  	int asize;
247ff8e610cb63 Alan Cox              2012-02-24  1685  
247ff8e610cb63 Alan Cox              2012-02-24  1686  	switch (cmd) {
247ff8e610cb63 Alan Cox              2012-02-24  1687  	case KDGKBDIACR:
247ff8e610cb63 Alan Cox              2012-02-24  1688  	{
9d329c1c68d2cc Mark Rustad           2014-09-05  1689  		struct kbdiacrs __user *a = udp;
247ff8e610cb63 Alan Cox              2012-02-24  1690  		int i;
247ff8e610cb63 Alan Cox              2012-02-24  1691  
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1692) 		struct kbdiacr __free(kfree) *dia = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacr),
247ff8e610cb63 Alan Cox              2012-02-24  1693  								  GFP_KERNEL);
9d329c1c68d2cc Mark Rustad           2014-09-05  1694  		if (!dia)
247ff8e610cb63 Alan Cox              2012-02-24  1695  			return -ENOMEM;
247ff8e610cb63 Alan Cox              2012-02-24  1696  
247ff8e610cb63 Alan Cox              2012-02-24  1697  		/* Lock the diacriticals table, make a copy and then
247ff8e610cb63 Alan Cox              2012-02-24  1698  		   copy it after we unlock */
247ff8e610cb63 Alan Cox              2012-02-24  1699  		spin_lock_irqsave(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1700  
247ff8e610cb63 Alan Cox              2012-02-24  1701  		asize = accent_table_size;
247ff8e610cb63 Alan Cox              2012-02-24  1702  		for (i = 0; i < asize; i++) {
9d329c1c68d2cc Mark Rustad           2014-09-05  1703  			dia[i].diacr = conv_uni_to_8bit(
247ff8e610cb63 Alan Cox              2012-02-24  1704  						accent_table[i].diacr);
9d329c1c68d2cc Mark Rustad           2014-09-05  1705  			dia[i].base = conv_uni_to_8bit(
247ff8e610cb63 Alan Cox              2012-02-24  1706  						accent_table[i].base);
9d329c1c68d2cc Mark Rustad           2014-09-05  1707  			dia[i].result = conv_uni_to_8bit(
247ff8e610cb63 Alan Cox              2012-02-24  1708  						accent_table[i].result);
247ff8e610cb63 Alan Cox              2012-02-24  1709  		}
247ff8e610cb63 Alan Cox              2012-02-24  1710  		spin_unlock_irqrestore(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1711  
247ff8e610cb63 Alan Cox              2012-02-24  1712  		if (put_user(asize, &a->kb_cnt))
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1713) 			return -EFAULT;
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1714) 		if (copy_to_user(a->kbdiacr, dia, asize * sizeof(struct kbdiacr)))
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1715) 			return -EFAULT;
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1716) 		return 0;
247ff8e610cb63 Alan Cox              2012-02-24  1717  	}
247ff8e610cb63 Alan Cox              2012-02-24  1718  	case KDGKBDIACRUC:
247ff8e610cb63 Alan Cox              2012-02-24  1719  	{
9d329c1c68d2cc Mark Rustad           2014-09-05  1720  		struct kbdiacrsuc __user *a = udp;
247ff8e610cb63 Alan Cox              2012-02-24  1721  
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1722) 		void __free(kfree) *buf = kmalloc_array(MAX_DIACR, sizeof(struct kbdiacruc),
247ff8e610cb63 Alan Cox              2012-02-24  1723  							GFP_KERNEL);
247ff8e610cb63 Alan Cox              2012-02-24  1724  		if (buf == NULL)
247ff8e610cb63 Alan Cox              2012-02-24  1725  			return -ENOMEM;
247ff8e610cb63 Alan Cox              2012-02-24  1726  
247ff8e610cb63 Alan Cox              2012-02-24  1727  		/* Lock the diacriticals table, make a copy and then
247ff8e610cb63 Alan Cox              2012-02-24  1728  		   copy it after we unlock */
247ff8e610cb63 Alan Cox              2012-02-24  1729  		spin_lock_irqsave(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1730  
247ff8e610cb63 Alan Cox              2012-02-24  1731  		asize = accent_table_size;
247ff8e610cb63 Alan Cox              2012-02-24  1732  		memcpy(buf, accent_table, asize * sizeof(struct kbdiacruc));
247ff8e610cb63 Alan Cox              2012-02-24  1733  
247ff8e610cb63 Alan Cox              2012-02-24  1734  		spin_unlock_irqrestore(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1735  
247ff8e610cb63 Alan Cox              2012-02-24  1736  		if (put_user(asize, &a->kb_cnt))
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1737) 			return -EFAULT;
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1738) 		if (copy_to_user(a->kbdiacruc, buf, asize * sizeof(struct kbdiacruc)))
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1739) 			return -EFAULT;
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1740) 
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1741) 		return 0;
247ff8e610cb63 Alan Cox              2012-02-24  1742  	}
247ff8e610cb63 Alan Cox              2012-02-24  1743  
247ff8e610cb63 Alan Cox              2012-02-24  1744  	case KDSKBDIACR:
247ff8e610cb63 Alan Cox              2012-02-24  1745  	{
9d329c1c68d2cc Mark Rustad           2014-09-05  1746  		struct kbdiacrs __user *a = udp;
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1747) 		struct kbdiacr __free(kfree) *dia = NULL;
247ff8e610cb63 Alan Cox              2012-02-24  1748  		unsigned int ct;
247ff8e610cb63 Alan Cox              2012-02-24  1749  		int i;
247ff8e610cb63 Alan Cox              2012-02-24  1750  
247ff8e610cb63 Alan Cox              2012-02-24  1751  		if (!perm)
247ff8e610cb63 Alan Cox              2012-02-24  1752  			return -EPERM;
247ff8e610cb63 Alan Cox              2012-02-24  1753  		if (get_user(ct, &a->kb_cnt))
247ff8e610cb63 Alan Cox              2012-02-24  1754  			return -EFAULT;
247ff8e610cb63 Alan Cox              2012-02-24  1755  		if (ct >= MAX_DIACR)
247ff8e610cb63 Alan Cox              2012-02-24  1756  			return -EINVAL;
247ff8e610cb63 Alan Cox              2012-02-24  1757  
247ff8e610cb63 Alan Cox              2012-02-24  1758  		if (ct) {
e651faa2fba4d3 Philipp Stanner       2023-11-03  1759  			dia = memdup_array_user(a->kbdiacr,
e651faa2fba4d3 Philipp Stanner       2023-11-03  1760  						ct, sizeof(struct kbdiacr));
1051937d465665 Saurabh Sengar        2015-10-28  1761  			if (IS_ERR(dia))
1051937d465665 Saurabh Sengar        2015-10-28  1762  				return PTR_ERR(dia);
247ff8e610cb63 Alan Cox              2012-02-24  1763  		}
247ff8e610cb63 Alan Cox              2012-02-24  1764  
247ff8e610cb63 Alan Cox              2012-02-24  1765  		spin_lock_irqsave(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1766  		accent_table_size = ct;
247ff8e610cb63 Alan Cox              2012-02-24  1767  		for (i = 0; i < ct; i++) {
247ff8e610cb63 Alan Cox              2012-02-24  1768  			accent_table[i].diacr =
9d329c1c68d2cc Mark Rustad           2014-09-05  1769  					conv_8bit_to_uni(dia[i].diacr);
247ff8e610cb63 Alan Cox              2012-02-24  1770  			accent_table[i].base =
9d329c1c68d2cc Mark Rustad           2014-09-05  1771  					conv_8bit_to_uni(dia[i].base);
247ff8e610cb63 Alan Cox              2012-02-24  1772  			accent_table[i].result =
9d329c1c68d2cc Mark Rustad           2014-09-05  1773  					conv_8bit_to_uni(dia[i].result);
247ff8e610cb63 Alan Cox              2012-02-24  1774  		}
247ff8e610cb63 Alan Cox              2012-02-24  1775  		spin_unlock_irqrestore(&kbd_event_lock, flags);
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1776) 
247ff8e610cb63 Alan Cox              2012-02-24  1777  		return 0;
247ff8e610cb63 Alan Cox              2012-02-24  1778  	}
247ff8e610cb63 Alan Cox              2012-02-24  1779  
247ff8e610cb63 Alan Cox              2012-02-24  1780  	case KDSKBDIACRUC:
247ff8e610cb63 Alan Cox              2012-02-24  1781  	{
9d329c1c68d2cc Mark Rustad           2014-09-05  1782  		struct kbdiacrsuc __user *a = udp;
247ff8e610cb63 Alan Cox              2012-02-24  1783  		unsigned int ct;
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1784) 		void __free(kfree) *buf = NULL;
247ff8e610cb63 Alan Cox              2012-02-24  1785  
247ff8e610cb63 Alan Cox              2012-02-24  1786  		if (!perm)
247ff8e610cb63 Alan Cox              2012-02-24  1787  			return -EPERM;
247ff8e610cb63 Alan Cox              2012-02-24  1788  
247ff8e610cb63 Alan Cox              2012-02-24 @1789  		if (get_user(ct, &a->kb_cnt))
247ff8e610cb63 Alan Cox              2012-02-24  1790  			return -EFAULT;
247ff8e610cb63 Alan Cox              2012-02-24  1791  
247ff8e610cb63 Alan Cox              2012-02-24  1792  		if (ct >= MAX_DIACR)
247ff8e610cb63 Alan Cox              2012-02-24  1793  			return -EINVAL;
247ff8e610cb63 Alan Cox              2012-02-24  1794  
247ff8e610cb63 Alan Cox              2012-02-24  1795  		if (ct) {
e651faa2fba4d3 Philipp Stanner       2023-11-03  1796  			buf = memdup_array_user(a->kbdiacruc,
e651faa2fba4d3 Philipp Stanner       2023-11-03  1797  						ct, sizeof(struct kbdiacruc));
9b6519009dbe2b Muhammad Falak R Wani 2016-05-20  1798  			if (IS_ERR(buf))
9b6519009dbe2b Muhammad Falak R Wani 2016-05-20  1799  				return PTR_ERR(buf);
247ff8e610cb63 Alan Cox              2012-02-24  1800  		} 
247ff8e610cb63 Alan Cox              2012-02-24  1801  		spin_lock_irqsave(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1802  		if (ct)
247ff8e610cb63 Alan Cox              2012-02-24  1803  			memcpy(accent_table, buf,
247ff8e610cb63 Alan Cox              2012-02-24  1804  					ct * sizeof(struct kbdiacruc));
247ff8e610cb63 Alan Cox              2012-02-24  1805  		accent_table_size = ct;
247ff8e610cb63 Alan Cox              2012-02-24  1806  		spin_unlock_irqrestore(&kbd_event_lock, flags);
247ff8e610cb63 Alan Cox              2012-02-24  1807  		return 0;
247ff8e610cb63 Alan Cox              2012-02-24  1808  	}
247ff8e610cb63 Alan Cox              2012-02-24  1809  	}
215a9ed05f5272 Jiri Slaby (SUSE      2025-08-19  1810) 	return 0;
247ff8e610cb63 Alan Cox              2012-02-24  1811  }
079c9534a96da9 Alan Cox              2012-02-28  1812  

:::::: The code at line 1789 was first introduced by commit
:::::: 247ff8e610cb63c015de19191db9666754c2ed79 vt: lock the accent table

:::::: TO: Alan Cox <alan@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
