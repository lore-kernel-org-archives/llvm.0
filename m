Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B826A1DA;
	Fri,  9 May 2025 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777588; cv=none; b=hcmhSnx9TyNhTi+eY+SvJA5fGIthZV/5UOr69qG18ZvUsUBVtEe9uRRxuUnmIlvhNUMyHfeqP6lQAhQOYRdZquPlw3dxLeLkARGP1OZFHwhxREjd/JnA9NXgK8QU8TBkxea3lVzvi3dKodPWCxDk5sDj/YuyYCQChcm2+QpV+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777588; c=relaxed/simple;
	bh=XH5qgIiNV8vC+T96lEpPKyjg4glmUUOxb/545SRV5hU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwvoL3f+gQVPaL0qk1DY9zsL3ZUZXmZubnyCxpoOINzW454GhvnZo7V5/OivnD+tjxrOOBpGUv4q7pzkWupDCijs4neiPD+Bl4xet/Wdi9wcgqbwtlpW6wu8hpnUFXz9vufeyqXPIwkTEXsiP4U2qXUnhPvEQZmjZF7fyiJfmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEJHRgyv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEJHRgyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746777586; x=1778313586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XH5qgIiNV8vC+T96lEpPKyjg4glmUUOxb/545SRV5hU=;
  b=HEJHRgyvHdCBOrpfYnvi/40BTMsTa0237tTWc6anvHAo9/Mt5F0Kg5zu
   LfZ+dUvrJvD+WhWjUo+Za4rECMw/7JungfpuLZnqBUxAUs47ZLqJ+4MPH
   cc8au2Ma94o/7LsRP6FkTC3Bj0SWn7ZR0h2s6QivlEohHhFgHsZir96Rr
   aP6oB7HFwnXprXDKlV+TvlEzhweJ3WI+WYGcWdp5NgZ16I/Ji8XSRhl3k
   onlugT55DV+UmXPzZ9mtBDuD+L98NsHfbRUJR4lhSGGXQWinBy+8AaSGe
   7NOVZIEsNVBWkZKtW17RXOZelw1KMxjdHzdUMP+wmypH2mrkUeHzrvwf1
   A==;
X-CSE-ConnectionGUID: nFDDaohZT4+EvumLj95OVw==
X-CSE-MsgGUID: kNBnMPLCQG2rqbEXBTOz7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48503481"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48503481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:59:44 -0700
X-CSE-ConnectionGUID: 3SgJZi6zTPqzTElo4P98vw==
X-CSE-MsgGUID: UIKOL4kQQqW9ZW8fJsa1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="173708327"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2025 00:59:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIdw-000BnP-0y;
	Fri, 09 May 2025 07:59:40 +0000
Date: Fri, 9 May 2025 15:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [palmer:for-next 10/25] include/linux/fs.h:3921:15: warning: label
 followed by a declaration is a C23 extension
Message-ID: <202505091520.cze8wv81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   1a3f6980889df3fc90ad3e4a525061d2c138adba
commit: f6bff7827a48e59cff1ef98aae72452d65174e0c [10/25] riscv: uaccess: use 'asm_goto_output' for get_user()
config: riscv-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091520.cze8wv81-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091520.cze8wv81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091520.cze8wv81-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:1221:
   In file included from include/linux/huge_mm.h:7:
>> include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3921 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   1 warning generated.
--
   In file included from fs/ioctl.c:8:
   In file included from include/linux/syscalls.h:83:
   In file included from include/uapi/linux/aio_abi.h:31:
>> include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3921 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> fs/ioctl.c:69:10: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      69 |         error = get_user(ur_block, p);
         |                 ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   fs/ioctl.c:346:10: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     346 |         error = get_user(on, argp);
         |                 ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   fs/ioctl.c:370:10: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     370 |         error = get_user(on, argp);
         |                 ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   fs/ioctl.c:424:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     424 |         if (get_user(count, &argp->dest_count)) {
         |             ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   fs/ioctl.c:723:8: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     723 |         err = get_user(flags, argp);
         |               ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   6 warnings generated.
--
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:83:
   In file included from include/uapi/linux/aio_abi.h:31:
>> include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3921 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> fs/namespace.c:4097:7: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    4097 |                 if (get_user(c, (const char __user *)data + offset))
         |                     ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   fs/namespace.c:5942:8: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    5942 |         ret = get_user(usize, &req->size);
         |               ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   3 warnings generated.
--
   In file included from fs/read_write.c:14:
   In file included from include/linux/fsnotify.h:15:
   In file included from include/linux/fsnotify_backend.h:14:
>> include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3921 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> fs/read_write.c:1403:16: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1403 |                 if (unlikely(get_user(off, offset)))
         |                              ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   2 warnings generated.
--
   In file included from fs/select.c:18:
   In file included from include/linux/compat.h:17:
>> include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3921 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> fs/select.c:783:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     783 |                 unsafe_get_user(to->p, &from->p, Efault);
         |                 ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   fs/select.c:784:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     784 |                 unsafe_get_user(to->size, &from->size, Efault);
         |                 ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   3 warnings generated.
--
   In file included from fs/namei.c:22:
>> include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3921 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> fs/namei.c:231:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     231 |         if (get_user(c, pathname))
         |             ^
   arch/riscv/include/asm/uaccess.h:263:3: note: expanded from macro 'get_user'
     263 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:233:2: note: expanded from macro '__get_user'
     233 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:2: note: expanded from macro '__get_user_error'
     196 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   2 warnings generated.
..


vim +3921 include/linux/fs.h

90f8572b0f021fd Eric W. Biederman 2015-06-29  3903  
45cd0faae3715e3 Amir Goldstein    2018-08-27  3904  /* mm/fadvise.c */
45cd0faae3715e3 Amir Goldstein    2018-08-27  3905  extern int vfs_fadvise(struct file *file, loff_t offset, loff_t len,
45cd0faae3715e3 Amir Goldstein    2018-08-27  3906  		       int advice);
cf1ea0592dbf109 Jan Kara          2019-08-29  3907  extern int generic_fadvise(struct file *file, loff_t offset, loff_t len,
cf1ea0592dbf109 Jan Kara          2019-08-29  3908  			   int advice);
45cd0faae3715e3 Amir Goldstein    2018-08-27  3909  
1bc6d4452d5c91b Christian Brauner 2024-04-30  3910  static inline bool vfs_empty_path(int dfd, const char __user *path)
1bc6d4452d5c91b Christian Brauner 2024-04-30  3911  {
1bc6d4452d5c91b Christian Brauner 2024-04-30  3912  	char c;
1bc6d4452d5c91b Christian Brauner 2024-04-30  3913  
1bc6d4452d5c91b Christian Brauner 2024-04-30  3914  	if (dfd < 0)
1bc6d4452d5c91b Christian Brauner 2024-04-30  3915  		return false;
1bc6d4452d5c91b Christian Brauner 2024-04-30  3916  
1bc6d4452d5c91b Christian Brauner 2024-04-30  3917  	/* We now allow NULL to be used for empty path. */
1bc6d4452d5c91b Christian Brauner 2024-04-30  3918  	if (!path)
1bc6d4452d5c91b Christian Brauner 2024-04-30  3919  		return true;
1bc6d4452d5c91b Christian Brauner 2024-04-30  3920  
1bc6d4452d5c91b Christian Brauner 2024-04-30 @3921  	if (unlikely(get_user(c, path)))
1bc6d4452d5c91b Christian Brauner 2024-04-30  3922  		return false;
1bc6d4452d5c91b Christian Brauner 2024-04-30  3923  
1bc6d4452d5c91b Christian Brauner 2024-04-30  3924  	return !c;
1bc6d4452d5c91b Christian Brauner 2024-04-30  3925  }
1bc6d4452d5c91b Christian Brauner 2024-04-30  3926  

:::::: The code at line 3921 was first introduced by commit
:::::: 1bc6d4452d5c91beb09e37a98a590808e1997b79 fs: new helper vfs_empty_path()

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
