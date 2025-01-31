Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713110E0;
	Fri, 31 Jan 2025 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738304609; cv=none; b=b1jKlVd2Bdmm1vbwS39/mqRnmoVLvUpisbUrBxFkjAR9wfOyVZTW8MelLE6yd1qkah9SIS6jV2JJyMdZHkDgVyaN3lmfKL7su/Tcd/8ILyxNv2vT/KLVeOKRlneh89Ca03L4JzHgf6RR/QU94LO3X50qMAuIMTE6n6cbEfvXq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738304609; c=relaxed/simple;
	bh=QXY/B5pMe0GGW3KUSN7S7GmU/ZqDPs/qCUCZTarbgnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QW+J9I7j4sI//rGl3keelv3De3sTy6paksw4vP+hSXEKIVd/P7S3uZ97lo/ezCxR6R94rwK2OFsL15tQY4deYXHpb6iq/c7VbzUNopF9XZg8v3Vz3frYpueKe6WY6599CQIW2rUImN2FjR8MkllDw/onRs3LaPmJ2avU2mQUwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjqiLtig; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjqiLtig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738304607; x=1769840607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXY/B5pMe0GGW3KUSN7S7GmU/ZqDPs/qCUCZTarbgnQ=;
  b=VjqiLtigIPxWAipwfA+IuHTHEabKNgMzPjecDOjd5j54h22AiDRkiWF5
   nxckG4ar8GsllmYgSerbAmbZ7iu9Io29RdnNP4pKRwBWhxB+ndzl8VsKG
   H44u2VnGwKyDsiIU19BhSW1+my7YYtEcHnpQpDLkIFSAPOniDdUzsygDa
   7mJTq9PwwMijJkl1tkvzsKEEwlypvJjh45fzwALNQ7asIzO3VtO6wAYjB
   1xF3OtkRSMwuj1QUveMVh7hPm9ayybNRWnbDrEkiRnwGWszFS28Zvvi2S
   d852Os0IgHclC/1/x9u2mYmBI8WB92hAej0z9gJd2azhT925TV/0sQdOC
   g==;
X-CSE-ConnectionGUID: Zlthcb62RESjszx8CxI9aQ==
X-CSE-MsgGUID: Akv/idyVQ5WF08kyDBlNJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61340355"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="61340355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 22:23:27 -0800
X-CSE-ConnectionGUID: s4LAcrseSB+3PGfGtaOLMg==
X-CSE-MsgGUID: z1xYEFkLS6GxGWneqRF2rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146731783"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2025 22:23:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdkR0-000m5n-2F;
	Fri, 31 Jan 2025 06:23:22 +0000
Date: Fri, 31 Jan 2025 14:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 6/16] arch/x86/kernel/tsc.c:1525:3:
 error: call to undeclared function 'tdx_tsc_init'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202501311459.U2DirNC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   39ec46a246988da8e58ee3caccb2b5ff6d07666a
commit: e02c3f9b45df22178674c33ee15e37bfa9bf3e3c [6/16] x86/tdx: Override PV calibration routines with CPUID-based calibration
config: x86_64-buildonly-randconfig-005-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311459.U2DirNC3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311459.U2DirNC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311459.U2DirNC3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:1525:3: error: call to undeclared function 'tdx_tsc_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1525 |                 tdx_tsc_init();
         |                 ^
   arch/x86/kernel/tsc.c:1525:3: note: did you mean 'tsc_init'?
   arch/x86/include/asm/tsc.h:89:13: note: 'tsc_init' declared here
      89 | extern void tsc_init(void);
         |             ^
   1 error generated.


vim +/tdx_tsc_init +1525 arch/x86/kernel/tsc.c

  1508	
  1509	void __init tsc_early_init(void)
  1510	{
  1511		if (!boot_cpu_has(X86_FEATURE_TSC))
  1512			return;
  1513		/* Don't change UV TSC multi-chassis synchronization */
  1514		if (is_early_uv_system())
  1515			return;
  1516	
  1517		/*
  1518		 * Do CoCo specific "secure" TSC initialization *after* hypervisor
  1519		 * platform initialization so that the secure variant can override the
  1520		 * hypervisor's PV calibration routine with a more trusted method.
  1521		 */
  1522		if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
  1523			snp_secure_tsc_init();
  1524		else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
> 1525			tdx_tsc_init();
  1526	
  1527		if (!determine_cpu_tsc_frequencies(true))
  1528			return;
  1529		tsc_enable_sched_clock();
  1530	}
  1531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
