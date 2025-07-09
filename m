Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F526E6F2;
	Wed,  9 Jul 2025 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043414; cv=none; b=JsjpLLVKU5nTiOmcIlp0cH4JuyPz5ECPTfiEFh9Qy6fnze9SN4i8zC7IuP5RidHpgnhz+BYxDBR5D2pSyAKitAlj0WfP3N/lq81/kAMu0oNKtPZmlgts33Dfk79VMOkMCVVcc7CYUTSYyrhhXUExps+yDtxTmTinPfQtFdrgb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043414; c=relaxed/simple;
	bh=6ASvOCdxdJnM+FneL5R3jBgkwlmz+qDDifEWOJ/p5Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7tmn0ETxorKVBllZKAcOQtdFRN+zMO/LW+vpHdhGlvaXWwvL0kxt1uTh/KK52Ap5EnJlwHRzOFRfsNQLTl/0s/vAV6rJ9kzUXm5Rm0F7FILIchfTRt/+gTCvhe79uByYHISabvOu1UCUnM7mRDDZ9EBK8LCkJIaibvUPEMCmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL2/1Z48; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL2/1Z48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752043412; x=1783579412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ASvOCdxdJnM+FneL5R3jBgkwlmz+qDDifEWOJ/p5Ms=;
  b=VL2/1Z48ki6H5481SLYxuS4iKOmBgIQVvl7OG8ZslNnEk/Lbkr6YaoOw
   010N6Q7irbWVXuhnR/XY2FLfBfduPl9xCXuHgK+li4q4EahoIb+p6DhD1
   OTksv7UeKYSvEYIhataMtkHkjPiYiRHk2SdU/l+8Vh86pA8SYTR16qNMy
   JNiN4y/Zt9CxCscx66Mno/eYgE4jF/fOg4ws26fwSPEIcosKxuXJT/qy8
   GLlpuSde54Dz5yBzNcswIYlRJLadnqE30kXIAaCmRE1lbl9m/PTXtVw1i
   omtFW4KDUmdyQFEZrNzMgVx4/fnCUS6XUmTO6RAFXG65HmaX4526iGTaK
   Q==;
X-CSE-ConnectionGUID: KDG7LpmVRTuQ9ZTxIzlxCw==
X-CSE-MsgGUID: 6YNEx3V5RBGAw2ePISyx6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64542060"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="64542060"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 23:43:32 -0700
X-CSE-ConnectionGUID: EdOJoOa4QCWqxdMq11kzgw==
X-CSE-MsgGUID: i4iOe/7tQzOqNx0YrqqMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="192875910"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2025 23:43:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZOW1-0003Bx-2F;
	Wed, 09 Jul 2025 06:42:49 +0000
Date: Wed, 9 Jul 2025 14:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:tdx/dpamt 4/16] arch/x86/include/asm/shared/tdx_errno.h:68:16:
 warning: shift count >= width of type
Message-ID: <202507091449.UwoQBGu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git tdx/dpamt
head:   d5281cff178eb57cd05950a4b723d7ecd7787528
commit: f4839e7d43483915593f133b6944204a31b66a6d [4/16] x86/tdx: Add helpers to check return status codes
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091449.UwoQBGu0-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091449.UwoQBGu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091449.UwoQBGu0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
>> arch/x86/include/asm/shared/tdx_errno.h:68:16: warning: shift count >= width of type [-Wshift-count-overflow]
      68 |         return (err & TDX_ERR_NON_RECOVERABLE) == TDX_ERR_NON_RECOVERABLE;
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:41:35: note: expanded from macro 'TDX_ERR_NON_RECOVERABLE'
      41 | #define TDX_ERR_NON_RECOVERABLE                 _BITUL(62)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:68:44: warning: shift count >= width of type [-Wshift-count-overflow]
      68 |         return (err & TDX_ERR_NON_RECOVERABLE) == TDX_ERR_NON_RECOVERABLE;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:41:35: note: expanded from macro 'TDX_ERR_NON_RECOVERABLE'
      41 | #define TDX_ERR_NON_RECOVERABLE                 _BITUL(62)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:73:16: warning: shift count >= width of type [-Wshift-count-overflow]
      73 |         return (err & TDX_ERR_SW_ERROR) == TDX_ERR_SW_ERROR;
         |                       ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:73:37: warning: shift count >= width of type [-Wshift-count-overflow]
      73 |         return (err & TDX_ERR_SW_ERROR) == TDX_ERR_SW_ERROR;
         |                                            ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:78:16: warning: shift count >= width of type [-Wshift-count-overflow]
      78 |         return (err & TDX_ERR_SEAMCALL_VMFAILINVALID) ==
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:43:42: note: expanded from macro 'TDX_ERR_SEAMCALL_VMFAILINVALID'
      43 | #define TDX_ERR_SEAMCALL_VMFAILINVALID          (TDX_ERR_SW_ERROR | _UL(0xFFFF0000))
         |                                                  ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:79:3: warning: shift count >= width of type [-Wshift-count-overflow]
      79 |                 TDX_ERR_SEAMCALL_VMFAILINVALID;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:43:42: note: expanded from macro 'TDX_ERR_SEAMCALL_VMFAILINVALID'
      43 | #define TDX_ERR_SEAMCALL_VMFAILINVALID          (TDX_ERR_SW_ERROR | _UL(0xFFFF0000))
         |                                                  ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:84:16: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         return (err & TDX_ERR_SEAMCALL_GP) == TDX_ERR_SEAMCALL_GP;
         |                       ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:45:32: note: expanded from macro 'TDX_ERR_SEAMCALL_GP'
      45 | #define TDX_ERR_SEAMCALL_GP                     (TDX_ERR_SW_ERROR | X86_TRAP_GP)
         |                                                  ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
--
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
>> arch/x86/include/asm/shared/tdx_errno.h:68:16: warning: shift count >= width of type [-Wshift-count-overflow]
      68 |         return (err & TDX_ERR_NON_RECOVERABLE) == TDX_ERR_NON_RECOVERABLE;
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:41:35: note: expanded from macro 'TDX_ERR_NON_RECOVERABLE'
      41 | #define TDX_ERR_NON_RECOVERABLE                 _BITUL(62)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:68:44: warning: shift count >= width of type [-Wshift-count-overflow]
      68 |         return (err & TDX_ERR_NON_RECOVERABLE) == TDX_ERR_NON_RECOVERABLE;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:41:35: note: expanded from macro 'TDX_ERR_NON_RECOVERABLE'
      41 | #define TDX_ERR_NON_RECOVERABLE                 _BITUL(62)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:73:16: warning: shift count >= width of type [-Wshift-count-overflow]
      73 |         return (err & TDX_ERR_SW_ERROR) == TDX_ERR_SW_ERROR;
         |                       ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:73:37: warning: shift count >= width of type [-Wshift-count-overflow]
      73 |         return (err & TDX_ERR_SW_ERROR) == TDX_ERR_SW_ERROR;
         |                                            ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:78:16: warning: shift count >= width of type [-Wshift-count-overflow]
      78 |         return (err & TDX_ERR_SEAMCALL_VMFAILINVALID) ==
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:43:42: note: expanded from macro 'TDX_ERR_SEAMCALL_VMFAILINVALID'
      43 | #define TDX_ERR_SEAMCALL_VMFAILINVALID          (TDX_ERR_SW_ERROR | _UL(0xFFFF0000))
         |                                                  ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:79:3: warning: shift count >= width of type [-Wshift-count-overflow]
      79 |                 TDX_ERR_SEAMCALL_VMFAILINVALID;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:43:42: note: expanded from macro 'TDX_ERR_SEAMCALL_VMFAILINVALID'
      43 | #define TDX_ERR_SEAMCALL_VMFAILINVALID          (TDX_ERR_SW_ERROR | _UL(0xFFFF0000))
         |                                                  ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)
         |                                                 ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   In file included from arch/x86/include/asm/tdx.h:13:
   In file included from arch/x86/include/asm/shared/tdx.h:7:
   arch/x86/include/asm/shared/tdx_errno.h:84:16: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         return (err & TDX_ERR_SEAMCALL_GP) == TDX_ERR_SEAMCALL_GP;
         |                       ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:45:32: note: expanded from macro 'TDX_ERR_SEAMCALL_GP'
      45 | #define TDX_ERR_SEAMCALL_GP                     (TDX_ERR_SW_ERROR | X86_TRAP_GP)
         |                                                  ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:42:29: note: expanded from macro 'TDX_ERR_SW_ERROR'
      42 | #define TDX_ERR_SW_ERROR                        (TDX_ERR_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~~~~~
   arch/x86/include/asm/shared/tdx_errno.h:40:26: note: expanded from macro 'TDX_ERR_ERROR'
      40 | #define TDX_ERR_ERROR                           _BITUL(63)


vim +68 arch/x86/include/asm/shared/tdx_errno.h

    65	
    66	static inline bool IS_TDX_ERR_NON_RECOVERABLE(u64 err)
    67	{
  > 68		return (err & TDX_ERR_NON_RECOVERABLE) == TDX_ERR_NON_RECOVERABLE;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
