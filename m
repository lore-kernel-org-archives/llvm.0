Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD27E;
	Thu, 24 Aug 2023 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692916527; x=1724452527;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ya7i1i8o+cqGYiGD2X0u9DR8sUjb0zhnopv2OISh1RE=;
  b=X+WMlmlYzEm2U7pBRQugDnjGj4BbZ1q5Zgrlz1wOu8AFfU38xkSkRWTb
   sesmAyhipoESmMKdBFp8/ukHU/sqbTRDg0fOn/Bp6uLpHMwkr4WhWnJD9
   FjFTu/K3nc06ZC+PmNIRgMgd0k1fCABYfhCIyLi5hZx/UKNtmCwC20UXb
   HYUUwXWpY7fR4UknlEi85vyzrrLaMEPjakOcWuzXizL60GGsVeMcrzbLl
   OjAo45bJ0cVz2rFIEJdplxjQzgzPDzqj6prRrv0JIO8j5hEHoVgFlPdUi
   OP1cwHhFFCYSpTbAtCf+kvl2caDEgq4KutkrrFy/i5rW1DigNVM2rYRMn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373449106"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373449106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="772265129"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="772265129"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Aug 2023 15:35:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIvD-00031C-22;
	Thu, 24 Aug 2023 22:35:23 +0000
Date: Fri, 25 Aug 2023 06:34:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 9813/9999] test_set_error_stamp: rm
 /kbuild/obj/consumer/x86_64-buildonly-randconfig-004-20230825/.reduce_errors/arch-x86-kvm-kvm-amd.lto.o:warning:objtool:.altinstr_replacement:call-without-frame-pointer-save-setup
Message-ID: <202308250617.WruC8KJn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 0071b17eb66b12151f83cdbfc9824743004f87eb [9813/9999] x86/srso: Add IBPB on VMEXIT
config: x86_64-buildonly-randconfig-004-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250617.WruC8KJn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250617.WruC8KJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250617.WruC8KJn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm-amd.lto.o: warning: objtool: .altinstr_replacement+0x0: call without frame pointer save/setup
   arch/x86/kvm/kvm-amd.lto.o: warning: objtool: __svm_sev_es_vcpu_run()+0x1c: BP used as a scratch register

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
