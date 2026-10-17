Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F282D73A6;
	Sat, 17 Oct 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252709; cv=none; b=f1L+B4tFMHOOGKfNcb9XlCxiwjsJIiZSpQMcPM+4kGO3T2DggBmzTIwoPOFJbMO29H1RhbrNSjTyYJ1TlWTZHE55Jq88ho3y0Y+IUmKrNlzDgy9ceBbm8V2ZSsd7CmdQYhLATx0VSMvYhMWcHFct8/kxCAFWANHC8aISaZt+tvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252709; c=relaxed/simple;
	bh=l8Yh5Fymi1DtjES7v6fzt680qfEaLaf3RyMwtxw1AAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mTYYnaLPC7N2JJsOeDs8l/liDiwqoqv9RD+CcqQcblz2K+tlLvY7t1nP5obxmpzNKOzN/3R+vFCUxRctRD+UAeGPp6h50xT86jlNzt7VllR+3yCeXmgcKCUXSyIP38F8RmkLKsV0n28ZIVgB3+YB4art987ULf9FQCWEbBOWVYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2WFRj+4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2WFRj+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792252706; x=1823788706;
  h=date:from:to:cc:subject:message-id;
  bh=l8Yh5Fymi1DtjES7v6fzt680qfEaLaf3RyMwtxw1AAk=;
  b=X2WFRj+4ytXPciipBeKmLcKi+i+6PoKYC3USOfclfbYfxkNJ+FmsKPE3
   edGJ5LzFE4iVo5/FP7yL11v15HX3y8U5BJsiHXV+ltHqXvi/ig6NByFyw
   GdTOnooZM4b2fUIAvOo1aB+DhJbfRvms1g2csHEy6Q9q9yoRhtc/1THdQ
   70bja7vRXlX0+L7whjr2LFF6bqS0I6UdQgk/Hxf0YstoFCRheLGR5HSpC
   Yo1cmDwzCxO/N8eTu4pTiuzUG16hz5P0U16caSZb0O7SkmRgSCafiAjUE
   elQO73bZXajNEk7ecbqhiv04qPSZRGMzls5+cI+tK+eV2xCJUnUwQr9vA
   g==;
X-CSE-ConnectionGUID: rN2Jn4D4SFuQ73rdQv+yWQ==
X-CSE-MsgGUID: h0NnVn38Tre3dZD+oAk0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="888696"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="888696"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 08:58:25 -0700
X-CSE-ConnectionGUID: 1HT8uVb3RYu1XCh8JOF45A==
X-CSE-MsgGUID: qc6i/h+qQEKa1lUpZ7VU8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2173430"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2026 08:58:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI6nd-00000000JT8-1B1V;
	Sat, 17 Oct 2026 15:58:21 +0000
Date: Sat, 17 Oct 2026 23:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 1/17]
 drivers/media/mc/mc-device.c:31:1: error: unknown type name
 'param_check_unsigned'
Message-ID: <202610172349.NeNGF1lj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   cf47170584526b52366e936406ce2430b99a03a9
commit: d50da12ab1df5599da158568d31337d2daeee81d [1/17] media: Add "kaboom" module parameter
config: hexagon-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261017/202610172349.NeNGF1lj-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172349.NeNGF1lj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172349.NeNGF1lj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/mc/mc-device.c:31:1: error: unknown type name 'param_check_unsigned'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:163:2: note: expanded from macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |         ^
   <scratch space>:165:1: note: expanded from here
     165 | param_check_unsigned
         | ^
>> drivers/media/mc/mc-device.c:31:1: error: expected ')'
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:163:25: note: expanded from macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |                                ^
   drivers/media/mc/mc-device.c:31:1: note: to match this '('
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:163:20: note: expanded from macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |                           ^
>> drivers/media/mc/mc-device.c:31:1: error: use of undeclared identifier 'param_ops_unsigned'; did you mean 'param_ops_uint'?
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:164:25: note: expanded from macro 'module_param_named'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |                                ^~~~~~~~~~~~~~~~
   <scratch space>:166:1: note: expanded from here
     166 | param_ops_unsigned
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:459:38: note: 'param_ops_uint' declared here
     459 | extern const struct kernel_param_ops param_ops_uint;
         |                                      ^
>> drivers/media/mc/mc-device.c:31:31: error: expected '}'
      31 | module_param(kaboom, unsigned int, 0077);
         |                               ^
   drivers/media/mc/mc-device.c:31:1: note: to match this '{'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:164:2: note: expanded from macro 'module_param_named'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^
   include/linux/moduleparam.h:189:2: note: expanded from macro 'module_param_cb'
     189 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
         |         ^
   include/linux/moduleparam.h:305:4: note: expanded from macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   4 errors generated.


vim +/param_check_unsigned +31 drivers/media/mc/mc-device.c

    29	
    30	static unsigned int kaboom;
  > 31	module_param(kaboom, unsigned int, 0077);
    32	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
