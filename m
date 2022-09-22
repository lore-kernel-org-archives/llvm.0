Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E82523A0
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663824905; x=1695360905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BvrxDfYRvUIToUMMdHXnInRWosnpIic7xYP73pfU5g=;
  b=i4wjJlWqRN19zqXoJwefSZCc3gyk2M6dvrph5otpmJt0lLXpU8mgBfj/
   m31eik/60U62EUyoHcu+r7K13tSxrkRDIYZMWukVF2huxdAkaMxE2KzkN
   0lNj9FUwa76DUHEDAZoS2NmtaXQNxknckTLUNvcaTC42kCmu96XE7Yj6X
   sowVHvNBSWWIzoJw61DEanjvA7FRAdJD9yFijjkY+np/kFAnimmRtJHJG
   +toizKa3kcHXImGj2KYoUh72P8D36uhM6tO2eiJmrm9Y+lw68X93PAvgB
   WQP+vjcPq1YfOgQswaraPk9RTnChjUP4257owTPsPVvkoQHJOyHABlN1V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="279924379"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="279924379"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 22:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="570828745"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2022 22:35:02 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obErW-0004Lw-0z;
	Thu, 22 Sep 2022 05:35:02 +0000
Date: Thu, 22 Sep 2022 13:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [intel-tdx:guest 2/4] arch/x86/kernel/tdx-tests.c:66:12: warning: no
 previous prototype for function 'kvm_unit_test_debug_init'
Message-ID: <202209221348.2nPiKzy0-lkp@intel.com>
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
commit: 4cd6be90a565d847e1d7ccfe28264a1610a02a34 [2/4] x86/tdx-tests: Add a port of a kvm unit test
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220922/202209221348.2nPiKzy0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/4cd6be90a565d847e1d7ccfe28264a1610a02a34
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 4cd6be90a565d847e1d7ccfe28264a1610a02a34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/ arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tdx-tests.c:66:12: warning: no previous prototype for function 'kvm_unit_test_debug_init' [-Wmissing-prototypes]
   int __init kvm_unit_test_debug_init(void)
              ^
   arch/x86/kernel/tdx-tests.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init kvm_unit_test_debug_init(void)
   ^
   static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for UNACCEPTED_MEMORY
   Depends on [n]: EFI [=n] && EFI_STUB [=n]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && PARAVIRT [=y] && SECURITY [=y] && X86_X2APIC [=y]


vim +/kvm_unit_test_debug_init +66 arch/x86/kernel/tdx-tests.c

    65	
  > 66	int __init kvm_unit_test_debug_init(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
