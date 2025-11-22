Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9936D4E3;
	Sat, 22 Nov 2025 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763796164; cv=none; b=WzOcufCEd+6BoRM7Ja64QP9LOuqRp6aDrDVLJd07Uzkb5Ih9+D6tO/52N12oX/fkhv1vCHUSo5f99VoTDJA7NvLN1kuWhQzvvAvTMKuY0Kmc/03oIu/8wsW9B9KKjcIuO6ggTs1F5xG5tU73nywgJCOWw2te6zMcJB1kTzyo/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763796164; c=relaxed/simple;
	bh=vBhdd+mBUybqT0N8LSQYvdjovoKws9IXj9E7SnuzvtE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZaAbdhIGWNYqzevpuGzytF1ywud07sABh2tllOMAX7nGsQyzwlKZQVnXWNneZ2kiRpW1Xz9SP1hirZSQQGTsA2T6AeSg9tVOjhUG+PBjIMiU3HQoQFfWqvXn3mnZZZFBkEBzflUoXqOz18Eblbrictfc2qCR/BbcKuN07q8qXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk2am8zr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk2am8zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763796162; x=1795332162;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vBhdd+mBUybqT0N8LSQYvdjovoKws9IXj9E7SnuzvtE=;
  b=Fk2am8zrZpVixbQKyR/6B52GfxgNbrTsUCwphqh7svJVzeLkwP8ZlDyt
   B6mCPJQ7oNARXCP69w4NL1lS9gagXm5EQo0wi9J1mJYY4pUEN6WopNQir
   GK3nLU3OZm+Jv0S/FjRvCtcQMEPRLFnTFd2rm32pPZvOxahFcBbvdXftJ
   c9Obti3vp6j5ADWE4x1iEUr6WUOuKjxi9jCqY0cvW3DHcqG64RTZ/dI98
   oD8NanUxQLlBqhF0Du2PNseIjUSC2vR+4zycS1keDRwIFAoba/b2V5tcu
   pvp5AgzaBheQd5O/2COaB7jstncs26xkoMEIzWdKLbq42ea3OwK/Onmu6
   Q==;
X-CSE-ConnectionGUID: 934bX7pIS+SbClhtOENz2A==
X-CSE-MsgGUID: uFzZ4QjyThGZImp7aEz2yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83272572"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="83272572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 23:22:41 -0800
X-CSE-ConnectionGUID: TmgWtRtdTaaR5L/vTCOh5g==
X-CSE-MsgGUID: Pr6D6oc7Sq2hkrf6eVtCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192660280"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2025 23:22:40 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMhx7-0007FL-2Y;
	Sat, 22 Nov 2025 07:22:37 +0000
Date: Sat, 22 Nov 2025 15:21:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] Unable to generate bindings:
 clang diagnosed error: include/linux/blkdev.h:1699:17: error: field has
 incomplete type 'struct rq_list'
Message-ID: <202511221532.nBTygcY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c1902e025e9f61d6df517052ea698b429b1f6589
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [0/1] UPSTREAM: block: add a rq_list type
config: x86_64-randconfig-001-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221532.nBTygcY8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221532.nBTygcY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221532.nBTygcY8-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   2 warnings and 18 errors generated.
   make[3]: *** [rust/Makefile:431: rust/helpers/helpers.o] Error 1 shuffle=4150035346
   include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
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
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
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
   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=4150035346
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
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
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
