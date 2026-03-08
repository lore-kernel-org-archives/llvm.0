Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F629DB9A;
	Sun,  8 Mar 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983304; cv=none; b=bAJku8MoSKT6ybnBZ216FBuPeAl67OoDY2TySSvUk3hgHzDMXYtdswacnpKbHoHi5KTK4aFoYkyQ//PDBCdCazY5Ms+WRVKR8Xi8Kem4ciRnsaFyEgItlYy0MhN0GwFXmkkfGSrdUG6myw8MBHHmogSPMjztp6ntRxr6dOHUBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983304; c=relaxed/simple;
	bh=yDzNEqRrRAhvayACf2rMbNqXf3V42o1yRrdEMCoycsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FguNbvNUZy2b96UoUJGkBldVdKaeiImqvpaAW8OsicR7ZB5Hx1pEK5uUmOmPgaa+VgmMPzkCzkIcNC1K/YwKvxQpNcUbcHZGZjnjQIS4eMpKCNiTHcwFsvKSjT9NiER+/LhRChVf+4QxuF51SVYN5vJHb39Yrisys4u+66vEkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5tGnm/L; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5tGnm/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772983302; x=1804519302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDzNEqRrRAhvayACf2rMbNqXf3V42o1yRrdEMCoycsM=;
  b=a5tGnm/LLgdfgQ/EIzHA2Kix5OIRQeBrM0kDu556JFgbhcZNN1kJpx5C
   YJKPBspQP7LG7WkzCPK1FgiFkxB1TnIJMeNEW5qMF7p87abOCH+rW5HO0
   reNj0bVtMLOEms6vqeQhaNixePRrqwkRaj9zFMOhqlX5HokUmoPYz9QdN
   OoUa4rjCVb4Xm2FqiS47CIs3OZNadXFr50d2aKTnkz3U/itEzXIFvOlU4
   Ee7bNydUVVs/7S1q+mn2Lhx5Y994z0+GNfikBuLfPG20vplzIBcgKuDeD
   cITmWUvAeOcUqSpFrXmmOOldn/tiNYj8nKcUGUj+mmht5wW1ttjwtFskc
   g==;
X-CSE-ConnectionGUID: vvQAoqRDQg6m38ICzoiMdA==
X-CSE-MsgGUID: 9FfW3MMMSnCuEHDgLEPOKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73896563"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="73896563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 08:21:41 -0700
X-CSE-ConnectionGUID: qRzGCl+iTievQSm43NO+KA==
X-CSE-MsgGUID: cPPmQvIER3exxhn1Mf0zmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="242533494"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 08:21:39 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzFwm-000000003CS-46EZ;
	Sun, 08 Mar 2026 15:21:36 +0000
Date: Sun, 08 Mar 2026 23:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 2/2]
 ./usr/include/asm/ucontext.h:24:37: error: use of undeclared identifier
 'sigset_t'
Message-ID: <202603082317.n3Cv4poc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   1a122f38e5ce0abdc67e4dd182a7070244ac7e2f
commit: 1a122f38e5ce0abdc67e4dd182a7070244ac7e2f [2/2] ucontext
config: riscv-randconfig-002-20260308 (https://download.01.org/0day-ci/archive/20260308/202603082317.n3Cv4poc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082317.n3Cv4poc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082317.n3Cv4poc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   ./usr/include/asm/ucontext.h:16:2: error: unknown type name 'stack_t'
      16 |         stack_t           uc_stack;
         |         ^
   ./usr/include/asm/ucontext.h:17:2: error: unknown type name 'sigset_t'
      17 |         sigset_t          uc_sigmask;
         |         ^
>> ./usr/include/asm/ucontext.h:24:37: error: use of undeclared identifier 'sigset_t'
      24 |         __u8              __unused[1024 / 8 - sizeof(sigset_t)];
         |                                                      ^~~~~~~~
>> ./usr/include/asm/ucontext.h:35:20: error: field has incomplete type 'struct sigcontext'
      35 |         struct sigcontext uc_mcontext;
         |                           ^
   ./usr/include/asm/ucontext.h:35:9: note: forward declaration of 'struct sigcontext'
      35 |         struct sigcontext uc_mcontext;
         |                ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
