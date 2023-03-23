Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB9D2E2;
	Thu, 23 Mar 2023 21:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679606926; x=1711142926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enyq76n/qUnJm8HY0aP4eDlAZ/2oi/DbawgktbItx4U=;
  b=CcHu1T0E6NGlubu92wJ8rsi4s/8mywmSIWTfYQugbmAA3X3lkL9BHUkT
   KUHooRixKvWSepNDLkcXtZH/6s3kEJVS1KQnoShlTr1crFVWZ8z1M/OuJ
   B8XU6kXLOYL1xXOoNYTu6Biu2XuoyVnVYHr3LOoHdy3a0SUBgvayjBbf1
   zcN8HqSZCJ2qDEDFNDeOVgeKMQ3sgn3CawgyQ+h5k5zB/KiELm8z7BBWN
   L+TDg1533OM1nBRBm5xUlHEuR9tvEdybyeS+tyEvk5VtMJlKWBttNwE+j
   hgUt5c5dKiyVFmoi+9u5L1apg0QuxDAHVuAoSuVXtD1A7+r2E0Fb9XsOE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328032670"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="328032670"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 14:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="771615781"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="771615781"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2023 14:28:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfSUG-000EiW-0t;
	Thu, 23 Mar 2023 21:28:44 +0000
Date: Fri, 24 Mar 2023 05:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:smp/core 12/13] ERROR: modpost:
 "__tracepoint_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202303240543.IYJKCZog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   5c6509a4c573ae4521032e646ee52d163c862aa2
commit: 00cefad5164e17300fcbde1f5bf214508643e1cc [12/13] trace: Add trace_ipi_send_cpu()
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230324/202303240543.IYJKCZog-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=00cefad5164e17300fcbde1f5bf214508643e1cc
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout 00cefad5164e17300fcbde1f5bf214508643e1cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240543.IYJKCZog-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__tracepoint_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__SCT__tp_func_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
