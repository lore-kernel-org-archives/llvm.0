Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824403BBA01;
	Thu, 21 May 2026 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365362; cv=none; b=p2+i9apWTtTl5xsTztzj7zbMmGWXZfKqcuGCeUNwaJXJdhP+pO7lrM8hAtzKP7NkvBdA0wBaL+oVnl1OyjXD2572smOOtACZY6A5h7mTraBbWE9zSahuByFb3DLbfvgRVC3tmQDKQr+h1gZaCMHukxi3/ibqQAlFXwxPSKQnREc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365362; c=relaxed/simple;
	bh=EB7F6wv1UDS0wwnl4HwLsjubJE9/npZenRXzZuoTp90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J7PJBc7xbcF6I6+5RddwVoFPbH468PEYZXywrBzKwh+MtSPKw61o2tJlci1VLDai4dGIs5q+nzEGL+xkEG6Rq3CGnY0GA4kMHCpIO3EtQPAk0t6LMmUV8TeBDLoSyv5P9WnjBNUsrjzy6tZukFWaQOpU8xE8Y5HTqOFMxbQ+zJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUDeGg/L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUDeGg/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779365361; x=1810901361;
  h=date:from:to:cc:subject:message-id;
  bh=EB7F6wv1UDS0wwnl4HwLsjubJE9/npZenRXzZuoTp90=;
  b=GUDeGg/LJKmNNS5PMKgTk7Cg5q3hhtloSQt11k1c+wObXLHyaRp7xfaw
   Kp59hYD2r+bNmbH4Du68ip8WLr9CgiK/rRwzNeVY8Z1EKxaiqqD7a5/ay
   jBb/cQkLjQg+stVkDp+gKvUnoH98uhZy7/lFS1GTMqFBgbzo39X3G60/Y
   EWwbFdc3zWwfTbUz1ogK1c+pNHtydRyElNy/JA4xYDGq2s59bYYhyzyFS
   e7uNP3UU6xxHCO1XB/8SpKh/mwYCkkwIV/0y0kTZxE59TMGaR8m2XBpmB
   oNgDuIAnTasSfNNYuJjIXOFDR7y1hU+aVUHC7Y5jLpq1SM4YWuJKg4O2/
   Q==;
X-CSE-ConnectionGUID: BsGBkBB2SYWmzQjHB/gnyA==
X-CSE-MsgGUID: H97JPkLWTh+V2U43uZWp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90856225"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90856225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:09:20 -0700
X-CSE-ConnectionGUID: RnDh3zs4RD2JNtNrZagCKQ==
X-CSE-MsgGUID: BPWunWTPRlCitZTbuFbyNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="244503121"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 05:09:17 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ2DC-000000000FJ-4BI7;
	Thu, 21 May 2026 12:09:14 +0000
Date: Thu, 21 May 2026 20:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 126/1130]
 fs/select.c:783:30: error: incompatible pointer types passing 'sigset_t **'
 to parameter of type 'const void **'
Message-ID: <202605211933.MAIx0AIR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 1ab05c9b1f5b7d7f615c289b441e2bf963123a0e [126/1130] [CHERRY-PICK] fs/select: Use get_user_ptr for PCuABI support
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211933.MAIx0AIR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211933.MAIx0AIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211933.MAIx0AIR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:18:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:726:9: warning: 'get_user_ptr' macro redefined [-Wmacro-redefined]
     726 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^
   include/asm-generic/uaccess.h:259:9: note: previous definition is here
     259 | #define get_user_ptr(x, ptr)                                    \
         |         ^
   In file included from fs/select.c:18:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:727:9: warning: 'put_user_ptr' macro redefined [-Wmacro-redefined]
     727 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^
   include/asm-generic/uaccess.h:218:9: note: previous definition is here
     218 | #define put_user_ptr(x, ptr)                                    \
         |         ^
>> fs/select.c:783:30: error: incompatible pointer types passing 'sigset_t **' to parameter of type 'const void **' [-Wincompatible-pointer-types]
     783 |                 unsafe_get_user_ptr(to->p, &from->p, Efault);
         |                                            ^~~~~~~~
   include/linux/uaccess.h:703:68: note: expanded from macro 'unsafe_get_user_ptr'
     703 | #define unsafe_get_user_ptr(x,p,e) unsafe_op_wrap(__get_user_ptr(x,p),e)
         |                                                                    ^
   include/asm-generic/uaccess.h:254:31: note: expanded from macro '__get_user_ptr'
     254 |         __gu_err = __get_user_ptr_fn(ptr, &__x);                \
         |                                      ^~~
   include/asm-generic/uaccess.h:286:51: note: expanded from macro '__get_user_ptr_fn'
     286 | #define __get_user_ptr_fn(u, k) __get_user_ptr_fn(u, k)
         |                                                   ^
   include/linux/uaccess.h:701:51: note: expanded from macro 'unsafe_op_wrap'
     701 | #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
         |                                                   ^~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   2 warnings and 1 error generated.


vim +783 fs/select.c

   773	
   774	static inline int get_sigset_argpack(struct sigset_argpack *to,
   775					     struct sigset_argpack __user *from)
   776	{
   777		// the path is hot enough for overhead of copy_from_user() to matter
   778		if (from) {
   779			if (can_do_masked_user_access())
   780				from = masked_user_access_begin(from);
   781			else if (!user_read_access_begin(from, sizeof(*from)))
   782				return -EFAULT;
 > 783			unsafe_get_user_ptr(to->p, &from->p, Efault);
   784			unsafe_get_user(to->size, &from->size, Efault);
   785			user_read_access_end();
   786		}
   787		return 0;
   788	Efault:
   789		user_read_access_end();
   790		return -EFAULT;
   791	}
   792	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
