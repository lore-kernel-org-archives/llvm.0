Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D634635;
	Thu, 15 Jun 2023 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686813945; x=1718349945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wer7VA7XjNpicQLFbnkgJHYtwAIp8CyLQHVOQDC1XUg=;
  b=FPfglzrdF4mjlm9myE7w9rFgcuqPkgcqUttBVWmRJzpL1ij2eGBdUrAH
   p+kp7YCSkrjN4MLbTGZXv5N03vKNjFCfKXU6PAn89DJyBXR531g1THvY5
   pLczgE9BhzHzSkxFbyVIFMu3gX45dNTXFI1iMDgBuJOzgI0aL0Glpv3TX
   PUFLZjZ4MsyyCw5HP+5Zd5LBPf30SDqnYI6vFGJ2zark+Qw4+B/rshTdF
   zmlk1+ZEtCt4ey5jJzl8j9x/cPTvoikUcIwWPtQpr56wH/f/ulJd5P/7F
   GOzHxJJc2lM9AAt+Wg2UqHIxiuFUnFtT5qzxCau1ZNDgCS3a8Z4lulWKR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="445206418"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="445206418"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 00:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777554499"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="777554499"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2023 00:25:36 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9hMO-0001ax-05;
	Thu, 15 Jun 2023 07:25:36 +0000
Date: Thu, 15 Jun 2023 15:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [mkp-scsi:for-next 70/83] ./usr/include/linux/ioprio.h:107:8: error:
 unknown type name '__always_inline'
Message-ID: <202306151519.FDr0tbFR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   aca416ac0b1fbe89d563f88cdb9884f986863d34
commit: bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60 [70/83] scsi: block: Improve ioprio value validity checks
config: i386-randconfig-i001-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151519.FDr0tbFR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
        git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
        git fetch --no-tags mkp-scsi for-next
        git checkout bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151519.FDr0tbFR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ioprio.h:107:8: error: unknown type name '__always_inline'
   static __always_inline __u16 ioprio_value(int class, int level, int hint)
          ^
>> ./usr/include/linux/ioprio.h:107:29: error: expected ';' after top level declarator
   static __always_inline __u16 ioprio_value(int class, int level, int hint)
                               ^
                               ;
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
