Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BCD2F23
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663182628; x=1694718628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Av9Qy1mmdaLVS1Y5UFAEwpgyvHuwEjAoSVdJaW3fMU=;
  b=iYDJh7PUT0Z6Akc7NOMCZNxIdSoWimyjrHo5dce1WsA4nx/5iaXUdhFb
   eWxtwvGawyxZrT64gG1rWnhznzFj4dgH4f70TtXSpg9SlVIWMp0/12pD6
   l5jz63BGpMM+p5aY+raQNeUz8QHyAM70tkNl9fD3D+aEm+vhssXl+Qn8q
   QLZvZvslg6cO+E8KY1UVjCgBwl/bcMnWIgT2cFr9Of96yX5C/ZYr/1Y3Y
   KS7vFocYs9CIc1o9kOHPDft3o3yppx6U7WS46C18yPI14fMV3GaMoHSIl
   HS9kEBjCpSNWBNDIEzet2qg/BGnebRv1/UikN9aUdgTM0fAok/FWqNvoz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278248148"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="278248148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 12:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="568129165"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Sep 2022 12:10:25 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYXmD-0000Ui-0E;
	Wed, 14 Sep 2022 19:10:25 +0000
Date: Thu, 15 Sep 2022 03:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [spandruvada:idle-inject 10/13]
 drivers/thermal/intel/intel_powerclamp.c:449:6: warning: no previous
 prototype for function 'idle_inject_end'
Message-ID: <202209150259.dx4CzR7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/spandruvada/linux-kernel idle-inject
head:   adb26b2a9269625eac48c04d39443e741894a569
commit: 85a53ba91f9b1a7511239c5bb33a44d78fa5e4a5 [10/13] thermal/drivers/intel_powerclamp: Use powercap idle-inject framework
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220915/202209150259.dx4CzR7v-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/spandruvada/linux-kernel/commit/85a53ba91f9b1a7511239c5bb33a44d78fa5e4a5
        git remote add spandruvada https://github.com/spandruvada/linux-kernel
        git fetch --no-tags spandruvada idle-inject
        git checkout 85a53ba91f9b1a7511239c5bb33a44d78fa5e4a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thermal/intel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/thermal/intel/intel_powerclamp.c:449:6: warning: no previous prototype for function 'idle_inject_end' [-Wmissing-prototypes]
   void idle_inject_end(unsigned int cpu, unsigned int idle_duration, unsigned int run_duration)
        ^
   drivers/thermal/intel/intel_powerclamp.c:449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_inject_end(unsigned int cpu, unsigned int idle_duration, unsigned int run_duration)
   ^
   static 
   1 warning generated.


vim +/idle_inject_end +449 drivers/thermal/intel/intel_powerclamp.c

   448	
 > 449	void idle_inject_end(unsigned int cpu, unsigned int idle_duration, unsigned int run_duration)
   450	{
   451		unsigned int runtime;
   452	
   453		runtime = get_run_time(&powerclamp_data);
   454		idle_inject_set_duration(ii_dev, runtime, idle_duration);
   455	}
   456	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
