Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC74A28;
	Sun, 17 Dec 2023 00:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUuPqzf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702771387; x=1734307387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=utJ4D/HZJB6QEfNsOsX0UXAsOKPKlUbtSJcQFnt6o6U=;
  b=CUuPqzf1Nm+OdsW55q7IK1cQOUyVq7MpONFQMBas7yns7kq4hSAGunqI
   85TY3GAiEql17tNAM0jJriJ+Ji2mX4cUflLjD9X4tBQMVL1YnDKaoeG42
   INw6ELoqybYingsce//+h0jtEzo8QLfv8U7kP/bWe7rS00/9dQSAnDWXB
   wxBfO2u/ZH58IEtf/A9vF9HWi3s907A4pssfUk4Jf/HxF66Hi6DJZXDtp
   3eQFX5ldvKyf/Wcfq0WCkc2c7qMMOHp7vLzE1Coz/v+qkeXq8ddgtfdQ9
   sUwDAKtKgvfA0MgsoHKccXAydcZBah9+oc6x+qj7MQma4C/L5fUJRmLAK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="394267720"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="394267720"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 16:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845521513"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845521513"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 16:03:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEecZ-0002N4-0W;
	Sun, 17 Dec 2023 00:03:03 +0000
Date: Sun, 17 Dec 2023 08:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 102/136] arch/x86/kernel/tdx.c:712:15: warning: no
 previous prototype for function 'tdx_mmio_readq'
Message-ID: <202312170729.Pla2YVag-lkp@intel.com>
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
commit: c2b75088b70d45a8b98121cd1c4a4fa1380d4cf7 [102/136] x86/tdx: Enable direct iomap MMIO optimizations
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170729.Pla2YVag-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170729.Pla2YVag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170729.Pla2YVag-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/tdx.c:267:5: warning: no previous prototype for function 'tdx_hcall_set_notify_intr' [-Wmissing-prototypes]
   int tdx_hcall_set_notify_intr(u8 vector)
       ^
   arch/x86/kernel/tdx.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_hcall_set_notify_intr(u8 vector)
   ^
   static 
   arch/x86/kernel/tdx.c:490:14: warning: no previous prototype for function 'tdx_write_msr' [-Wmissing-prototypes]
   void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
                ^
   arch/x86/kernel/tdx.c:490:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
   ^
   static 
>> arch/x86/kernel/tdx.c:712:15: warning: no previous prototype for function 'tdx_mmio_readq' [-Wmissing-prototypes]
   unsigned long tdx_mmio_readq(void __iomem *addr)
                 ^
   arch/x86/kernel/tdx.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long tdx_mmio_readq(void __iomem *addr)
   ^
   static 
   3 warnings generated.


vim +/tdx_mmio_readq +712 arch/x86/kernel/tdx.c

   711	
 > 712	unsigned long tdx_mmio_readq(void __iomem *addr)
   713	{
   714		unsigned long val;
   715	
   716		if (tdx_virt_mmio(8, false, (unsigned long)addr, &val))
   717			return 0xffffffffffffffff;
   718		return val;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
