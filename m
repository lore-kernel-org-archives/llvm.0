Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E617ED;
	Mon, 20 Feb 2023 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676911228; x=1708447228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVpTGQ8FoPyLDs7k37yMqyyrS872DbF1vhla/C+g+MI=;
  b=elWqJr8Oti0WtDIOM2BcY9lrKzws3VfSYRhnuYyFUHZOFO1ZU33BValr
   59AYQMO33grTYV+rYzrUmBXsBnCF/CcTzh1ciLiOx/+X0BCpWq7RLDnCR
   UWl/Dtv8656yA9ldTjg9XCQgTuiCD1e1jbZylNvcYd6HpLlUVmTHI1IAQ
   RHeywpuWRXVtskzWWe/fatYzB2iLT/NgEICsQU3qHNavUzBTKktN8S9T2
   ivVrIbrHtDbGs3CJMKOYZF9EB+ndsuC8T1W8ST5c/I1jUiPI+uL39gGG9
   nhJFWwb7TmCNIpX7R7XSVWryjNVbGXV8Mhrx/pXlKsXaiJwQANQGFh0yX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="359909573"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="359909573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 08:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="703749785"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="703749785"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Feb 2023 08:40:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU9DD-000E3j-1N;
	Mon, 20 Feb 2023 16:40:23 +0000
Date: Tue, 21 Feb 2023 00:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Cross <ccross@android.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthias Kaehlcke <mka@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 6403/9999]
 kernel/watchdog_buddy_cpu.c:89:6: warning: no previous prototype for
 function 'watchdog_check_hardlockup'
Message-ID: <202302210029.ezzrsZnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: c257fa8632bb98df1fbc4e2ac46c91c938428be2 [6403/9999] CHROMIUM: hardlockup: detect hard lockups without NMIs using secondary cpus
config: x86_64-randconfig-a013-20230220 (https://download.01.org/0day-ci/archive/20230221/202302210029.ezzrsZnI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/c257fa8632bb98df1fbc4e2ac46c91c938428be2
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout c257fa8632bb98df1fbc4e2ac46c91c938428be2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210029.ezzrsZnI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog_buddy_cpu.c:89:6: warning: no previous prototype for function 'watchdog_check_hardlockup' [-Wmissing-prototypes]
   void watchdog_check_hardlockup(void)
        ^
   kernel/watchdog_buddy_cpu.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void watchdog_check_hardlockup(void)
   ^
   static 
   1 warning generated.


vim +/watchdog_check_hardlockup +89 kernel/watchdog_buddy_cpu.c

    88	
  > 89	void watchdog_check_hardlockup(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
