Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BC79FD;
	Mon, 17 Apr 2023 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681740631; x=1713276631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QK/KfDrcqImjANR2YzgtHGBef9KjJ+Cx1zl5pn3ujU=;
  b=TCxGJJwv4RczE29o5SsgYAFMthLzIdbMUjGf9iIirCiHEwoBOUmzSjyv
   hla+Dr3RQ59wK4t9hewwNIThkVU9VsPoF1TlRw4jtITppnRvqWXkNDmz5
   /rNC6cIQhVvCpo+VfZRCy4Qv+k33y92wzPQAkidFDfAR0TpS8ezbQb5hh
   gvmvJLp9+5+Bzvi1rGCwwlpPe9X/wSAu9WRfzHWazhZ85wdsnF0jfvUp1
   XvI68JxtIDVe831H6n2AyYENQCc3t83QNUKA8epmSMGuvYBkmyuAogEeD
   dF/TJCcx5YB2BDuNDmgRJlCkNLgqUjSMigO9plTmGc+WuHhT/dfdDMAKK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="344898536"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="344898536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 07:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="640965821"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="640965821"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Apr 2023 07:06:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poPVG-000cQF-21;
	Mon, 17 Apr 2023 14:06:46 +0000
Date: Mon, 17 Apr 2023 22:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Pagani <marpagan@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 4/4] fpga: add initial KUnit test suites
Message-ID: <202304172107.goZcZrrT-lkp@intel.com>
References: <20230417122308.131453-5-marpagan@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417122308.131453-5-marpagan@redhat.com>

Hi Marco,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8f57ae2eb07ab39a6f0ccad60c760743051026]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-fake-FPGA-manager/20230417-203029
base:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
patch link:    https://lore.kernel.org/r/20230417122308.131453-5-marpagan%40redhat.com
patch subject: [RFC PATCH v4 4/4] fpga: add initial KUnit test suites
config: i386-randconfig-a012-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172107.goZcZrrT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/156d20883bf1a304b4d2df8c1ed6f244caba52b5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marco-Pagani/fpga-add-fake-FPGA-manager/20230417-203029
        git checkout 156d20883bf1a304b4d2df8c1ed6f244caba52b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172107.goZcZrrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
>> drivers/fpga/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
