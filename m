Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB321DE2B4;
	Wed,  2 Apr 2025 07:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577948; cv=none; b=a9g8rnoTHAAOa6BAgfN4E/KQ3eVNWw+2TC60WiM1xM6NdEzNKg43YTsfSAtURFAa4LF6Uuq65okr9PgfAwGOb3oeQNqaOjkE04qlxv025QXlCWTV/Mq+kWRz/KMPQaYXPAW90lwwR2Qd+xbV2swxNg7XffF/+ayWPDPqFeVPE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577948; c=relaxed/simple;
	bh=FHGwz101zBFwuB3z7Qa+rUADrbwA4hEKXaZsc6fujk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKqWTNGoIK8hNyK+BsSszUC4p1zsXc/qiHovvZh+ZQOzFkxMTTCqVhEeaCXHAAs/GwzondDBFsEmhVX22erjOnJeF046WYbpXS9emTKxpC/Dphpt4TraQEKKnjRscVjxrAPM3gNNoGUfMLCRpJQ+tft5SWfWV0CH0Q9MBs2N9Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOJau+K+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOJau+K+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743577946; x=1775113946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FHGwz101zBFwuB3z7Qa+rUADrbwA4hEKXaZsc6fujk0=;
  b=gOJau+K+6DQZzj2ctLQ/exT0z3W/ijhVHpOfgLal48tC8ZVm0rFxt6HL
   Ks8iPVqpog4+b7p3nxhHWU9uq0Ohll7LHlJNgKijgPmaRoqqPjv2w62Yq
   7OoN9Z2k49gUya+LLuaPvim5nbg7QttpuwoSHOLNpQXpNkCpCTef7doTD
   mIVSZ8i8wUf1qVOqYPb0DgT04VakCmGyLsWP61YKcxedGokb4XmqX8yd5
   4nMTt9xYohmxe2FdhJNMApVSX5WqFJqSCa9iILRjD5DLdf203Zqprk77a
   ihRGr2p4W8AhO3gwvC5tWUrfdtKXSOSuG9rbDUCbwoPS4SmLUqzuHx3et
   w==;
X-CSE-ConnectionGUID: dBCRpzDFSEajGk5Ph7gYzA==
X-CSE-MsgGUID: ZACLMBJ7Q+iFZErUYNhIEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45071455"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="45071455"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:12:25 -0700
X-CSE-ConnectionGUID: 1xyMX/tkTU2lOtcujXofFA==
X-CSE-MsgGUID: zH8EAmFgSLyI5ZrV+uwuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="127440006"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2025 00:12:23 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzsGo-000AWq-0r;
	Wed, 02 Apr 2025 07:12:19 +0000
Date: Wed, 2 Apr 2025 15:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Somlo <gsomlo@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [litex-hub:litex-rebase 8/18] drivers/gpio/gpio-litex.c:157:2:
 error: use of undeclared identifier 'class_spin_lock_irqsave_t'; did you
 mean '_raw_spin_lock_irqsave'?
Message-ID: <202504021531.LSDxngLf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   27cd831fb75ec1b1667350dcdad43e58d34ac9f5
commit: 639fd3757f161027e4f8ec56033e598bf06d7923 [8/18] fixup: use scoped_guard() with LiteGPIO
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504021531.LSDxngLf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021531.LSDxngLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021531.LSDxngLf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'class_spin_lock_irqsave_t'; did you mean '_raw_spin_lock_irqsave'?
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^
   include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:159:1: note: expanded from here
     159 | class_spin_lock_irqsave_t
         | ^
   include/linux/spinlock_api_smp.h:32:26: note: '_raw_spin_lock_irqsave' declared here
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                          ^
>> drivers/gpio/gpio-litex.c:157:2: error: expected ';' in 'for' statement specifier
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |                           ^
>> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |                           ^
   arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
     119 | extern struct sclp_info sclp;
         |                         ^
>> drivers/gpio/gpio-litex.c:157:2: error: expected ';' in 'for' statement specifier
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^
   include/linux/cleanup.h:258:24: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                               ^
   include/linux/compiler-clang.h:15:25: note: expanded from macro '__cleanup'
      15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
         |                         ^
   include/linux/compiler_attributes.h:343:41: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                         ^
>> drivers/gpio/gpio-litex.c:157:2: error: call to undeclared function 'class_spin_lock_irqsave_lock_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:7: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^
   include/linux/cleanup.h:321:28: note: expanded from macro '__guard_ptr'
     321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^
   <scratch space>:165:1: note: expanded from here
     165 | class_spin_lock_irqsave_lock_ptr
         | ^
   drivers/gpio/gpio-litex.c:157:2: note: did you mean 'class_spinlock_irqsave_lock_ptr'?
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:7: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^
   include/linux/cleanup.h:321:28: note: expanded from macro '__guard_ptr'
     321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^
   <scratch space>:165:1: note: expanded from here
     165 | class_spin_lock_irqsave_lock_ptr
         | ^
   include/linux/spinlock.h:585:1: note: 'class_spinlock_irqsave_lock_ptr' declared here
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^
   include/linux/cleanup.h:408:49: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     408 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
   include/linux/cleanup.h:387:10: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     387 |                                                                         \
         |                                                                         ^
   include/linux/cleanup.h:295:23: note: expanded from macro '\
   __DEFINE_GUARD_LOCK_PTR'
     295 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                              ^
   <scratch space>:133:1: note: expanded from here
     133 | class_spinlock_irqsave_lock_ptr
         | ^
>> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:27: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                  ^
   arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
     119 | extern struct sclp_info sclp;
         |                         ^
>> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'class_spin_lock_irqsave_is_conditional'; did you mean 'class_spinlock_irqsave_is_conditional'?
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:38: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^
   include/linux/cleanup.h:322:30: note: expanded from macro '__is_cond_ptr'
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^
   <scratch space>:167:1: note: expanded from here
     167 | class_spin_lock_irqsave_is_conditional
         | ^
   include/linux/spinlock.h:585:1: note: 'class_spinlock_irqsave_is_conditional' declared here
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^
   include/linux/cleanup.h:407:65: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     407 | #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)          \
         |                                                                         ^
   include/linux/cleanup.h:292:34: note: expanded from macro '\
   __DEFINE_CLASS_IS_CONDITIONAL'
     292 | static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
         |                                  ^
   <scratch space>:125:1: note: expanded from here
     125 | class_spinlock_irqsave_is_conditional
         | ^
>> drivers/gpio/gpio-litex.c:157:2: error: expected ')'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:58: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                                                 ^
   drivers/gpio/gpio-litex.c:157:2: note: to match this '('
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:6: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |             ^
>> drivers/gpio/gpio-litex.c:157:2: error: expected ';' after expression
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:336:25: note: expanded from macro '__scoped_guard'
     336 |              ({ goto _label; }))                                        \
         |                                ^
>> drivers/gpio/gpio-litex.c:157:2: error: expected expression
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:336:25: note: expanded from macro '__scoped_guard'
     336 |              ({ goto _label; }))                                        \
         |                                ^
>> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared label '__UNIQUE_ID_label556'
   include/linux/cleanup.h:343:24: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |                               ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:157:1: note: expanded from here
     157 | __UNIQUE_ID_label556
         | ^
   drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'class_spin_lock_irqsave_t'; did you mean '_raw_spin_lock_irqsave'?
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^
   include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:173:1: note: expanded from here
     173 | class_spin_lock_irqsave_t
         | ^
   include/linux/spinlock_api_smp.h:32:26: note: '_raw_spin_lock_irqsave' declared here
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                          ^
   drivers/gpio/gpio-litex.c:173:2: error: expected ';' in 'for' statement specifier
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |                           ^
   drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |                           ^
   arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
     119 | extern struct sclp_info sclp;
         |                         ^
   drivers/gpio/gpio-litex.c:173:2: error: expected ';' in 'for' statement specifier
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^
   include/linux/cleanup.h:258:24: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                               ^
   include/linux/compiler-clang.h:15:25: note: expanded from macro '__cleanup'
      15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
         |                         ^
   include/linux/compiler_attributes.h:343:41: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                         ^
   drivers/gpio/gpio-litex.c:173:2: error: call to undeclared function 'class_spin_lock_irqsave_lock_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:7: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^
   include/linux/cleanup.h:321:28: note: expanded from macro '__guard_ptr'
     321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^
   <scratch space>:179:1: note: expanded from here
     179 | class_spin_lock_irqsave_lock_ptr
         | ^
   drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:27: note: expanded from macro '__scoped_guard'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                  ^
   arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
     119 | extern struct sclp_info sclp;
         |                         ^
   drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'class_spin_lock_irqsave_is_conditional'; did you mean 'class_spinlock_irqsave_is_conditional'?
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:335:38: note: expanded from macro '__scoped_guard'


vim +157 drivers/gpio/gpio-litex.c

   145	
   146	static void litex_gpio_irq_unmask(struct irq_data *idata)
   147	{
   148		struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
   149		struct litex_gpio *gpio_s = gpiochip_get_data(chip);
   150		int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
   151		u32 bit = BIT(offset);
   152		u32 enable;
   153	
   154		gpiochip_enable_irq(chip, idata->hwirq);
   155	
   156		/* Clear any sticky pending interrupts */
 > 157		scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
   158			litex_gpio_set_reg(gpio_s, LITEX_GPIO_PENDING_OFFSET, bit);
   159			enable = litex_gpio_get_reg(gpio_s, LITEX_GPIO_ENABLE_OFFSET);
   160			enable |= bit;
   161			litex_gpio_set_reg(gpio_s, LITEX_GPIO_ENABLE_OFFSET, enable);
   162		}
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
