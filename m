Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C919299A9E;
	Thu,  2 Oct 2025 06:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759387957; cv=none; b=YvumQHpVxwRU9Qhz7vEsQ9O18p/V48FIAInoNyosSkNBObyJXQ3Hnyx4rkW5iXK/A9XDUzmBTCV5180b+gPM5bkEW+i+YfbArzjJrDXWDmK8vDDPsxnBW8ZNLmfys0dbhkE2StMjBxkJGia0QDakLOXPvzVRSXwyP3LWajFPWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759387957; c=relaxed/simple;
	bh=bVXeDuXy8yqaxbuc88f/OC4/J8nDq8GVJSRtwvlZynk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0+9R9Df2kAlDnB1tTuC/TBMd3eB0L2IYtkWzqg6HT3v0rlc6c8dBKIM+3A87jE0RGL1z0AtbTBiAHspcFmH6HLw7OwBratCyccQq22urIy7kLYW2vghaS+r/ANFcKEzrK+ua3DUBpe03t3HL86y8ot7qywUOIKgacaJuPJaWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J207nz4L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J207nz4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759387956; x=1790923956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bVXeDuXy8yqaxbuc88f/OC4/J8nDq8GVJSRtwvlZynk=;
  b=J207nz4LaE1KWBzpafFIAwaoWZXqNq8lzOQt3K+vzUtanRhIezxXIXgm
   rwPn9Z1zjjIbOChwfrMED2cQKVGj3dMApNnEGRxwHLF9zj5KZfiQ71lUW
   Mg4Cjr6UNX6RwFP26/SW+n8x+u2wrDLA6iA36L04QkMmP6LfS4IgdnmeZ
   002tCOGl/k9FOhoz6exUn7QqDuJSf/FXfJk3Q53hCW877hgENzJfD6dIQ
   AXssYK1BDC5FZHHxmKZU8CxQ+3oZ9C06uuKm1LbrUzx3FMkgjv1GvmcFp
   lInb/9Mhs6qe3mxrxaM53aU4ZctMxFurhk6/P0ouPUqoNbRod3OQxXbzw
   A==;
X-CSE-ConnectionGUID: TSsj0k8eQKCdwJ4K8gZVmA==
X-CSE-MsgGUID: NuB3MhGbQHyQzmwcHKpeiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61627840"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61627840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 23:52:35 -0700
X-CSE-ConnectionGUID: 9mn1e2/US+yF7nt54xWgbA==
X-CSE-MsgGUID: Vb5Md+5CQAqBhddbvxyZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="179005275"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2025 23:52:34 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4DB1-0003cV-0y;
	Thu, 02 Oct 2025 06:52:31 +0000
Date: Thu, 2 Oct 2025 14:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-fpsimd-on-stack2 19/19] lib/test_fpu_glue.c:28:2: error:
 too few arguments to function call, expected 1, have 0
Message-ID: <202510021400.SOpdrxp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-fpsimd-on-stack2
head:   b5e76712d12bee6396a6232e659ea7f10758e48b
commit: b5e76712d12bee6396a6232e659ea7f10758e48b [19/19] arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
config: arm64-randconfig-002-20251002 (https://download.01.org/0day-ci/archive/20251002/202510021400.SOpdrxp9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021400.SOpdrxp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510021400.SOpdrxp9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_fpu_glue.c:28:2: error: too few arguments to function call, expected 1, have 0
      28 |         kernel_fpu_begin();
         |         ^~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/fpu.h:12:46: note: expanded from macro 'kernel_fpu_begin'
      12 | #define kernel_fpu_begin()      kernel_neon_begin()
         |                                 ~~~~~~~~~~~~~~~~~ ^
   arch/arm64/include/asm/neon.h:16:6: note: 'kernel_neon_begin' declared here
      16 | void kernel_neon_begin(struct user_fpsimd_state *);
         |      ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_fpu_glue.c:30:2: error: too few arguments to function call, expected 1, have 0
      30 |         kernel_fpu_end();
         |         ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/fpu.h:13:42: note: expanded from macro 'kernel_fpu_end'
      13 | #define kernel_fpu_end()        kernel_neon_end()
         |                                 ~~~~~~~~~~~~~~~ ^
   arch/arm64/include/asm/neon.h:17:6: note: 'kernel_neon_end' declared here
      17 | void kernel_neon_end(struct user_fpsimd_state *);
         |      ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +28 lib/test_fpu_glue.c

4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  23  
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  24  static int test_fpu_get(void *data, u64 *val)
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  25  {
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  26  	int status = -EINVAL;
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  27  
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18 @28  	kernel_fpu_begin();
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  29  	status = test_fpu();
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  30  	kernel_fpu_end();
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  31  
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  32  	*val = 1;
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  33  	return status;
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  34  }
4185b3b92792ea lib/test_fpu.c Petteri Aimonen 2020-06-18  35  

:::::: The code at line 28 was first introduced by commit
:::::: 4185b3b92792eaec5869266e594338343421ffb0 selftests/fpu: Add an FPU selftest

:::::: TO: Petteri Aimonen <jpa@git.mail.kapsi.fi>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
