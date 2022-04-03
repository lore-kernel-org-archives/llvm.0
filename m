Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2994C7A
	for <llvm@lists.linux.dev>; Sun,  3 Apr 2022 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648973490; x=1680509490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVK9zXQdbVWUMLGPYLr8SlqGvLyalhZYV94U/fmezXA=;
  b=HrgOxRQMzEztvBL8cKUk63lIVfVH1FxYcGRkiOJOIrt1IeqCdjXFItoc
   ctnnSCAbH0F8iW3eX0j0bBeYvnrCaY7jTQChG9yQrlWIIGEWVgr5kbk6m
   OuaZLXovIOlnZbkrCd7mpaTHskp/Uc/wGZmC+7/r0A0VbsTr8G6eAjy/0
   ovtw0Da9+yexeXXqSuTCfkcY8TqXZV8fTIly6HrHC2/9czaAn+80qJMWu
   HZo+prGaSSVDIsrGs2prFVX9WVfhuwGIld3bvf8IlXnr/TxIarxRiMBtA
   MjmyMBKpDJcUTxsepJMMrhrR+ypt0FG0ey2vPPpCui5+YmRc5808bqPG5
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="321062191"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="321062191"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 01:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="656973769"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Apr 2022 01:11:25 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1navKW-0000pN-EH;
	Sun, 03 Apr 2022 08:11:24 +0000
Date: Sun, 3 Apr 2022 16:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 1/5] fpga: zynq: Fix incorrect variable type
Message-ID: <202204031645.41xkvyOT-lkp@intel.com>
References: <20220403051641.3867610-2-nava.manne@xilinx.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220403051641.3867610-2-nava.manne@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Nava,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17 next-20220401]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/fpga-zynq-Fix-incorrect-variable-type/20220403-141639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
config: mips-randconfig-r001-20220403 (https://download.01.org/0day-ci/archive/20220403/202204031645.41xkvyOT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0269b45231586f272bd771126a39154852ccb0d3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nava-kishore-Manne/fpga-zynq-Fix-incorrect-variable-type/20220403-141639
        git checkout 0269b45231586f272bd771126a39154852ccb0d3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/fpga/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/fpga/zynq-fpga.c:246:14: warning: result of comparison of constant 170 with expression of type 'const char' is always false [-Wtautological-constant-out-of-range-compare]
                       buf[3] == 0xaa)
                       ~~~~~~ ^  ~~~~
   drivers/fpga/zynq-fpga.c:245:50: warning: result of comparison of constant 153 with expression of type 'const char' is always false [-Wtautological-constant-out-of-range-compare]
                   if (buf[0] == 0x66 && buf[1] == 0x55 && buf[2] == 0x99 &&
                                                           ~~~~~~ ^  ~~~~
   2 warnings generated.


vim +246 drivers/fpga/zynq-fpga.c

37784706bf9e3b Moritz Fischer     2015-10-16  237  
0269b45231586f Nava kishore Manne 2022-04-03  238  /* Sanity check the proposed bitstream. The sync word must be found in the
0269b45231586f Nava kishore Manne 2022-04-03  239   * correct byte order and it should be dword aligned. The input is a
0269b45231586f Nava kishore Manne 2022-04-03  240   * Xilinx.bin file with every 32 bit quantity swapped.
b496df86ac1bbe Jason Gunthorpe    2017-02-01  241   */
0269b45231586f Nava kishore Manne 2022-04-03  242  static bool zynq_fpga_has_sync(const char *buf, size_t count)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  243  {
b496df86ac1bbe Jason Gunthorpe    2017-02-01  244  	for (; count >= 4; buf += 4, count -= 4)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  245  		if (buf[0] == 0x66 && buf[1] == 0x55 && buf[2] == 0x99 &&
b496df86ac1bbe Jason Gunthorpe    2017-02-01 @246  		    buf[3] == 0xaa)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  247  			return true;
b496df86ac1bbe Jason Gunthorpe    2017-02-01  248  	return false;
b496df86ac1bbe Jason Gunthorpe    2017-02-01  249  }
b496df86ac1bbe Jason Gunthorpe    2017-02-01  250  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
