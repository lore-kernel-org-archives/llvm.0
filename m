Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F93351C22;
	Mon,  6 Jul 2026 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783306506; cv=none; b=arSbIjZatf+KYRgajax5VtezAP881QLZK2a91j2B1RY2jwhMh04moid5OFbHX3LdIIYz4BdFx9lIp5ldxqgbbQGX5lAQDaf3y3FodwxgwAIXUhKg565/eSsN/svKooH6jseFx4oR/Zl4uKpLgD4SSdQA/h7Xd5PJ2HuX8LldgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783306506; c=relaxed/simple;
	bh=p2JTJKkla5uj/FEvDAfrlRuVlBAf3V5CbJOzj+Jsu4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V2MVQCU96zY7uXQvXWoEX6BKT8o1DkcrU/q8m32FGbX1W1/yeu1EeEee6fQi8jI5uw49sFkBm27p7y6m2WHiMaFFBcOu77bg6CXQmhu0e1p8I3GLSWM8pxYNDVu4i47RbSt07b0IzgooLAgL4Mn/XHrMY8T3GB2LB4Quk58Q4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0HEpgB5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0HEpgB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783306506; x=1814842506;
  h=date:from:to:cc:subject:message-id;
  bh=p2JTJKkla5uj/FEvDAfrlRuVlBAf3V5CbJOzj+Jsu4k=;
  b=T0HEpgB5LVKFDVd4OCgzDInOUYblMmWb3avaeUd1rzzk9whLTburxkdr
   5j4keZBL0E5yNm+r4yvy/J+SVu4R/enIVv92ThyaQ22/bTpPhZ9tLgYaR
   2pb09IvcEq5DqTdp47cM8ui/xY6EjrG1czsqMVRhnZFDL867gmrKx7Su4
   TrjhMRo7etapGg++eAMjjylQeUUSqQzB13eDTtUCGD4TMgymmJdw2iefQ
   DiNwhUTAbEjLnwg/BcUGm9gvxazNd4GNYWf/DATmeQPjX+uw1AG0aQepI
   cH5WvvzBi5fsv3uR/hxkhS2J8YQ4KjTLaLcFB59nG9BBMqYwI62r5cEGs
   Q==;
X-CSE-ConnectionGUID: 9s418rMMT3+SbzkF8eh4Ww==
X-CSE-MsgGUID: dPFvxhSYQeaCH7YWm60//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94294598"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94294598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 19:55:05 -0700
X-CSE-ConnectionGUID: VzhlegAdTkq07heZbFMZ7w==
X-CSE-MsgGUID: 7uHYY1YDRoCkyC+jFm9xMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258482966"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2026 19:55:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgZU4-00000000E2B-1d57;
	Mon, 06 Jul 2026 02:55:00 +0000
Date: Mon, 06 Jul 2026 10:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 8/24]
 include/linux/device/trust.h:35:54: error: incomplete definition of type
 'struct module'
Message-ID: <202607061044.u1seSFQE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: 2a323f22915efbb3253657c0b11a0b81b5d582ef [8/24] device core: Initial device trust infrastructure
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260706/202607061044.u1seSFQE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061044.u1seSFQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061044.u1seSFQE-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
   In file included from arch/arm/kernel/asm-offsets.c:15:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:32:
>> include/linux/device/trust.h:35:54: error: incomplete definition of type 'struct module'
      35 |         pr_warn("module: %s: trust= support disabled\n", mod->name);
         |                                                          ~~~^
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:404:8: note: forward declaration of 'struct module'
     404 | struct module;
         |        ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +35 include/linux/device/trust.h

    28	
    29	#ifdef CONFIG_DEVICE_TRUST
    30	void module_driver_trust(struct module *mod, const char *val);
    31	void module_driver_trust_init(struct module *mod, bool distrust);
    32	#else
    33	static inline void module_driver_trust(struct module *mod, const char *val)
    34	{
  > 35		pr_warn("module: %s: trust= support disabled\n", mod->name);
    36	}
    37	static inline void module_driver_trust_init(struct module *mod, bool distrust)
    38	{
    39	}
    40	#endif
    41	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
