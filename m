Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0ED14012;
	Sun, 15 Sep 2024 05:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726378300; cv=none; b=iZ9n0acop4NRpmAmLdy6l+2axuJzfKdyATIzHmS2YzOqjjWN+bDfrsVVih1FL1Y2ACK24qwWjz1s/z/zlCDbN3SoV2kBUU07G/H9EleuAZO35mEjkC9bdAH3FwDCA6TtwycIC8Y6iFgwTdpPz3y4xYRLLt450qzKhhZCOevT1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726378300; c=relaxed/simple;
	bh=ZlOUnRulQudpKPD9CNteVU/UHYUX9y6pWsAgUX8cwOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjdlR8wq2zI2y3xesW49DGPo6oJnZhgrKioa4rcr4hSrQz3jmse3b1zTKOMw7w69aqQztXVNCuKQDcRnU5fq3qGR2PfolFvtFaN71lUvnGCvNuLGUTHGdgcQkIOqTGxyWvjKzumhIBM0NXgQDDpf5DZAQuakXCIhJ5lVn20RzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGsgz7Vp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGsgz7Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726378298; x=1757914298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZlOUnRulQudpKPD9CNteVU/UHYUX9y6pWsAgUX8cwOs=;
  b=EGsgz7VpoeF0Uwtfeic8Szn//c1DdyBMbICrfvsNB42UkhlpA9c0uJuw
   3IDaDgx3J0He3QIZa+GH/vSM6vXUIaRuUfuZdvpMgWIE0gZ6Hh1qhd7Zp
   6ppCl/PQ6kIxtiJX8oC0KiIJSxk+BSa/rCP4lbQAeL9WBfM3MnPPv9jk7
   wqVoG4MyhN4OqxVLHtzNmrDJ9HX38R9AEez39OnKRj/yUqzHsoq3tJo+N
   s/grkC8hVDTBKlCRS9gvVNsnNE+zREtNeDacHubfHSUoCq3PbQa/W8Tn4
   hjXLE52Cu31hSkd3dYSUVAd83yK5f0BHqpPvlu4XPmJY6h4Q2no0JS5HW
   A==;
X-CSE-ConnectionGUID: mroB+dlBT0yfRzQ80xHBiw==
X-CSE-MsgGUID: QOXQtnCBTEy0e4DVB5jxug==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35814729"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35814729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 22:31:35 -0700
X-CSE-ConnectionGUID: uUxbNSmEQGij06vuYG7Bpw==
X-CSE-MsgGUID: RJ+evuIVTF6IgdIsALlTFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="72647176"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2024 22:31:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sphr9-0008RL-1H;
	Sun, 15 Sep 2024 05:31:31 +0000
Date: Sun, 15 Sep 2024 13:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v3 3/9] net: napi: Make gro_flush_timeout per-NAPI
Message-ID: <202409151342.0rV7V4ko-lkp@intel.com>
References: <20240912100738.16567-4-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912100738.16567-4-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240911]
[cannot apply to net-next/main net/main linus/master horms-ipvs/master v6.11-rc7 v6.11-rc6 v6.11-rc5 v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/net-napi-Make-napi_defer_hard_irqs-per-NAPI/20240912-181240
base:   next-20240911
patch link:    https://lore.kernel.org/r/20240912100738.16567-4-jdamato%40fastly.com
patch subject: [RFC net-next v3 3/9] net: napi: Make gro_flush_timeout per-NAPI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240915/202409151342.0rV7V4ko-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151342.0rV7V4ko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151342.0rV7V4ko-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == (424 + 2 * sizeof(struct dim))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (424 + 2 * sizeof(struct dim))
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:16: note: expanded from macro 'libeth_cacheline_group_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                       offsetofend(type, __cacheline_group_begin__##grp) ==    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                       (sz))
         |                       ~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: note: expression evaluates to '776 == 760'
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:18:59: note: expanded from macro 'libeth_cacheline_group_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                       offsetofend(type, __cacheline_group_begin__##grp) ==    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      19 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: error: static assertion failed due to requirement 'sizeof(struct idpf_q_vector) == ((((((104)) + ((int)(((1 << (6)))) - 1)) & ~((int)(((1 << (6)))) - 1)) + ((((424 + 2 * sizeof(struct dim))) + ((unsigned long)(((1 << (6)))) - 1)) & ~((unsigned long)(((1 << (6)))) - 1)) + ((((8 + sizeof(struct cpumask *))) + ((unsigned long)(((1 << (6)))) - 1)) & ~((unsigned long)(((1 << (6)))) - 1))))': sizeof(struct idpf_q_vector) == ((((((104)) + ((__typeof__((104)))(((1 << (6)))) - 1)) & ~((__typeof__((104)))(((1 << (6)))) - 1)) + ((((424 + 2 * sizeof(struct dim))) + ((__typeof__((424 + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) & ~((__typeof__((424 + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) + ((((8 + sizeof(cpumask_var_t))) + ((__typeof__((8 + sizeof(cpumask_var_t))))(((1 << (6)))) - 1)) & ~((__typeof__((8 + sizeof(cpumask_var_t))))(((1 << (6)))) - 1))))
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:2: note: expanded from macro 'libeth_cacheline_set_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:48:2: note: expanded from macro 'libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_struct_assert'
      21 |         static_assert(sizeof(type) == (sz))
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: note: expression evaluates to '1024 == 960'
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:2: note: expanded from macro 'libeth_cacheline_set_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:48:2: note: expanded from macro 'libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:29: note: expanded from macro '__libeth_cacheline_struct_assert'
      21 |         static_assert(sizeof(type) == (sz))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   2 errors generated.
--
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == (424 + 2 * sizeof(struct dim))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (424 + 2 * sizeof(struct dim))
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:16: note: expanded from macro 'libeth_cacheline_group_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                       offsetofend(type, __cacheline_group_begin__##grp) ==    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                       (sz))
         |                       ~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: note: expression evaluates to '776 == 760'
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:18:59: note: expanded from macro 'libeth_cacheline_group_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                       offsetofend(type, __cacheline_group_begin__##grp) ==    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      19 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: error: static assertion failed due to requirement 'sizeof(struct idpf_q_vector) == ((((((104)) + ((int)(((1 << (6)))) - 1)) & ~((int)(((1 << (6)))) - 1)) + ((((424 + 2 * sizeof(struct dim))) + ((unsigned long)(((1 << (6)))) - 1)) & ~((unsigned long)(((1 << (6)))) - 1)) + ((((8 + sizeof(struct cpumask *))) + ((unsigned long)(((1 << (6)))) - 1)) & ~((unsigned long)(((1 << (6)))) - 1))))': sizeof(struct idpf_q_vector) == ((((((104)) + ((__typeof__((104)))(((1 << (6)))) - 1)) & ~((__typeof__((104)))(((1 << (6)))) - 1)) + ((((424 + 2 * sizeof(struct dim))) + ((__typeof__((424 + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) & ~((__typeof__((424 + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) + ((((8 + sizeof(cpumask_var_t))) + ((__typeof__((8 + sizeof(cpumask_var_t))))(((1 << (6)))) - 1)) & ~((__typeof__((8 + sizeof(cpumask_var_t))))(((1 << (6)))) - 1))))
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:2: note: expanded from macro 'libeth_cacheline_set_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:48:2: note: expanded from macro 'libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:16: note: expanded from macro '__libeth_cacheline_struct_assert'
      21 |         static_assert(sizeof(type) == (sz))
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:475:1: note: expression evaluates to '1024 == 960'
     475 | libeth_cacheline_set_assert(struct idpf_q_vector, 104,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     476 |                             424 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     477 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:2: note: expanded from macro 'libeth_cacheline_set_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:48:2: note: expanded from macro 'libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:29: note: expanded from macro '__libeth_cacheline_struct_assert'
      21 |         static_assert(sizeof(type) == (sz))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_main.c:167:39: warning: shift count >= width of type [-Wshift-count-overflow]
     167 |         err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +475 drivers/net/ethernet/intel/idpf/idpf_txrx.h

4930fbf419a72d Pavan Kumar Linga 2023-08-07  412  
4930fbf419a72d Pavan Kumar Linga 2023-08-07  413  /**
4930fbf419a72d Pavan Kumar Linga 2023-08-07  414   * struct idpf_q_vector
1c325aac10a82f Alan Brady        2023-08-07  415   * @vport: Vport back pointer
5a816aae2d463d Alexander Lobakin 2024-06-20  416   * @num_rxq: Number of RX queues
d4d5587182664b Pavan Kumar Linga 2023-08-07  417   * @num_txq: Number of TX queues
5a816aae2d463d Alexander Lobakin 2024-06-20  418   * @num_bufq: Number of buffer queues
e4891e4687c8dd Alexander Lobakin 2024-06-20  419   * @num_complq: number of completion queues
5a816aae2d463d Alexander Lobakin 2024-06-20  420   * @rx: Array of RX queues to service
1c325aac10a82f Alan Brady        2023-08-07  421   * @tx: Array of TX queues to service
5a816aae2d463d Alexander Lobakin 2024-06-20  422   * @bufq: Array of buffer queues to service
e4891e4687c8dd Alexander Lobakin 2024-06-20  423   * @complq: array of completion queues
5a816aae2d463d Alexander Lobakin 2024-06-20  424   * @intr_reg: See struct idpf_intr_reg
5a816aae2d463d Alexander Lobakin 2024-06-20  425   * @napi: napi handler
5a816aae2d463d Alexander Lobakin 2024-06-20  426   * @total_events: Number of interrupts processed
c2d548cad1508d Joshua Hay        2023-08-07  427   * @tx_dim: Data for TX net_dim algorithm
1c325aac10a82f Alan Brady        2023-08-07  428   * @tx_itr_value: TX interrupt throttling rate
1c325aac10a82f Alan Brady        2023-08-07  429   * @tx_intr_mode: Dynamic ITR or not
1c325aac10a82f Alan Brady        2023-08-07  430   * @tx_itr_idx: TX ITR index
3a8845af66edb3 Alan Brady        2023-08-07  431   * @rx_dim: Data for RX net_dim algorithm
95af467d9a4e3b Alan Brady        2023-08-07  432   * @rx_itr_value: RX interrupt throttling rate
95af467d9a4e3b Alan Brady        2023-08-07  433   * @rx_intr_mode: Dynamic ITR or not
95af467d9a4e3b Alan Brady        2023-08-07  434   * @rx_itr_idx: RX ITR index
5a816aae2d463d Alexander Lobakin 2024-06-20  435   * @v_idx: Vector index
bf9bf7042a38eb Alexander Lobakin 2024-06-20  436   * @affinity_mask: CPU affinity mask
4930fbf419a72d Pavan Kumar Linga 2023-08-07  437   */
4930fbf419a72d Pavan Kumar Linga 2023-08-07  438  struct idpf_q_vector {
5a816aae2d463d Alexander Lobakin 2024-06-20  439  	__cacheline_group_begin_aligned(read_mostly);
1c325aac10a82f Alan Brady        2023-08-07  440  	struct idpf_vport *vport;
1c325aac10a82f Alan Brady        2023-08-07  441  
5a816aae2d463d Alexander Lobakin 2024-06-20  442  	u16 num_rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  443  	u16 num_txq;
5a816aae2d463d Alexander Lobakin 2024-06-20  444  	u16 num_bufq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  445  	u16 num_complq;
5a816aae2d463d Alexander Lobakin 2024-06-20  446  	struct idpf_rx_queue **rx;
e4891e4687c8dd Alexander Lobakin 2024-06-20  447  	struct idpf_tx_queue **tx;
5a816aae2d463d Alexander Lobakin 2024-06-20  448  	struct idpf_buf_queue **bufq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  449  	struct idpf_compl_queue **complq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  450  
5a816aae2d463d Alexander Lobakin 2024-06-20  451  	struct idpf_intr_reg intr_reg;
5a816aae2d463d Alexander Lobakin 2024-06-20  452  	__cacheline_group_end_aligned(read_mostly);
5a816aae2d463d Alexander Lobakin 2024-06-20  453  
5a816aae2d463d Alexander Lobakin 2024-06-20  454  	__cacheline_group_begin_aligned(read_write);
5a816aae2d463d Alexander Lobakin 2024-06-20  455  	struct napi_struct napi;
5a816aae2d463d Alexander Lobakin 2024-06-20  456  	u16 total_events;
5a816aae2d463d Alexander Lobakin 2024-06-20  457  
c2d548cad1508d Joshua Hay        2023-08-07  458  	struct dim tx_dim;
1c325aac10a82f Alan Brady        2023-08-07  459  	u16 tx_itr_value;
1c325aac10a82f Alan Brady        2023-08-07  460  	bool tx_intr_mode;
1c325aac10a82f Alan Brady        2023-08-07  461  	u32 tx_itr_idx;
1c325aac10a82f Alan Brady        2023-08-07  462  
3a8845af66edb3 Alan Brady        2023-08-07  463  	struct dim rx_dim;
95af467d9a4e3b Alan Brady        2023-08-07  464  	u16 rx_itr_value;
95af467d9a4e3b Alan Brady        2023-08-07  465  	bool rx_intr_mode;
95af467d9a4e3b Alan Brady        2023-08-07  466  	u32 rx_itr_idx;
5a816aae2d463d Alexander Lobakin 2024-06-20  467  	__cacheline_group_end_aligned(read_write);
95af467d9a4e3b Alan Brady        2023-08-07  468  
5a816aae2d463d Alexander Lobakin 2024-06-20  469  	__cacheline_group_begin_aligned(cold);
5a816aae2d463d Alexander Lobakin 2024-06-20  470  	u16 v_idx;
bf9bf7042a38eb Alexander Lobakin 2024-06-20  471  
bf9bf7042a38eb Alexander Lobakin 2024-06-20  472  	cpumask_var_t affinity_mask;
5a816aae2d463d Alexander Lobakin 2024-06-20  473  	__cacheline_group_end_aligned(cold);
4930fbf419a72d Pavan Kumar Linga 2023-08-07  474  };
5a816aae2d463d Alexander Lobakin 2024-06-20 @475  libeth_cacheline_set_assert(struct idpf_q_vector, 104,
5a816aae2d463d Alexander Lobakin 2024-06-20  476  			    424 + 2 * sizeof(struct dim),
5a816aae2d463d Alexander Lobakin 2024-06-20  477  			    8 + sizeof(cpumask_var_t));
0fe45467a1041e Pavan Kumar Linga 2023-08-07  478  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
