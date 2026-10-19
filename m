Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1619F40B;
	Mon, 19 Oct 2026 01:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792371857; cv=none; b=Mp0C4Vm+0troMPe3W1w+/Zux4AQ92hNxe8PWh7DxGkZ/G6LNhtNhfKhuL8IxiPSh6mPl7XullT7ZPVXqDshSfkUyDFzUbiaRfxomDiPAGFSDzqHlQy+tx65IgeqdPigqtFaoCY5ClIRxrmBzHgdNYxoDVDWukrPAhRlgUAbtjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792371857; c=relaxed/simple;
	bh=24DCowcPYaY/u6pgXRmWH2F+U/EfMM35gWW5Hq3I5oQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=smEdpOZjI+qFQFUaspSd1OEjkyO+/w5lP7UvALPwyiwfh4zI8CLUMdBu190jZCFD81ENNu8/O/8TUYe0zH5mcYxMQl9PMHg2ffSDV86BNYrEL3FGCxcryYqzfZ9XBOPjYh7lbhcIJVBiyb+haZdeVl4jUidXZt4bKOBDUiUK0KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddjGEViC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddjGEViC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792371856; x=1823907856;
  h=date:from:to:cc:subject:message-id;
  bh=24DCowcPYaY/u6pgXRmWH2F+U/EfMM35gWW5Hq3I5oQ=;
  b=ddjGEViCBcrn0cRXB6b+8NTOu7eHJAJa81IZgW+NvBrEGSUk2sS+SQua
   dpu6a9zFZi/hGzmWC54FSAPDiknzgLqPHQciF3U77KDZG6ObUrljLUvsq
   i9+ovYjLac/awA256SfEC1ftOS1NWt9Wk7eME9Bi0GY7aa8A6f692FVfw
   3zPZUUZ9zcgzHEhIltXxBww8RsxmIpKDlX/dfjXD1XUKRWttMGZFhpAc4
   ufJjVcDbfDShogd32JNx00WWPkgTCoKbs56YqBJe6lXvSSFR0vw9II/ev
   LN71tqFOHd5Y8leRRWiQIa64iLGgH4CdwYh+hKQ/DEV2Rs9FBHZsGoiyA
   A==;
X-CSE-ConnectionGUID: xffi/FenR5evOPcd3a3eRQ==
X-CSE-MsgGUID: xmfUxmY+SHmlB2WjBTiQ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="935564"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="935564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:04:15 -0700
X-CSE-ConnectionGUID: 21zga5fsSFmip4+tKBXiqQ==
X-CSE-MsgGUID: t7EEH9/WRcq2zyg7fLRMRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2400452"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2026 18:04:15 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIbnQ-000000005Pb-071n;
	Mon, 19 Oct 2026 01:04:12 +0000
Date: Mon, 19 Oct 2026 03:03:28 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 31/32] arch/x86/kernel/cet.c:204:6:
 warning: no previous prototype for function 'regs_set_return_ip'
Message-ID: <202610190320.LiuXeUz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: ca107dce40b82cc491ac08e03e01626956ca5eb4 [31/32] fred-entry-ssp-muck
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261019/202610190320.LiuXeUz8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190320.LiuXeUz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190320.LiuXeUz8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cet.c:204:6: warning: no previous prototype for function 'regs_set_return_ip' [-Wmissing-prototypes]
     204 | void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
         |      ^
   arch/x86/kernel/cet.c:204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     204 | void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
         | ^
         | static 
   1 warning generated.


vim +/regs_set_return_ip +204 arch/x86/kernel/cet.c

   193	
   194	/*
   195	 * Change the return IP of an event. Use this instead of directly
   196	 * manipulating regs->ip.
   197	 *
   198	 * The hardware saves a special FRED entry frame on to the shadow
   199	 * stack. It contains the RIP of the interrupted context. ERETS
   200	 * ensures that this matches regs->ip.
   201	 *
   202	 * Update the FRED entry frame in addition to regs->ip.
   203	 */
 > 204	void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
   205	{
   206		struct fred_shstk_entry_frame *ssef;
   207	
   208		regs->ip = ip;
   209	
   210		/* Only kernel-mode events save the 'ssef' pointer. */
   211		WARN_ON_ONCE(user_mode(regs));
   212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
