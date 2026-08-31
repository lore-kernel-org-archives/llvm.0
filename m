Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF14AD4BD;
	Mon, 31 Aug 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189917; cv=none; b=K5e6Q7p1YZdQ9ZF9o0G0bwvumS2p5h2hzghUaqoJFqsd/pV3Y9aDrVz9rD7mdr518ZekHUAoRuern4cxM/I+qA1pxxRHP5BNxXcmahr3iFKxHh9g6JfvITRxohPJPhz9qgl48VpVZ4VIRl/ZD9YQGQgViendcOXVS2HmCF/KKBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189917; c=relaxed/simple;
	bh=ny8Sz8SRNYgG/ELu7ZN81JbTZHPpyKQmrrASmB08/ww=;
	h=Date:From:Cc:Subject:Message-ID; b=cngHc2qui38lDORryy/b7e243YyYZWTT+XPyl5e24fgTtcDjXynkpb5rqaFbhYmBKulXe9dIKjTVbNIfbW0jo0CNbbKv7EDjqEsfJrRar12eZzDfxUfEaVKPu1F53IuMKIcT5pwwCorYLh2IrdLt41e44euThPn4TpF8EtqWLHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbCcV0P/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbCcV0P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788189914; x=1819725914;
  h=date:from:cc:subject:message-id;
  bh=ny8Sz8SRNYgG/ELu7ZN81JbTZHPpyKQmrrASmB08/ww=;
  b=fbCcV0P/En1gDaKZIZwX6GMNBeuTaJbp2T0J+UlOiA8sMtiZJhu3paYO
   lHAcx1WqXWeg9HYBAMhIckSOPKUZz/fLIR3hpkecwZTt/fOr04mO5L0mb
   Imks/w+rjyAKAYP+czMvcc5wsT4dRDFxjVfnPR5yGcpmWheLElgVyYo/V
   lYDom/iAAyQPFC4iRzw6szLiiNEfxEabjYMG64QiKYKorhzr5wEC8qTbz
   9je38xNIRm/RPze9YpDz8PqPkov+6xjF16Q7byEXhxxkUP9YLJceww2WY
   6UhH8bZbhtEFvw3jYFLvdkF4jBI7YhbcjhlLYVbHfifkDUs6Fb2gVyucT
   A==;
X-CSE-ConnectionGUID: oqKaSxTYSM+AWUICXROzHg==
X-CSE-MsgGUID: xlxgo0K2T4CmDY9xu8JGrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88622685"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88622685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:25:14 -0700
X-CSE-ConnectionGUID: 5JoeLgtMSx+kWJYo+yxrSw==
X-CSE-MsgGUID: SVwrTYBOTLKZEoK9GJnsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267488343"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 08:25:13 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x13sk-000000000nL-40vB;
	Mon, 31 Aug 2026 15:25:10 +0000
Date: Mon, 31 Aug 2026 23:24:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tglx-devel:irqflags 4/22] rust/helpers/spinlock.h:53:34:
 error: call to undeclared function '__LOCK'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202608312301.kMILkNug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   ec3ae38eecb47043e2e2d2138e35ee22dedfced4
commit: e4ad033b57310ea8804a2fb5a32a23fdd93e4329 [4/22] movestuff
config: x86_64-randconfig-005-20260831 (https://download.01.org/0day-ci/archive/20260831/202608312301.kMILkNug-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312301.kMILkNug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608312301.kMILkNug-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers/spinlock.h:53:34: error: call to undeclared function '__LOCK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.h:53:34: error: call to undeclared function '__LOCK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.h:55:7: error: call to undeclared function '__UNLOCK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.h:53:2: error: expected identifier or '('
>> rust/helpers/spinlock.h:53:65: error: while loop outside of a function
>> rust/helpers/spinlock.c:31:19: error: use of undeclared identifier '_raw_spin_lock_irq_disable'
   rust/helpers/spinlock.h:55:2: error: expected identifier or '('
   rust/helpers/spinlock.h:55:66: error: while loop outside of a function
>> rust/helpers/spinlock.c:39:19: error: use of undeclared identifier '_raw_spin_unlock_irq_enable'
>> Unable to generate bindings: clang diagnosed error: rust/helpers/spinlock.h:53:34: error: call to undeclared function '__LOCK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.h:53:34: error: call to undeclared function '__LOCK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.h:55:7: error: call to undeclared function '__UNLOCK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/spinlock.h:53:2: error: expected identifier or '('
>> rust/helpers/spinlock.h:53:65: error: while loop outside of a function
>> rust/helpers/spinlock.c:31:19: error: use of undeclared identifier '_raw_spin_lock_irq_disable'
   rust/helpers/spinlock.h:55:2: error: expected identifier or '('
   rust/helpers/spinlock.h:55:66: error: while loop outside of a function
>> rust/helpers/spinlock.c:39:19: error: use of undeclared identifier '_raw_spin_unlock_irq_enable'


vim +/__LOCK +53 rust/helpers/spinlock.h

    51	
    52	#define __LOCK_IRQ_DISABLE(lock, ...)						\
  > 53		do { local_interrupt_disable(); __LOCK(lock, ##__VA_ARGS__); } while (0)
    54	#define __UNLOCK_IRQ_ENABLE(lock, ...)						\
  > 55		do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
    56	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
