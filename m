Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813B3081D6;
	Wed, 25 Mar 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441898; cv=none; b=H6rS9Tz0SiGzRvjBAMZ5XChoZ3j4fyrTzt3MKG29vo2AKiET8+1WgbKyWRh0SP7sC8BwU+1mS4IwAV5xJChQBOT+IrMuD/+u8zeDEyNJedJ4mpOi2VNW8M7g7OtWUU0snTw9nUVvTzYlmRYDrlupp1bFWtZ1VLIGyj2qjTRYDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441898; c=relaxed/simple;
	bh=Z3SZCSbhBFWu8rsltkP3qFJdmtCVYUDApccrJqNIdqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iC4eWsiWBLZDVUe2Y1MJMTUdHrVP5NVnOTf3oukyRR2dZgAMlKlGStmPY0cQaSfqjf9ODjyfJ2tigke1VEBl2yLFxDpUwRj+ZQfKr9QmipssGa6VJWCTnRLtW8BeSzY8OVLBx50tvHuLg5OR0DsLfVwCJbCx3/ycMK2L233VybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mpi5XMRQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mpi5XMRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441897; x=1805977897;
  h=date:from:to:cc:subject:message-id;
  bh=Z3SZCSbhBFWu8rsltkP3qFJdmtCVYUDApccrJqNIdqc=;
  b=Mpi5XMRQlUnHtqyqgomlmt4Rzi+BJlpCB+LNMadOsjrCFpEEF+R7YpTK
   pcOa2zGiyRQFcNEtpNJ5//XUzogekyzOevmUT4viyDWpI/ymiZeEsfCqS
   1TrFKQ7XRYNgLiG7JuVHy98zB6RarWn/rXpjXWRz8NmVnZhl/xcqFGh/z
   wsfLgJstdLx+Ju+JwEM9VVXKhX9WXpevAAC9EunG73/Z5yqjdiaPTp/gt
   BYJjVyuzR4tMQQ6MdYGlvQTpJCc1s038VHz4kZ7jri63l5mgOs+19asr1
   vnDkaEmAWrM7qtpqMSwaaoBxXoyRZu3xHS49A0kY7tQXA+1uy6PCKWWQ5
   A==;
X-CSE-ConnectionGUID: aiw8ooR5TcuUrHJQT8YufQ==
X-CSE-MsgGUID: v5Tz4rzJRIqTvku1QbJikQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75364091"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75364091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:31:35 -0700
X-CSE-ConnectionGUID: 8CQC4yxfTTOs87CSuot9FA==
X-CSE-MsgGUID: w5p9LRehRKyzhtdFCb4Urg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248184791"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 05:31:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5NOU-000000006oP-3PnQ;
	Wed, 25 Mar 2026 12:31:30 +0000
Date: Wed, 25 Mar 2026 20:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-input@vger.kernel.org
Subject: [dtor-input:next 32/43]
 drivers/input/touchscreen/mxs-lradc-ts.c:508:45: error: too many arguments
 provided to function-like macro invocation
Message-ID: <202603252030.fwSlmiBx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   303cdff39cdb1895a6d2b08e8946cc89feaf405c
commit: a995f3ca3bd51c348bd4c8d1833d318bef1a5001 [32/43] Input: mxs-lradc-ts - use guard notation when acquiring spinlock
config: riscv-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252030.fwSlmiBx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252030.fwSlmiBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252030.fwSlmiBx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/mxs-lradc-ts.c:508:45: error: too many arguments provided to function-like macro invocation
     508 |                 scoped_guard(spinlock_irqsave, &ts->lock, flags) {
         |                                                           ^
   include/linux/spinlock.h:623:9: note: macro 'class_spinlock_irqsave_constructor' defined here
     623 | #define class_spinlock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave, _T)
         |         ^
>> drivers/input/touchscreen/mxs-lradc-ts.c:508:3: error: initializing 'class_spinlock_irqsave_t' with an expression of incompatible type 'class_spinlock_irqsave_t (spinlock_t *)' (aka 'class_spinlock_irqsave_t (struct spinlock *)')
     508 |                 scoped_guard(spinlock_irqsave, &ts->lock, flags) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:447:2: note: expanded from macro 'scoped_guard'
     447 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:438:20: note: expanded from macro '__scoped_guard'
     438 |         for (CLASS(_name, scope)(args);                                 \
         |              ~~~~~~~~~~~~~^~~~~~
   include/linux/cleanup.h:299:20: note: expanded from macro 'CLASS'
     299 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                           ^
     300 |                 class_##_name##_constructor
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +508 drivers/input/touchscreen/mxs-lradc-ts.c

   491	
   492	/* IRQ Handling */
   493	static irqreturn_t mxs_lradc_ts_handle_irq(int irq, void *data)
   494	{
   495		struct mxs_lradc_ts *ts = data;
   496		struct mxs_lradc *lradc = ts->lradc;
   497		unsigned long reg = readl(ts->base + LRADC_CTRL1);
   498		u32 clr_irq = mxs_lradc_irq_mask(lradc);
   499		const u32 ts_irq_mask =
   500			LRADC_CTRL1_TOUCH_DETECT_IRQ |
   501			LRADC_CTRL1_LRADC_IRQ(TOUCHSCREEN_VCHANNEL1) |
   502			LRADC_CTRL1_LRADC_IRQ(TOUCHSCREEN_VCHANNEL2);
   503	
   504		if (!(reg & mxs_lradc_irq_mask(lradc)))
   505			return IRQ_NONE;
   506	
   507		if (reg & ts_irq_mask) {
 > 508			scoped_guard(spinlock_irqsave, &ts->lock, flags) {
   509				mxs_lradc_handle_touch(ts);
   510			}
   511			/* Make sure we don't clear the next conversion's interrupt. */
   512			clr_irq &= ~(LRADC_CTRL1_LRADC_IRQ(TOUCHSCREEN_VCHANNEL1) |
   513					LRADC_CTRL1_LRADC_IRQ(TOUCHSCREEN_VCHANNEL2));
   514			writel(reg & clr_irq,
   515			       ts->base + LRADC_CTRL1 + STMP_OFFSET_REG_CLR);
   516		}
   517	
   518		return IRQ_HANDLED;
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
