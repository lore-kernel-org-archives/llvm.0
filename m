Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804C2362
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657957868; x=1689493868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4kybbQfKyma5R7luiQh44ufZEmN4Kly6z7nCh2v/Ij4=;
  b=YgXGnqbd14hbOoAiUKsPgrb+JahmMLYgdw4zVgKhKwBGLTIeziH1WbCm
   VKWjveq9wk0axAq7KCcNDprGMGAKShpFWq1DDHvimBsB2rcY56m9rI74h
   WOg2UYF/axBx+5+dGVcTTk5ozLEObGrkOsWLtuGN6w/XL1LgEOADfMqq+
   zZiAMB6ijwmi+8KrysbOXWi1FIqJJLUy6hzQcKHjdS5+cT73NIvz0PPU/
   iiRe9M+laVPcjwC6JvIY9hfjvCtNImFxsWko9iQVkDCIkxm7oFNRMQUeo
   SGliBUGSCXuv3Da/1qv5gmxShRB6AHz9nLppRaxzIx/7vpQoLIlaQQQUD
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="286692876"
X-IronPort-AV: E=Sophos;i="5.92,276,1650956400"; 
   d="scan'208";a="286692876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 00:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,276,1650956400"; 
   d="scan'208";a="738917041"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2022 00:51:03 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCcZq-0001HI-NV;
	Sat, 16 Jul 2022 07:51:02 +0000
Date: Sat, 16 Jul 2022 15:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, l.stach@pengutronix.de
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com,
	laurent.pinchart@ideasonboard.com, marex@denx.de,
	paul.elder@ideasonboard.com, aford173@gmail.com,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 6/6] arm64: dts: imx8mp: add VPU blk ctrl node
Message-ID: <202207161526.eF3Q4LDD-lkp@intel.com>
References: <20220713063653.2584488-7-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713063653.2584488-7-peng.fan@oss.nxp.com>

Hi "Peng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linus/master v5.19-rc6 next-20220715]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/imx-add-i-MX8MP-hdmi-blk-ctrl-hdcp-hrv-and-vpu-blk-ctrl/20220713-143746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: arm64-buildonly-randconfig-r003-20220714 (https://download.01.org/0day-ci/archive/20220716/202207161526.eF3Q4LDD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/be95b11efe846d01a6f40eda8a8c7750f53155e4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peng-Fan-OSS/imx-add-i-MX8MP-hdmi-blk-ctrl-hdcp-hrv-and-vpu-blk-ctrl/20220713-143746
        git checkout be95b11efe846d01a6f40eda8a8c7750f53155e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mp.dtsi:1181.26-27 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
