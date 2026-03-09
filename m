Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88E392C35;
	Mon,  9 Mar 2026 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773099701; cv=none; b=V0cty4lQPoYCXbV3tHylGn/PIE/M7dcwHKHQGICci1CEeYMf69T5ELbMznCNvDDK3WL3HYHuz4iI26pKEdXYIvHVoGcCbIjutfdRU5bue8zavhs3VUCRU63WvqfKIMSVET38KO7u5PvAtoJKOExNkKg68QbseePAFMNC89yGweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773099701; c=relaxed/simple;
	bh=23AQyKhvYFnvv3mr+aCBcqA42hSbK57co0tLCkWFvv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=urB9h3KPawNBdxloIsaYezOSBIHX0x+6DiXZYbg5H6rylbncFfhuf4xhM55JzJEh6xMs3wOL7fxgvwSnebQPEuUI2rDVDAdcZsrwpZ5B1u75dXxrNZRkBM6pCJjrwyjS0rWHe0XhZj1DLrJl7fPq3sxG02ZZWPpPyVmEpAkSjsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAuwbdhJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAuwbdhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773099700; x=1804635700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23AQyKhvYFnvv3mr+aCBcqA42hSbK57co0tLCkWFvv0=;
  b=eAuwbdhJUM3ukqejgOhQusCjsLWxhUJpmKZWN9tJ7anI1Tyo7t6CPAxN
   Fzeae4BiPGdcoq1xpFAvj+iej50fxXLraq2Eq2RrzKlM6xoW9v5/5ZB4l
   5A14p+wZkFSKCA6e5/OHOcdP2gL0O/iB7qGGOaL7gjviLtiV8KxxeWb0v
   DW4Vlw1kx1amSalC2RBizjpHq/mRIJcPjsqObzxXo9CBLIWAHPJay+qZC
   yX7/jUIY16dD6ZWgEgtk09CAGnhGoy0kp+5/6cvSXao4ESzN0+HjyGzwz
   DUJO6Xjro3tWWDJRbH7DOb/iilp5/kwqSyi0w+DEEDXtnkDhqZ3bI2Zyr
   Q==;
X-CSE-ConnectionGUID: JBAOxpMmSJOPjsko6y1aXQ==
X-CSE-MsgGUID: pxxP4t7OQUWHj5FX3xuZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84464411"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84464411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:41:39 -0700
X-CSE-ConnectionGUID: RsfjxMu1RVaU0ziTczmD8Q==
X-CSE-MsgGUID: dbr+OoZgQKS26YbiaWNT8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216770595"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2026 16:41:37 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzkEA-000000000yW-3hwi;
	Mon, 09 Mar 2026 23:41:34 +0000
Date: Tue, 10 Mar 2026 07:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 2/2]
 arch/arm/kernel/signal.h:4:18: error: field has incomplete type 'struct
 ucontext'
Message-ID: <202603100737.K3CuGFOl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   df361b22b2f106ba30caa3955db2858764c4a3db
commit: b3b6bda8db008005cbd3da3b085bed301450704f [2/2] ucontext
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260310/202603100737.K3CuGFOl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100737.K3CuGFOl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100737.K3CuGFOl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:32:
>> arch/arm/kernel/signal.h:4:18: error: field has incomplete type 'struct ucontext'
       4 |         struct ucontext uc;
         |                         ^
   arch/arm/kernel/signal.h:4:9: note: forward declaration of 'struct ucontext'
       4 |         struct ucontext uc;
         |                ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1341: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +4 arch/arm/kernel/signal.h

5c16595353e074 Nicolas Pitre 2017-08-09  2  
5c16595353e074 Nicolas Pitre 2017-08-09  3  struct sigframe {
5c16595353e074 Nicolas Pitre 2017-08-09 @4  	struct ucontext uc;
5c16595353e074 Nicolas Pitre 2017-08-09  5  	unsigned long retcode[4];
5c16595353e074 Nicolas Pitre 2017-08-09  6  };
5c16595353e074 Nicolas Pitre 2017-08-09  7  

:::::: The code at line 4 was first introduced by commit
:::::: 5c16595353e0743af99294db48549c3145e3a5ad ARM: signal handling support for FDPIC_FUNCPTRS functions

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nicolas.pitre@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
