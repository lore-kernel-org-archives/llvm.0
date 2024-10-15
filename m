Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1BC1E633B;
	Tue, 15 Oct 2024 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988501; cv=none; b=P/pTjrxtmOThJ6AKzeyb+VHDcWa2DA7l33i11GJf8z+qf+zyazXKsbZ+M9/xhS3MxRpK+QUQImuRt+ug5xNJFgsK7V8OZVa226MOJDliOSUe98TJDWG+fK0nOAI9NDBBsyKxn/srkwZamjAOfNHfUwH1t9eJwf5LJEho4K5OPgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988501; c=relaxed/simple;
	bh=qWrhG0NPHfNgRsbGiYxw3eJsrWXs0X2A4BuV9LDFL4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ie07rJ5kp6dwitDnOShZ2wOuKVHP7UZzMLL7/Or60ilp0gaBHqdcZicMu3eugLAb2mokjISC+GhKrx22p5CXaGHU2U9Q3phBAe+uRSRBRHqRBvDlHU/dO3lw5XUhnj2CGWYh9nW4Uga8w5v7OO0dRZFdAejuaGGPTtnqqj+r+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbPJHgqG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbPJHgqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728988500; x=1760524500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWrhG0NPHfNgRsbGiYxw3eJsrWXs0X2A4BuV9LDFL4M=;
  b=BbPJHgqGjl2IMa/0UPrmsRHBw/RGW9tgxvhsqMi224JUuRhF8N4j3tua
   YB/HvTzQZvj1pWspseiMjz6DSdG5FU1qtxTVo7sax8zuhtZjCDhRCItIW
   MbcSFM+e4zwwiGqaL6BYPgGLMM8fm5mBb5o3up1UgtRDQ5qQxuPcXUTWh
   sqbXM5a99e8D2eZj6VUPmd+99Bj8qU2jprpFQ8TJBKlmzJEzlMdNwDagu
   niNlHvlApGGuIgo6qnM+q/UmfihxTKTRh6a5UuSReU22NObPmXryrLgN3
   wWxPVLffrJjjyJBqZV3nWV7Owj5e64q2FERitEyVpC7aeseGRs5iZfiv6
   w==;
X-CSE-ConnectionGUID: TJP3TyE4QbWJmYA2909dyQ==
X-CSE-MsgGUID: q99G8k7BTYeIEPSW6IMMjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39495269"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39495269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 03:34:49 -0700
X-CSE-ConnectionGUID: WwDAtCrBSsesM0IvbEEAEQ==
X-CSE-MsgGUID: +/dUy+AGQQmb8lwOmaH/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="82904940"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2024 03:34:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0et2-000Hyd-1Z;
	Tue, 15 Oct 2024 10:34:44 +0000
Date: Tue, 15 Oct 2024 18:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v6 8/8] arch/x86/mm/init.c:1056:6: warning: no
 previous prototype for function 'execmem_fill_trapping_insns'
Message-ID: <202410151847.zZSyJZxK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v6
head:   2b978e9386bfb02955ece81058a14103d1bb7504
commit: 2b978e9386bfb02955ece81058a14103d1bb7504 [8/8] x86/module: enable ROX caches for module text
config: i386-buildonly-randconfig-003-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151847.zZSyJZxK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151847.zZSyJZxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151847.zZSyJZxK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/init.c:1056:6: warning: no previous prototype for function 'execmem_fill_trapping_insns' [-Wmissing-prototypes]
    1056 | void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
         |      ^
   arch/x86/mm/init.c:1056:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1056 | void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/execmem_fill_trapping_insns +1056 arch/x86/mm/init.c

  1055	
> 1056	void execmem_fill_trapping_insns(void *ptr, size_t size, bool writeable)
  1057	{
  1058		/* fill memory with INT3 instructions */
  1059		if (writeable)
  1060			memset(ptr, INT3_INSN_OPCODE, size);
  1061		else
  1062			text_poke_set(ptr, INT3_INSN_OPCODE, size);
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
