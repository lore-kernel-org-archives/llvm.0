Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527751;
	b=ZJC7ZVxT8LOJPuMGITRq82jt7rJFxoVw2U1xOwOZmX2WzkNOnERCJcWXu9Rvtw9z5ebM
	 EfzaWgmPCoYEX5rnB4Bk8cMMSmBtfve0/p+eiIQK2GNTallu/e063+gmy7tMXSNwag6kX
	 1EcSaKLeLZN1jvGLzjpmESsWYSx2L6wn/8TpJFSTJpwg47IpSgXfS5S8Jfv0fBNPQNgbw
	 7Hzy6Oo2szrw4NfQaEA8ilMYNmKkksmoMqWv0Ym/5V8vUOiAUJxG/0HeSxzhmXpbdJ6pm
	 FRyQKQaObiyIem3iQry50GM7MA10llRyLQ3nI3y1GPkbJ6b3H9G8uxEJhAhprfyoreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527751;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=W0y7eSdzZOdL287C7Dl6llyptLT1adUT1BZK2u4A3fQ=;
	b=nFi+kXp4iDfL4rIxE+xXuNfLHvVkiu5Ql51Qkxj43iOEu10vImE88uZNHQp0s8SPcyPi
	 rtBvM9o4GgXaRZ6onjhmDwdICKY0T8OYDS3vrWRB47Sqjq+bN3ErT572GsKKiCyijjiJS
	 U5pn86f85yj1L6xUIRPsGpVajMzAFRL/LCEgyu40f0HNeh8oat7412ia+H5PEdAvIFvZn
	 CfkR6ySTPRdJzCLrLQpiZYk7Z10ZIJ5XwEEs/7ahnG5CnfuUERKvmpWWaISPx7g/L6lOi
	 wkMgdh7ICdtYYGQtzLbiYVZTYxuyOae0QNAKcG4ygfYvN5fSCICjgLLvLTIM9GyK/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W6Bs8KH9;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4B606A31E;
	Tue, 24 Nov 2026 13:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W6Bs8KH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795527751; x=1827063751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrF09vv+ciashULbO0v5LVsOaLbzLGwInEB/NeEGsQY=;
  b=W6Bs8KH9vqIhN6pDhwhkvYFARtbBIpQZN8nP3xoF/Q/jr5MaGYxuDxZ2
   ATTIhmKC3IB2wVqWKbHz8J4wKgylTEI9R/F3p2ImQ6Fw/ZNkA54n1/fpk
   OW5nh4SJ7IsyAob0wxg17s+hpvaZ70MBWg3/6pr+VUUsV9CazhzHY3+6z
   zTywx9JO++wNEPY/7fcK07x4zmMsDhnN7idmwQYVZGJBOrtspXyzf+cC1
   dT4sJFB4y1aaIlLLdNu6hSPhwR/fpw3jqBtmzKas7KeGiaAo6bHDo1AeU
   N/sf8FVyMQqv4v7/wuxhXkV/ciugLWK6pq/Ogbd5s1Fqb6jG+nYmys65J
   A==;
X-CSE-ConnectionGUID: HL7oJi7sRkS4QZH02gaSFA==
X-CSE-MsgGUID: y8SouzihTY+kvLtu2CxW8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4244444"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4244444"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 05:42:30 -0800
X-CSE-ConnectionGUID: 3NJENb3hTNC/OsDt2BlJTQ==
X-CSE-MsgGUID: 9SLlxSfJS4mTQ6t0GI0CzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11923085"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2026 05:42:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVqmw-000000005Cf-1ltf;
	Tue, 24 Nov 2026 13:42:26 +0000
Date: Tue, 24 Nov 2026 14:42:21 +0100
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [drm-i915:for-linux-next 5/6]
 drivers/gpu/drm/i915/display/intel_de.c:350:18: warning: use of bitwise '|'
 with boolean operands
Message-ID: <20261124143710.bu4mng1e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
head:   6d00cec4c9becea6540f75820bc0837d14ea7611
commit: 1a6684ee830ff0a15147e332991e1a5d34c55592 [5/6] drm/i915/de: Optimize the mmio_debug checks in intel_de_{read,write}()
config: riscv-randconfig-2005-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124143710.bu4mng1e-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124143710.bu4mng1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124143710.bu4mng1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_de.c:350:18: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
     350 |         return unlikely(!!READ_ONCE(display->params.mmio_debug) |
         |                ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                 ||
     351 |                         READ_ONCE(display->mmio.mmio_debug_oneshot));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:47:41: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:32:34: note: expanded from macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                      ~^~
   drivers/gpu/drm/i915/display/intel_de.c:350:18: note: cast one or both operands to int to silence this warning
>> drivers/gpu/drm/i915/display/intel_de.c:350:18: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
     350 |         return unlikely(!!READ_ONCE(display->params.mmio_debug) |
         |                ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                 ||
     351 |                         READ_ONCE(display->mmio.mmio_debug_oneshot));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:47:68: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:34:19: note: expanded from macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_de.c:350:18: note: cast one or both operands to int to silence this warning
   2 warnings generated.


vim +350 drivers/gpu/drm/i915/display/intel_de.c

   345	
   346	static __always_inline bool
   347	__mmio_debug_is_enabled(struct intel_display *display)
   348	{
   349		/* with || gcc emits two branches for this */
 > 350		return unlikely(!!READ_ONCE(display->params.mmio_debug) |
   351				READ_ONCE(display->mmio.mmio_debug_oneshot));
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
