Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149042D8368;
	Mon, 27 Oct 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761601646; cv=none; b=OrLLe0DF0qgEFfoEeYI7Z19x5wsBfQEkOrrvqoTSdCcEQI2xgePPFl5DpW0LQXI6UN9aPJcexRm8rPntvyBRdmgwXco+bEw1sQyTU4Z57G5Gd5gLGiFr3sT7uLfnP+Ii/T/BBOwxM8MEGl1S/wBujO94rgp67qBMP29AnvVK3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761601646; c=relaxed/simple;
	bh=tA1Cr9FQIEMuJWZXyNQjjjb8hVQJ7bMEl41bTmAorgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEwqL/IlcfEzdNuR07PVaKUDCYddKw9lEfTzC3Eej8u++l5YlkuUtb+aKrqu24EU4zS74mMYCPIUtxIQl3vLFVVnHcJg1G3B501HMeIaoktZR+DMASrDmYa/HUAlx6yfQPSVICX5OvM2RrxRCQKr4ND1A31raMR6hJbvDyrwe/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3IDPvbY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3IDPvbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761601643; x=1793137643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tA1Cr9FQIEMuJWZXyNQjjjb8hVQJ7bMEl41bTmAorgE=;
  b=N3IDPvbYY63YLJ0lNBlWf6zbq0q9sqzyWU3Vyi4RTpjtvWUPAPqjLbA/
   /YDyMM26kOr6zLSMIU5z9xi5vhhZssT7ApzQ6g0xIE5PFYrTrtIuYE0Rf
   A0JK6zlmgtjGX5lbcB2gy3MblHRTxQ+zbM92OSSuuq7+I0pVcUmF1G+nb
   XoajZY1AQ25BZVPPU3EdzYIGXyh0nR9tIURaTTp+wFMKsWPaLBa9TBoj/
   yZsiqb9iMrOwHHdUcZ9TwybZgkeRHj2wqZ8ThPD71u/mbA5uHFr3mX6sX
   ciFI5trNPTPknttgulERwnq0KbM0EWOYaOi3iHrB4DC6Tv8O+yqn7U8Nf
   w==;
X-CSE-ConnectionGUID: prrywFozSay6P70g9dyEbg==
X-CSE-MsgGUID: f7Zya+HTT2mfyl4m8VkvDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89163405"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="89163405"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 14:47:22 -0700
X-CSE-ConnectionGUID: vLvtWSkfRtqpkT7jBki4FA==
X-CSE-MsgGUID: MocNLfJQTCS6hi8Eq6BNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185629087"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2025 14:47:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDV3O-000IUj-2v;
	Mon, 27 Oct 2025 21:47:08 +0000
Date: Tue, 28 Oct 2025 05:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 12/75] fs/select.c:781:4: error: cannot jump
 from this asm goto statement to one of its possible targets
Message-ID: <202510280558.3H6jqQEP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   7b95ad81f6a1e0d08a1e481f74e83a8a49c3ec30
commit: 3966353ab775f0ea62f580b255cb7316e1207995 [12/75] select: Convert to scoped user access
config: arm64-randconfig-001-20251027 (https://download.01.org/0day-ci/archive/20251028/202510280558.3H6jqQEP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280558.3H6jqQEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280558.3H6jqQEP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:220:3: note: expanded from macro '__raw_get_mem'
     220 |                 __get_mem_asm(ldr, "%x",  __gu_val, (ptr), label, type);        \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_user_read_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:217:3: note: expanded from macro '__raw_get_mem'
     217 |                 __get_mem_asm(ldr, "%w", __gu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_user_read_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:214:3: note: expanded from macro '__raw_get_mem'
     214 |                 __get_mem_asm(ldr "h", "%w", __gu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_user_read_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
     211 |                 __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_user_read_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   fs/select.c:780:4: error: cannot jump from this asm goto statement to one of its possible targets
     780 |                         unsafe_get_user(to->p, &from->p, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:220:3: note: expanded from macro '__raw_get_mem'
     220 |                 __get_mem_asm(ldr, "%x",  __gu_val, (ptr), label, type);        \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_user_read_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   fs/select.c:780:4: error: cannot jump from this asm goto statement to one of its possible targets
     780 |                         unsafe_get_user(to->p, &from->p, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:217:3: note: expanded from macro '__raw_get_mem'
     217 |                 __get_mem_asm(ldr, "%w", __gu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_user_read_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   fs/select.c:780:4: error: cannot jump from this asm goto statement to one of its possible targets
     780 |                         unsafe_get_user(to->p, &from->p, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:214:3: note: expanded from macro '__raw_get_mem'
     214 |                 __get_mem_asm(ldr "h", "%w", __gu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \


vim +781 fs/select.c

7e71609f64ec81 Al Viro         2020-02-19  773  
7e71609f64ec81 Al Viro         2020-02-19  774  static inline int get_sigset_argpack(struct sigset_argpack *to,
7e71609f64ec81 Al Viro         2020-02-19  775  				     struct sigset_argpack __user *from)
7e71609f64ec81 Al Viro         2020-02-19  776  {
7e71609f64ec81 Al Viro         2020-02-19  777  	// the path is hot enough for overhead of copy_from_user() to matter
7e71609f64ec81 Al Viro         2020-02-19  778  	if (from) {
3966353ab775f0 Thomas Gleixner 2025-08-13  779  		scoped_user_read_access(from, Efault) {
7e71609f64ec81 Al Viro         2020-02-19  780  			unsafe_get_user(to->p, &from->p, Efault);
7e71609f64ec81 Al Viro         2020-02-19 @781  			unsafe_get_user(to->size, &from->size, Efault);
3966353ab775f0 Thomas Gleixner 2025-08-13  782  		}
7e71609f64ec81 Al Viro         2020-02-19  783  	}
7e71609f64ec81 Al Viro         2020-02-19  784  	return 0;
7e71609f64ec81 Al Viro         2020-02-19  785  Efault:
7e71609f64ec81 Al Viro         2020-02-19  786  	return -EFAULT;
7e71609f64ec81 Al Viro         2020-02-19  787  }
7e71609f64ec81 Al Viro         2020-02-19  788  

:::::: The code at line 781 was first introduced by commit
:::::: 7e71609f64ec81b8367b7fa59ab06bb571d17e3b pselect6() and friends: take handling the combined 6th/7th args into helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
