Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377EB23A3
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 21:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653688712; x=1685224712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GpBpIclkHkO+HLOIhC+fZ6RlUfaROULvv/SMKg2mBTc=;
  b=EAhmPGnK7apO7GWg0egPCU2eX0R9x7UIEOyC+THoFiwUs0A8V3XChCOs
   ErR/sMq/PLrrOXsma9sqBdNzM0oNPmns005cIEfrhVJziI1+Qsundy4n/
   Q/GMEhTpOfG1BEUe/xU/+uR5yp1Q2taiEdaWGfh7XwgMV3xSLIX5VqPcq
   5+1uSgDqTUANUoTSohd+5U5SwAt5B7CJrqv4Jma7aFvdBmBOP0PbT+YWh
   hJXM1dZqL+i5cUoxXWM1LvJCyQZmUJeUfi51yEqCueGexavFBzNSGGdVh
   5oebWZCuZceD6e3NTB6xEglTndkxsTvTzkFJXcm0ozMaQ1nLJpDY99KSM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="273399299"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="273399299"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 14:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="705323923"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2022 14:58:29 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuhyW-0005AF-U9;
	Fri, 27 May 2022 21:58:28 +0000
Date: Sat, 28 May 2022 05:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: lib/crypto/blake2s-selftest.c:548:13: warning: stack frame size
 (1176) exceeds limit (1024) in 'blake2s_selftest'
Message-ID: <202205280544.UeG75XaY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220527-161529/Jason-A-Donenfeld/crypto-blake2s-remove-shash-module/20220526-172214
head:   3f36e6ac3553b6d6872d5e575f30112d333a1934
commit: 3f36e6ac3553b6d6872d5e575f30112d333a1934 crypto: blake2s - remove shash module
date:   14 hours ago
config: hexagon-randconfig-r041-20220526 (https://download.01.org/0day-ci/archive/20220528/202205280544.UeG75XaY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f36e6ac3553b6d6872d5e575f30112d333a1934
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220527-161529/Jason-A-Donenfeld/crypto-blake2s-remove-shash-module/20220526-172214
        git checkout 3f36e6ac3553b6d6872d5e575f30112d333a1934
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/crypto/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/crypto/blake2s-selftest.c:548:13: warning: stack frame size (1176) exceeds limit (1024) in 'blake2s_selftest' [-Wframe-larger-than]
   bool __init blake2s_selftest(void)
               ^
   1 warning generated.


vim +/blake2s_selftest +548 lib/crypto/blake2s-selftest.c

66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  547  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08 @548  bool __init blake2s_selftest(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
