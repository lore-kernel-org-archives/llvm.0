Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F542EBB99;
	Wed, 29 Apr 2026 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777504031; cv=none; b=mJlv0qs9MQZGBJC8w/5LfEfIz/suJRafoi+SaAmiElkG9RCRgsc8lDpQmykAcFDbii5R/PHUXU9BFn+BYkHM3o2kc6FsYYiEXoFYjIjxjIE26x6je/WmaKtTw6x5hDHbOXFTAwmDQGEHjMFmUdprZDUWHCP84a9PR4T+eU2D1mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777504031; c=relaxed/simple;
	bh=PLAVqYl6yHKtsDBKnBsVrP7vHSoWvPPjv8T1xOcoHeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NDOkalvzzlkfEisRrkabXCIk1MkJRoqyQxaGnFmKAoXI3/7iB0UKuXNiGENRiBWLYlCcsfJtvMoxBX0f/IqZHtjn159z038XlojTOO7DsslVxTiwZOD4yAF25fc90talk6QPoEToBergEeQCUi3qw7vnH3225gG3qXk8Q0Ud+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jdh87m3Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jdh87m3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777504029; x=1809040029;
  h=date:from:to:cc:subject:message-id;
  bh=PLAVqYl6yHKtsDBKnBsVrP7vHSoWvPPjv8T1xOcoHeM=;
  b=Jdh87m3ZclJ9aCGAKLHqr3Fms5tCwKqG8imEptJfpkQsv5tVgz5HZUCu
   z0DLFDmouo6AXfe8A+UMjYVDwA3fOSlYvx6+lDHnfB2IiWA8LLEhKUYiu
   Z75RfftEkVf8GKGqF6AZLIl3xH04iQBBDgw9/TBYXkGwSk4I3VfRTZFKr
   M5GUwdck8/kEBd6Ai812bsD7FgOEiOCjoEwZJM7a1wbX/2QA14WauRIVf
   1seKb+L6v39QNbgT4PZ36kgFE/hCNEtSxumJ1KEdXv16rO0Q/xNz9F/wd
   l1ga/xF5d08b8U1f5+KVRP3Fc84NvbevmEYSOtrlArV9Z0p82HWz8xV6I
   Q==;
X-CSE-ConnectionGUID: U8mASqQgTXGfbALir//ETg==
X-CSE-MsgGUID: CyvrjzmAReiXaiWU8YIhYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77611432"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="77611432"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 16:07:07 -0700
X-CSE-ConnectionGUID: vRVGeZlRQJ2cDjvqxOiUOg==
X-CSE-MsgGUID: dTtMcXZxR3KF8K6PQcVPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234676560"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 16:07:05 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIDzi-00000000BdC-2LJq;
	Wed, 29 Apr 2026 23:07:02 +0000
Date: Thu, 30 Apr 2026 07:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mtd:mtd/spi-mem-cont-read 4/6]
 drivers/spi/spi-intel.c:817:37: error: incompatible pointer types passing
 'struct spi_mem_op **' to parameter of type 'const struct spi_mem_op *';
 remove &
Message-ID: <202604300653.PchLEPCg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Miquel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/spi-mem-cont-read
head:   6e3e2ce14a3c0a111736dc9140a3200363ab704f
commit: 56b2c08482734182d867bf853bce5233d78df796 [4/6] spi: spi-mem: Transform the read operation template
config: hexagon-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300653.PchLEPCg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300653.PchLEPCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300653.PchLEPCg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-intel.c:817:37: error: incompatible pointer types passing 'struct spi_mem_op **' to parameter of type 'const struct spi_mem_op *'; remove & [-Wincompatible-pointer-types]
     817 |         iop = intel_spi_match_mem_op(ispi, &desc->info.op_tmpl);
         |                                            ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-intel.c:744:73: note: passing argument to parameter 'op' here
     744 | intel_spi_match_mem_op(struct intel_spi *ispi, const struct spi_mem_op *op)
         |                                                                         ^
   drivers/spi/spi-intel.c:830:20: error: initializing 'struct spi_mem_op' with an expression of incompatible type 'struct spi_mem_op *'; dereference with *
     830 |         struct spi_mem_op op = desc->info.op_tmpl;
         |                           ^    ~~~~~~~~~~~~~~~~~~
         |                                *
   drivers/spi/spi-intel.c:847:20: error: initializing 'struct spi_mem_op' with an expression of incompatible type 'struct spi_mem_op *'; dereference with *
     847 |         struct spi_mem_op op = desc->info.op_tmpl;
         |                           ^    ~~~~~~~~~~~~~~~~~~
         |                                *
   3 errors generated.
--
   drivers/spi/spi-mxic.c:406:67: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     406 |         writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
         |                                                        ~~~~~~~~~~~~~~~~~~^
         |                                                                          ->
>> drivers/spi/spi-mxic.c:409:34: error: incompatible pointer types passing 'struct spi_mem_op **' to parameter of type 'const struct spi_mem_op *'; remove & [-Wincompatible-pointer-types]
     409 |         writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:319:62: note: passing argument to parameter 'op' here
     319 | static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
         |                                                              ^
   drivers/spi/spi-mxic.c:414:38: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     414 |         writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
         |                           ~~~~~~~~~~~~~~~~~~^
         |                                             ->
   drivers/spi/spi-mxic.c:103:25: note: expanded from macro 'LMODE_CMD0'
     103 | #define LMODE_CMD0(x)           (x)
         |                                  ^
   drivers/spi/spi-mxic.c:419:56: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     419 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                             ~~~~~~~~~~~~~~~~~~^
         |                                                               ->
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/spi/spi-mxic.c:419:56: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     419 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                             ~~~~~~~~~~~~~~~~~~^
         |                                                               ->
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/spi/spi-mxic.c:419:56: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     419 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                             ~~~~~~~~~~~~~~~~~~^
         |                                                               ->
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/spi/spi-mxic.c:451:67: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     451 |         writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
         |                                                        ~~~~~~~~~~~~~~~~~~^
         |                                                                          ->
   drivers/spi/spi-mxic.c:454:34: error: incompatible pointer types passing 'struct spi_mem_op **' to parameter of type 'const struct spi_mem_op *'; remove & [-Wincompatible-pointer-types]
     454 |         writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:319:62: note: passing argument to parameter 'op' here
     319 | static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
         |                                                              ^
   drivers/spi/spi-mxic.c:459:38: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     459 |         writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
         |                           ~~~~~~~~~~~~~~~~~~^
         |                                             ->
   drivers/spi/spi-mxic.c:103:25: note: expanded from macro 'LMODE_CMD0'
     103 | #define LMODE_CMD0(x)           (x)
         |                                  ^
   drivers/spi/spi-mxic.c:464:56: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     464 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                             ~~~~~~~~~~~~~~~~~~^
         |                                                               ->
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/spi/spi-mxic.c:464:56: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     464 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                             ~~~~~~~~~~~~~~~~~~^
         |                                                               ->
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/spi/spi-mxic.c:464:56: error: member reference type 'struct spi_mem_op *' is a pointer; did you mean to use '->'?
     464 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                             ~~~~~~~~~~~~~~~~~~^
         |                                                               ->
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/spi/spi-mxic.c:512:43: error: incompatible pointer types passing 'struct spi_mem_op **' to parameter of type 'const struct spi_mem_op *'; remove & [-Wincompatible-pointer-types]
     512 |         if (!mxic_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
         |                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )


vim +817 drivers/spi/spi-intel.c

e23e5a05d1fd947 Mika Westerberg 2022-02-09  811  
c2b5a40c9e50651 Mika Westerberg 2022-04-20  812  static int intel_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
c2b5a40c9e50651 Mika Westerberg 2022-04-20  813  {
5fa0ade1851f776 Yang Yingliang  2023-08-07  814  	struct intel_spi *ispi = spi_controller_get_devdata(desc->mem->spi->controller);
c2b5a40c9e50651 Mika Westerberg 2022-04-20  815  	const struct intel_spi_mem_op *iop;
c2b5a40c9e50651 Mika Westerberg 2022-04-20  816  
c2b5a40c9e50651 Mika Westerberg 2022-04-20 @817  	iop = intel_spi_match_mem_op(ispi, &desc->info.op_tmpl);
c2b5a40c9e50651 Mika Westerberg 2022-04-20  818  	if (!iop)
c2b5a40c9e50651 Mika Westerberg 2022-04-20  819  		return -EOPNOTSUPP;
c2b5a40c9e50651 Mika Westerberg 2022-04-20  820  
c2b5a40c9e50651 Mika Westerberg 2022-04-20  821  	desc->priv = (void *)iop;
c2b5a40c9e50651 Mika Westerberg 2022-04-20  822  	return 0;
c2b5a40c9e50651 Mika Westerberg 2022-04-20  823  }
c2b5a40c9e50651 Mika Westerberg 2022-04-20  824  

:::::: The code at line 817 was first introduced by commit
:::::: c2b5a40c9e50651a29ee9d110f7ebc41b8720efa spi: intel: Implement dirmap hooks

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
