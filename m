Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9963D176FB1;
	Sun, 19 Apr 2026 00:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557760; cv=none; b=IcTZ6IvExYtbPBroSDve0OBBJQJ4ZwUk+Gj/SFtxkOhkxACZQQUegB/5kk1PD7hBHzc92d5uksONjD4hMtVOeTgx+ipxY1qF0RXSeFWjVVr4VsLbTywatDYcCcse49b8lkfr0LZlcRjZWn59Eo3p7Hn21ntm8Q4YHjC/OuIuObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557760; c=relaxed/simple;
	bh=61Y2NrOO5m0b4dv5cBIvkoZBlg4AOUpUSRtAdz0uP3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cKq7QuHdmrbeXhKbsrY9NCHwhikE5twJbMa8Da/32yNmNspz+IHT3aHXokYR6jkIHi5Q/t6PhBQcPWKypJC0xTLSn1vbelXfg0f8Ll7+vjC8xFZjEz08J2Jtf+gxDRMSNEuMYbeDnhSc77u9mRSq2OJAsZfwDIvhytEqwHVbbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgubJwRh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgubJwRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776557758; x=1808093758;
  h=date:from:to:cc:subject:message-id;
  bh=61Y2NrOO5m0b4dv5cBIvkoZBlg4AOUpUSRtAdz0uP3g=;
  b=kgubJwRh6yQmv6US+WmRYAFIQGUubDAAQWXmMY3gXoensiyHJtHQMA+t
   wblwDT3oUa7OQtFcj8F4PbKGbcpvdmYOn651weq1SdcoLp+B7jIUbQDHH
   0OEAppxRCvz4AuWL4IcdfBmVlbVECmVYgJiJIYvqVah0lT1/PtS6sVymi
   vAqnoh04CATbnbQa7hLBYgFHlqubhfRrrHqmpp5y+pD7PMaFk5gD8bH5y
   IJNNkbXxPQCQm2dAfWTUIvgnAeZJ2hELTu715Zn5Biz5ihglkHCzwy79p
   U/PXNiGJw3mVOzN+fYX9WKOfH4txap/xD6NpvgfUPIQmyclPlbKd9SqRg
   Q==;
X-CSE-ConnectionGUID: /gP4IXJiQpS9n20r44c31Q==
X-CSE-MsgGUID: EqUE/pOITfqz5NKvIOoqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77228046"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77228046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 17:15:58 -0700
X-CSE-ConnectionGUID: Tcl9XqwWQXS4Hyyvj8Murg==
X-CSE-MsgGUID: 9Wpe2mxMRE2jCglgoJXXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="224868990"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2026 17:15:56 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEFpJ-000000001bv-3HHE;
	Sun, 19 Apr 2026 00:15:53 +0000
Date: Sun, 19 Apr 2026 08:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd/rfc-v2 3/7] include/linux/userfaultfd_k.h:167:55:
 warning: shift count >= width of type
Message-ID: <202604190854.w97I47Zr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/rfc-v2
head:   8f55f0ce2de130272cb80eee2434a185922b3340
commit: a5a0f28bfc37d5fb52d9268238be0f8280ca737c [3/7] userfaultfd: add UFFDIO_REGISTER_MODE_RWP
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260419/202604190854.w97I47Zr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190854.w97I47Zr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190854.w97I47Zr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/exec.c:82:
   In file included from fs/../mm/internal.h:13:
   In file included from include/linux/mm_inline.h:10:
>> include/linux/userfaultfd_k.h:167:55: warning: shift count >= width of type [-Wshift-count-overflow]
     167 |         return vma->vm_flags & (VM_UFFD_WP | VM_UFFD_MINOR | VM_UFFD_RWP);
         |                                                              ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/exec.c:82:
   In file included from fs/../mm/internal.h:13:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:199:25: warning: shift count >= width of type [-Wshift-count-overflow]
     199 |         return vma->vm_flags & VM_UFFD_RWP;
         |                                ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/exec.c:82:
   In file included from fs/../mm/internal.h:13:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:216:25: warning: shift count >= width of type [-Wshift-count-overflow]
     216 |         return vma->vm_flags & __VM_UFFD_FLAGS;
         |                                ^~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/exec.c:82:
   In file included from fs/../mm/internal.h:13:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:223:14: warning: shift count >= width of type [-Wshift-count-overflow]
     223 |         vm_flags &= __VM_UFFD_FLAGS;
         |                     ^~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/exec.c:82:
   In file included from fs/../mm/internal.h:13:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:237:15: warning: shift count >= width of type [-Wshift-count-overflow]
     237 |         vm_flags &= ~VM_UFFD_RWP;
         |                      ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   5 warnings generated.
--
   In file included from fs/userfaultfd.c:18:
   In file included from include/linux/mm_inline.h:10:
>> include/linux/userfaultfd_k.h:167:55: warning: shift count >= width of type [-Wshift-count-overflow]
     167 |         return vma->vm_flags & (VM_UFFD_WP | VM_UFFD_MINOR | VM_UFFD_RWP);
         |                                                              ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/userfaultfd.c:18:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:199:25: warning: shift count >= width of type [-Wshift-count-overflow]
     199 |         return vma->vm_flags & VM_UFFD_RWP;
         |                                ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/userfaultfd.c:18:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:216:25: warning: shift count >= width of type [-Wshift-count-overflow]
     216 |         return vma->vm_flags & __VM_UFFD_FLAGS;
         |                                ^~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/userfaultfd.c:18:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:223:14: warning: shift count >= width of type [-Wshift-count-overflow]
     223 |         vm_flags &= __VM_UFFD_FLAGS;
         |                     ^~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from fs/userfaultfd.c:18:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:237:15: warning: shift count >= width of type [-Wshift-count-overflow]
     237 |         vm_flags &= ~VM_UFFD_RWP;
         |                      ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> fs/userfaultfd.c:220:15: warning: shift count >= width of type [-Wshift-count-overflow]
     220 |         if (reason & VM_UFFD_RWP)
         |                      ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/userfaultfd.c:328:39: warning: shift count >= width of type [-Wshift-count-overflow]
     328 |                 if (pmd_protnone(_pmd) && (reason & VM_UFFD_RWP))
         |                                                     ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/userfaultfd.c:357:39: warning: shift count >= width of type [-Wshift-count-overflow]
     357 |         if (pte_protnone(ptent) && (reason & VM_UFFD_RWP))
         |                                              ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/userfaultfd.c:418:28: warning: shift count >= width of type [-Wshift-count-overflow]
     418 |         VM_WARN_ON_ONCE(reason & ~__VM_UFFD_FLAGS);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                     ~~~~~~~~~~~~~^~~~~
   include/asm-generic/bug.h:180:18: note: expanded from macro 'WARN_ON_ONCE'
     180 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   fs/userfaultfd.c:1317:15: warning: shift count >= width of type [-Wshift-count-overflow]
    1317 |                 vm_flags |= VM_UFFD_RWP;
         |                             ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/userfaultfd.c:1360:24: warning: shift count >= width of type [-Wshift-count-overflow]
    1359 |                 VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1360 |                                 !!(cur->vm_flags & __VM_UFFD_FLAGS));
         |                                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                     ~~~~~~~~~~~~~^~~~~
   include/asm-generic/bug.h:180:18: note: expanded from macro 'WARN_ON_ONCE'
     180 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   fs/userfaultfd.c:1511:24: warning: shift count >= width of type [-Wshift-count-overflow]
    1510 |                 VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1511 |                                 !!(cur->vm_flags & __VM_UFFD_FLAGS));
         |                                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
--
   In file included from mm/memory.c:44:
   In file included from include/linux/mm_inline.h:10:
>> include/linux/userfaultfd_k.h:167:55: warning: shift count >= width of type [-Wshift-count-overflow]
     167 |         return vma->vm_flags & (VM_UFFD_WP | VM_UFFD_MINOR | VM_UFFD_RWP);
         |                                                              ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from mm/memory.c:44:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:199:25: warning: shift count >= width of type [-Wshift-count-overflow]
     199 |         return vma->vm_flags & VM_UFFD_RWP;
         |                                ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from mm/memory.c:44:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:216:25: warning: shift count >= width of type [-Wshift-count-overflow]
     216 |         return vma->vm_flags & __VM_UFFD_FLAGS;
         |                                ^~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from mm/memory.c:44:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:223:14: warning: shift count >= width of type [-Wshift-count-overflow]
     223 |         vm_flags &= __VM_UFFD_FLAGS;
         |                     ^~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:25:5: note: expanded from macro '__VM_UFFD_FLAGS'
      25 |                          VM_UFFD_RWP)
         |                          ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   In file included from mm/memory.c:44:
   In file included from include/linux/mm_inline.h:10:
   include/linux/userfaultfd_k.h:237:15: warning: shift count >= width of type [-Wshift-count-overflow]
     237 |         vm_flags &= ~VM_UFFD_RWP;
         |                      ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   mm/memory.c:1485:26: warning: shift count >= width of type [-Wshift-count-overflow]
    1485 |         if (dst_vma->vm_flags & VM_COPY_ON_FORK)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/mm.h:643:65: note: expanded from macro 'VM_COPY_ON_FORK'
     643 | #define VM_COPY_ON_FORK (VM_PFNMAP | VM_MIXEDMAP | VM_UFFD_WP | VM_UFFD_RWP | \
         |                                                                 ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   mm/memory.c:6069:31: warning: shift count >= width of type [-Wshift-count-overflow]
    6069 |         return handle_userfault(vmf, VM_UFFD_RWP);
         |                                      ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
..


vim +167 include/linux/userfaultfd_k.h

   153	
   154	/*
   155	 * Never enable huge pmd sharing on some uffd registered vmas:
   156	 *
   157	 * - VM_UFFD_WP VMAs, because write protect information is per pgtable entry.
   158	 *
   159	 * - VM_UFFD_MINOR VMAs, because otherwise we would never get minor faults for
   160	 *   VMAs which share huge pmds. (If you have two mappings to the same
   161	 *   underlying pages, and fault in the non-UFFD-registered one with a write,
   162	 *   with huge pmd sharing this would *also* setup the second UFFD-registered
   163	 *   mapping, and we'd not get minor faults.)
   164	 */
   165	static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
   166	{
 > 167		return vma->vm_flags & (VM_UFFD_WP | VM_UFFD_MINOR | VM_UFFD_RWP);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
