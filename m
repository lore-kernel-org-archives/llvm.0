Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51C23AE62;
	Mon, 12 May 2025 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065299; cv=none; b=U5Aql2rmkHwjLtxN5VvzTIrbxTwYMxxEkGGSJcmW0HNyQpY2XYi3UjTd3UjTLLxYCcATPwroCYSFEZdRgLlYqzrg2IqDzBuxkj6MclOzQARnQL+RlSS5wkC4B8Z6CzgGL5EAlMp0WzRdGBo/RgCfAyBmxzlApsg6b3LhmWucY7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065299; c=relaxed/simple;
	bh=yCofJX9nfvGVB14a5V/EKi0+fmUIwqhQO6ONDFEl4+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryeESyqDI7BYYjgpdNejFglmo9JGsTcm4uEVKbiHQPfDChNmfCVxDlgIvVGHFx9S3kTC1xQkQeKt6FDogN5W7SeUpVhx4CRasOCULaKdi+A4J+SnUZc/F7Zz/HMd12iuB3jGDmyAv7CiXmIYKP3TU57TMIezZKKXSLNhs+rM+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lI+QJZ9q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lI+QJZ9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747065297; x=1778601297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCofJX9nfvGVB14a5V/EKi0+fmUIwqhQO6ONDFEl4+Y=;
  b=lI+QJZ9qAFh2vtWy+p2/IcRoBkme7WaHF5uGg0qwJL1Hlc1+YADTIjiM
   0jzob/i+9R7Jumdle75A2ufQTZXz0WcQhiC2EW3mEJ1YS+TKnapoJPntI
   ymYgGu0Pbub/n2DcR9e7AZdDvg60Rqk+ZOmw6vMErGlbd5GoYW5/xPshL
   3g5royZDNNJSuuSbQ9TusBHL8X2QaCgSq1aRs5YdxJ0Z9JyIqvsDzV0hF
   8ta10VAezOwD+PFR+gj1FJHZe/jled6yhk+4xnpvDi40cQvWpr+NE+LU3
   AeaUGc7wWfiNUJrUjNzyz9hIP82gDLWpkaXui0N8+DB1FRA9su2+0rCpY
   w==;
X-CSE-ConnectionGUID: nmQhwyKuSrSXQbWOWVmpfA==
X-CSE-MsgGUID: PsjbhJ+mR0+/A6oVKhGJew==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59531538"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="59531538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 08:54:56 -0700
X-CSE-ConnectionGUID: xID2NfeFTauVZHinytpdmw==
X-CSE-MsgGUID: oxGsmYCJQVOhaWgY9DbgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142358813"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2025 08:54:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEVUR-000EXt-38;
	Mon, 12 May 2025 15:54:51 +0000
Date: Mon, 12 May 2025 23:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [linux-next:master 8977/10491] include/linux/fs.h:3921:15: error:
 label followed by a declaration is a C23 extension
Message-ID: <202505122357.aPWWHCbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: f6bff7827a48e59cff1ef98aae72452d65174e0c [8977/10491] riscv: uaccess: use 'asm_goto_output' for get_user()
config: riscv-randconfig-002-20250512 (https://download.01.org/0day-ci/archive/20250512/202505122357.aPWWHCbX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122357.aPWWHCbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505122357.aPWWHCbX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/bsg.c:5:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
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
>> block/bsg.c:96:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      96 |         if (get_user(max_queue, uarg))
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
   block/bsg.c:131:7: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     131 |                 if (get_user(val, intp))
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
   block/bsg.c:141:7: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     141 |                 if (get_user(val, intp))
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
   4 warnings generated.
--
   In file included from block/ioctl.c:3:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
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
>> block/ioctl.c:72:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      72 |         if (get_user(op, &arg->op) || get_user(udata, &arg->data))
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
   block/ioctl.c:72:32: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      72 |         if (get_user(op, &arg->op) || get_user(udata, &arg->data))
         |                                       ^
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
   block/ioctl.c:445:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     445 |         if (get_user(n, (int __user *)arg))
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
   block/ioctl.c:538:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     538 |         if (get_user(n, argp))
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
   5 warnings generated.
--
   In file included from kernel/rseq.c:13:
   In file included from include/linux/syscalls.h:83:
   In file included from include/uapi/linux/aio_abi.h:31:
   include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
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
>> kernel/rseq.c:299:8: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     299 |         ret = get_user(sig, usig);
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
   kernel/rseq.c:336:8: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     336 |         ret = get_user(flags, &t->rseq->flags);
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
   In file included from io_uring/futex.c:4:
   include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
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
   In file included from io_uring/futex.c:10:
>> io_uring/../kernel/futex/futex.h:267:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     267 |         unsafe_get_user(val, from, Efault);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   2 warnings generated.
--
   In file included from io_uring/net.c:6:
   In file included from include/linux/net.h:23:
   include/linux/fs.h:3921:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
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
>> io_uring/net.c:261:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     261 |         unsafe_get_user(msg->msg_name, &umsg->msg_name, ua_end);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   io_uring/net.c:262:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     262 |         unsafe_get_user(msg->msg_namelen, &umsg->msg_namelen, ua_end);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   io_uring/net.c:263:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     263 |         unsafe_get_user(msg->msg_iov, &umsg->msg_iov, ua_end);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   io_uring/net.c:264:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     264 |         unsafe_get_user(msg->msg_iovlen, &umsg->msg_iovlen, ua_end);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   io_uring/net.c:265:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     265 |         unsafe_get_user(msg->msg_control, &umsg->msg_control, ua_end);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   io_uring/net.c:266:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     266 |         unsafe_get_user(msg->msg_controllen, &umsg->msg_controllen, ua_end);
         |         ^
   arch/riscv/include/asm/uaccess.h:449:2: note: expanded from macro 'unsafe_get_user'
     449 |         __get_user_nocheck(__gu_val, (ptr), label);                     \
         |         ^
   arch/riscv/include/asm/uaccess.h:185:3: note: expanded from macro '__get_user_nocheck'
     185 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   7 warnings generated.
..


vim +3921 include/linux/fs.h

90f8572b0f021f Eric W. Biederman 2015-06-29  3903  
45cd0faae3715e Amir Goldstein    2018-08-27  3904  /* mm/fadvise.c */
45cd0faae3715e Amir Goldstein    2018-08-27  3905  extern int vfs_fadvise(struct file *file, loff_t offset, loff_t len,
45cd0faae3715e Amir Goldstein    2018-08-27  3906  		       int advice);
cf1ea0592dbf10 Jan Kara          2019-08-29  3907  extern int generic_fadvise(struct file *file, loff_t offset, loff_t len,
cf1ea0592dbf10 Jan Kara          2019-08-29  3908  			   int advice);
45cd0faae3715e Amir Goldstein    2018-08-27  3909  
1bc6d4452d5c91 Christian Brauner 2024-04-30  3910  static inline bool vfs_empty_path(int dfd, const char __user *path)
1bc6d4452d5c91 Christian Brauner 2024-04-30  3911  {
1bc6d4452d5c91 Christian Brauner 2024-04-30  3912  	char c;
1bc6d4452d5c91 Christian Brauner 2024-04-30  3913  
1bc6d4452d5c91 Christian Brauner 2024-04-30  3914  	if (dfd < 0)
1bc6d4452d5c91 Christian Brauner 2024-04-30  3915  		return false;
1bc6d4452d5c91 Christian Brauner 2024-04-30  3916  
1bc6d4452d5c91 Christian Brauner 2024-04-30  3917  	/* We now allow NULL to be used for empty path. */
1bc6d4452d5c91 Christian Brauner 2024-04-30  3918  	if (!path)
1bc6d4452d5c91 Christian Brauner 2024-04-30  3919  		return true;
1bc6d4452d5c91 Christian Brauner 2024-04-30  3920  
1bc6d4452d5c91 Christian Brauner 2024-04-30 @3921  	if (unlikely(get_user(c, path)))
1bc6d4452d5c91 Christian Brauner 2024-04-30  3922  		return false;
1bc6d4452d5c91 Christian Brauner 2024-04-30  3923  
1bc6d4452d5c91 Christian Brauner 2024-04-30  3924  	return !c;
1bc6d4452d5c91 Christian Brauner 2024-04-30  3925  }
1bc6d4452d5c91 Christian Brauner 2024-04-30  3926  

:::::: The code at line 3921 was first introduced by commit
:::::: 1bc6d4452d5c91beb09e37a98a590808e1997b79 fs: new helper vfs_empty_path()

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
