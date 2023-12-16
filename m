Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809613066C;
	Sat, 16 Dec 2023 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnQQOI8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702750603; x=1734286603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFU4IWelI910/BhThAkNF3VjB10ss8qH0dOaxo7jE08=;
  b=DnQQOI8D0/WH/LK18HEXJkELde4S9Hn+pWzXdelJV+aLdfG6XUhOk7/N
   zZDjd59amVlJIarcpSr170+IjpJ5hnRHOCQCXop/dS1CaiOSmwyTTAFjM
   O366Iso018mG7B7Z9We+WVeicJUApLjJf5pAhmzDerQKzRLFHJrqKfTcM
   y+AroYVmaGz2L6Tq1RbWgJD3pwaDWm7melRD4qKMVEerI0GrO/p014WWq
   vPY4KHAxP56t2+jNdk2JykrqVbTkSxZ0kvYHYgrzZTJvTJle5PRs42zaa
   /dfZNxOHlV6mHkmkSmdQPJKDyGOv642KzFchRbt0a3Pd8XGfPEATi8hbH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8809633"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="8809633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 10:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751298413"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="751298413"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2023 10:16:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEZDK-00020W-1c;
	Sat, 16 Dec 2023 18:16:38 +0000
Date: Sun, 17 Dec 2023 02:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>, Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest 62/136] arch/x86/kernel/tdx.c:225:5: warning: no
 previous prototype for function 'tdx_hcall_set_notify_intr'
Message-ID: <202312170253.LKpNFmoD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: 2c0498d3a27b537d428cc081fe9578605111569e [62/136] x86/tdx: Add SetupEventNotifyInterrupt TDX hypercall support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170253.LKpNFmoD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170253.LKpNFmoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170253.LKpNFmoD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tdx.c:225:5: warning: no previous prototype for function 'tdx_hcall_set_notify_intr' [-Wmissing-prototypes]
   int tdx_hcall_set_notify_intr(u8 vector)
       ^
   arch/x86/kernel/tdx.c:225:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_hcall_set_notify_intr(u8 vector)
   ^
   static 
   1 warning generated.


vim +/tdx_hcall_set_notify_intr +225 arch/x86/kernel/tdx.c

   217	
   218	/*
   219	 * tdx_hcall_set_notify_intr() - Setup Event Notify Interrupt Vector.
   220	 *
   221	 * @vector        : Vector address to be used for notification.
   222	 *
   223	 * return 0 on success or failure error number.
   224	 */
 > 225	int tdx_hcall_set_notify_intr(u8 vector)
   226	{
   227		u64 ret;
   228	
   229		/* Minimum vector value allowed is 32 */
   230		if (vector < 32)
   231			return -EINVAL;
   232	
   233		/*
   234		 * Register callback vector address with VMM. More details
   235		 * about the ABI can be found in TDX Guest-Host-Communication
   236		 * Interface (GHCI), sec 3.5.
   237		 */
   238		ret = _trace_tdx_hypercall(TDVMCALL_SETUP_NOTIFY_INTR, vector, 0, 0, 0,
   239					   NULL);
   240	
   241		if (ret == TDVMCALL_SUCCESS)
   242			return 0;
   243		else if (ret == TDCALL_INVALID_OPERAND)
   244			return -EINVAL;
   245	
   246		return -EIO;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
