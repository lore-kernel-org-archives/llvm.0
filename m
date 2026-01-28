Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4018265CC2;
	Wed, 28 Jan 2026 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600197; cv=none; b=cCR3guxqxkGVmCcefkNim4+V7JJhT+6GrXaScbrGhLBwCpeRgZ408i1FRvF3r+vV4KpXxqltGID+V+RAI1x2344TB+fiojHYGUEZ9EtZe+vYNKuEWZKfMxiWJLz6trKIIowzMnWMH2DJFSXxvZ9SFoMHwYfZnanAOM/ZEYnPURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600197; c=relaxed/simple;
	bh=39+VcHxZp2L05wgjblLxIZQtRSLWjLNhV3d6CWPNefs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O5O6N8q34y05/dyMAVhJrsT/CjkHsgTPmHQYHPWtuiYga8dSdg6cTw16Rhvztj5xAdkPZe/FB9P9d8xWbHUQp7BKllTl8mWNbRvBYv9XgMFzc1hHkHTXDKKDpN4VoCQpj0R4r+bi4gv9YGylgbOZ60alkvA+f10DAO1EeOzpHww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbd5cKYs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbd5cKYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769600196; x=1801136196;
  h=date:from:to:cc:subject:message-id;
  bh=39+VcHxZp2L05wgjblLxIZQtRSLWjLNhV3d6CWPNefs=;
  b=mbd5cKYsP+WiH8BIM3vykxSf9+D8e07C/Tu0T+xP/96vsCigDVRPSFVh
   4Fp08c2ELjYzxW23VYpCE49aVsDxMNPYJA9D50HAyJ0LdEXRCBhIg7vx2
   VlkkyPN4KGRhSM8fEINPU6ujek+g8wkl4GIzzsLxvEF+W25y5OfOTXD4l
   RM41j3DUWPLKQQylIRUqyS2VH/luaiVXRWBXtjlOAiqwfuDNGDXsFDFpU
   0BZY9LM4bNfvfqN/n4DLX/S5r4nXiq1nSpZwAaOELYtlEzQSgAXy6oEMy
   pcqT/VvoGLmgDM/ovTfHjaJ3YFc9O0rw4je99gA2rl1msxW5jQ8stgXuG
   Q==;
X-CSE-ConnectionGUID: +R52KXN1QH6Tm/VRifF4jg==
X-CSE-MsgGUID: Og7Z8Zh+QC2dE6MW88gPCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70851452"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70851452"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 03:36:34 -0800
X-CSE-ConnectionGUID: MAGxF+f+TWq1nrsWaCWvXw==
X-CSE-MsgGUID: jRJfIwCwQ72hyD09t5kOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208481814"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jan 2026 03:36:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl3qY-00000000ZcQ-1y78;
	Wed, 28 Jan 2026 11:36:30 +0000
Date: Wed, 28 Jan 2026 19:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/38]
 arch/hexagon/kernel/devtree.c:107:16: warning: variable 'dt_root' set but not
 used
Message-ID: <202601281908.ysa4xy7M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: c03d45c08b8a1046b1502fc07d0a7145fc2fb5b8 [26/38] hexagon: add memory management enhancements
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601281908.ysa4xy7M-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281908.ysa4xy7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281908.ysa4xy7M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/hexagon/kernel/devtree.c:50:44: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'int *' [-Werror,-Wincompatible-pointer-types]
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

1732d55bf9016e Brian Cain  2026-01-24   89  
57d9a292755c80 Richard Kuo 2025-08-18   90  /*
57d9a292755c80 Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
57d9a292755c80 Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
57d9a292755c80 Richard Kuo 2025-08-18   93   *
57d9a292755c80 Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
57d9a292755c80 Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
57d9a292755c80 Richard Kuo 2025-08-18   96   *
57d9a292755c80 Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
57d9a292755c80 Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
57d9a292755c80 Richard Kuo 2025-08-18   99   * old scheme I think.
57d9a292755c80 Richard Kuo 2025-08-18  100   *
57d9a292755c80 Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
57d9a292755c80 Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
57d9a292755c80 Richard Kuo 2025-08-18  103   */
1732d55bf9016e Brian Cain  2026-01-24  104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
57d9a292755c80 Richard Kuo 2025-08-18  105  {
1732d55bf9016e Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
57d9a292755c80 Richard Kuo 2025-08-18 @107  	unsigned long dt_root;
57d9a292755c80 Richard Kuo 2025-08-18  108  

:::::: The code at line 107 was first introduced by commit
:::::: 57d9a292755c8023e31bdefe25e21f0c9837db51 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
