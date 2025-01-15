Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17092156F3B;
	Wed, 15 Jan 2025 05:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736919335; cv=none; b=BlOuED/u2sbhsM7pa6cWoHK+u5ElIcohaYZow5xMzJmUCl5SxvV2AuajalGH7kiZkDAIH3YqCsiCqAoKvk1JakaFsgVmEO6JhkaOWbXoLFEabo58lLlkqVQTwUEm8PqvtWcgr9l9PteLWjCNpIAlL0Q2lAOllNdErSvH05CU8sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736919335; c=relaxed/simple;
	bh=b5LfSnKrjdbtlZ0eonODC+gXQg4sAqYMilNpGP0/teg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eos0OyD0xIR/v+2QbWuot2+/iWA1BePth8VuIVjvK0a37n57yfY79LrhKiNjme2PkJx4PqPeVlQpSW7UIWppo9sB7sN5RO5gWTAui1EMF8Tu7mu5cGr6c+99bZAh/+vDIyZ2oinGaNPmmEUTegM6GUDuOBShCyL1/039UpIkk90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJtIBWVP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJtIBWVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736919333; x=1768455333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5LfSnKrjdbtlZ0eonODC+gXQg4sAqYMilNpGP0/teg=;
  b=kJtIBWVPbmCvkUJaV3nDXzjDciyW4m2nUbH6TC5e9FU7BLCfvDv9YJtR
   ywDS7x2aS1w3zPt7zrlvMFcbEclZ9Of4k4k0Hpz7yky6njlkp1Q5DZew7
   XI7NySh/JF4YW1emHf1wgiVT1WehIq3Z9MP7kAU1ivU+a+iar56Lrm6kg
   jwXHWs5V3kCtyI4UBM5FDdFgGHTpdDD+mAOFHy5+Pg0M038CO0cL2a62O
   lJvpj/1HSO1R0s8nrZ+AYfprPPIXJia3sKhKfvb0vUtcQEBRvCDDswXKU
   NS+67HGkIaDtotByYEoyPVuY1uY97LBMW/x15HizdmT5AW4zFf+Ux2CR6
   A==;
X-CSE-ConnectionGUID: 4y06fzjYSyGrrDy7yeVn4A==
X-CSE-MsgGUID: ANVN0x97RYyW9Lpn8XKQPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47823691"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="47823691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 21:34:47 -0800
X-CSE-ConnectionGUID: ZU/vxDkITzyVcGv1e6AbMA==
X-CSE-MsgGUID: dmS5p3icQvSGOedjnbPmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="105210166"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2025 21:34:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXw39-000PVX-09;
	Wed, 15 Jan 2025 05:34:43 +0000
Date: Wed, 15 Jan 2025 13:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool/break-stuff 5/5] arch/x86/kernel/head_64.o: error:
 objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with
 modified stack frame
Message-ID: <202501151354.4Rtqe3L2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/break-stuff
head:   5daebdfce36d5b286c19eafeb6a44bb73d7f721c
commit: 5daebdfce36d5b286c19eafeb6a44bb73d7f721c [5/5] objtool: Change "warning:" to "error:" for CONFIG_OBJTOOL_WERROR
config: x86_64-buildonly-randconfig-003-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151354.4Rtqe3L2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151354.4Rtqe3L2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151354.4Rtqe3L2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: error: objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with modified stack frame
>> arch/x86/kernel/head_64.o: error: objtool:   xen_hypercall_hvm+0x0: <=== (sym)
   0000 0000000000000000 <xen_hypercall_hvm>:
   0000    0:	55                   	push   %rbp
   0001    1:	48 89 e5             	mov    %rsp,%rbp
   0004    4:	50                   	push   %rax
   0005    5:	51                   	push   %rcx
   0006    6:	52                   	push   %rdx
   0007    7:	57                   	push   %rdi
   0008    8:	56                   	push   %rsi
   0009    9:	41 53                	push   %r11
   000b    b:	41 52                	push   %r10
   000d    d:	41 51                	push   %r9
   000f    f:	41 50                	push   %r8
   0011   11:	6a 00                	push   $0x0
   0013   13:	e8 00 00 00 00       	call   18 <xen_hypercall_hvm+0x18>	14: R_X86_64_PLT32	__xen_hypercall_setfunc-0x4
   0018   18:	48 8d 1d 00 00 00 00 	lea    0x0(%rip),%rbx        # 1f <xen_hypercall_hvm+0x1f>	1b: R_X86_64_PC32	xen_hypercall_amd-0x4
   001f   1f:	48 39 c3             	cmp    %rax,%rbx
   0022   22:	58                   	pop    %rax
   0023   23:	41 58                	pop    %r8
   0025   25:	41 59                	pop    %r9
   0027   27:	41 5a                	pop    %r10
   0029   29:	41 5b                	pop    %r11
   002b   2b:	5e                   	pop    %rsi
   002c   2c:	5f                   	pop    %rdi
   002d   2d:	5a                   	pop    %rdx
   002e   2e:	59                   	pop    %rcx
   002f   2f:	58                   	pop    %rax
   0030   30:	0f 84 00 00 00 00    	je     36 <xen_hypercall_hvm+0x36>	32: R_X86_64_PLT32	xen_hypercall_amd-0x4
   0036   36:	e9 00 00 00 00       	jmp    3b <xen_hypercall_hvm+0x3b>	37: R_X86_64_PLT32	xen_hypercall_intel-0x4
   003b   3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
