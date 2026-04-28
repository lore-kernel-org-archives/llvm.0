Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22271282F27;
	Tue, 28 Apr 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392256; cv=none; b=ejHA7q3SqdocyEw33ZNbv2gTN7+KYia05dmh/rRGjUDCQGGd89MY+A1JPxDwdvyAplz68Nq4zLNyRMH06Bozu1XOdItnalwJAC+PeBSik4RFHPIfq0WF6SPXbv5AfqZBPr63skt4+ZyDDcm22Ym35iJSNpeJtcboL8bwkMn41Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392256; c=relaxed/simple;
	bh=iIw2z8QDpyZXImMtZROYTGdmJ+CwbgFifAyRQdnz+D8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BdBXaTYgav3nh0spxbj+DjCDnBeEnycd/15L3NRCkTMKMfxGhnoZ/Fy+Nl2GHXmgamNxV5In32DOXtelIzQjYNKJSnRip5jmTQ9g1m6nTHbLTbL7N/PqXK0GzPlv8hqjf119MeMBpYY6kr2vF1z84K0lg4AXEG1hNwz2jG95e+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KATViUM4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KATViUM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777392254; x=1808928254;
  h=date:from:to:cc:subject:message-id;
  bh=iIw2z8QDpyZXImMtZROYTGdmJ+CwbgFifAyRQdnz+D8=;
  b=KATViUM4q6UI8YqSg0ulJOFPh8QIlnpL0R8Myu7xtda5TDvlvwDvtEBv
   A03DSp6ieXjC2rHg+uaBP1zhwzRxJYd8022C4mqu6NayxbeVa0BE/zsNi
   Is8hX1DSZCO09Mb1UO2QRe4UD2jMjFuKJs4E9aQyeLCw5VJTmEXIuLCvM
   7795WPYPSS3gS//GWdNVn7uKS5ncm0nEq2wm+1GF9QoVdbFbYHrWq5YJP
   gc7loaqMvU7JsdIGpm2qFWES6e0RD3X3cmtV758hxdgaN/o2+Hw/2DHpl
   yZEJMkKtEnwmIU3f/TDBfza/6XKmAr1lELadC3dyAsorSlgVc/AcFUsLy
   Q==;
X-CSE-ConnectionGUID: o+hTp61+S4qsCAl7RmESPg==
X-CSE-MsgGUID: Kve+n+HlSp2a2RyNKIIWrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="103763594"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="103763594"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:04:13 -0700
X-CSE-ConnectionGUID: JLwf7RYwSeKUo1PhT2oE0g==
X-CSE-MsgGUID: xRVcx+PITcmcwmmlXPE9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="238974753"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Apr 2026 09:04:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHkup-000000009wy-3OwW;
	Tue, 28 Apr 2026 16:04:03 +0000
Date: Wed, 29 Apr 2026 00:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/hmx 26/66]
 arch/hexagon/kernel/devtree.c:107:16: warning: variable 'dt_root' set but not
 used
Message-ID: <202604282333.UkZL41Tj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hmx
head:   1d0fb0b4cf1764f00775cff1c17c2b3494b6b94e
commit: 4f3ac18400ea643ada1af624c617c61f2b32aa5e [26/66] hexagon: add memory management enhancements
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604282333.UkZL41Tj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604282333.UkZL41Tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282333.UkZL41Tj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/hexagon/kernel/devtree.c:50:44: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'int *' [-Wincompatible-pointer-types]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |                                                   ^~
   include/linux/of_fdt.h:57:17: note: passing argument to parameter 'size' here
      57 |                                        int *size);
         |                                             ^
   arch/hexagon/kernel/devtree.c:50:4: error: assigning to 'char *' from 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/hexagon/kernel/devtree.c:107:16: warning: variable 'dt_root' set but not used [-Wunused-but-set-variable]
     107 |         unsigned long dt_root;
         |                       ^
   1 warning and 2 errors generated.


vim +/dt_root +107 arch/hexagon/kernel/devtree.c

51ba881ada7104 Brian Cain  2026-01-24   89  
efcb3f02069d74 Richard Kuo 2025-08-18   90  /*
efcb3f02069d74 Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
efcb3f02069d74 Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
efcb3f02069d74 Richard Kuo 2025-08-18   93   *
efcb3f02069d74 Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
efcb3f02069d74 Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
efcb3f02069d74 Richard Kuo 2025-08-18   96   *
efcb3f02069d74 Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
efcb3f02069d74 Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
efcb3f02069d74 Richard Kuo 2025-08-18   99   * old scheme I think.
efcb3f02069d74 Richard Kuo 2025-08-18  100   *
efcb3f02069d74 Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
efcb3f02069d74 Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
efcb3f02069d74 Richard Kuo 2025-08-18  103   */
51ba881ada7104 Brian Cain  2026-01-24  104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
efcb3f02069d74 Richard Kuo 2025-08-18  105  {
51ba881ada7104 Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
efcb3f02069d74 Richard Kuo 2025-08-18 @107  	unsigned long dt_root;
efcb3f02069d74 Richard Kuo 2025-08-18  108  

:::::: The code at line 107 was first introduced by commit
:::::: efcb3f02069d744d73c43ded9cc7d7b20454e203 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
