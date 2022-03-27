Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777D3FC7
	for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648411764; x=1679947764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4I12XJxDEhjAO25mTGvCioKhPW6W/xXzKDptJWUv0yo=;
  b=gvzI39KeI3AM6V28jzqZrqeEFDYMyFeFxntNhbMSD6VW0O3BKVVKg2ss
   5619EinksXpJlcooGBTY/b33UdpXxMvQEbTS6g9U1+Osn1s3KFV/adeUr
   QKT5LjZxu248v+dtSeudmw9EeLiie+Hmlja3eje8DbBC/mX5UyQug6Mja
   OHNzranELdWioqis+m/J6zZaVPFWmujAozMzoEiK7fiQYfq0bCS1jt5J2
   uyklF4GAgasCKbvVzAS7pL0nBYdSBMuhZsImUWIKPjGmX2QY/W+bQ3bRB
   tgx9nWbbrdweMs/lmFvTQTx2ZpPm8CUHAYPMZFY7ZQx9effHiiYtrFsrH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258590187"
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; 
   d="scan'208";a="258590187"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 13:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; 
   d="scan'208";a="638751067"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2022 13:09:21 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYZCS-0001OZ-Qe; Sun, 27 Mar 2022 20:09:20 +0000
Date: Mon, 28 Mar 2022 04:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Syed Syed <syed.syed@xilinx.com>,
	Priyadarshini Babu <priyadarshini.babu@xilinx.com>,
	Ravali Potineni <ravali.potineni@xilinx.com>,
	Pranavi Somisetty <pranavi.somisetty@xilinx.com>,
	Swati Agarwal <swati.agarwal@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 231/1029]
 drivers/net/ethernet/xilinx/xilinx_tsn_switch.c:597:13: warning: variable
 'pmap' is used uninitialized whenever 'if' condition is false
Message-ID: <202203280456.kzjSjx7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Saurabh,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: a7ae7ddafe91c16d0f4bcd4d148c76318f3cfb06 [231/1029] net: xilinx: Add support for PL TSN IP features
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220328/202203280456.kzjSjx7T-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/a7ae7ddafe91c16d0f4bcd4d148c76318f3cfb06
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout a7ae7ddafe91c16d0f4bcd4d148c76318f3cfb06
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/xilinx/xilinx_tsn_switch.c:597:13: warning: variable 'pmap' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (num_q == 2) {
                      ^~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_tsn_switch.c:602:36: note: uninitialized use occurs here
           axienet_iow(&lp, XAS_PMAP_OFFSET, pmap);
                                             ^~~~
   drivers/net/ethernet/xilinx/xilinx_tsn_switch.c:597:9: note: remove the 'if' if its condition is always true
           } else if (num_q == 2) {
                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_tsn_switch.c:579:10: note: initialize the variable 'pmap' to silence this warning
           u32 pmap;
                   ^
                    = 0
   1 warning generated.


vim +597 drivers/net/ethernet/xilinx/xilinx_tsn_switch.c

   576	
   577	static int tsn_switch_cam_init(u16 num_q)
   578	{
   579		u32 pmap;
   580		u32 timeout = 20000;
   581	
   582		/* wait for switch init done */
   583		while (!(axienet_ior(&lp, XAS_STATUS_OFFSET) &
   584			SDL_CAM_WR_ENABLE) && timeout)
   585			timeout--;
   586	
   587		if (!timeout)
   588			pr_warn("Switch init took longer time!!");
   589	
   590		if (num_q == 3) {
   591		/* map pcp = 2,3 to queue1
   592		 *     pcp = 4 to queue2
   593		 */
   594			pmap = ((PMAP_EGRESS_QUEUE1_SELECT << PMAP_PRIORITY2_SHIFT) |
   595				(PMAP_EGRESS_QUEUE1_SELECT << PMAP_PRIORITY3_SHIFT) |
   596				(PMAP_EGRESS_QUEUE2_SELECT << PMAP_PRIORITY4_SHIFT));
 > 597		} else if (num_q == 2) {
   598			/*     pcp = 4 to queue1 */
   599			pmap = (PMAP_EGRESS_QUEUE1_SELECT << PMAP_PRIORITY4_SHIFT);
   600		}
   601	
   602		axienet_iow(&lp, XAS_PMAP_OFFSET, pmap);
   603	
   604		timeout = 20000;
   605		/* wait for cam init done */
   606		while (!(axienet_ior(&lp, XAS_SDL_CAM_STATUS_OFFSET) &
   607			SDL_CAM_WR_ENABLE) && timeout)
   608			timeout--;
   609	
   610		if (!timeout)
   611			pr_warn("CAM init took longer time!!");
   612	
   613		return 0;
   614	}
   615	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
