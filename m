Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2318F343D6E;
	Tue, 27 Jan 2026 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510545; cv=none; b=RDbHhshWrxhpj9+PG2I+Z+ukytxY0jSVMNNpAri3ZYzqU1TjnonLjKLwa3huqkNTw0sPl10AjcDiekpvVp3vEf3XLXCQkHPiTfAdOHs2nlNCYYhzbLx1Jfiob3yQo6ie3e4XM9/9ljxYIA8f3PShyXdarXnKvU7gRF6IYMA2QFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510545; c=relaxed/simple;
	bh=iOwR9j2XgjX2wR3jZG+vODfixjwvdIhZAqBoaQMR2pI=;
	h=Date:From:Cc:Subject:Message-ID; b=pDeaBwpZ1DSn8SON7em1g8286EPprGiZLHfjJ06rxEj58r3B2imvVLPqWaBsxIF6n0R+RzOycfT7NOr5zyBjry18SNg6Lhpc2B5Xq+qVTK09sufX57E+vrH/uW9bkmxVZHXhq4PJBfdSGovrqYkSM5LdnL7oRtWMN1V0Rl5scDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUi1+mPn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUi1+mPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510541; x=1801046541;
  h=date:from:cc:subject:message-id;
  bh=iOwR9j2XgjX2wR3jZG+vODfixjwvdIhZAqBoaQMR2pI=;
  b=eUi1+mPnsd6Jcj5WOnq4iiTp2DhNVprPRo24E1OLPLcm4p6zIu9ACifm
   CZSQqIEGFoy5NsjipymDDrIZPXxIuO8LE9e+lWiXIG5aitUxOV1pSIvAf
   eD0ickq7g6lg5+PH2j/itGmAll9qeLFy0JPCEXoHPswhizjcphC+FQimv
   OOQd8Exl1hErZQUL+CGbqKIAkrBUz6A6dSGIGzV91MUH10VCN3gndUgsh
   xo7rr0Q4n1UWC9XazjD/mmDzVEqSB9qzkjaE45CBNP9flknEXnx5xJkT3
   nBNQV9vXxt8otjICdXGfxlFnB1i6m5TylRxUb9mQY2ylLmH7JsVRo8wIW
   w==;
X-CSE-ConnectionGUID: SVubGnqWQJ+8iYmhWmm5vA==
X-CSE-MsgGUID: RJ7wHdG7SWK54MpK3wKemw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70744294"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70744294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:42:20 -0800
X-CSE-ConnectionGUID: OkbldqlXSCOYPyyKFKffQg==
X-CSE-MsgGUID: GUqbVH2cQ8y8/RdYNqK3IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="239211656"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 02:42:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkgWW-00000000YLi-1J0F;
	Tue, 27 Jan 2026 10:42:16 +0000
Date: Tue, 27 Jan 2026 18:41:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 include/linux/acpi.h:1582:9: error: incompatible integer to pointer
 conversion returning 'int' from a function with result type 'struct
 acpi_pptt_cache *'
Message-ID: <202601271843.aOsOKG9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Drew Fustini <fustini@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260127/202601271843.aOsOKG9z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271843.aOsOKG9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271843.aOsOKG9z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   clang diag: include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>> Unable to generate bindings: clang diagnosed error: include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]


vim +1582 include/linux/acpi.h

  1579	
  1580	static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
  1581	{
> 1582		return -EINVAL;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
