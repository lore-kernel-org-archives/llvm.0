Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2396AA6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 20:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655413033; x=1686949033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGb98EreHsN25CXV/01rJqWNIbdOu/CzDE/l/VN7VXo=;
  b=JwyJ5Bim5XlEFW1h5oKHHWy5PZ+en3+zCkWGzlhBh5RC++DRTeVsbCtG
   1m5Sbc2IE0eYFjwx1bDTwKpv28gwTCVST0BGM+mN3a7bQ+/UoNXpoVsoI
   T3UXSLBODpASawQTQBrKA4S5AHzaCQtYAIDUwxoeFu225SbDy/7q+fcrp
   XLN9zpfcy4wtyNsI+JJ/Kk+2CJofOxSm5aQR+VW2MiWfQd7SmpuybSxLM
   OD/tqvCYXMAxl1vYQ1jOd/oW5Pi8SWw+VVfqUsAKWKuWoTlZVi8NDhZcL
   zuHUHbzOiYZzMIatO09/tAzVoxcJDqeeNgAfHmfvwO37Et2q8/SGM5yDz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365702146"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="365702146"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="831731727"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2022 13:56:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1wXG-000Om1-LC;
	Thu, 16 Jun 2022 20:56:14 +0000
Date: Fri, 17 Jun 2022 04:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: [jkirsher-next-queue:master 1/5] ld.lld: error: undefined symbol:
 qcom_smem_get
Message-ID: <202206170405.fqVbBgOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git master
head:   5dcb50c009c9f8ec1cfca6a81a05c0060a5bbf68
commit: 9ec092d2feb69045dd289845024301fb91c064ee [1/5] net: ethernet: stmmac: add missing sgmii configure for ipq806x
config: riscv-randconfig-r042-20220616 (https://download.01.org/0day-ci/archive/20220617/202206170405.fqVbBgOE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git/commit/?id=9ec092d2feb69045dd289845024301fb91c064ee
        git remote add jkirsher-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git
        git fetch --no-tags jkirsher-next-queue master
        git checkout 9ec092d2feb69045dd289845024301fb91c064ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: qcom_smem_get
   >>> referenced by socinfo.c
   >>>               soc/qcom/socinfo.o:(qcom_socinfo_probe) in archive drivers/built-in.a
   >>> referenced by socinfo.c
   >>>               soc/qcom/socinfo.o:(qcom_socinfo_probe) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_SOCINFO
   Depends on QCOM_SMEM
   Selected by
   - DWMAC_IPQ806X && NETDEVICES && ETHERNET && NET_VENDOR_STMICRO && STMMAC_ETH && STMMAC_PLATFORM && OF && (ARCH_QCOM || COMPILE_TEST

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
