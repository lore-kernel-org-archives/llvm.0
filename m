Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB1288B1;
	Sun,  7 Jun 2026 02:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780800557; cv=none; b=MEnL2w+bCwf8bhmm4ArkoVNi5ZJdT8hzCgdulTXS5i8dQTMZ4JahqAs+T0WLlROZiE93tRNJAC9u903EDAPeBEhRoa1bAJwsBGu8E+h740ZJjGTGE9Sxffr8qTbs5Ah5rkeDcBsnT8Rh9FbRo8Y5uGOerUXJKjuk70gJIsY7jjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780800557; c=relaxed/simple;
	bh=4bmKfbx4v7WNjDlgRiZEZX1VNwcvXlYhbVYgBYvK3XE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JiLLWy+QFzChquqUIBhMUyX4/HsgCoN6h4UQR2QKCTMzZjP4rBNWG8H69CFFfZ1X6+A9SXvLAjRqWHYjdEMpAJJh67xZg7Fc86TdfURc7WDXB1UWc5wibx5NAhx48D5Y/7aX+Ww35vNlRsByElkeuRFd6GRW+i8V0fdCmT5iErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIwBj0qm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIwBj0qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780800554; x=1812336554;
  h=date:from:to:cc:subject:message-id;
  bh=4bmKfbx4v7WNjDlgRiZEZX1VNwcvXlYhbVYgBYvK3XE=;
  b=UIwBj0qmnxJ+oZQpCSvgHeFPuePEupZ7gAtIPyD9tx1sPnHw2wClTyy4
   BRmJyB++Tdxe5x1+uF/zEdbvaizRrNEcWdEcMbftCxFI8k5C8a1wBMvPT
   3aKfO5slFMprmNLLVxGGaQM34wlxEKoWs25PAfUZgOosDmBVpWQC4iNFV
   dso9h6+G9/XQ9WUH/hNT3lTI5FfWQvQS99s7VjRgOu+uX7bn3My3m1DD7
   Oto9hAXvx7Ul7XmTWjFq+lBmg6QOQbyC+TloEsLH2Wue0RaCtp23JF7J0
   hcNvkNQjvQAp+3aEvdW9q7vcNqsuy4MMuhTEdUVbES+ZmbXICDyFr0iv8
   w==;
X-CSE-ConnectionGUID: JAF7HPhaT8W6RjLY+Fxpfg==
X-CSE-MsgGUID: RxxgDEUoSTSSYHdwrkx9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="92145956"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="92145956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 19:49:13 -0700
X-CSE-ConnectionGUID: CwrYUfeMR3+DdIbO4lwszg==
X-CSE-MsgGUID: ANmMb5w6SfuzBEfmfD2fTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="245036243"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jun 2026 19:49:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW3ZT-00000000HYo-3Mqm;
	Sun, 07 Jun 2026 02:49:07 +0000
Date: Sun, 07 Jun 2026 10:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.2.misc 28/28] fs/open.c:112:29:
 warning: converting the result of '<<' to a boolean always evaluates to true
Message-ID: <202606071029.DKCs8WOs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Jori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/brauner/linux.git vfs-7.2.misc
head:   0da79c259ad0554b36761a7135d4f92eb7c46263
commit: 0da79c259ad0554b36761a7135d4f92eb7c46263 [28/28] vfs: uapi: retire octal and hex numbers in favor of (1 << n) for O_ flags
config: powerpc64-randconfig-001-20260607 (https://download.01.org/0day-ci/archive/20260607/202606071029.DKCs8WOs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606071029.DKCs8WOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606071029.DKCs8WOs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/open.c:112:29: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     112 |         error = break_lease(inode, O_WRONLY);
         |                                    ^
   include/uapi/asm-generic/fcntl.h:20:21: note: expanded from macro 'O_WRONLY'
      20 | #define O_WRONLY        (1 << 0)
         |                            ^
   fs/open.c:152:1: warning: alias and aliasee have different types 'long (const char *, long)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((const char *)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((const char *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((long)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
     152 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name))));    \
         |                                ^
   fs/open.c:152:1: note: aliasee is declared here
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DEFINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^
   <scratch space>:92:1: note: expanded from here
      92 | __se_sys_truncate
         | ^
   fs/open.c:158:1: warning: alias and aliasee have different types 'long (const char *, compat_off_t)' (aka 'long (const char *, int)') and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((const char *)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((const char *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((compat_off_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((compat_off_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
     158 | COMPAT_SYSCALL_DEFINE2(truncate, const char __user *, path, compat_off_t, length)
         | ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_DEFINE2'
      55 |         COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |         ^
   include/linux/compat.h:76:18: note: expanded from macro 'COMPAT_SYSCALL_DEFINEx'
      76 |                 __attribute__((alias(__stringify(__se_compat_sys##name))));     \
         |                                ^
   fs/open.c:158:1: note: aliasee is declared here
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_DEFINE2'
      55 |         COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |         ^
   include/linux/compat.h:80:18: note: expanded from macro 'COMPAT_SYSCALL_DEFINEx'
      80 |         asmlinkage long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))   \
         |                         ^
   <scratch space>:119:1: note: expanded from here
     119 | __se_compat_sys_truncate
         | ^
   fs/open.c:209:1: warning: alias and aliasee have different types 'long (unsigned int, off_t)' (aka 'long (unsigned int, long)') and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((off_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((off_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
     209 | SYSCALL_DEFINE2(ftruncate, unsigned int, fd, off_t, length)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name))));    \
         |                                ^
   fs/open.c:209:1: note: aliasee is declared here
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DEFINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^
   <scratch space>:165:1: note: expanded from here
     165 | __se_sys_ftruncate
         | ^
   fs/open.c:215:1: warning: alias and aliasee have different types 'long (unsigned int, compat_off_t)' (aka 'long (unsigned int, int)') and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((compat_off_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((compat_off_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
     215 | COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_off_t, length)
         | ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_DEFINE2'
      55 |         COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |         ^
   include/linux/compat.h:76:18: note: expanded from macro 'COMPAT_SYSCALL_DEFINEx'
      76 |                 __attribute__((alias(__stringify(__se_compat_sys##name))));     \
         |                                ^
   fs/open.c:215:1: note: aliasee is declared here
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_DEFINE2'
      55 |         COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |         ^
   include/linux/compat.h:80:18: note: expanded from macro 'COMPAT_SYSCALL_DEFINEx'
      80 |         asmlinkage long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))   \
         |                         ^
   <scratch space>:192:1: note: expanded from here
     192 | __se_compat_sys_ftruncate
         | ^
   fs/open.c:365:1: warning: alias and aliasee have different types 'long (int, int, loff_t, loff_t)' (aka 'long (int, int, long long, long long)') and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((loff_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((loff_t)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((loff_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((loff_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long long, long long)') [-Wattribute-alias]
     365 | SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFINE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'


vim +112 fs/open.c

^1da177e4c3f41 Linus Torvalds    2005-04-16   72  
29d80d506b1838 Yuichiro Tsuji    2025-01-21   73  int vfs_truncate(const struct path *path, loff_t length)
^1da177e4c3f41 Linus Torvalds    2005-04-16   74  {
abf08576afe315 Christian Brauner 2023-01-13   75  	struct mnt_idmap *idmap;
^1da177e4c3f41 Linus Torvalds    2005-04-16   76  	struct inode *inode;
29d80d506b1838 Yuichiro Tsuji    2025-01-21   77  	int error;
^1da177e4c3f41 Linus Torvalds    2005-04-16   78  
a02de9608595c8 David Howells     2012-12-20   79  	inode = path->dentry->d_inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16   80  
^1da177e4c3f41 Linus Torvalds    2005-04-16   81  	/* For directories it's -EISDIR, for other non-regulars - -EINVAL */
^1da177e4c3f41 Linus Torvalds    2005-04-16   82  	if (S_ISDIR(inode->i_mode))
a02de9608595c8 David Howells     2012-12-20   83  		return -EISDIR;
^1da177e4c3f41 Linus Torvalds    2005-04-16   84  	if (!S_ISREG(inode->i_mode))
a02de9608595c8 David Howells     2012-12-20   85  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16   86  
abf08576afe315 Christian Brauner 2023-01-13   87  	idmap = mnt_idmap(path->mnt);
4609e1f18e19c3 Christian Brauner 2023-01-13   88  	error = inode_permission(idmap, inode, MAY_WRITE);
9ac9b8474c39c3 Dave Hansen       2008-02-15   89  	if (error)
4acf3bc76e521b Amir Goldstein    2024-11-15   90  		return error;
4acf3bc76e521b Amir Goldstein    2024-11-15   91  
4acf3bc76e521b Amir Goldstein    2024-11-15   92  	error = fsnotify_truncate_perm(path, length);
4acf3bc76e521b Amir Goldstein    2024-11-15   93  	if (error)
4acf3bc76e521b Amir Goldstein    2024-11-15   94  		return error;
4acf3bc76e521b Amir Goldstein    2024-11-15   95  
4acf3bc76e521b Amir Goldstein    2024-11-15   96  	error = mnt_want_write(path->mnt);
4acf3bc76e521b Amir Goldstein    2024-11-15   97  	if (error)
4acf3bc76e521b Amir Goldstein    2024-11-15   98  		return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16   99  
^1da177e4c3f41 Linus Torvalds    2005-04-16  100  	error = -EPERM;
c82e42da8a6b2f Miklos Szeredi    2008-06-24  101  	if (IS_APPEND(inode))
9ac9b8474c39c3 Dave Hansen       2008-02-15  102  		goto mnt_drop_write_and_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  103  
8cf9ee5061037a Miklos Szeredi    2018-07-18  104  	error = get_write_access(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  	if (error)
9ac9b8474c39c3 Dave Hansen       2008-02-15  106  		goto mnt_drop_write_and_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  107  
9700382c3c9ff3 david m. richter  2007-07-31  108  	/*
9700382c3c9ff3 david m. richter  2007-07-31  109  	 * Make sure that there are no leases.  get_write_access() protects
9700382c3c9ff3 david m. richter  2007-07-31  110  	 * against the truncate racing with a lease-granting setlease().
9700382c3c9ff3 david m. richter  2007-07-31  111  	 */
8737c9305bd560 Al Viro           2009-12-24 @112  	error = break_lease(inode, O_WRONLY);
^1da177e4c3f41 Linus Torvalds    2005-04-16  113  	if (error)
9700382c3c9ff3 david m. richter  2007-07-31  114  		goto put_write_and_out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  115  
a02de9608595c8 David Howells     2012-12-20  116  	error = security_path_truncate(path);
907f4554e2521c Christoph Hellwig 2010-03-03  117  	if (!error)
abf08576afe315 Christian Brauner 2023-01-13  118  		error = do_truncate(idmap, path->dentry, length, 0, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  
9700382c3c9ff3 david m. richter  2007-07-31  120  put_write_and_out:
8cf9ee5061037a Miklos Szeredi    2018-07-18  121  	put_write_access(inode);
9ac9b8474c39c3 Dave Hansen       2008-02-15  122  mnt_drop_write_and_out:
a02de9608595c8 David Howells     2012-12-20  123  	mnt_drop_write(path->mnt);
4acf3bc76e521b Amir Goldstein    2024-11-15  124  
^1da177e4c3f41 Linus Torvalds    2005-04-16  125  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  126  }
a02de9608595c8 David Howells     2012-12-20  127  EXPORT_SYMBOL_GPL(vfs_truncate);
a02de9608595c8 David Howells     2012-12-20  128  

:::::: The code at line 112 was first introduced by commit
:::::: 8737c9305bd5602b11f7eb4655d5695d4a42a0c6 Switch may_open() and break_lease() to passing O_...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
