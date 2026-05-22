Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFD939E167;
	Fri, 22 May 2026 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428311; cv=none; b=VBhWJNHtjHFYPCQU2gP9laIJ3x6ybd7rSt1BABLjOty8A+zeU+sG0dfNz2/+A9WAEyRM/V1465m+dZqNVpV5PBzIYu+H5hQ4lhAVAC5Mawku5wyi07wnr9mvONyYstTH1Oz+9nT3KBs54Jkoq3XS982Dg0p630nKartGOnRNwNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428311; c=relaxed/simple;
	bh=mhGv1wrWtp/2PwM295aJy4cHFnqCrxQG4dY1eJOHAwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PpzCpFFIfSV2h/I+gEv5w/uO8+gPKPdpoWyKzUWca6X6tqE/rOrDKOU2P+axLj1yKFRFy5aydewMFixMpUEFAkgEu7y6974u/dG4y2ynMog5txISjfnRQGm6zvfURNUmrDvVySGUtMJDpwBXcywNq05+UvGQ4Whsy+mNnrw5ucM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIMv3d+W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIMv3d+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779428309; x=1810964309;
  h=date:from:to:cc:subject:message-id;
  bh=mhGv1wrWtp/2PwM295aJy4cHFnqCrxQG4dY1eJOHAwc=;
  b=EIMv3d+WrA+eByNauWFdJc5bFduYXjiyumxYPrace5KSHXYph2Svsb3z
   QOpOf1M3vT2qcxfRAWrst1v1svrNraZK+ldmHKTRj1lVrujBr05qy+fJw
   Cg5SQqzC4OwwLfOTpAtJsgzSX/0vleaVdEgl71MDRKzVZvjthasoC59D0
   qpnha2msUSJxziLXlrExLbAMneR+WQZ4LU7oYMJUhs5G+g6WikrWxZ+jt
   VmDm4iPmPu2RVQDiqdq5/rCQDZZ4GEhEPh3g7pf3+RQiEVKnTT/gC9KZZ
   gaMo8/Uldog9YTMVKiJpcF4zHNOdbQz/MMogmJntCFToqt6BkXlsxhTjf
   Q==;
X-CSE-ConnectionGUID: ustE1S7ZSHWgVIpo3IMxEw==
X-CSE-MsgGUID: 7R+v0aBBTBWcM0iJGcHl9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79505830"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="79505830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 22:38:27 -0700
X-CSE-ConnectionGUID: GyzggtoGSKip5D+fo6F+Tg==
X-CSE-MsgGUID: 1R8ib2k+TreC86aFyCAB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236581677"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 22:38:25 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQIaU-000000001nz-2ABp;
	Fri, 22 May 2026 05:38:22 +0000
Date: Fri, 22 May 2026 13:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 589/1197]
 block/ioctl.c:73:32: error: passing 'typeof (*(&arg->data)) 
 __attribute__((btf_type_tag("user")))*' (aka 'void **') to parameter of type
 'const void  __attribute__((btf_type_tag("user")))*
 __attribute__((btf_type_tag("user")))*' (aka 'const void **') dis...
Message-ID: <202605221308.fjy109H1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: d0e2fdbadb4874f723f8079912937eaa0ba779b7 [589/1197] riscv: cheri: Implement {get,put}_user_ptr
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605221308.fjy109H1-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221308.fjy109H1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221308.fjy109H1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/ioctl.c:73:32: error: passing 'typeof (*(&arg->data))  __attribute__((btf_type_tag("user")))*' (aka 'void **') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      73 |         if (get_user(op, &arg->op) || get_user_ptr(udata, &arg->data))
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:264:23: note: expanded from macro 'get_user_ptr'
     264 |                 __get_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   1 error generated.
--
>> fs/exec.c:369:6: error: incompatible pointer types passing 'typeof (*(argv.ptr.native + nr))  __attribute__((btf_type_tag("user")))*' (aka 'const char *const *') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') [-Wincompatible-pointer-types]
     369 |         if (get_user_ptr(native, argv.ptr.native + nr))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:264:23: note: expanded from macro 'get_user_ptr'
     264 |                 __get_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   1 error generated.
--
>> fs/aio.c:1483:8: error: incompatible pointer types passing 'typeof (*(ctxp))  __attribute__((btf_type_tag("user")))*' (aka 'unsigned long *') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') [-Wincompatible-pointer-types]
    1483 |         ret = get_user_ptr(ctx, ctxp);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:264:23: note: expanded from macro 'get_user_ptr'
     264 |                 __get_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   fs/aio.c:1483:8: error: incompatible pointer to integer conversion assigning to 'aio_context_t' (aka 'unsigned long') from 'void  __attribute__((btf_type_tag("user")))*' (aka 'void *') [-Wint-conversion]
    1483 |         ret = get_user_ptr(ctx, ctxp);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:264:3: note: expanded from macro 'get_user_ptr'
     264 |                 __get_user_ptr((x), __p) :                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:255:6: note: expanded from macro '__get_user_ptr'
     255 |         (x) = __x;                                              \
         |             ^ ~~~
   fs/aio.c:1483:8: error: incompatible pointer to integer conversion assigning to 'aio_context_t' (aka 'unsigned long') from 'void *' [-Wint-conversion]
    1483 |         ret = get_user_ptr(ctx, ctxp);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:265:8: note: expanded from macro 'get_user_ptr'
     265 |                 ((x) = NULL, -EFAULT);                          \
         |                      ^ ~~~~
>> fs/aio.c:1497:9: error: incompatible integer to pointer conversion initializing 'void  __attribute__((btf_type_tag("user")))*' (aka 'void *') with an expression of type 'aio_context_t' (aka 'unsigned long') [-Wint-conversion]
    1497 |                 ret = put_user_ptr(ioctx->user_id, ctxp);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:223:3: note: expanded from macro 'put_user_ptr'
     223 |                 __put_user_ptr((x), __p) :                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:213:15: note: expanded from macro '__put_user_ptr'
     213 |         void __user *__x = (x);                                 \
         |                      ^     ~~~
   fs/aio.c:1497:9: error: incompatible pointer types passing 'typeof (*(ctxp))  __attribute__((btf_type_tag("user")))*' (aka 'unsigned long *') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') [-Wincompatible-pointer-types]
    1497 |                 ret = put_user_ptr(ioctx->user_id, ctxp);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:223:23: note: expanded from macro 'put_user_ptr'
     223 |                 __put_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:238:47: note: passing argument to parameter 'ptr' here
     238 | __put_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
>> fs/aio.c:2226:16: error: incompatible pointer types passing 'typeof (*(iocbpp + i))  __attribute__((btf_type_tag("user")))*' (aka 'struct iocb **') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') [-Wincompatible-pointer-types]
    2226 |                 if (unlikely(get_user_ptr(user_iocb, iocbpp + i))) {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:264:23: note: expanded from macro 'get_user_ptr'
     264 |                 __get_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   fs/aio.c:2331:1: warning: unused label 'out' [-Wunused-label]
    2331 | out:
         | ^~~~
   1 warning and 6 errors generated.
--
>> kernel/futex/core.c:1148:6: error: incompatible pointer types passing 'typeof (*(head))  __attribute__((btf_type_tag("user")))*' (aka 'struct robust_list **') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') [-Wincompatible-pointer-types]
    1148 |         if (get_user_ptr(uentry, head))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:264:23: note: expanded from macro 'get_user_ptr'
     264 |                 __get_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   1 error generated.
--
>> kernel/futex/syscalls.c:109:9: error: incompatible pointer types passing 'typeof (*(head_ptr))  __attribute__((btf_type_tag("user")))*' (aka 'struct robust_list_head **') to parameter of type 'const void  __attribute__((btf_type_tag("user")))* __attribute__((btf_type_tag("user")))*' (aka 'const void **') [-Wincompatible-pointer-types]
     109 |         return put_user_ptr(head, head_ptr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:223:23: note: expanded from macro 'put_user_ptr'
     223 |                 __put_user_ptr((x), __p) :                      \
         |                                     ^~~
   include/asm-generic/uaccess.h:238:47: note: passing argument to parameter 'ptr' here
     238 | __put_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   1 error generated.


vim +73 block/ioctl.c

^1da177e4c3f415 drivers/block/ioctl.c Linus Torvalds        2005-04-16  66  
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  67  static int blkpg_ioctl(struct block_device *bdev,
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  68  		       struct blkpg_ioctl_arg __user *arg)
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  69  {
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  70  	struct blkpg_partition __user *udata;
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  71  	int op;
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  72  
8a4b4d3ea4e305c block/ioctl.c         Christian A. Ehrhardt 2026-04-28 @73  	if (get_user(op, &arg->op) || get_user_ptr(udata, &arg->data))
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  74  		return -EFAULT;
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  75  
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  76  	return blkpg_do_ioctl(bdev, udata, op);
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  77  }
5fb889f587fa2ae block/ioctl.c         Arnd Bergmann         2019-11-28  78  

:::::: The code at line 73 was first introduced by commit
:::::: 8a4b4d3ea4e305c4a3c136e43f7ad8310e8caf0a [CHERRY-PICK] block/ioctl: Use get_user_ptr for PCuABI

:::::: TO: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
