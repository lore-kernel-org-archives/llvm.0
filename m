Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652843CC33F;
	Fri, 28 Aug 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900824; cv=none; b=ZhfQu5ljSYHBCJWmO/Tkg1lX0Vn76Nk7SE8WlwnVcvYNb8t/HJp6XlXjNMGpUn1GVSk+bWdRP0sgoCwriW8HrylbkZ2OjJX2JEbi/cKsoZucnjbt8fSSeB1U1YKxw4pBUio/8Dzcg11f5CFjRM3Mwft/EvD/irbIRjvU6fm7Jg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900824; c=relaxed/simple;
	bh=BN/+G4zWK2RRQMtMrHrssXG5xrKCM18lgYGzEQApxZw=;
	h=Date:From:Cc:Subject:Message-ID; b=J4xGa7hcnfiANjQ0cR1A3GGzR/lehS4iRNTr6P09pm1rMsLHj+hTqkxh8tDjaZvbNO2cCywjbrK6Y35v5rrBB2BUit786p+GOnR+GStJB1vV8s96fCDFgddOrbT4zG1emz1mzdcCqeTv7uFX6uLzuEGvEoEEXKpnEAmCQ8P7x50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyBEtrL9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyBEtrL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787900822; x=1819436822;
  h=date:from:cc:subject:message-id;
  bh=BN/+G4zWK2RRQMtMrHrssXG5xrKCM18lgYGzEQApxZw=;
  b=jyBEtrL9U/KTO9yspaGuRrlKAfymnPsO3U48fQGJFqc2zpPpWC14qEs4
   KLHbGvWLQGgzL6JZfuFz/ALwzfxKOyHqLpPM+1f/IUFESseRsWKwA8u3I
   PNgIP93Sa277KD0cbagNcI6Qntifu3So0MmYgPZYa3drbTdasPutcQB5X
   VgksS8m3lelucnhxgGB6Uc6Z6QFCSIuqN4K/B9c5E5S/49gMIBOEA3geS
   x8nHBP+O/PhWk9MiqKkoNNn5A7U/yXDnkdcj7gir+7KFPgCbWFUMPpOO1
   fzI6zpwqwNUpdHJAieUL1/lil4pWXXxq/o8DyUcG3xba7OhPvzLKJ48Xe
   A==;
X-CSE-ConnectionGUID: uagyHKFXSj+bw/ShJtkOkg==
X-CSE-MsgGUID: zlXRC59sQn2ZaP83tAj1ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99757897"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99757897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:06:45 -0700
X-CSE-ConnectionGUID: l9L4QjG3TguXji0Sk2dG0w==
X-CSE-MsgGUID: 0YIa+yO2RrujIDJvxIGFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291576984"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Aug 2026 00:06:42 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzqff-00000000AXx-3lIr;
	Fri, 28 Aug 2026 07:06:39 +0000
Date: Fri, 28 Aug 2026 15:06:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct
 rq_list'
Message-ID: <202608281500.eLpSJP8L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: cros-kernel-buildreports@googlegroups.com

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   50e8de680435dfb61c1efbe10901c2cf9d97433a
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [0/3] UPSTREAM: block: add a rq_list type
config: x86_64-randconfig-004-20260828 (https://download.01.org/0day-ci/archive/20260828/202608281500.eLpSJP8L-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281500.eLpSJP8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281500.eLpSJP8L-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[3]: *** [rust/Makefile:443: rust/core.o] Error 1 shuffle=540017786
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
   28 | #define __SANITIZE_ADDRESS__
   |         ^
   <built-in>:353:9: note: previous definition is here
   353 | #define __SANITIZE_ADDRESS__ 1
   |         ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   239 |         return rl->head == NULL;
   |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   244 |         rl->head = NULL;
   |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   245 |         rl->tail = NULL;
   |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   251 |         if (rl->tail)
   |             ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   252 |                 rl->tail->rq_next = rq;
   |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   254 |                 rl->head = rq;
   |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   255 |         rl->tail = rq;
   |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   260 |         rq->rq_next = rl->head;
   |                       ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   261 |         rl->head = rq;
   |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   262 |         if (!rl->tail)
   |              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   263 |                 rl->tail = rq;
   |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   268 |         struct request *rq = rl->head;
   |                              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   271 |                 rl->head = rl->head->rq_next;
   |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   271 |                 rl->head = rl->head->rq_next;
   |                            ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   272 |                 if (!rl->head)
   |                      ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   273 |                         rl->tail = NULL;
   |                         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:11:
   In file included from rust/helpers/blk.c:3:
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   282 |         return rl->head;
   |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   1699 |         struct rq_list req_list;
   |                ^
   In file included from rust/helpers/helpers.c:21:
   In file included from rust/helpers/mman.c:3:
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
   159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
   |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
   137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
   |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
   160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
   |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
   137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
   |                     ^ ~~~~~~~~~~~~~~~~~
   3 warnings and 18 errors generated.
   make[3]: *** [rust/Makefile:431: rust/helpers/helpers.o] Error 1 shuffle=540017786
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> Unable to generate bindings: clang diagnosed error: include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
--
   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=540017786
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:137:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> Unable to generate bindings: clang diagnosed error: include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'


vim +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
