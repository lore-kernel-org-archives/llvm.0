Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7D7FB;
	Tue, 31 Jan 2023 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675184108; x=1706720108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QBLJPPxPUFajZFL05Db/V+ZgQ7qyfyTBDVh05BHcUQA=;
  b=MbTmJDZI4AXL+8hPiTSKdhlCUTWtE1Iyj4+U/E5+pWV1eR3s+3D6o5Du
   zFI77XtgB0bonnN9abfQAyDXCz6YVKpe4e9xClW9rdT/G4BsYzgjwM0cS
   W5YeDj77seFhyAkQBoa5w5FnpiCZ2jq6ded1vxBpMGp8+H5WHOLmI8Psh
   UOahPfgaBJmnKEdKip7sdQjQv3naOVR8bm7GorB2HWOJuZg+e90B13Fmg
   Nh4H22Sf33CtWapZIqLecvNJCwMyFueirWQMFeWlOm8i+fPZO+WWjdjsH
   GUO96GujLiBhZB5+pcSB30Meck4hL1rVr0FpxSATzp+KzNBewxQV+Jsi/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315854985"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="315854985"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 08:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="733184905"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="733184905"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2023 08:55:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMtuR-0004Z4-2l;
	Tue, 31 Jan 2023 16:55:03 +0000
Date: Wed, 1 Feb 2023 00:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2 3/3] mmc: sdhci-of-dwcmshc: Add host software queue
 support
Message-ID: <202302010000.KeMtGkbw-lkp@intel.com>
References: <1675125991-189452-4-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675125991-189452-4-git-send-email-shawn.lin@rock-chips.com>

Hi Shawn,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/mmc-sdhci-of-dwcmshc-Update-DLL-and-pre-change-delay-for-rockchip-platform/20230131-084738
patch link:    https://lore.kernel.org/r/1675125991-189452-4-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH v2 3/3] mmc: sdhci-of-dwcmshc: Add host software queue support
config: riscv-randconfig-r042-20230129 (https://download.01.org/0day-ci/archive/20230201/202302010000.KeMtGkbw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/73576aaa2a9d56edd98c4259a33d4896677bb211
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shawn-Lin/mmc-sdhci-of-dwcmshc-Update-DLL-and-pre-change-delay-for-rockchip-platform/20230131-084738
        git checkout 73576aaa2a9d56edd98c4259a33d4896677bb211
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mmc_hsq_init
   >>> referenced by sdhci-of-dwcmshc.c:0 (drivers/mmc/host/sdhci-of-dwcmshc.c:0)
   >>>               drivers/mmc/host/sdhci-of-dwcmshc.o:(dwcmshc_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mmc_hsq_finalize_request
   >>> referenced by clk.h:1073 (include/linux/clk.h:1073)
   >>>               drivers/mmc/host/sdhci-of-dwcmshc.o:(sdhci_dwcmshc_request_done) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
