Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF12E62D;
	Tue,  9 Jul 2024 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720521267; cv=none; b=WCyX63h8HajOmPjydczAPURCu1tJS7aPKj5DddQyJT20WdWU9Pcms6bDZISFKcO2HhXmqkT39zm+ajPRP40Ckbw7RJU3Fl+kfR6c8ut8lRiS0Ep8cqP+8rTjat5/ZnvcqsCcbXWOo4YwF/Im6ifi33cYWNTUQTJVdrnijKQVQJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720521267; c=relaxed/simple;
	bh=Md5F1DrIuPGntBdX+Co3/MNh5k+sGrraSKYBdA4OA1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A/1J8RERUidZW0RVdcfyEY45LQTu7jeQwZFv6GcS6hVoHVPvYh+29AusPUndBYBJiwiuE/SrWB8ZsbW2yynVh2D9cwsj3CrJAcxOrO8u63bPGFCtdJFdoysbrBJSk98Uhht23Y5w6DaHzIWpdoBSv5X8pNH+gh3tSnggtAje5tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSI/A0Ci; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSI/A0Ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720521265; x=1752057265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Md5F1DrIuPGntBdX+Co3/MNh5k+sGrraSKYBdA4OA1c=;
  b=jSI/A0Ci18PEJNpXB+a9U6ePrJA7kPNJCYv+a915mp52V6+4b8cgtKw5
   ClxQC6lcoBaArRX32VjMTTWRLjueIhDQyD7ui5t5RD6RHIxdtPiDhbZ5x
   poKckaaEHQKCoe0YhaI9xuHgvmCrmecdwk3R0ZD6JWnACtlfQHupQO0k2
   wQzbTsdNvd1m/YhHesOHkDFz9FbJHuL37Xf0VMNb3y9Nxn0wz4086dO/F
   fMddQMvQkJCVBbvy3wX/wPwy3nipEmCdC8KY/GzDbIWRM1FAFtgEl9dhd
   mHkAkaSwqXRDLm2KrhSLwAXjs8BzHPA0zHWy/bpHbc7BRKxKXmcL4OW+f
   w==;
X-CSE-ConnectionGUID: Ts9+UcKBSgyoc0tyoaFNzw==
X-CSE-MsgGUID: FqAUL9nrTf28GwsxbwPVEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17870390"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17870390"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:34:25 -0700
X-CSE-ConnectionGUID: cc/WzAh1TKmDV+I1uhi08A==
X-CSE-MsgGUID: gEJ3D0RfTdyt9WP0JWGs0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47780120"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2024 03:34:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR8Av-000WZX-0N;
	Tue, 09 Jul 2024 10:34:21 +0000
Date: Tue, 9 Jul 2024 18:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/slab-v6.11/typed-alloc/v1 3/5]
 drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of
 'typeof' to bit-field
Message-ID: <202407091812.ND3JWAqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/slab-v6.11/typed-alloc/v1
head:   6e7fe92b1c5b0a4fd99772e8769e8adf7d296bc1
commit: cc4265a19e8f49c42f22458ab1ea9273cf4dfad5 [3/5] slab: Detect negative size values and saturate
config: x86_64-randconfig-011-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091812.ND3JWAqy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091812.ND3JWAqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091812.ND3JWAqy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
     330 |         fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
         |                       ^
   include/linux/slab.h:697:32: note: expanded from macro 'kmalloc'
     697 |         unsigned char:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:697:32: note: expanded from macro 'kmalloc'
     697 |         unsigned char:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:698:32: note: expanded from macro 'kmalloc'
     698 |         unsigned short: kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:698:32: note: expanded from macro 'kmalloc'
     698 |         unsigned short: kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:699:32: note: expanded from macro 'kmalloc'
     699 |         unsigned int:   kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:699:32: note: expanded from macro 'kmalloc'
     699 |         unsigned int:   kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:700:32: note: expanded from macro 'kmalloc'
     700 |         unsigned long:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:700:32: note: expanded from macro 'kmalloc'
     700 |         unsigned long:  kmalloc_sized(__force_integral_expr(p), gfp), \
         |                                       ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:701:32: note: expanded from macro 'kmalloc'
     701 |         signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:10: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                        ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:701:32: note: expanded from macro 'kmalloc'
     701 |         signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:9: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                       ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:701:32: note: expanded from macro 'kmalloc'
     701 |         signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:692:4: note: expanded from macro '__size_force_positive'
     692 |                         __force_integral_expr(x);               \
         |                         ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:701:32: note: expanded from macro 'kmalloc'
     701 |         signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:10: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                        ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:701:32: note: expanded from macro 'kmalloc'
     701 |         signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:9: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                       ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:701:32: note: expanded from macro 'kmalloc'
     701 |         signed char:    kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:692:4: note: expanded from macro '__size_force_positive'
     692 |                         __force_integral_expr(x);               \
         |                         ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:702:32: note: expanded from macro 'kmalloc'
     702 |         signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:10: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                        ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:702:32: note: expanded from macro 'kmalloc'
     702 |         signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:9: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                       ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:702:32: note: expanded from macro 'kmalloc'
     702 |         signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:692:4: note: expanded from macro '__size_force_positive'
     692 |                         __force_integral_expr(x);               \
         |                         ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:702:32: note: expanded from macro 'kmalloc'
     702 |         signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:10: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                        ^
   include/linux/compiler_types.h:468:2: note: expanded from macro '__force_integral_expr'
     468 |         ___force_integral_expr(x, int, 0)
         |         ^
   include/linux/compiler_types.h:466:25: note: expanded from macro '___force_integral_expr'
     466 |         __builtin_choose_expr(!__is_ptr(x), (x), (type)val)
         |                                ^
   include/linux/compiler_types.h:462:22: note: expanded from macro '__is_ptr'
     462 | #define __is_ptr(p)             __same_type(p, __decay(p))
         |                                 ^
   include/linux/compiler_types.h:451:62: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                              ^
>> drivers/usb/gadget/function/f_tcm.c:330:16: error: invalid application of 'typeof' to bit-field
   include/linux/slab.h:702:32: note: expanded from macro 'kmalloc'
     702 |         signed short:   kmalloc_sized(__size_force_positive(p), gfp), \
         |                                       ^
   include/linux/slab.h:691:9: note: expanded from macro '__size_force_positive'
     691 |                 typeof(__force_integral_expr(x)) __forced_val = \
         |                       ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/typeof +330 drivers/usb/gadget/function/f_tcm.c

08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  304  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  305  static int bot_prepare_reqs(struct f_uas *fu)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  306  {
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  307  	int ret;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  308  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  309  	fu->bot_req_in = usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  310  	if (!fu->bot_req_in)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  311  		goto err;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  312  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  313  	fu->bot_req_out = usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  314  	if (!fu->bot_req_out)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  315  		goto err_out;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  316  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  317  	fu->cmd.req = usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  318  	if (!fu->cmd.req)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  319  		goto err_cmd;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  320  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  321  	fu->bot_status.req = usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  322  	if (!fu->bot_status.req)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  323  		goto err_sts;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  324  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  325  	fu->bot_status.req->buf = &fu->bot_status.csw;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  326  	fu->bot_status.req->length = US_BULK_CS_WRAP_LEN;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  327  	fu->bot_status.req->complete = bot_status_complete;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  328  	fu->bot_status.csw.Signature = cpu_to_le32(US_BULK_CS_SIGN);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  329  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11 @330  	fu->cmd.buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  331  	if (!fu->cmd.buf)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  332  		goto err_buf;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  333  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  334  	fu->cmd.req->complete = bot_cmd_complete;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  335  	fu->cmd.req->buf = fu->cmd.buf;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  336  	fu->cmd.req->length = fu->ep_out->maxpacket;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  337  	fu->cmd.req->context = fu;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  338  
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  339  	ret = bot_enqueue_cmd_cbw(fu);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  340  	if (ret)
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  341  		goto err_queue;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  342  	return 0;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  343  err_queue:
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  344  	kfree(fu->cmd.buf);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  345  	fu->cmd.buf = NULL;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  346  err_buf:
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  347  	usb_ep_free_request(fu->ep_in, fu->bot_status.req);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  348  err_sts:
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  349  	usb_ep_free_request(fu->ep_out, fu->cmd.req);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  350  	fu->cmd.req = NULL;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  351  err_cmd:
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  352  	usb_ep_free_request(fu->ep_out, fu->bot_req_out);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  353  	fu->bot_req_out = NULL;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  354  err_out:
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  355  	usb_ep_free_request(fu->ep_in, fu->bot_req_in);
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  356  	fu->bot_req_in = NULL;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  357  err:
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  358  	pr_err("BOT: endpoint setup failed\n");
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  359  	return -ENOMEM;
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  360  }
08a1cb0f65fde6f Andrzej Pietrasiewicz 2015-12-11  361  

:::::: The code at line 330 was first introduced by commit
:::::: 08a1cb0f65fde6f0da1db77b847ea78dc3c102cb usb: gadget: tcm: factor out f_tcm

:::::: TO: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
