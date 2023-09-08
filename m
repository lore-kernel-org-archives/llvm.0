Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC96136F;
	Fri,  8 Sep 2023 05:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694151960; x=1725687960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EjYJNeAKDmW+2aEg/LNL8yM8z1Tj84dZgmUT11vBR4A=;
  b=SdKi8YCClrw2790hfgA4olmdhaN0PKw/Ruq6TVTg+L2bBkiy9d03AONQ
   PQc2o1yNAJlagnarYdMsv7fu+PM9uBK51gD4flV3aW3qcUBzPGZGiiUl6
   RwePmkYB95Ym5NlhYV0eEZF3REp0p0TRiXjnwV4PFsvRZEh49IuvJzldg
   27SfJqnvaa91FYoINcKRSRjoL1GZHF6SPp1oY2kTEoxd+gqFqTbnGhH5Y
   JzNuSui6MjSVQzpgWjhHB+RDSyAIblH6BItZj40ZUckrNBussTQH+NOfY
   iZn8aV3AmaN8qHMGC/rhZhvx4QjGd72Z7ayzxOAV0it39hV2nGUiKRCxE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357027570"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="357027570"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 22:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="832525904"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="832525904"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2023 22:45:51 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeUJQ-0001xj-37;
	Fri, 08 Sep 2023 05:45:48 +0000
Date: Fri, 8 Sep 2023 13:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 19/20]
 arch/powerpc/sysdev/xics/icp-native.c:194:6: warning: no previous prototype
 for function 'xics_wake_cpu'
Message-ID: <202309081330.Z2IcjeuA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   bac0634d402f98992a041354ea641c03d00ee498
commit: dde80ac552f52f097170476fe37cb0e78e34af0f [19/20] KVM: Hide KVM internal data structures and values from kernel at-large
config: powerpc64-randconfig-r013-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081330.Z2IcjeuA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081330.Z2IcjeuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081330.Z2IcjeuA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/sysdev/xics/icp-native.c:194:6: warning: no previous prototype for function 'xics_wake_cpu' [-Wmissing-prototypes]
     194 | void xics_wake_cpu(int cpu)
         |      ^
   arch/powerpc/sysdev/xics/icp-native.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     194 | void xics_wake_cpu(int cpu)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV7670
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_MMP_CAMERA [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=m] && (ARCH_MMP || COMPILE_TEST [=y]) && COMMON_CLK [=y]
   - VIDEO_VIA_CAMERA [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && FB_VIA [=m] && VIDEO_DEV [=m]


vim +/xics_wake_cpu +194 arch/powerpc/sysdev/xics/icp-native.c

d6a4f70909d279 Paul Mackerras 2014-09-02  193  
371fefd6f2dc46 Paul Mackerras 2011-06-29 @194  void xics_wake_cpu(int cpu)
371fefd6f2dc46 Paul Mackerras 2011-06-29  195  {
371fefd6f2dc46 Paul Mackerras 2011-06-29  196  	icp_native_set_qirr(cpu, IPI_PRIORITY);
371fefd6f2dc46 Paul Mackerras 2011-06-29  197  }
371fefd6f2dc46 Paul Mackerras 2011-06-29  198  EXPORT_SYMBOL_GPL(xics_wake_cpu);
371fefd6f2dc46 Paul Mackerras 2011-06-29  199  

:::::: The code at line 194 was first introduced by commit
:::::: 371fefd6f2dc46668e00871930dde613b88d4bde KVM: PPC: Allow book3s_hv guests to use SMT processor modes

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
