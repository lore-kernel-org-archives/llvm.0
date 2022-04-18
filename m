Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F67EC
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650276802; x=1681812802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQF2jtCGMD/mT3g9u1gUk0MtABVPEyW0OYjrIfpl5gs=;
  b=BDWCoJ+XRg8Ewa2DTlwGqFfcxaztvb5cWYUyQun52ixZrb/ziEu6laYj
   ttc0OtfmTqGxUc89xSnigDnU9R26xKO3Tv0zPQa1kE7B4ibKg0Gg0xgl2
   I3sL7DpQaFWsga7vWBKpRwhkblzSAbu3UUKg6FgxeAlzWJ3BSpCXaO9vQ
   ztwGUNyAUOYpJkphbDiRgw0nxkvk+CJh1OJjYT7ZrarcDh/8pEvPZYLRY
   SYHkYsyEkXhwMAfzZkj8YmGGYMUrMfoddVRha8t2y3bufxHF2NRwTnrqe
   DFULlLVJeVu0mN+Pek5mbDLCycO6HuwnT01hLG3teL0FJhlic2Y2jmBso
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="326393423"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="326393423"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 03:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="726592930"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Apr 2022 03:13:20 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngONk-0004Wp-15;
	Mon, 18 Apr 2022 10:13:20 +0000
Date: Mon, 18 Apr 2022 18:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>
Subject: drivers/clk/imx/clk-imx93.c:324:34: warning: unused variable
 'imx93_clk_of_match'
Message-ID: <202204181828.VNB1sR4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Peng,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 24defbe194b650218680fcd9dec8cd103537b531 clk: imx: add i.MX93 clk
date:   6 weeks ago
config: hexagon-randconfig-r045-20220417 (https://download.01.org/0day-ci/archive/20220418/202204181828.VNB1sR4E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24defbe194b650218680fcd9dec8cd103537b531
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 24defbe194b650218680fcd9dec8cd103537b531
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/imx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx93.c:324:34: warning: unused variable 'imx93_clk_of_match' [-Wunused-const-variable]
   static const struct of_device_id imx93_clk_of_match[] = {
                                    ^
   1 warning generated.


vim +/imx93_clk_of_match +324 drivers/clk/imx/clk-imx93.c

   323	
 > 324	static const struct of_device_id imx93_clk_of_match[] = {
   325		{ .compatible = "fsl,imx93-ccm" },
   326		{ /* Sentinel */ },
   327	};
   328	MODULE_DEVICE_TABLE(of, imx93_clk_of_match);
   329	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
