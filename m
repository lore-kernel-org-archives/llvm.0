Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADC235291;
	Sat, 16 Dec 2023 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9yuSE+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702761420; x=1734297420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxdl+GnoaeeU6ElbMeJtuMecQ1u6HrtAyY0wzX4Q33s=;
  b=c9yuSE+JWPKMDBut5J16l4G8iYuXwD2T0yRPNsSinKkvuf8fj3paj1S1
   JxDQOgkWvXUTzfShjPIvldzieN/shKCsj7Xc1lP4DvxwUJdAXVAz6PszL
   CE6pTzERndNmjDCQ0UmevoJcWf9FYYKcrkP9WWtCljb+4rVVeie0n/4j0
   UwDbk1bl9/trhmxQH4hAJttvTYy2MxFq46PnG2G22MeaZiAdXIIdwj3eq
   R3nxjBSHW6W/te7eYOAcnVov97lwgL7jowYlXkTYEfW+Vb8Xc3Lmrqe7Z
   5t7hFVONYRjnMNz+TRsDqHhrz+AlN85ROKUqRJNeSe/3OgR9JQQ+EiT8S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14073856"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="14073856"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 13:16:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768384077"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768384077"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 13:16:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEc1l-0002Da-2V;
	Sat, 16 Dec 2023 21:16:54 +0000
Date: Sun, 17 Dec 2023 05:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 98/136] arch/x86/kernel/tdx.c:489:14: warning: no
 previous prototype for function 'tdx_write_msr'
Message-ID: <202312170538.kmTS0vGH-lkp@intel.com>
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
commit: 0b2ba653fca5799158883bdaefabe6176aea7db9 [98/136] x86/tdx: Use direct paravirt call for wrmsrl
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170538.kmTS0vGH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170538.kmTS0vGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170538.kmTS0vGH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/tdx.c:266:5: warning: no previous prototype for function 'tdx_hcall_set_notify_intr' [-Wmissing-prototypes]
   int tdx_hcall_set_notify_intr(u8 vector)
       ^
   arch/x86/kernel/tdx.c:266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_hcall_set_notify_intr(u8 vector)
   ^
   static 
>> arch/x86/kernel/tdx.c:489:14: warning: no previous prototype for function 'tdx_write_msr' [-Wmissing-prototypes]
   void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
                ^
   arch/x86/kernel/tdx.c:489:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
   ^
   static 
   2 warnings generated.


vim +/tdx_write_msr +489 arch/x86/kernel/tdx.c

   488	
 > 489	void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
   490	{
   491		if (tdx_fast_tdcall_path_msr(msr))
   492			tdx_write_msr_safe(msr, low, high);
   493		else
   494			native_write_msr(msr, low, high);
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
