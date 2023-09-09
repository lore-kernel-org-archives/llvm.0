Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA796FBD;
	Sat,  9 Sep 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694299977; x=1725835977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XxtyzBLCI9lH5FY9lKGxt1fnPgWSSQ26q0I+Wz80T+g=;
  b=lFWwPunBfcY8zib+qg6NyahTn2IFgVm4QLEdgCh6G/gsKMlCD9hy6yTB
   sMLbX4bbIqfSmkEp2KajB0vjZMrFRKVjKe2PugmD4ISxMoIE7kEmy4qTp
   6QzTQ7rAkP3ONAhcs4RBrWfAAaq+pD7lEhrma/ol+tiyuuMHcqGSUeWn/
   vM5TkIk5O0X0Gd6F8hjc6ExDbqLMWy0WiHnmMtYliuyEwyQjHsEo0nphy
   WKjFXGbXcBjtXpp6UiQ6sF/iALCyTv3Dq9LBWXrrFb1N1VMSVDcNTA5Fz
   wJ06ix5G7tgYWFRfUA4ATFtBSh+5VGT17NOcp0SyLbEi6iNRk7ZlOPh3q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358155627"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="358155627"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 15:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989642598"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="989642598"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2023 15:52:55 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf6ou-00041c-2r;
	Sat, 09 Sep 2023 22:52:52 +0000
Date: Sun, 10 Sep 2023 06:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 18/19]
 arch/powerpc/sysdev/xics/icp-native.c:194:6: error: no previous prototype
 for function 'xics_wake_cpu'
Message-ID: <202309100615.1NysCi2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   a4cf1960322069d95b013d644a0121858e5c996f
commit: 973dc13aa01a2c2f28ac6c5145a411f2135325a4 [18/19] powerpc/xics: Move declaration of xics_wake_cpu() out of kvm_ppc.h
config: powerpc-skiroot_defconfig (https://download.01.org/0day-ci/archive/20230910/202309100615.1NysCi2Y-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100615.1NysCi2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100615.1NysCi2Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/sysdev/xics/icp-native.c:194:6: error: no previous prototype for function 'xics_wake_cpu' [-Werror,-Wmissing-prototypes]
     194 | void xics_wake_cpu(int cpu)
         |      ^
   arch/powerpc/sysdev/xics/icp-native.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     194 | void xics_wake_cpu(int cpu)
         | ^
         | static 
   1 error generated.


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
