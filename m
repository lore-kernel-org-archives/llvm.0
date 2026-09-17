Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04C2547072;
	Thu, 17 Sep 2026 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665104; cv=none; b=cBfj9zZjWSmvm4Ehwl7KjmxO6Ks+PfenmO++zn57sxbDB2QNeCUVqLxuaCi7xLlXheIU/XW7lqwkuc8qaNVfBMOsodVmomaZU/EC4KcBp5QnRy6GzQ4b4rE9KlFCSBkg+WFlNQ2hBNKGo0WTKzLztPcqorn3oOBjIijf3iCAxJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665104; c=relaxed/simple;
	bh=QCmCvULCSQn7dxYaMf48EBHKoyECq4F13pBQ0voEC+c=;
	h=Date:From:Cc:Subject:Message-ID; b=nLImvosZ3VeGUFIec9mPLQJfx6uNfYTiGqLynEIqpT4974XVub0cgclrJ7GnBVbnWwjD4PSLO/CEnIuwEcRHE4pWci0UGGnbjamRzdJjgCXOKFcMKX50TqWBllYgfP/jql+gXZGcktGyE/iYDByL/edWaIG60EBVw9NFk1ixY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fj6TBt13; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj6TBt13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789665102; x=1821201102;
  h=date:from:cc:subject:message-id;
  bh=QCmCvULCSQn7dxYaMf48EBHKoyECq4F13pBQ0voEC+c=;
  b=fj6TBt135sxFqRQqsFXRxeks/Whr2RNYsOkgyE2cSKnNj7EIYkY57eFV
   1lKVZIIUHS0P9KfI6dL0qz3bYZA95BHq8lq2fQKi4WyKersKySHQ4M9ov
   h/1iPo8/aInYwzVpjvU1Sz58Sb826HwihKknAGT7MqIuUpYYLwbVQc78k
   vPEhvyW1N/BkJhUeGtdeauna831W8u1Cr9VaIE5NOXYNJqsaO8HwAGQui
   sbcv1WOlx8Gf60aU+AwcVFHk8jrsgL7PQpRQKJiKEtwSLHAv4x1selESR
   vydrAAGvryMYqGNt217fSP60TpiktIZ546izV1qupcfoIVevoKMU8Wrd1
   Q==;
X-CSE-ConnectionGUID: rDWELSM7RmuabFTs7/R8hQ==
X-CSE-MsgGUID: R1h2lfrCTLCAXG9DeItaNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89046096"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89046096"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:11:41 -0700
X-CSE-ConnectionGUID: E/eUDXbRSMq6xZOtaNgYjA==
X-CSE-MsgGUID: gJ30Y/FJRHqpjXsWNpNp4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2136631"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 10:11:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Fe5-000000008HB-2STT;
	Thu, 17 Sep 2026 17:11:37 +0000
Date: Fri, 18 Sep 2026 01:11:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 1/1]
 include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct
 rq_list'
Message-ID: <202609180126.3KyZ35Bp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   15ffcb7576561ae4930591fbedcdfbcfab0b5f97
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [1/1] UPSTREAM: block: add a rq_list type
config: arm64-randconfig-1003-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180126.3KyZ35Bp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180126.3KyZ35Bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180126.3KyZ35Bp-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   make[3]: *** [rust/Makefile:431: rust/helpers/helpers.o] Error 1 shuffle=1823093635
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
   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=1823093635
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
