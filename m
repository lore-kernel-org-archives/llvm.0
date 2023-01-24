Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7A322A;
	Tue, 24 Jan 2023 22:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674600147; x=1706136147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iMqGUpaat2M/41NFExMis4vWSlWmm+dwBlVykhSgI9E=;
  b=AJRg9HQ6VHUiBXDh6wo6THfYvgK7VL2OQvy4IZMSmCPlwGkn61LE8k40
   j/GXoj6Hdgj9r/QdZMEaxi9Bky+KhDYekTn00Jp+HFdUNzAplZYdtEvoN
   ZKTTNKrM0O11Tbr1IpqvaQLT/17LfjKuJWQMaw/CfHWJn72OlPJ46zUEH
   CREviIXHX+sCNugP+KjOLRYMNpStCWNCyHbFIQALWat++cYYKnTP0Aasg
   sMOhMuG/7H19yq3653E7TPRMmqQPWmtjCUjnM2wVtXqqVsn5k8F6rr6Vk
   xdzTPsX0gSpxo/HxqwlYuGHLdhXYK+PzBbul6/wPHd/WQ0bPrV35D1KMb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328514505"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="328514505"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664264332"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="664264332"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 14:42:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKRzk-0006qm-0n;
	Tue, 24 Jan 2023 22:42:24 +0000
Date: Wed, 25 Jan 2023 06:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] soc: apple: rtkit: Add register dump decoding to
 crashlog
Message-ID: <202301250612.UZ8rgt6i-lkp@intel.com>
References: <20230123031728.22515-1-lina@asahilina.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123031728.22515-1-lina@asahilina.net>

Hi Asahi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.2-rc5 next-20230124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Asahi-Lina/soc-apple-rtkit-Add-register-dump-decoding-to-crashlog/20230123-112025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230123031728.22515-1-lina%40asahilina.net
patch subject: [PATCH v2] soc: apple: rtkit: Add register dump decoding to crashlog
config: powerpc-buildonly-randconfig-r006-20230123 (https://download.01.org/0day-ci/archive/20230125/202301250612.UZ8rgt6i-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e505dcb428ededed4847191eaa3504d3dae39bea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Asahi-Lina/soc-apple-rtkit-Add-register-dump-decoding-to-crashlog/20230123-112025
        git checkout e505dcb428ededed4847191eaa3504d3dae39bea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soc/apple/rtkit-crashlog.c:186:6: warning: stack frame size (1040) exceeds limit (1024) in 'apple_rtkit_crashlog_dump' [-Wframe-larger-than]
   void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
        ^
   164/1040 (15.77%) spills, 876/1040 (84.23%) variables
   1 warning generated.


vim +/apple_rtkit_crashlog_dump +186 drivers/soc/apple/rtkit-crashlog.c

e505dcb428eded Asahi Lina 2023-01-23  185  
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @186  void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
