Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15FE7E
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660378274; x=1691914274;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ni+uZhz+L9V3Im6hcehe9gu5qiprCUC4AEMNF5myolA=;
  b=EL3JVWV5z211MHqF5JDmq+qZexXgxDdpIlJ1ea2379CpvHHpWsnMR4WL
   9oxHgwUhdCEnSAX7PfABetVNPVqnvU+X8J6xYY9a26I2kswmZir/phC14
   3Ym5uh1UFWRCD9LRZxCTiOq1QVj0jQivZEU3++SbqJuIJY3YvqHLzmBv7
   iLpqBMBdzjrLzjegQGMl7lmOLCaDrnDosESIkIzA0Z0fk5RCwxRbscLpP
   VQCF13w+B/68zE+LSUffZzPUIUAxpUqP9p8MDYcEFFDxU2ieKIloP6pBx
   BKXmqlqaTRo9ah3INyheoJWF/7W5OImne3gW8+EY6sE3v7z53Zh8uhQeX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289306678"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="289306678"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 01:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="748436374"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2022 01:11:13 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMmEi-0001Tn-13;
	Sat, 13 Aug 2022 08:11:12 +0000
Date: Sat, 13 Aug 2022 16:10:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [tnguy-net-queue:100GbE 2/2] ld.lld: error:
 arch/riscv/built-in.a(kernel/patch.o):(function patch_text: .text+0x1b8):
 relocation R_RISCV_HI20 out of range: 534338 is not in [-524288, 524287];
 references stop_machine_cpuslocked.______f
Message-ID: <202208131625.zTwm1ch1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
CC: linux-kernel@vger.kernel.org
TO: Michal Jaron <michalx.jaron@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Jedrzej Jagielski <jedrzej.jagielski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git 100GbE
head:   cf90b74341eecc32ceef0c136954a1668e43b1e7
commit: cf90b74341eecc32ceef0c136954a1668e43b1e7 [2/2] ice: Fix call trace with null VSI during VF reset
config: riscv-randconfig-r024-20220811 (https://download.01.org/0day-ci/archive/20220813/202208131625.zTwm1ch1-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git/commit/?id=cf90b74341eecc32ceef0c136954a1668e43b1e7
        git remote add tnguy-net-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git
        git fetch --no-tags tnguy-net-queue 100GbE
        git checkout cf90b74341eecc32ceef0c136954a1668e43b1e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/patch.o):(function patch_text: .text+0x1b8): relocation R_RISCV_HI20 out of range: 534338 is not in [-524288, 524287]; references stop_machine_cpuslocked.______f
   >>> referenced by patch.c:98 (arch/riscv/kernel/patch.c:98)
   >>> defined in arch/riscv/built-in.a(kernel/patch.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
