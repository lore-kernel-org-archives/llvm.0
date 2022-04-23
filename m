Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C3917C2
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650709338; x=1682245338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7R1DmnTTaWPWYNqsuNK1zc8jkQ7VVU9lIofBerYqtRI=;
  b=Du47MqMpDT4cO5WoINQoq2JtzsFEtAisnalkHG8V60c/B/8ESgyiUdPe
   yBTT8vI9ccl+fKSp0Fqj2+aURoG7K4lRaz9ffKfAw1wSL1AKPKSQ3Z/mw
   jafE2Ov+BensZAnYof5AiJ8xhOu/wvivU11z11fc7+B8ohD+Q0c2p9f9C
   9QW6UpjgXL3EV0l2ZbUSKH9hsQm0IgIsUfwvdTeUWglo667u9kRJJQzGN
   Pe1DVOBeEmR+eUd/8uPYxGMKMfeos+Ro5CNU/B840QdjOyfko35VIdzbx
   AQITZy0MIVevBBWFEabDzgPA0MD8WsTovc9Yrr121UDCAtQzNSONcBhJy
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245449921"
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="245449921"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 03:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="511913819"
Received: from lkp-server01.sh.intel.com (HELO dd58949a6e39) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Apr 2022 03:22:16 -0700
Received: from kbuild by dd58949a6e39 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niCu7-0000A7-UO;
	Sat, 23 Apr 2022 10:22:15 +0000
Date: Sat, 23 Apr 2022 18:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 1/5] fpga: zynq: Fix incorrect variable type
Message-ID: <202204231832.eX31L2dR-lkp@intel.com>
References: <20220421044744.3777983-2-nava.manne@xilinx.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421044744.3777983-2-nava.manne@xilinx.com>

Hi Nava,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc3]
[cannot apply to xilinx-xlnx/master next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/fpga-zynq-Fix-incorrect-variable-type/20220421-135249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b253435746d9a4a701b5f09211b9c14d3370d0da
config: mips-randconfig-r005-20220422 (https://download.01.org/0day-ci/archive/20220423/202204231832.eX31L2dR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/14e1fd8955f47ca1dbb9b58fee3b0b94429fc5d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nava-kishore-Manne/fpga-zynq-Fix-incorrect-variable-type/20220421-135249
        git checkout 14e1fd8955f47ca1dbb9b58fee3b0b94429fc5d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
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
b496df86ac1bbe Jason Gunthorpe    2017-02-01  238  /* Sanity check the proposed bitstream. It must start with the sync word in
b496df86ac1bbe Jason Gunthorpe    2017-02-01  239   * the correct byte order, and be dword aligned. The input is a Xilinx .bin
b496df86ac1bbe Jason Gunthorpe    2017-02-01  240   * file with every 32 bit quantity swapped.
b496df86ac1bbe Jason Gunthorpe    2017-02-01  241   */
14e1fd8955f47c Nava kishore Manne 2022-04-21  242  static bool zynq_fpga_has_sync(const char *buf, size_t count)
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
