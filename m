Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D00807
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 11:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651835753; x=1683371753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bOr4XnnPzTyes6Ks3tUZimc/YBpub4vpLa7yfnLA62g=;
  b=XC8Z1KskrDdvfezeqETBEudGdlGcirBNS/cxsqu/ZF+xLb9tV+qedbsH
   jGisjpA+O4dM3ysnUSQCIfX6kSbyUs0GQFejWjNffx3LQtZOIUVE+hSDF
   XkENdsHTqb2BYwSyd8FWvW6rRulEK9NskU6z8SnsPJOmw7Nw8FtF43XBb
   /v83u9BNmyNYBm++CbVY+bi23Dc71tdAXTgrKRWHwtq/2WYb98kcbY1Hn
   xJHtLRn9OrevtW4fJePj9/qSD6alNg+XnfY/BolAF2Nat8dq+yWj42lyr
   mMMlOoBxuzPKtUjqG+gzPB6wKhQqtxQnK2EFpHmbjm10o4j0eieRZLBuP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="250438959"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="250438959"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 04:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="569066523"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 May 2022 04:15:51 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmvw6-000DOY-L0;
	Fri, 06 May 2022 11:15:50 +0000
Date: Fri, 6 May 2022 19:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Moritz Fischer <mdf@kernel.org>
Subject: [linux-next:master 4615/9759] drivers/fpga/zynq-fpga.c:246:14:
 warning: result of comparison of constant 170 with expression of type 'const
 char' is always false
Message-ID: <202205061916.MQGByNg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nava,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: ada14a023a641107da1ada546e1d345ca3dc78a5 [4615/9759] fpga: zynq: Fix incorrect variable type
config: mips-randconfig-c004-20220506 (https://download.01.org/0day-ci/archive/20220506/202205061916.MQGByNg6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ada14a023a641107da1ada546e1d345ca3dc78a5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ada14a023a641107da1ada546e1d345ca3dc78a5
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
ada14a023a6411 Nava kishore Manne 2022-04-21  242  static bool zynq_fpga_has_sync(const char *buf, size_t count)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  243  {
b496df86ac1bbe Jason Gunthorpe    2017-02-01  244  	for (; count >= 4; buf += 4, count -= 4)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  245  		if (buf[0] == 0x66 && buf[1] == 0x55 && buf[2] == 0x99 &&
b496df86ac1bbe Jason Gunthorpe    2017-02-01 @246  		    buf[3] == 0xaa)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  247  			return true;
b496df86ac1bbe Jason Gunthorpe    2017-02-01  248  	return false;
b496df86ac1bbe Jason Gunthorpe    2017-02-01  249  }
b496df86ac1bbe Jason Gunthorpe    2017-02-01  250  

:::::: The code at line 246 was first introduced by commit
:::::: b496df86ac1bbe393a55ddbfed35d46e74ef9767 fpga zynq: Check the bitstream for validity

:::::: TO: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
