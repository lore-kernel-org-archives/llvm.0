Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBA4C64
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657817610; x=1689353610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KQ3EshMK8++GI8t4aQ2PncIZOhcWUzgg8CXcbiG8JzY=;
  b=TVwcJf83qWVfQdr//8/BRRpFN+zQ0JLRQUFRqw3gAecsPATiUM/8tdV8
   9ew2ARvc6g2RoPCG/iYscsirJXAMTXQaW5fmpQgngq1/lqVaJPThPuyAu
   8bGTLQQ35+E0+9az2xsroWWqaO0IwxwJ8BnqMcqZKin2va4MFO6d/qOaY
   ZFEE1FUyvfFlRgwRvMaNjY4KoF9vSahBAPjip6S2dpPd9BPkcwJEcnmp2
   H0bTqHA79vn+2+mPRP4f8weFEWDD3NQTv4E+MzrATQF8D2I8sSYriEUXN
   iegdeqVy2wU5Pi1aWiXJ6jAlIw49JfJtXyMFsrXe4goH/CrRxCvZxRItH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="284328450"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="284328450"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 09:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="923148964"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 09:53:28 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC25g-0000tR-20;
	Thu, 14 Jul 2022 16:53:28 +0000
Date: Fri, 15 Jul 2022 00:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Foss <robert.foss@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 7409/10678]
 drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a
 compile-time constant
Message-ID: <202207150057.s8huMpLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
commit: 160758b05ab1679dae83c7facf312b60dd263308 [7409/10678] clk: qcom: add support for SM8350 GPUCC
config: arm-randconfig-r023-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150057.s8huMpLd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=160758b05ab1679dae83c7facf312b60dd263308
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 160758b05ab1679dae83c7facf312b60dd263308
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
           gpu_cc_parent,
           ^~~~~~~~~~~~~
   drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
           gpu_cc_parent,
           ^~~~~~~~~~~~~
   2 errors generated.


vim +111 drivers/clk/qcom/gpucc-sm8350.c

   109	
   110	static const struct clk_parent_data gpu_cc_parent_data_0[] = {
 > 111		gpu_cc_parent,
   112		{ .hw = &gpu_cc_pll0.clkr.hw },
   113		{ .hw = &gpu_cc_pll1.clkr.hw },
   114		{ .fw_name = "gcc_gpu_gpll0_clk_src" },
   115		{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },
   116	};
   117	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
