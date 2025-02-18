Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB572862AD;
	Tue, 18 Feb 2025 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739914967; cv=none; b=BWs97Vr7NdCMReHtSCo/GF42eR8dw5zx9/KjtNsTl8zvOscjYe5Ej7FxIJJ+NnQwUUouczIdsbslFZN5qWzwANW9QxJmUS0W1EMoMQqGa7wxAdaLp3FhgP4E2M0EfTeyiRZS8g5MqiWuwU/vUhr20sW2TkMpXBG8kAkO+Ln1qJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739914967; c=relaxed/simple;
	bh=49i9DiL384YGpF/Wcr9Fo32Df9PMmU00eMiy4kAMXR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fv4m7ke96a3+vgaMViQboRDmIr3MQ1YWNw23Zd2rzPuzvUkIUGVmYXgSZQQcizNiBXflaxlgHdEdKpi5BOFnqjuxQzF3VDA7sKcJkcRFuS5olfXInmDhq6xKd435D4TNcpy3yQm1ghBimkjRzNqk0UJqA/0ijCpT+ENtG4z9u34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/agESr4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/agESr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739914966; x=1771450966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49i9DiL384YGpF/Wcr9Fo32Df9PMmU00eMiy4kAMXR8=;
  b=d/agESr4/4pdVvoyHxn6HCo4Muf9+WEb5VDt79T5mYhpa75XB1xASwHU
   vSUhc33gpoa014En0IXgM1CVLK/Nc074vWCzuwxZL2jSmrAl5e/+x8tRo
   X2hPqlDucGDaCt0sDKNNSLYEoqdDIYPtVOPxk3T6GfyYBxHMcNTxAGdvp
   Iz+wDDz9+It4UT8C2rAMkS+d8258rdn4Z4EpF6eBlXlytx+oVOvVmVwxe
   RbOckM+imnCb2xnr2bPBHdRHfkbD487x5zWHMjBvCfm/sCR3X0DHF1Pm9
   M2tyLZbMmp8EobGoKRJuK+FtE3MBiC/bnbD0vTAtWu29IVhkE0b4GAmFG
   g==;
X-CSE-ConnectionGUID: Ys0mFngLTOe3Ay49ZGSTWg==
X-CSE-MsgGUID: iS01eR4gQ0GEj2umKcVo2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40841597"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40841597"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 13:42:44 -0800
X-CSE-ConnectionGUID: Ovh+6ZByRySTbF8R+nKeBQ==
X-CSE-MsgGUID: 9AGFUNBaT6qvZfkPSINy+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="119630353"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2025 13:42:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkVMU-0000uR-23;
	Tue, 18 Feb 2025 21:42:38 +0000
Date: Wed, 19 Feb 2025 05:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Subject: [linux-next:master 2706/4377]
 drivers/input/touchscreen/fsl-imx25-tcq.c:148:8: warning: shift count is
 negative
Message-ID: <202502190532.CkyUG9Ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
commit: fe348e05890776897acb931eb39987fcef0f6f65 [2706/4377] mm: security: Check early if HARDENED_USERCOPY is enabled
config: powerpc-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250219/202502190532.CkyUG9Ua-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190532.CkyUG9Ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190532.CkyUG9Ua-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                        ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/input/touchscreen/fsl-imx25-tcq.c:12:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[3] = op(a3, b3);                                 \
                   ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/input/touchscreen/fsl-imx25-tcq.c:12:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[2] = op(a2, b2);                                 \
                   ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/input/touchscreen/fsl-imx25-tcq.c:12:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                                    ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/input/touchscreen/fsl-imx25-tcq.c:12:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                   ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/input/touchscreen/fsl-imx25-tcq.c:12:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                                    ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/input/touchscreen/fsl-imx25-tcq.c:12:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                   ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
>> drivers/input/touchscreen/fsl-imx25-tcq.c:148:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(0, MX25_CFG_PRECHARGE) |
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   drivers/input/touchscreen/fsl-imx25-tcq.c:149:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(1, MX25_CFG_TOUCH_DETECT) |
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   drivers/input/touchscreen/fsl-imx25-tcq.c:150:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(2, MX25_CFG_X_MEASUREMENT) |
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   drivers/input/touchscreen/fsl-imx25-tcq.c:151:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(3, MX25_CFG_Y_MEASUREMENT) |
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   drivers/input/touchscreen/fsl-imx25-tcq.c:152:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(4, MX25_CFG_PRECHARGE) |
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   drivers/input/touchscreen/fsl-imx25-tcq.c:153:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(5, MX25_CFG_TOUCH_DETECT));
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   34 warnings and 13 errors generated.
--
   In file included from kernel/printk/printk_ringbuffer.c:4:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
   In file included from arch/powerpc/include/asm/ptrace.h:342:
   In file included from include/linux/thread_info.h:221:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
   In file included from arch/powerpc/include/asm/cmpxchg.h:755:
   include/asm-generic/cmpxchg-local.h:26:2: error: call to undeclared function 'raw_local_irq_save'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_local_irq_save(flags);
           ^
   include/asm-generic/cmpxchg-local.h:47:2: error: call to undeclared function 'raw_local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_local_irq_restore(flags);
           ^
>> include/asm-generic/cmpxchg-local.h:26:21: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
           raw_local_irq_save(flags);
                              ^~~~~
   include/asm-generic/cmpxchg-local.h:18:21: note: initialize the variable 'flags' to silence this warning
           unsigned long flags, prev;
                              ^
                               = 0
   include/asm-generic/cmpxchg-local.h:60:2: error: call to undeclared function 'raw_local_irq_save'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_local_irq_save(flags);
           ^
   include/asm-generic/cmpxchg-local.h:64:2: error: call to undeclared function 'raw_local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_local_irq_restore(flags);
           ^
   include/asm-generic/cmpxchg-local.h:60:21: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
           raw_local_irq_save(flags);
                              ^~~~~
   include/asm-generic/cmpxchg-local.h:58:21: note: initialize the variable 'flags' to silence this warning
           unsigned long flags;
                              ^
                               = 0
   2 warnings and 4 errors generated.


vim +148 drivers/input/touchscreen/fsl-imx25-tcq.c

4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  140  
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  141  static int imx25_setup_queue_4wire(struct mx25_tcq_priv *priv,
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  142  				   unsigned settling_cnt, int *items)
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  143  {
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  144  	imx25_setup_queue_cfgs(priv, settling_cnt);
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  145  
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  146  	/* Setup the conversion queue */
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  147  	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14 @148  		     MX25_ADCQ_ITEM(0, MX25_CFG_PRECHARGE) |
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  149  		     MX25_ADCQ_ITEM(1, MX25_CFG_TOUCH_DETECT) |
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  150  		     MX25_ADCQ_ITEM(2, MX25_CFG_X_MEASUREMENT) |
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  151  		     MX25_ADCQ_ITEM(3, MX25_CFG_Y_MEASUREMENT) |
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  152  		     MX25_ADCQ_ITEM(4, MX25_CFG_PRECHARGE) |
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  153  		     MX25_ADCQ_ITEM(5, MX25_CFG_TOUCH_DETECT));
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  154  
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  155  	/*
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  156  	 * We measure X/Y with 'sample_count' number of samples and execute a
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  157  	 * touch detection twice, with 1 sample each
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  158  	 */
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  159  	priv->expected_samples = priv->sample_count * 2 + 2;
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  160  	*items = 6;
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  161  
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  162  	return 0;
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  163  }
4f7ed234f2a5dcc Markus Schneider-Pargmann 2015-12-14  164  

:::::: The code at line 148 was first introduced by commit
:::::: 4f7ed234f2a5dcc26fc56a6e8324d34bbc9afe23 Input: touchscreen: Add imx25 TCQ driver

:::::: TO: Markus Pargmann <mpa@pengutronix.de>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
