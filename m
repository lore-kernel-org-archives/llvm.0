Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645D17C0
	for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648376404; x=1679912404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iVbRAa5xQqd+DUAlYQF1JGiLPmyqbzEI6HNajm6sIO4=;
  b=EtzHMv2SdZvsR/Oyy56NZ2xqXLfdaQMOzaO4LjiV3nZdAxMl0Y4rIEbQ
   TKEaBd/9ttWFk8vxFB5vGtI/UfKO4LHtzdw4SBWx5tdgQ1E2uRW6D0FI2
   jRVWoT2TN4kXZKaUsSCBjYmsyYgS0TOErXKhqTccJOAmkDC4xG+EKEe8T
   48Iu3TpFt6l0imvWxs5PPk2qHowVvU3JNJaxyMhOo4TfOSbJA8j53S4ni
   43YbLBbdvGcOEDoUw3Ijm0/c5CSvNVGhlAlow7Q1HdK7rxptcQd3bTEGi
   Ut7NkbGwfv1Chz+DsVanxNDdEHIklWOIaDPX8ajJ+fVVQ8wNvDh6ErrF7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10298"; a="246328288"
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; 
   d="scan'208";a="246328288"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 03:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; 
   d="scan'208";a="545584008"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2022 03:20:01 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYQ09-0000wW-03; Sun, 27 Mar 2022 10:20:01 +0000
Date: Sun, 27 Mar 2022 18:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radheys@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 169/1029]
 drivers/dma/xilinx/vdmatest.c:89: warning: expecting prototype for struct
 vdmatest_slave_thread. Prototype was for struct xilinx_vdmatest_slave_thread
 instead
Message-ID: <202203271838.nOI1qzaX-lkp@intel.com>
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
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: ab760699820df369f94bcbbec0ce4b4e53fa2ae9 [169/1029] dmaengine: xilinx: Add vdmatest test client code
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220327/202203271838.nOI1qzaX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/ab760699820df369f94bcbbec0ce4b4e53fa2ae9
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout ab760699820df369f94bcbbec0ce4b4e53fa2ae9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/vdmatest.c:89: warning: expecting prototype for struct vdmatest_slave_thread. Prototype was for struct xilinx_vdmatest_slave_thread instead
>> drivers/dma/xilinx/vdmatest.c:101: warning: expecting prototype for struct vdmatest_chan. Prototype was for struct xilinx_vdmatest_chan instead


vim +89 drivers/dma/xilinx/vdmatest.c

    69	
    70	/**
    71	 * struct vdmatest_slave_thread - VDMA test thread
    72	 * @node: Thread node
    73	 * @task: Task structure pointer
    74	 * @tx_chan: Tx channel pointer
    75	 * @rx_chan: Rx Channel pointer
    76	 * @srcs: Source buffer
    77	 * @dsts: Destination buffer
    78	 * @type: DMA transaction type
    79	 */
    80	struct xilinx_vdmatest_slave_thread {
    81		struct list_head node;
    82		struct task_struct *task;
    83		struct dma_chan *tx_chan;
    84		struct dma_chan *rx_chan;
    85		u8 **srcs;
    86		u8 **dsts;
    87		enum dma_transaction_type type;
    88		bool done;
  > 89	};
    90	
    91	/**
    92	 * struct vdmatest_chan - VDMA Test channel
    93	 * @node: Channel node
    94	 * @chan: DMA channel pointer
    95	 * @threads: List of VDMA test threads
    96	 */
    97	struct xilinx_vdmatest_chan {
    98		struct list_head node;
    99		struct dma_chan *chan;
   100		struct list_head threads;
 > 101	};
   102	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
