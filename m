Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F44C60;
	Fri,  3 Feb 2023 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675428663; x=1706964663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlccfO8aU3nKKqyOaEtsrBm5JQO2RpbyK4ma3DnSP5w=;
  b=X/hFqy9OxIiaBsb7EwFm7uPmPHs0+z2tHhDbBmLXhO0qY1ZDTNPpQx4U
   g/12Gkb8rzcETx/8IJku4zzWsv4aYj963EVln1LLLQ+vp2+IMCmjM00VX
   vkfqh8W6GCPNbDeeKQPhTOGfwt+I1rOSuNfyTUBwjhHy/OmklKUwDtNIq
   y1Y75R7PAg0bdzcamcWEK3KHS1GXbc9F2SvMIeeUNbrfiMUGHScXvVQlM
   +yr48I5Sw55NbM+O2+H3al9aHPXVcw05dvcKz2RLgCd+kONQyxLuhbTjr
   2w+WxHY9UgvzHkFSLk7ibg5Ob4lgIyPE1VIzdRdgXPSUzlUblTYqvntOz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="414951196"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="414951196"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 04:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="734339791"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="734339791"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2023 04:51:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNvWt-0000UT-0u;
	Fri, 03 Feb 2023 12:50:59 +0000
Date: Fri, 3 Feb 2023 20:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/paronl.2023.02.01a 6/9] ld.lld:
 error: undefined symbol: __per_cpu_offset
Message-ID: <202302032015.LdoA9Pkn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/paronl.2023.02.01a
head:   05792727280c094a8dcd1aa4950a61a2d214ddb8
commit: 42e667c0dd66241675acf0e7bda8368b5bc8e384 [6/9] x86/smpboot: Support parallel startup of secondary CPUs
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230203/202302032015.LdoA9Pkn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/42e667c0dd66241675acf0e7bda8368b5bc8e384
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/paronl.2023.02.01a
        git checkout 42e667c0dd66241675acf0e7bda8368b5bc8e384
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __per_cpu_offset
   >>> referenced by head_64.S:286 (arch/x86/kernel/head_64.S:286)
   >>>               arch/x86/kernel/head_64.o:(secondary_startup_64) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: idle_threads
   >>> referenced by head_64.S:298 (arch/x86/kernel/head_64.S:298)
   >>>               arch/x86/kernel/head_64.o:(secondary_startup_64) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
