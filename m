Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394063C00
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658299576; x=1689835576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eVrm6H+aOOB40iO3p23GmHegIyeHrd4VfgRNMDktSqM=;
  b=LWaMmzoXgxNQlGJo7U2MDorA70ydXw1pbEyzsAFAhO0D9oURlsaNO2Jf
   +bHe2ubxlRaSg39BC4Mj1oxQiCRTHjVfRwdatrfWVFrWBFDyMoxPhoPq3
   YibZjiEHxDHDAoDP/378PpWp0oWNt0otcb0pA0Y4fTuRWhLETwdyGP5uA
   zSM0h4sfvlbWLqmKikEiNYd7ryeXEfmHwFBf4dQmq6Y+3rNhQOo50ScnN
   UzduqXxP3Xn9GqjVUSnkMJ8rB/eYQlBqjstsaBtZ9OyFJoARMQBFwsRrj
   PU2BUG8J5SuiPA44ogoHgmMndH/untDysqRP8vCciPxQomGVZ9w8cCJ3U
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="312386494"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="312386494"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 23:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="925106437"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2022 23:46:14 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oE3TJ-000091-Dr;
	Wed, 20 Jul 2022 06:46:13 +0000
Date: Wed, 20 Jul 2022 14:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [intel-tdx:guest-hardening-rebased 19/23]
 arch/x86/coco/tdx/tdx-tests.c:66:12: warning: no previous prototype for
 function 'kvm_unit_test_debug_init'
Message-ID: <202207201438.I3jn9Bvh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   c170462888e1dab8e3e80c1c6e3708dd473ad1ed
commit: bb5af2b7a84ef8343b56bd2c1c90461635b32bd2 [19/23] x86/tdx-tests: Add a port of a kvm unit test
config: x86_64-buildonly-randconfig-r002-20220718 (https://download.01.org/0day-ci/archive/20220720/202207201438.I3jn9Bvh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/bb5af2b7a84ef8343b56bd2c1c90461635b32bd2
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-hardening-rebased
        git checkout bb5af2b7a84ef8343b56bd2c1c90461635b32bd2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx-tests.c:66:12: warning: no previous prototype for function 'kvm_unit_test_debug_init' [-Wmissing-prototypes]
   int __init kvm_unit_test_debug_init(void)
              ^
   arch/x86/coco/tdx/tdx-tests.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init kvm_unit_test_debug_init(void)
   ^
   static 
   1 warning generated.


vim +/kvm_unit_test_debug_init +66 arch/x86/coco/tdx/tdx-tests.c

    65	
  > 66	int __init kvm_unit_test_debug_init(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
