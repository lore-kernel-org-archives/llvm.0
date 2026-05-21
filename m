Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54735BDAA;
	Thu, 21 May 2026 03:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779334386; cv=none; b=asn77egBSFSSRDf4VbJe5kydTinUZX8R6hbs6PPl4f2KPrWidN0ktOL7WU8ia4jZEB2Ml93fTBFYFZm+l6oDPRabkYm/MLmWkrc8EPEZZ0VxB8ygVjva2vZNBmBIqOZk/w2J6AUICPT99R63h1ytOJsX1hkw6JvSUi5TdU0L77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779334386; c=relaxed/simple;
	bh=B+v/Nuq/Q3Rrhx/5MBpC+SYtC2W2RWaV7EIXCFE9PVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qMec/lW7EakSurqmsEt8NJs0jwYv/0ucmmRcN1s8+7JtaxT8BP0Av9pcpvlVZGWsPji3ifC8xEuzTY1V8sOF5tuMcQwmnm6Oez0OHrDW39afq9Ixf1JvtVfPpcIptQNaKOyaRURrwGjo0g4+uyp573sIw7UEYF31ycG6i8jycGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkNq2fLk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkNq2fLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779334384; x=1810870384;
  h=date:from:to:cc:subject:message-id;
  bh=B+v/Nuq/Q3Rrhx/5MBpC+SYtC2W2RWaV7EIXCFE9PVk=;
  b=NkNq2fLkSSnQxml5LPQy18Kcl8SIMZlUZrCbXQKe0t8SOmjNZnsN23uH
   AkL5dQzECDpyqq/AhLVoxKEJUzfq5pzftv/+O0peOyQSRabkuF2qc3UWF
   vJApFuuGnVGm23TDzk8YN2zviGtZDjItWAB/d1X4LdI5Ij/JuFCioKhhL
   aiIqztCSxhVDiz2t9BV28oJZWx2bWKJ0fLSlfc/3utSktv2aEe52a4+rI
   TPVqgvktESZVjrlLhtQVtUMdMcrZslBdbhuMOIxLORXnoowzYbOIeZK5P
   UtmtWuA/esJnNN7KvWcrbxyEKzj04UPtn6uGnd1WuvCapqcIJvP0rqN/h
   w==;
X-CSE-ConnectionGUID: zs7WHbQKQUuhFGj/SFx4Sw==
X-CSE-MsgGUID: 19WCgyxyS++h5hQ3MWGWCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84103803"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84103803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:33:03 -0700
X-CSE-ConnectionGUID: NCV/ZUPtSnGgWkytqEydeA==
X-CSE-MsgGUID: oIi9FSvnTlKuxNPZXHQf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="278523163"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2026 20:33:01 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPu8K-000000004Ih-076A;
	Thu, 21 May 2026 03:31:54 +0000
Date: Thu, 21 May 2026 11:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 115/1130]
 kernel/ptrace.c:1339:37: error: passing 'void **' to parameter of type 'const
 void **' discards qualifiers in nested pointer types
Message-ID: <202605211145.HiFuURcJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b8dd58a99f3a6b933636441f72da97e1a06c8a57 [115/1130] [CHERRY-PICK] kernel/ptrace: Modify ptrace syscall to accept capability arguments
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211145.HiFuURcJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211145.HiFuURcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211145.HiFuURcJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/ptrace.c:16:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:726:9: warning: 'get_user_ptr' macro redefined [-Wmacro-redefined]
     726 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^
   include/asm-generic/uaccess.h:259:9: note: previous definition is here
     259 | #define get_user_ptr(x, ptr)                                    \
         |         ^
   In file included from kernel/ptrace.c:16:
   In file included from include/linux/sched/task.h:13:
   include/linux/uaccess.h:727:9: warning: 'put_user_ptr' macro redefined [-Wmacro-redefined]
     727 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^
   include/asm-generic/uaccess.h:218:9: note: previous definition is here
     218 | #define put_user_ptr(x, ptr)                                    \
         |         ^
>> kernel/ptrace.c:1339:37: error: passing 'void **' to parameter of type 'const void **' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1339 |                 if (__get_user_ptr(kiov.iov_base, &uiov->iov_base) ||
         |                                                   ^~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:254:31: note: expanded from macro '__get_user_ptr'
     254 |         __gu_err = __get_user_ptr_fn(ptr, &__x);                \
         |                                      ^~~
   include/asm-generic/uaccess.h:286:51: note: expanded from macro '__get_user_ptr_fn'
     286 | #define __get_user_ptr_fn(u, k) __get_user_ptr_fn(u, k)
         |                                                   ^
   include/asm-generic/uaccess.h:279:47: note: passing argument to parameter 'ptr' here
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                                               ^
   2 warnings and 1 error generated.


vim +1339 kernel/ptrace.c

  1313	
  1314		case PTRACE_SINGLESTEP:
  1315	#ifdef PTRACE_SINGLEBLOCK
  1316		case PTRACE_SINGLEBLOCK:
  1317	#endif
  1318	#ifdef PTRACE_SYSEMU
  1319		case PTRACE_SYSEMU:
  1320		case PTRACE_SYSEMU_SINGLESTEP:
  1321	#endif
  1322		case PTRACE_SYSCALL:
  1323		case PTRACE_CONT:
  1324			return ptrace_resume(child, request, data);
  1325	
  1326		case PTRACE_KILL:
  1327			send_sig_info(SIGKILL, SEND_SIG_NOINFO, child);
  1328			return 0;
  1329	
  1330	#ifdef CONFIG_HAVE_ARCH_TRACEHOOK
  1331		case PTRACE_GETREGSET:
  1332		case PTRACE_SETREGSET: {
  1333			struct iovec kiov;
  1334			struct iovec __user *uiov = datavp;
  1335	
  1336			if (!access_ok(uiov, sizeof(*uiov)))
  1337				return -EFAULT;
  1338	
> 1339			if (__get_user_ptr(kiov.iov_base, &uiov->iov_base) ||
  1340			    __get_user(kiov.iov_len, &uiov->iov_len))
  1341				return -EFAULT;
  1342	
  1343			ret = ptrace_regset(child, request, addr, &kiov);
  1344			if (!ret)
  1345				ret = __put_user(kiov.iov_len, &uiov->iov_len);
  1346			break;
  1347		}
  1348	
  1349		case PTRACE_GET_SYSCALL_INFO:
  1350			ret = ptrace_get_syscall_info(child, addr, datavp);
  1351			break;
  1352	
  1353		case PTRACE_SET_SYSCALL_INFO:
  1354			ret = ptrace_set_syscall_info(child, addr, datavp);
  1355			break;
  1356	#endif
  1357	
  1358		case PTRACE_SECCOMP_GET_FILTER:
  1359			ret = seccomp_get_filter(child, addr, datavp);
  1360			break;
  1361	
  1362		case PTRACE_SECCOMP_GET_METADATA:
  1363			ret = seccomp_get_metadata(child, addr, datavp);
  1364			break;
  1365	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
