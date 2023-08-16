Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A943D60;
	Wed, 16 Aug 2023 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692220617; x=1723756617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTZV4tmlMYkykmO5HljcaEblsUb58mTHrw3JLW6UAjo=;
  b=NJdMw3qfk7LaM/w1/2wVP/G1WqP2kmfROd1r+kF1flbnFOjfuIXrk1gQ
   MJdsmOwaqH+iJ9s5Zq/H2FMT/2+5Zh+CfWSdZKp/S29GCpul37a8u+LpS
   vfO1C4oengGwqHUrdLFxtOed624TIQz/eBg4HHYTfVS6QOkQqrI1JH6tp
   VNfyc/jogWZlXKhrn4eVkeU1i1VdjNXAhnsVOBr26XBFOobIhNcW3rp28
   dtzlY47s+amzEfHhIFnhMQn6maqzuyE9lGIHN35EXeRvSJisAXaitlExW
   oR2Qy9y9k/GKrbACVYPwMbWC/2r/7gtAP4SR1UA/SfT0DM3HHnkwDmN43
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352958136"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="352958136"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 14:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857960394"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="857960394"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 14:16:54 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWNss-0000Zj-0L;
	Wed, 16 Aug 2023 21:16:54 +0000
Date: Thu, 17 Aug 2023 05:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: ld.lld: error: version script assignment of 'LINUX_2.6' to symbol
 '__vdso_gettimeofday' failed: symbol not defined
Message-ID: <202308170532.zxFFv25c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: e738521a11f13e40af89f66527e59306c4169782 clocksource/drivers/loongson1: Move PWM timer to clocksource framework
date:   8 weeks ago
config: mips-randconfig-r012-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170532.zxFFv25c-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170532.zxFFv25c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170532.zxFFv25c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_gettimeofday' failed: symbol not defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
