Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0891361
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651163150; x=1682699150;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nH+CoS83/3jOr37igtdZeX4inUutU5HEUSaAb46G7BY=;
  b=Gr44kY19bCT7sA1U1UaMQUElK184CJ4DfzjMUeSdOSHT/X82ANM3oaXW
   NNk7YHItJsUOsxAbdaci8TxxlsEvH3HZrtIMI1AQo3hgVGKpuhwG21/ig
   wVrjMt6jpfrTwKtulWQVIQ6PwRcB7wO6C6DCszGY3FBDsL7IpfchzGG+F
   nMgj4uLC8/8I2d84oP9lVmX7U+Ei6ewdPCrfeKsJE87kIi3u+7yUeIp/B
   6oMFzbWt5+2k/k6lriXsgLRWe0bNz0hfEZf6884wcJXF23puxwg1xZm0G
   vH+EoztGzjWxC2ZxsdwqJzDEVew7DtNaGvi3bLGISaznfA2fAQgAmEb0m
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="265870845"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="265870845"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 09:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="541454639"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Apr 2022 09:25:48 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk6xg-0005Wr-6z;
	Thu, 28 Apr 2022 16:25:48 +0000
Date: Fri, 29 Apr 2022 00:25:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: arch/riscv/built-in.a(mm/extable.o):(function
 fixup_exception: .text+0x3c): relocation R_RISCV_HI20 out of range: 528930
 is not in [-524288, 524287]; references __sancov_gen_cov_switch_values
Message-ID: <202204290059.Zav1EkLe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f4dd16603ce834d1c5c4da67803ea82dd282511
commit: ac875df4d854ab13d9c4af682a1837a1214fecec pinctrl: samsung: fix missing GPIOLIB on ARM64 Exynos config
date:   7 days ago
config: riscv-randconfig-r021-20220428 (https://download.01.org/0day-ci/archive/20220429/202204290059.Zav1EkLe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac875df4d854ab13d9c4af682a1837a1214fecec
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ac875df4d854ab13d9c4af682a1837a1214fecec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(mm/extable.o):(function fixup_exception: .text+0x3c): relocation R_RISCV_HI20 out of range: 528930 is not in [-524288, 524287]; references __sancov_gen_cov_switch_values
   >>> referenced by extable.c:57 (arch/riscv/mm/extable.c:57)
   >>> defined in arch/riscv/built-in.a(mm/extable.o)
--
>> ld.lld: error: arch/riscv/built-in.a(mm/extable.o):(function fixup_exception: .text+0x112): relocation R_RISCV_HI20 out of range: 528930 is not in [-524288, 524287]; references .L__unnamed_1
   >>> referenced by extable.c:61 (arch/riscv/mm/extable.c:61)
   >>> defined in arch/riscv/built-in.a(mm/extable.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/reset.o):(function machine_power_off: .text+0x56): relocation R_RISCV_HI20 out of range: 529400 is not in [-524288, 524287]; references pm_power_off
   >>> referenced by reset.c:25 (arch/riscv/kernel/reset.c:25)
   >>> defined in arch/riscv/built-in.a(kernel/reset.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
