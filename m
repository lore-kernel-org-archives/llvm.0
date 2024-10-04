Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74A91C3038;
	Fri,  4 Oct 2024 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056728; cv=none; b=BlCDWHUE05XDrEFZh2bmvcqr1C5c5guSIbh3YSxkCmbaqjutLl7xNSbzOHcLlgfmqvkE5YMnZtOvdJsblbPOX4TLaMDdgglvEiulvTG2ApARAX/KyIgkPrHf4ukBRN4IcCamWxMrhyboPPxdxqS2DLX0cyiP5h78Z0iAXPdqoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056728; c=relaxed/simple;
	bh=e7oCZOQEpb4KoIn9xoa0YLv2beWw5KGIE5hNlFZoaZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ygt+zAIT0DKHaWBqT/mFV45Sh+DsqIpf9/SHOOB+ED7n6GpuJYWN3h1qlw/KzAwioKqzu9ds5cjyaPK5WKwHe+J3/bgTsaozuDr0TQDflCUFZhL7vWdUWLTgpiIk/STVbP09WvRUNqjLYrRA5ddqse8Ad52IA3LVCBi6kGZYCSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHn9CjMy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHn9CjMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728056727; x=1759592727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7oCZOQEpb4KoIn9xoa0YLv2beWw5KGIE5hNlFZoaZE=;
  b=HHn9CjMyfGK/WH2yY6E4o+Ft1LdSYqDMvkpp19iLWf11laalFHjbm8XG
   T0gLA0gLgzoGuCUyA33byKuLqO/zF8qJupdYV5q0JemXdvY7YqlgmJDpp
   DrgykO1yIEquS6BXAgcQ9vZiDL6bWTCIP8r/iOSQx/X0zvD5Q465TXXkA
   8vsKCLRgjkVnfQgsI+vjWRRz/EonBPcyel25hshWl1ToUdRaKRt0EC/ID
   OkFak2Jzv7vWmBz3d/jjiCBRSsN2C5cvz5ROjBtqrnwyqijcCxFFJI188
   FCvpR9U31Rnk3/i4mdH2DNIvcZ/329gkWqFCyObtDrd71CTfWz39MREh3
   Q==;
X-CSE-ConnectionGUID: bMExlRaTSuqnWKjlEYgQQw==
X-CSE-MsgGUID: MkN3+O/YT1yhTlWyb08x4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27165125"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27165125"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 08:45:26 -0700
X-CSE-ConnectionGUID: sw+nxSv+Rs+nBYQXdeVUMg==
X-CSE-MsgGUID: s+/cDWx0RPaDEIeWke7AYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79312415"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 08:45:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swkUc-0001qq-33;
	Fri, 04 Oct 2024 15:45:22 +0000
Date: Fri, 4 Oct 2024 23:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 30/31] ld.lld: error: relocation R_X86_64_32S
 cannot be used against symbol 'ftrace_trace_function'; recompile with -fPIC
Message-ID: <202410042304.WtASql7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   1295be6d1a5cb6a30132ee8b01c79018794d0c3e
commit: 61f3a3cf6f5940319514b36400d7c994b163d8c5 [30/31] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-buildonly-randconfig-004-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042304.WtASql7r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042304.WtASql7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042304.WtASql7r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_32S cannot be used against symbol 'ftrace_trace_function'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__fentry__)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against symbol 'ftrace_stub'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__fentry__)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
