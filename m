Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2B17C1
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 03:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660103230; x=1691639230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+28lw+7dUUsqcLBAMm2Sh9p8wAh+1ntA70NRC6apqUI=;
  b=GnxlsDXcD+czL1annhe1L17yr4U9nxiDBN34LVOEs6nAEa7GQDqUV8oV
   G/ytaimuh1skSjreQAsg+mXNXCXdT6C8OB9+6a2qMBeIikI/cvf5GdXNQ
   waRfMFW++9rtkr8atiiH/o8aTtEZAUbGZTo1GdiMMjfv1GTB6vgD6rzPw
   5fOoPitBz0vSvXgcg9Fz74moi3/4lFyzrRkoUsjfCOnsSrQ2ROYo16wLs
   coRGLidaLcjdzEgNTSkCNM6SLcqyDwLG+kIl1X+5B3KVRFx/GsPPbJFVD
   sugjz9XZwZFQHvPbvys7NPBA4a6TwO1Qm/cgLHCF40qpK/ZtQdg/d5DgU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="290989964"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="290989964"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 20:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="581066740"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 20:47:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLcgV-000NU5-0O;
	Wed, 10 Aug 2022 03:47:07 +0000
Date: Wed, 10 Aug 2022 11:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:ktext 13/19] arch/arm64/mm/mmu.c:737:13: warning: no
 previous prototype for function 'create_kernel_nid_map'
Message-ID: <202208101140.WHKcrIlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext
head:   9065be4a87799659473e7d135f6db3f7419a7553
commit: 2154e376802fd896345339e0940fca399b893515 [13/19] arm64: text replication: setup page tables for copied kernel
config: arm64-randconfig-r004-20220810 (https://download.01.org/0day-ci/archive/20220810/202208101140.WHKcrIlq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm ktext
        git checkout 2154e376802fd896345339e0940fca399b893515
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:737:13: warning: no previous prototype for function 'create_kernel_nid_map' [-Wmissing-prototypes]
   void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
               ^
   arch/arm64/mm/mmu.c:737:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
   ^
   static 
   1 warning generated.


vim +/create_kernel_nid_map +737 arch/arm64/mm/mmu.c

   736	
 > 737	void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
   738	{
   739		pgprot_t text_prot = kernel_text_pgprot();
   740	
   741		create_kernel_mapping(pgdp, __pa(ktext), _stext, _etext, text_prot, 0);
   742		create_kernel_mapping(pgdp, __pa_symbol(__start_rodata),
   743				      __start_rodata, __inittext_begin,
   744				      PAGE_KERNEL, NO_CONT_MAPPINGS);
   745		create_kernel_mapping(pgdp, __pa_symbol(__inittext_begin),
   746				      __inittext_begin, __inittext_end,
   747				      text_prot, 0);
   748		create_kernel_mapping(pgdp, __pa_symbol(__initdata_begin),
   749				      __initdata_begin, __initdata_end,
   750				      PAGE_KERNEL, 0);
   751		create_kernel_mapping(pgdp, __pa_symbol(_data), _data, _end,
   752				      PAGE_KERNEL, 0);
   753	}
   754	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
