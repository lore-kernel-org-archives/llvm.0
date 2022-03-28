Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF47C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 21:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648503955; x=1680039955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6hdtn/cv3bUvibd136rsVzvZJNMwDdiT1cnrYzEnG64=;
  b=KpN1Zwj7DzOR/pbYsVwfKphr4Z7hKnqe2LraDkFgd6r30Tj3IYlj8wqP
   yjbSgOvc8lNt+b7+P8nEm521oZl7tMyHNhFSQhtNMKABghXwYy9WjciaN
   mdSsg1dYn0s6JnRL/E+nVNybozKmRx5mD+wt2GeKK5bnZN3C94pYmj46d
   gRZISIZUOd99Ng4KtScGzp1LGmQ3a3K6ZpH9FzeGDdU/rYtnlSB10ZpnY
   zuNSGO1SwjwmctTl841iF3R8nkBX44j0S4LD/jyp/AYsBz9QZkxNSdENz
   LjRyh05yqENunc7MfLh3pj6ZALnVLeg2dm7IogMTs6eG9jrf5Mzq6ZiDn
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="319808606"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="319808606"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 14:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="564031153"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Mar 2022 14:45:52 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYxBP-0002Lv-Cg; Mon, 28 Mar 2022 21:45:51 +0000
Date: Tue, 29 Mar 2022 05:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Syed Syed <syed.syed@xilinx.com>,
	Priyadarshini Babu <priyadarshini.babu@xilinx.com>,
	Ravali Potineni <ravali.potineni@xilinx.com>,
	Pranavi Somisetty <pranavi.somisetty@xilinx.com>,
	Swati Agarwal <swati.agarwal@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 234/1039]
 drivers/net/ethernet/xilinx/xilinx_tsn_cb.c:85: warning: expecting prototype
 for config_stream_filter(). Prototype was for config_ingress_filter()
 instead
Message-ID: <202203290553.VbtP230C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   ea33365bd1a8cf667a122498e8f551df05609f92
commit: 263fc2f4cc2eb862df696baa57738c5047a7ed38 [234/1039] net: xilinx: Add Support for CB/FRER feature of PL TSN IP
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220329/202203290553.VbtP230C-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/263fc2f4cc2eb862df696baa57738c5047a7ed38
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 263fc2f4cc2eb862df696baa57738c5047a7ed38
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/xilinx/xilinx_tsn_cb.c:85: warning: expecting prototype for config_stream_filter(). Prototype was for config_ingress_filter() instead


vim +85 drivers/net/ethernet/xilinx/xilinx_tsn_cb.c

    79	
    80	/**
    81	 * config_stream_filter -  Configure Ingress Filter Configuration
    82	 * @data:	Value to be programmed
    83	 */
    84	void config_ingress_filter(struct in_fltr data)
  > 85	{
    86		u32 mask = 0;
    87	
    88		mask = ((data.in_port_id & IN_PORTID_MASK) << IN_PORTID_SHIFT) |
    89						(data.max_seq_id & MAX_SEQID_MASK);
    90		axienet_iow(&lp, INGRESS_FILTER_OFFSET, mask);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
